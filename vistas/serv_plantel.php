<?php
  if(isset($_SESSION['datos']['nombre'])){ 
   $disabledRC='disabled';
   $disabledMD='';
   $estatus=null;
 }else {
   $disabledRC='';
   $disabledMD='disabled';
 }
 $servicios='plantel';
 if(isset($_SESSION['datos'])){
  @$codigo_plantel=$_SESSION['datos']['codigo_plantel'];
  @$nombre=$_SESSION['datos']['nombre'];
  @$direccion=$_SESSION['datos']['direccion'];
  @$telefono_habitacion=$_SESSION['datos']['telefono_habitacion'];
  @$localidad=$_SESSION['datos']['localidad'];
  @$codigo_municipio=$_SESSION['datos']['codigo_municipio'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$codigo_plantel=null;
  @$nombre=null;
  @$direccion=null;
  @$telefono_habitacion=null;
  @$localidad=null;
  @$codigo_municipio=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script type="text/javascript" src="../js/uds_plantel.js"> </script>
  <form action="../controladores/cont_plantel.php" method="post" id="form">
   <fieldset>
    <legend>Plantel</legend>
    <div id="contenedorFormulario">
      <label>Código:</label>
      <input title="Ingrese el código del plantel educativo" onKeyUp="this.value=this.value.toUpperCase()" name="codigo_plantel" id="codigo_plantel" type="text" size="10"  value="<?= $codigo_plantel;?>" placeholder="Ingrese el código del plantel" class="campoTexto" required />
      <label>Nombre del Plantel Educativo:</label>
      <input title="Ingrese el nombre del plantel educativo" onKeyUp="this.value=this.value.toUpperCase()" name="nombre" id="nombre" type="text" size="50" value="<?= $nombre;?>" placeholder="Ingrese el nombre del plantel educativo" class="campoTexto" required />
      <label>Dirección del Plantel Educativo:</label>
      <textarea onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese la dirección del plantel educativo" name="direccion" id="direccion" placeholder="Ingrese la Dirección" rows=5 required /><?php echo $direccion;?></textarea>
      <label>Teléfono:</label>
      <input maxlength=11 title="Ingrese el número telefónico" onKeyPress="return isNumberKey(event)" name="telefono_habitacion" id="telefono_habitacion" type="text" size="50" value="<?= $telefono_habitacion;?>" placeholder="Ingrese el Número Telefónico" class="campoTexto" required />
      <label>Localidad:</label>
      <input title="Ingrese la localidad del plantel educativo" onKeyUp="this.value=this.value.toUpperCase()" name="localidad" id="localidad" type="text" size="50" value="<?= $localidad;?>" placeholder="Ingrese la localidad del plantel educativo" class="campoTexto" required />
      <label>Municipio:</label>
      <input title="Seleccione un Municipio" onKeyUp="this.value=this.value.toUpperCase()" name="codigo_municipio" id="codigo_municipio" type="text" size="50" value="<?= $codigo_municipio;?>" placeholder="Seleccione un municipio" class="campoTexto" required />
      <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
    </div>    
    <br>
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
  <a href="?plantel" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_plantel.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
  <table class="table table-striped table-bordered table-condensed">
   <tr> 
     <td>Código </td>
     <td>Nombre del Plantel</td>
     <td>Telefóno</td>
     <td>Localidad</td>
     <td>Municipio</td>
   </tr>
   <?php
//Conexión a la base de datos 
require_once("../clases/class_bd.php");
$mysql=new Conexion();

//Sentencia sql (sin limit) 
$_pagi_sql = "SELECT p.codigo_plantel,p.nombre,p.telefono_habitacion,p.localidad,m.descripcion AS municipio 
FROM tplantel p 
INNER JOIN tmunicipio m ON p.codigo_municipio = m.codigo_municipio 
WHERE p.fecha_desactivacion IS NULL ORDER BY p.codigo_plantel DESC"; 
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
    echo "<tr><td style='width:20%;'>".$row['codigo_plantel']."</td><td align='left'>".$row['nombre']."</td><td align='left'>".$row['telefono_habitacion']."</td><td align='left'>".$row['localidad']."</td><td align='left'>".$row['municipio']."</td></tr>"; 
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
<?php }