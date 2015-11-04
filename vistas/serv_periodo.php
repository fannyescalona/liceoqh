<?php
if(isset($_SESSION['datos']['descripcion'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='periodo';
if(isset($_SESSION['datos'])){
  @$descripcion=$_SESSION['datos']['descripcion'];
  @$codigo_periodo=$_SESSION['datos']['cod_periodo'];
  @$fecha_inicio=$_SESSION['datos']['fecha_inicio'];
  @$fecha_fin=$_SESSION['datos']['fecha_fin'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$descripcion=null;
  @$codigo_periodo=null;
  @$fecha_inicio=null;
  @$fecha_fin=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_periodo.js"> </script>
  <form action="../controladores/cont_periodo.php" method="post" id="form">
   <fieldset>
    <legend>Trayecto</legend>
    <div id="contenedorFormulario">
      <label class="sr-only">Código:</label>
      <input class="campoTexto" placeholder="El código del trayecto es generado por el sistema" title="El código del trayecto es generado por el sistema" name="cod_periodo" id="cod_periodo" type="text" size="10" readonly value="<?= $codigo_periodo;?>" required />
      <label>Nombre del Trayecto:</label>
      <input class="campoTexto" placeholder="Ingrese el nombre del trayecto" title="Ingrese el nombre del trayecto" onKeyUp="this.value=this.value.toUpperCase()" name="descripcion" id="descripcion" type="text" size="50" value="<?= $descripcion;?>" required />
      <label>Fecha de Inicio del Trayecto:</label>
      <input class="campoTexto" placeholder="Seleccione la fecha de inicio del trayecto" title="Seleccione la fecha de inicio del trayecto" type="text" size="35" name="fecha_inicio" id="fecha_inicio" value="<?= $fecha_inicio;?>" required />
      <label>Fecha de Inicio del Culminación:</label>
      <input class="campoTexto" placeholder="Seleccione la fecha de culminación del trayecto" title="Seleccione la fecha de culminaci&oacute;n del trayecto" type="text" size="35" name="fecha_fin" id="fecha_fin" value="<?= $fecha_fin;?>" required />

      <br />
      <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
    </div>
    <br />
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
  <a href="?periodo" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_periodo.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
  <table class="table table-striped table-bordered table-condensed">
   <tr> 
    <td>Código</td>
     <td>Trayecto</td>
     <td>Fecha Inicio</td>
     <td>Fecha Fin</td>
   </tr>
   <?php

           //Conexión a la base de datos 
   require_once("../clases/class_bd.php");
   $mysql=new Conexion();

//Sentencia sql (sin limit) 
   $_pagi_sql = "SELECT cod_periodo,descripcion,date_format(fecha_inicio,'%d/%m/%Y') fecha_inicio,date_format(fecha_fin,'%d/%m/%Y') fecha_fin 
   FROM tperiodo WHERE esinscripcion='N' AND fecha_desactivacion IS NULL 
   ORDER BY cod_periodo DESC"; 
//cantidad de resultados por página (opcional, por defecto 20) 
   $_pagi_cuantos = 10; 
//Cadena que separa los enlaces numéricos en la barra de navegación entre páginas.
   $_pagi_separador = " ";
//Cantidad de enlaces a los números de página que se mostrarán como máximo en la barra de navegación.
   $_pagi_nav_num_enlaces=5;
//Incluipos el script de paginación. Éste ya ejecuta la consulta automáticamente 
   @include("../librerias/paginador/paginator.inc.php"); 

//Leemos y escribimos los registros de la página actual 
   while($row = mysql_fetch_array($_pagi_result)){ 
    echo "<tr><td style='width:20%;'>".$row['cod_periodo']."</td><td align='left'>".$row['descripcion']."</td><td align='left'>".$row['fecha_inicio']."</td><td align='left'>".$row['fecha_fin']."</td></tr>"; 
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