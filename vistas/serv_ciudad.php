<?php
if(isset($_SESSION['datos']['nombre_ciudad'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='ciudad';
if(isset($_SESSION['datos'])){
  @$nombre_ciudad=$_SESSION['datos']['nombre_ciudad'];
  @$codigo_ciudad=$_SESSION['datos']['cod_ciudad'];
  @$codigo_estado=$_SESSION['datos']['cod_estado'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$nombre_ciudad=null;
  @$codigo_ciudad=null;
  @$codigo_estado=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_ciudad.js"> </script>
  <form action="../controladores/cont_ciudad.php" method="post" id="form">
   <fieldset>
    <legend>Ciudad</legend>         
    <div id="contenedorFormulario">
      <label>Código:</label>
      <input title="El código de la ciudad es generado por el sistema" name="cod_ciudad" id="cod_ciudad" type="text" size="10" readonly value="<?= $codigo_ciudad;?>" placeholder="El código de la ciudad es generado por el sistema" class="campoTexto" required=""/>
      <label>Nombre de la ciudad:</label>
      <input title="Ingrese el nombre de la ciudad" onKeyUp="this.value=this.value.toUpperCase()" name="nombre_ciudad" id="nombre_ciudad" type="text" size="50" value="<?= $nombre_ciudad;?>" placeholder="Ingrese el nombre de la ciudad" class="campoTexto" required=""/>
      <label>Seleccione un Estado:</label>
      <select name="cod_estado" id="cod_estado" title="Seleccione un estado" class="campoTexto" required="">
        <option value='0'>Seleccione un Estado</option>
        <?php
        require_once("../clases/class_bd.php");
        $mysql=new Conexion();
        $sql = "SELECT cod_estado,upper(nombre_estado) nombre_estado FROM testado WHERE fecha_desactivacion IS NULL ORDER BY cod_estado";
        $query = $mysql->Ejecutar($sql);
        while ($row = $mysql->Respuesta($query)){
          if($row['cod_estado']==$codigo_estado){
            echo "<option value='".$row['cod_estado']."' selected>".$row['nombre_estado']."</option>";
          }else{
            echo "<option value='".$row['cod_estado']."'>".$row['nombre_estado']."</option>";
          }
        }
        ?>
      </select>
    <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
    </div>
    <br>
    <?php echo '<p class="'.$estatus.'" id="estatus_registro">'.$estatus.'</p>'; ?>
    <?php
    imprimir_boton($disabledRC,$disabledMD,$estatus,$servicios);
    ?>                      
  </form>
</fieldset>
<br>
<?php }else{ 
  require_once("../clases/class_perfil.php");
  $perfil=new Perfil();
  $perfil->codigo_perfil(@$_SESSION['user_codigo_perfil']);
  $servicios_permitidos=$perfil->IMPRIMIR_SERVICIOS_USUARIO();
  $servicio_solicitado=strtolower(preg_replace('/(serv_)|(\.php)/','',basename(__FILE__)));  	
  ?>
  <a href="?ciudad" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_ciudad.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
  <table class="table table-striped table-bordered table-condensed">
   <tr> 
     <td>Código </td>
     <td>Nombre</td>
     <td>Estado</td>
   </tr>
   <?php

           //Conexión a la base de datos 
   require_once("../clases/class_bd.php");
   $mysql=new Conexion();

//Sentencia sql (sin limit) 
   $_pagi_sql = "SELECT c.cod_ciudad,c.nombre_ciudad,c.fecha_desactivacion,e.cod_estado,e.nombre_estado FROM tciudad c 
   INNER JOIN testado e ON c.cod_estado = e.cod_estado WHERE c.fecha_desactivacion IS NULL ORDER BY c.cod_ciudad DESC"; 
//cantidad de resultados por página (opcional, por defecto 20) 
   $_pagi_cuantos = 10; 
//Cadena que separa los enlaces numéricos en la barra de navegación entre páginas.
   $_pagi_separador = " ";
//Cantidad de enlaces a los números de página que se mostrarán como máximo en la barra de navegación.
   $_pagi_nav_num_enlaces=5;
//Incluimos el script de paginación. Éste ya ejecuta la consulta automáticamente 
   @include("../librerias/paginador/paginator.inc.php"); 

//Leemos y escribimos los registros de la página actual 
   while($row = mysql_fetch_array($_pagi_result)){ 
    echo "<tr><td style='width:20%;'>".$row['cod_ciudad']."</td>
    <td align='left'>".$row['nombre_ciudad']."</td>
    <td align='left'>".$row['nombre_estado']."</td></tr>"; 
  } 
//Incluimos la barra de navegación 
  ?>
</table>
<div class="pagination">
 <ul>
   <?php echo"<li>".$_pagi_navegacion."</li>";?>
 </ul>
</div>
</div>
<?php }?>