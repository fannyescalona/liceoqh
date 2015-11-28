<?php
if(isset($_SESSION['datos']['descripcion'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='inscripcion';
if(isset($_SESSION['datos'])){
  @$codigo_inscripcion=$_SESSION['datos']['codigo_inscripcion'];
  @$descripcion=$_SESSION['datos']['descripcion'];
  @$fecha_inicio=$_SESSION['datos']['fecha_inicio'];
  @$fecha_fin=$_SESSION['datos']['fecha_fin'];
  @$fecha_cierre=$_SESSION['datos']['fecha_cierre'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$codigo_inscripcion=null;
  @$fecha_inicio=null;
  @$fecha_fin=null;
  @$fecha_cierre=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_inscripcion.js"> </script>
  <form action="../controladores/cont_inscripcion.php" method="post" id="form">
   <fieldset>
    <legend>Período de Inscripción</legend>
    <div id="contenedorFormulario">
      <label>Código</label>
      <input title="El c&oacute;digo del inscripcion es generado por el sistema" name="codigo_inscripcion" id="codigo_inscripcion" type="text" size="10"  value="<?= $codigo_inscripcion;?>" placeholder="El código del inscripcion es generado por el Sistema" class="campoTexto" readonly />
      <label>Período de Inscripción:</label>
      <input title="Ingrese el nombre del Período de Inscripción" onKeyUp="this.value=this.value.toUpperCase()" name="descripcion" id="descripcion" type="text" placeholder="Ingrese Nombre del Período de Inscripción" class="campoTexto" value="<?= $descripcion;?>" required /> 
      <label>Fecha Inicio</label>
      <input title="Ingrese la fecha inicio del inscripcion" name="fecha_inicio" id="fecha_inicio" type="text" size="50" value="<?= $fecha_inicio;?>" placeholder="Ingrese la fecha inicio del inscripcion" class="campoTexto">    
      <label>Fecha Fin</label>
      <input title="Ingrese la fecha fin del inscripcion" name="fecha_fin" id="fecha_fin" type="text" size="50" value="<?= $fecha_fin;?>" placeholder="Ingrese la fecha fin del inscripcion" class="campoTexto">    
   	  <label>Fecha Cierre</label>
      <input title="Ingrese la fecha cierre del inscripcion" name="fecha_cierre" id="fecha_cierre" type="text" size="50" value="<?= $fecha_cierre;?>" placeholder="Ingrese la fecha cierre" class="campoTexto">    
      <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
    </div>
     <br>
     <?php echo '<p class="'.$estatus.'" id="estatus_registro">'.$estatus.'</p>'; ?>
     <?php
      imprimir_boton($disabledRC,$disabledMD,$estatus,$servicios);
     ?>  
    </fieldset>     
  </form>
</form>
<br>
<?php }else{ 
  require_once("../clases/class_perfil.php");
  $perfil=new Perfil();
  $perfil->codigo_perfil(@$_SESSION['user_codigo_perfil']);
  $inscripcions_permitidos=$perfil->IMPRIMIR_SERVICIOS_USUARIO();
  $inscripcion_solicitado=strtolower(preg_replace('/(serv_)|(\.php)/','',basename(__FILE__))); 
  ?>
  <a href="?inscripcion" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_inscripcion.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$inscripcion_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
<table class="table table-striped table-bordered table-condensed">
 <tr> 
   <td>Código</td>
   <td>Período de Inscripción</td>
   <td>Fecha Inicio</td>
   <td>Fecha Fin</td>
   <td>Fecha Cierre</td>
 </tr>
 <?php

           //Conexión a la base de datos 
 require_once("../clases/class_bd.php");
 $mysql=new Conexion();

//Sentencia sql (sin limit) 
 $_pagi_sql = "SELECT codigo_inscripcion,descripcion,date_format(fecha_inicio,'%d/%m/%Y') AS fecha_inicio,
    date_format(fecha_fin,'%d/%m/%Y') AS fecha_fin,date_format(fecha_cierre,'%d/%m/%Y') AS fecha_cierre
 FROM tinscripcion WHERE fecha_desactivacion IS NULL ORDER BY codigo_inscripcion DESC"; 
 
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
  echo "<tr style='cursor: pointer;' id='".$row['descripcion']."' onclick='enviarForm(this.id)'>
  <td style='width:20%;'>".$row['codigo_inscripcion']."</td>
  <td align='left'>".$row['descripcion']."</td>
  <td align='left'>".$row['fecha_inicio']."</td>
    <td align='left'>".$row['fecha_fin']."</td>
    <td align='left'>".$row['fecha_cierre']."</td></tr>"; 
} 
//Incluimos la barra de navegación 
?>
</table>
<script type="text/javascript">
function enviarForm(value){
  document.getElementById('campo_oculto').value=value;
  document.getElementById('form1').submit();
}
</script>
<form id="form1" method="POST" action="../controladores/cont_inscripcion.php">
  <input type="hidden" name="descripcion" id="campo_oculto" value="" />
  <input type="hidden" name="operacion" id="operacion" value="Consultar" />
</form>
<div class="pagination">
 <ul>
   <?php echo"<li>".$_pagi_navegacion."</li>";?>
 </ul>
</div>
</div>
<?php }?>