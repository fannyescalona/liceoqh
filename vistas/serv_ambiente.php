<?php
require_once("../clases/class_perfil.php");
$perfil=new Perfil();
$perfil->codigo_perfil(@$_SESSION['user_codigo_perfil']);
$servicios_permitidos=$perfil->IMPRIMIR_SERVICIOS_USUARIO();
$servicio_solicitado=strtoupper(preg_replace('/(serv_)|(\.php)/','',basename(__FILE__)));
if(array_search($servicio_solicitado,$servicios_permitidos)){
  if(isset($_SESSION['datos']['nombre_ambiente'])){ 
   $disabledRC='disabled';
   $disabledMD='';
   $estatus=null;
 }else {
   $disabledRC='';
   $disabledMD='disabled';
 }
 $servicios='ambiente';
 if(isset($_SESSION['datos'])){
  @$nombre_ambiente=$_SESSION['datos']['nombre_ambiente'];
  @$codigo_ambiente=$_SESSION['datos']['cod_ambiente'];
  @$tipo_ambiente=$_SESSION['datos']['tipo_ambiente'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$nombre_ambiente=null;
  @$codigo_ambiente=null;
  @$tipo_ambiente=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_ambiente.js"> </script>
  <form action="../controladores/cont_ambiente.php" method="post" id="form">
   <fieldset>
    <legend>Aula</legend>
    <div id="contenedorFormulario">
      <label>Código:</label>
      <input title="Ingrese el código del aula" onKeyUp="this.value=this.value.toUpperCase()" name="cod_ambiente" id="cod_ambiente" type="text" size="10"  value="<?= $codigo_ambiente;?>" placeholder="Ingrese el código del Aula" class="campoTexto" required />
      <label>Nombre del Aula:</label>
      <input title="Ingrese el nombre del aula" onKeyUp="this.value=this.value.toUpperCase()" name="nombre_ambiente" id="nombre_ambiente" type="text" size="50" value="<?= $nombre_ambiente;?>" placeholder="Ingrese el nombre del Aula" class="campoTexto" required />
      <label>Tipo de Aula:</label>
      <select name="tipo_ambiente" id="tipo_ambiente" title="Seleccione un tipo de aula" placeholder="Seleccione el Tipo de Aula" class="campoTexto"required > 
        <option value=0>Seleccione un tipo de aula</option>
        <option value="A" <? if($tipo_ambiente=="A") echo "selected"; ?> >Aula</option>
        <option value="C" <? if($tipo_ambiente=="C") echo "selected"; ?> >Cancha</option>
        <option value="L" <? if($tipo_ambiente=="L") echo "selected"; ?> >Laboratorio</option>
      </select> 
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
  <a href="?ambiente" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_aula.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
  <table class="table table-striped table-bordered table-condensed">
   <tr> 
     <td>Código </td>
     <td>Nombre</td>
     <td>Tipo de Aula</td>
   </tr>
   <?php

           //Conexión a la base de datos 
   require_once("../clases/class_bd.php");
   $mysql=new Conexion();

//Sentencia sql (sin limit) 
   $_pagi_sql = "SELECT cod_ambiente,nombre_ambiente,CASE tipo_ambiente WHEN 'A' THEN 'Aula' WHEN 'C' THEN 'Cancha' ELSE 'Laboratorio' END tipo FROM tambiente where fecha_desactivacion is null order by cod_ambiente desc"; 
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
    echo "<tr><td style='width:20%;'>".$row['cod_ambiente']."</td><td align='left'>".$row['nombre_ambiente']."</td><td align='left'>".$row['tipo']."</td></tr>"; 
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
}else{
  include('403.php'); 
}
?>