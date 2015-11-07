<?php
if(isset($_SESSION['datos']['descripcion'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='cargo';
if(isset($_SESSION['datos'])){
  @$descripcion=$_SESSION['datos']['descripcion'];
  @$codigo_cargo=$_SESSION['datos']['codigo_cargo'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$descripcion=null;
  @$codigo_cargo=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>

  <script src="../js/uds_cargo.js"> </script>
  <form action="../controladores/cont_cargo.php" method="post" id="form">
    <fieldset>
      <!--Nombre del Formulario-->
      <legend>Rol o Cargo</legend>   
      <div id="contenedorFormulario">
        <label>Código:</label>
        <input title="el código del cargo es generado por el sistema" name="codigo_cargo" id="codigo_cargo" type="text" readonly value="<?= $codigo_cargo;?>" required="" placeholder="Código del cargo es generado por el sistema" class="campoTexto"/>
        <label>Nombre del Cargo:</label>
        <input title="Ingrese el nombre del cargo" onKeyUp="this.value=this.value.toUpperCase()" name="descripcion" id="descripcion" type="text" placeholder="Ingrese Nombre del cargo" class="campoTexto" value="<?= $descripcion;?>" required="" />        
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
  <a href="?cargo" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_cargo.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
  <table style="width:100%;" class="tablapaginacion">
   <table class="table table-striped table-bordered table-condensed"> 
     <td>Código</td>
     <td>Rol o Cargo</td>
   </tr>
   <?php

           //Conexión a la base de datos 
   require_once("../clases/class_bd.php");
   $mysql=new Conexion();

//Sentencia sql (sin limit) 
   $_pagi_sql = "SELECT * FROM tcargo where fecha_desactivacion is null order by codigo_cargo desc"; 
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
    echo "<tr><td style='width:20%;'>".$row['codigo_cargo']."</td><td align='left'>".$row['descripcion']."</td></tr>"; 
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