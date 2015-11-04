<?php
if(isset($_SESSION['datos']['descripcion'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='municipio';
if(isset($_SESSION['datos'])){
  @$descripcion=$_SESSION['datos']['descripcion'];
  @$codigo_municipio=$_SESSION['datos']['codigo_municipio'];
  @$codigo_ciudad=$_SESSION['datos']['codigo_estado'];
  @$estatus=$_SESSION['datos']['estatus'];             
}
else{
  @$descripcion=null;
  @$codigo_municipio=null;
  @$codigo_ciudad=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_municipio.js"> </script>
  <form action="../controladores/cont_municipio.php" method="post" id="form">
   <fieldset>
    <legend>Municipio</legend>
    <div id="contenedorFormulario">
      <label>Código:</label>
      <input title="El código del municipio es generado por el sistema" name="codigo_municipio" id="codigo_municipio" type="text" size="10" readonly value="<?= $codigo_municipio;?>" placeholder="El código del municipio es generado por el sistema" class="campoTexto" required=""/> 
      <label>Nombre del Municipio:</label>
      <input title="Ingrese el nombre del municipio" onKeyUp="this.value=this.value.toUpperCase()" name="descripcion" id="descripcion" type="text" size="50" value="<?= $descripcion;?>" placeholder="Ingrese el nombre del municipio" class="campoTexto" required=""/>
      <label>Seleccione un Estado:</label>
      <select name="codigo_estado" id="codigo_estado" title="Seleccione un Estado" class="campoTexto" required="">
        <option value='0'>Seleccione un Estado</option>
        <?php
        require_once("../clases/class_bd.php");
        $mysql=new Conexion();
        $sql = "SELECT codigo_estado,upper(descripcion) descripcion FROM testado WHERE fecha_desactivacion IS NULL ORDER BY codigo_estado";
        $query = $mysql->Ejecutar($sql);
        while ($row = $mysql->Respuesta($query)){
          if($row['codigo_estado']==$codigo_ciudad){
            echo "<option value='".$row['codigo_estado']."' selected>".$row['descripcion']."</option>";
          }else{
            echo "<option value='".$row['codigo_estado']."'>".$row['descripcion']."</option>";
          }
        }
        ?>
      </select>                        
      <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
    </div>
    <br>
    <?php echo '<p class="'.$estatus.'" id="estatus_registro">'.$estatus.'</p>'; ?>
    <tr>                 
      <?php
      imprimir_boton($disabledRC,$disabledMD,$estatus,$servicios);
      ?>                              
    </fieldset>
  </form>
  <br>
  <?php }else{ 

    require_once("../clases/class_perfil.php");
    $perfil=new Perfil();
    $perfil->codigo_perfil(@$_SESSION['user_codigo_perfil']);
    $servicios_permitidos=$perfil->IMPRIMIR_SERVICIOS_USUARIO();
    $servicio_solicitado=strtolower(preg_replace('/(serv_)|(\.php)/','',basename(__FILE__)));
    ?>
    <a href="?municipio" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
    <a href="../excel/excel_municipio.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
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
     $_pagi_sql = "SELECT m.codigo_municipio,m.descripcion AS municipio,m.fecha_desactivacion,c.codigo_estado,c.descripcion AS estado FROM tmunicipio m 
     INNER JOIN testado c ON m.codigo_estado = c.codigo_estado WHERE m.fecha_desactivacion IS NULL ORDER BY m.codigo_municipio DESC"; 
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
      echo "<tr><td style='width:20%;'>".$row['codigo_municipio']."</td><td align='left'>".$row['municipio']."</td><td align='left'>".$row['estado']."</td></tr>"; 
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