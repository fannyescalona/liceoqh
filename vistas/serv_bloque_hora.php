<?php
if(isset($_SESSION['datos']['cod_bloque_hora'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='bloque_hora';
if(isset($_SESSION['datos'])){
  @$cod_bloque_hora=$_SESSION['datos']['cod_bloque_hora'];
  @$hora_inicio=$_SESSION['datos']['hora_inicio'];
  @$hora_fin=$_SESSION['datos']['hora_fin'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$cod_bloque_hora=null;
  @$hora_inicio=null;
  @$hora_fin=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_bloque_hora.js"> </script>
  <form action="../controladores/cont_bloque_hora.php" method="post" id="form">

    <fieldset>
      <legend>Bloque de Horas</legend>
      <div id="contenedorFormulario">
        <label>Código:</label>
        <input title="El código del bloque de hora es generado por el sistema" name="cod_bloque_hora" id="cod_bloque_hora" type="text" size="10" readonly value="<?= $cod_bloque_hora;?>" placeholder="El Código del Bloque de hora es generado por el sistema" class="campoTexto"/> </td></tr>
        <label>Hora de Inicio:</label>
        <input title="Seleccione la hora de inicio" name="hora_inicio" id="hora_inicio" type="text" size="50" value="<?= $hora_inicio;?>" placeholder="Ingrese La Hora Inicio" class="campoTexto" required ></td></tr>
        <label>Hora de Culminación:</label>
        <input title="Seleccione la hora de culminación" name="hora_fin" id="hora_fin" type="text" size="50" value="<?= $hora_fin;?>" placeholder="Ingrese la Hora Fin" class="campoTexto"required ></td></tr>
      </select>
      <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
    </div>    
    <br/><br/>
    <?php echo '<tr><td colspan="2" class="'.$estatus.'" id="estatus_registro">'.$estatus.'</td></tr>'; ?>

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
  <a href="?bloque_hora" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_bloque_hora.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>

  <table class="table table-striped table-bordered table-condensed">
   <tr> 
     <td>Código</td>
     <td>Hora de Inicio</td>
     <td>Hora Fin</td>
     <td>Turno</td>
   </tr>
   <?php

           //Conexión a la base de datos 
   require_once("../clases/class_bd.php");
   $mysql=new Conexion();

//Sentencia sql (sin limit) 
   $_pagi_sql = "SELECT cod_bloque_hora,time_format(hora_inicio,'%h:%i %p') hora_inicio,
   time_format(hora_fin,'%h:%i %p') hora_fin,Case turno When '0' Then 'Mañana' When '1' Then 'Tarde' Else 'Noche' End turno 
   FROM bloque_hora where fecha_desactivacion is null order by cod_bloque_hora desc"; 
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
    echo "<tr><td style='width:20%;'>".$row['cod_bloque_hora']."</td>
    <td align='left'>".$row['hora_inicio']."</td>
    <td align='left'>".$row['hora_fin']."</td>
    <td align='left'>".$row['turno']."</td>
    </tr>"; 
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