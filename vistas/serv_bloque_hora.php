<?php
require_once("../clases/class_perfil.php");
$perfil=new Perfil();
$perfil->codigo_perfil(@$_SESSION['user_codigo_perfil']);
$servicios_permitidos=$perfil->IMPRIMIR_SERVICIOS_USUARIO();
$servicio_solicitado=strtoupper(preg_replace('/(serv_)|(\.php)/','',basename(__FILE__)));
if(array_search($servicio_solicitado,$servicios_permitidos)!==false){
  if(isset($_SESSION['datos']['descripcion'])){ 
   $disabledRC='disabled';
   $disabledMD='';
   $estatus=null;
 }else {
   $disabledRC='';
   $disabledMD='disabled';
 }
 $servicios='bloque_hora';
 if(isset($_SESSION['datos'])){
  @$codigo_bloque_hora=$_SESSION['datos']['codigo_bloque_hora'];
  @$descripcion=$_SESSION['datos']['descripcion'];
  @$hora_inicio=$_SESSION['datos']['hora_inicio'];
  @$hora_fin=$_SESSION['datos']['hora_fin'];
  @$receso=$_SESSION['datos']['receso'];
  @$turno=$_SESSION['datos']['turno'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$codigo_bloque_hora=null;
  @$descripcion=null;
  @$hora_inicio=null;
  @$hora_fin=null;
  @$receso="N";
  @$turno=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_bloque_hora.js"> </script>
  <form action="../controladores/cont_bloque_hora.php" method="post" id="form" class="form-horizontal">
   <fieldset>
    <legend>Bloques de Hora</legend>
    <div id="contenedorFormulario">
      <label>Código:</label>
     <input title="el código del bloque de hora es generado por el sistema" name="codigo_bloque_hora" id="codigo_bloque_hora" type="text" size="10" readonly value="<?= $codigo_bloque_hora;?>" placeholder="Código del bloque de hora es generado por el sistema" class="campoTexto"/>
     <label>Nombre:</label>
     <input title="Ingrese el nombre del bloque de hora" onKeyUp="this.value=this.value.toUpperCase()" name="descripcion" id="descripcion" type="text" size="50" value="<?= $descripcion;?>" required placeholder="Ingrese el nombre del bloque de hora" class="campoTexto"/>
     <label>Hora Inicio:</label>
     <input title="Ingrese la hora de inicio del bloque de hora" name="hora_inicio" id="hora_inicio" type="text" size="50" value="<?= $hora_inicio;?>" required readonly class="campoTexto"/>
     <label>Hora Fin:</label>
     <input title="Ingrese la hora de salida del bloque de hora" name="hora_fin" id="hora_fin" type="text" size="50" value="<?= $hora_fin;?>" required readonly class="campoTexto"/>
     <label>Turno:</label>
     <select name="turno" id="turno" title="Seleccione un turno para el bloque de hora" placeholder="Seleccione un turno" class="campoTexto" required >
      <option value=''>Seleccione un Turno</option>
      <option value='M' <?php if($turno=='M'){ echo 'selected'; }?>> Mañana</option>
      <option value='T' <?php if($turno=='T'){ echo 'selected'; }?>> Tarde</option>
     </select>
     <label>Receso:</label>
      <input tabindex=1 name="receso" id="receso" type="radio" value="Y" <?php if($receso=="Y"){ echo "checked='checked'"; } ?>  required />
      <span>SÍ</span>
      <input tabindex=2 name="receso" id="receso" type="radio" value="N" <?php if($receso=="N"){ echo "checked='checked'"; } ?> required />
      <span>NO</span>
     <br><strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
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
  <a href="?bloque_hora"><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_bloque_hora.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
  <table class="table table-striped table-bordered table-condensed">
   <tr> 
     <td>Código </td>
     <td>Nombre</td>
     <td>Hora Inicio</td>
     <td>Hora Fin</td>
     <td>Turno</td>
     <td>Receso</td>
   </tr>
   <?php

           //Conexión a la base de datos 
   require_once("../clases/class_bd.php");
   $mysql=new Conexion();

//Sentencia sql (sin limit) 
  $_pagi_sql = "SELECT codigo_bloque_hora,descripcion,hora_inicio,hora_fin,
  date_format(hora_inicio,'%r') AS hora_inicio_formateada,date_format(hora_fin,'%r') AS hora_fin_formateada,
  CASE WHEN turno = 'M' THEN 'MAÑANA' ELSE 'TARDE' END AS turno,CASE WHEN receso = 'Y' THEN 'SÍ' ELSE 'NO' END AS receso 
  FROM tbloque_hora where fecha_desactivacion is null order by codigo_bloque_hora desc"; 
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
    echo "<tr style='cursor: pointer;' id='".$row['descripcion']."_".$row['hora_inicio']."_".$row['hora_fin']."' onclick='enviarForm(this.id)'>
    <td style='width:20%;'>".$row['codigo_bloque_hora']."</td>
    <td align='left'>".$row['descripcion']."</td>
    <td align='left'>".$row['hora_inicio_formateada']."</td>
    <td align='left'>".$row['hora_fin_formateada']."</td>
    <td align='left'>".$row['turno']."</td>
    <td align='left'>".$row['receso']."</td></tr>"; 
  } 
//Incluimos la barra de navegación 
  ?>
</table>
<script type="text/javascript">
function enviarForm(value){
  var data = value.split('_');
  document.getElementById('campo_oculto1').value=data[0];
  document.getElementById('campo_oculto2').value=data[1];
  document.getElementById('campo_oculto3').value=data[2];
  document.getElementById('form1').submit();
}
</script>
<form id="form1" method="POST" action="../controladores/cont_bloque_hora.php">
  <input type="hidden" name="descripcion" id="campo_oculto1" value="" />
  <input type="hidden" name="hora_inicio" id="campo_oculto2" value="" />
  <input type="hidden" name="hora_inicio" id="campo_oculto3" value="" />
  <input type="hidden" name="operacion" id="operacion" value="Consultar" />
</form>
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