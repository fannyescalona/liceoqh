<?php
require_once("../clases/class_perfil.php");
$perfil=new Perfil();
$perfil->codigo_perfil(@$_SESSION['user_codigo_perfil']);
$servicios_permitidos=$perfil->IMPRIMIR_SERVICIOS_USUARIO();
$servicio_solicitado=strtoupper(preg_replace('/(serv_)|(\.php)/','',basename(__FILE__)));
if(array_search($servicio_solicitado,$servicios_permitidos)){
  if(isset($_SESSION['datos']['nombre_pais'])){ 
   $disabledRC='disabled';
   $disabledMD='';
   $estatus=null;
 }else {
   $disabledRC='';
   $disabledMD='disabled';
 }
 $servicios='pais';
 if(isset($_SESSION['datos'])){
  @$nombre_pais=$_SESSION['datos']['nombre_pais'];
  @$codigo_pais=$_SESSION['datos']['cod_pais'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$nombre_pais=null;
  @$codigo_pais=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_pais.js"> </script>
  <form action="../controladores/cont_pais.php" method="post" id="form" class="form-horizontal">
   <fieldset>
    <legend>País</legend>
    <div id="contenedorFormulario">
      <label>Código:</label>
     <input title="el código del país es generado por el sistema" name="cod_pais" id="cod_pais" type="text" size="10" readonly value="<?= $codigo_pais;?>" placeholder="Código del País es generado por el sistema" class="campoTexto"/>
     <label>Nombre del País:</label>
     <input title="Ingrese el nombre del País" onKeyUp="this.value=this.value.toUpperCase()" name="nombre_pais" id="nombre_pais" type="text" size="50" value="<?= $nombre_pais;?>" required="" placeholder="Ingrese el nombre del País" class="campoTexto"/>      
     <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
   </div>   
   <br>
   <?php echo '<p class="'.$estatus.'" id="estatus_registro">'.$estatus.'</p>'; ?>
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
  <a href="?pais"><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_pais.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
  <table class="table table-striped table-bordered table-condensed">
   <tr> 
     <td>Código </td>
     <td>Nombre</td>
   </tr>
   <?php

           //Conexión a la base de datos 
   require_once("../clases/class_bd.php");
   $mysql=new Conexion();

//Sentencia sql (sin limit) 
   $_pagi_sql = "SELECT * FROM tpais where fecha_desactivacion is null order by cod_pais desc"; 
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
    echo "<tr><td style='width:20%;'>".$row['cod_pais']."</td><td align='left'>".$row['nombre_pais']."</td></tr>"; 
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
<?php }else{

  include('403.php');    	
}?>