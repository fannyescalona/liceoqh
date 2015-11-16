<?php
if(isset($_SESSION['datos']['seccion'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='seccion';
if(isset($_SESSION['datos'])){
  @$seccion=$_SESSION['datos']['seccion'];
  @$descripcion=$_SESSION['datos']['descripcion'];
  @$turno=$_SESSION['datos']['turno'];
  @$capacidad_min=$_SESSION['datos']['capacidad_min'];
  @$capacidad_max=$_SESSION['datos']['capacidad_max'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$seccion=null;
  @$descripcion=null;
  @$turno=null;
  @$capacidad_min=null;
  @$capacidad_max=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_seccion.js"> </script>
  <form action="../controladores/cont_seccion.php" method="post" id="form">
   <fieldset>
    <legend>Sección</legend>
    <div id="contenedorFormulario">
      <label>Código de la sección:</label>
      <input type="hidden" name="oldseccion" value="<?= @$seccion?>">
      <input title="Ingrese el Código de la sección" onKeyUp="this.value=this.value.toUpperCase()" maxlength=5 name="seccion" id="seccion" type="text" size="50" value="<?= $seccion;?>" placeholder="Ingrese el Código de la Sección" class="campoTexto" required />
      <label>Sección</label>
      <input type="text" name="descripcion" id="descripcion" onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el nombre de la sección" size="50" placeholder="Ingrese el nombre de la sección" class="campoTexto" value="<?= $descripcion;?>" required />
      <label>Asigne el Turno:</label>
      <select name="turno" id="turno" title="Seleccione un turno para la secci&oacute;n" placeholder="Seleccione un turno" class="campoTexto"  required >
        <option value='0'>Seleccione un Turno</option>
        <option value='M' <?php if($turno=='M'){ echo 'selected'; }?>> Mañana</option>
        <option value='T' <?php if($turno=='T'){ echo 'selected'; }?>> Tarde</option>
      </select>
      <label>Capacidad Mínima de la Sección:</label>
      <input title="Ingrese la capacidad mínima de la sección" onKeyPress="return isNumberKey(event)" name="capacidad_min" id="capacidad_min" maxlength=2 type="text" size="50" value="<?= $capacidad_min;?>" placeholder="Ingrese la Capacidad Mínima" class="campoTexto" required />
      <label>Capacidad Máxima de la sección:</label>
      <input title="Ingrese la capacidad máxima de la sección" onKeyPress="return isNumberKey(event)" name="capacidad_max" id="capacidad_max" maxlength=2 type="text" size="50" value="<?= $capacidad_max;?>" placeholder="Ingrese la Capacidad Máxima" class="campoTexto" required />
      </table>
      <br/>
      <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
    </div>    
    <br><br>
    <?php echo '<p class="'.$estatus.'" id="estatus_registro">'.$estatus.'</p>'; 
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
  <a href="?seccion" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_seccion.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
  
  <table class="table table-striped table-bordered table-condensed">
   <tr> 
     <td>Código Sección</td>
     <td>Sección</td>
     <td>Turno</td>
     <td>Capacidad Mínima</td>
     <td>Capacidad Máxima</td>
     
   </tr>
   <?php

           //Conexión a la base de datos 
   require_once("../clases/class_bd.php");
   $mysql=new Conexion();

//Sentencia sql (sin limit) 
   $_pagi_sql = "SELECT seccion,descripcion,CASE turno WHEN 'M' THEN 'MAÑANA' ELSE 'TARDE' END AS turno, 
   capacidad_max,capacidad_min 
   FROM tseccion where fecha_desactivacion is null order by seccion desc";  
//Booleano. Define si se utiliza pg_num_rows() (true) o COUNT(*) (false).
   $_pagi_conteo_alternativo = true;
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
    echo "<tr><td style='width:20%;'>".$row['seccion']."</td>
    <td align='left'>".$row['descripcion']."</td>
    <td align='left'>".$row['turno']."</td>
    <td align='left'>".$row['capacidad_min']."</td>
    <td align='left'>".$row['capacidad_max']."</td></tr>"; 
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