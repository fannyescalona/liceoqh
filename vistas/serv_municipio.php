<?php
if(isset($_SESSION['datos']['nombre_municipio'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='municipio';
if(isset($_SESSION['datos'])){
  @$nombre_municipio=$_SESSION['datos']['nombre_municipio'];
  @$codigo_municipio=$_SESSION['datos']['cod_municipio'];
  @$codigo_ciudad=$_SESSION['datos']['cod_ciudad'];
  @$estatus=$_SESSION['datos']['estatus'];             
}
else{
  @$nombre_municipio=null;
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
      <input title="El código del municipio es generado por el sistema" name="cod_municipio" id="cod_municipio" type="text" size="10" readonly value="<?= $codigo_municipio;?>" placeholder="El código del municipio es generado por el sistema" class="campoTexto" required=""/> 
      <label>Nombre del Municipio:</label>
      <input title="Ingrese el nombre del municipio" onKeyUp="this.value=this.value.toUpperCase()" name="nombre_municipio" id="nombre_municipio" type="text" size="50" value="<?= $nombre_municipio;?>" placeholder="Ingrese el nombre del municipio" class="campoTexto" required=""/>
      <label>Seleccione una Ciudad:</label>
      <select name="cod_ciudad" id="cod_ciudad" title="Seleccione una ciudad" class="campoTexto" required="">
        <option value='0'>Seleccione una Ciudad</option>
        <?php
        require_once("../clases/class_bd.php");
        $mysql=new Conexion();
        $sql = "SELECT cod_ciudad,upper(nombre_ciudad) nombre_ciudad FROM tciudad WHERE fecha_desactivacion IS NULL ORDER BY cod_ciudad";
        $query = $mysql->Ejecutar($sql);
        while ($row = $mysql->Respuesta($query)){
          if($row['cod_ciudad']==$codigo_ciudad){
            echo "<option value='".$row['cod_ciudad']."' selected>".$row['nombre_ciudad']."</option>";
          }else{
            echo "<option value='".$row['cod_ciudad']."'>".$row['nombre_ciudad']."</option>";
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
       <td>Ciudad</td>
     </tr>
     <?php

           //Conexión a la base de datos 
     require_once("../clases/class_bd.php");
     $mysql=new Conexion();

//Sentencia sql (sin limit) 
     $_pagi_sql = "SELECT m.cod_municipio,m.nombre_municipio,m.fecha_desactivacion,c.cod_ciudad,c.nombre_ciudad FROM tmunicipio m 
     INNER JOIN tciudad c ON m.cod_ciudad = c.cod_ciudad WHERE m.fecha_desactivacion IS NULL ORDER BY m.cod_municipio DESC"; 
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
      echo "<tr><td style='width:20%;'>".$row['cod_municipio']."</td><td align='left'>".$row['nombre_municipio']."</td><td align='left'>".$row['nombre_ciudad']."</td></tr>"; 
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