<?php
require_once("../clases/class_perfil.php");
$perfil=new Perfil();
$perfil->codigo_perfil(@$_SESSION['user_codigo_perfil']);
$servicios_permitidos=$perfil->IMPRIMIR_SERVICIOS_USUARIO();
$servicio_solicitado=strtoupper(preg_replace('/(serv_)|(\.php)/','',basename(__FILE__)));
if(array_search($servicio_solicitado,$servicios_permitidos)){
  if(isset($_SESSION['datos']['descripcion'])){ 
   $disabledRC='disabled';
   $disabledMD='';
   $estatus=null;
 }else {
   $disabledRC='';
   $disabledMD='disabled';
 }
 $servicios='configuracion';
 if(isset($_SESSION['datos'])){
  @$descripcion=$_SESSION['datos']['descripcion'];
  @$codigo_configuracion=$_SESSION['datos']['codigo_configuracion'];
  @$longitud_minclave=$_SESSION['datos']['longitud_minclave'];
  @$longitud_maxclave=$_SESSION['datos']['longitud_maxclave'];
  @$cantidad_letrasmayusculas=$_SESSION['datos']['cantidad_letrasmayusculas'];
  @$cantidad_letrasminusculas=$_SESSION['datos']['cantidad_letrasminusculas'];
  @$cantidad_numeros=$_SESSION['datos']['cantidad_numeros'];
  @$cantidad_caracteresespeciales=$_SESSION['datos']['cantidad_caracteresespeciales'];
  @$dias_vigenciaclave=$_SESSION['datos']['dias_vigenciaclave'];
  @$dias_aviso=$_SESSION['datos']['dias_aviso'];
  @$numero_ultimasclaves=$_SESSION['datos']['numero_ultimasclaves'];
  @$intentos_fallidos=$_SESSION['datos']['intentos_fallidos'];
  @$numero_preguntas=$_SESSION['datos']['numero_preguntas'];
  @$numero_preguntasaresponder=$_SESSION['datos']['numero_preguntasaresponder'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$descripcion=null;
  @$codigo_configuracion=null;
  @$longitud_minclave=null;
  @$longitud_maxclave=null;
  @$cantidad_letrasmayusculas=null;
  @$cantidad_letrasminusculas=null;
  @$cantidad_numeros=null;
  @$cantidad_caracteresespeciales=null;
  @$dias_vigenciaclave=null;
  @$dias_aviso=null;
  @$numero_ultimasclaves=null;
  @$intentos_fallidos=null;
  @$numero_preguntas=null;
  @$numero_preguntasaresponder=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_configuracion.js"> </script>
  <form action="../controladores/cont_configuracion.php" method="post" id="form" class="form-horizontal">
    <fieldset>
      <legend>Configuración del Perfil</legend>
      <div id="contenedorFormulario">
        <div class="row">
          <div class="span6">
            <label>Código:</label>
            <input tabindex=1 title="el código de la conf. del perfil es generado por el sistema" name="codigo_configuracion" id="codigo_configuracion" type="text" size="10" readonly value="<?= $codigo_configuracion;?>" placeholder="Código de la Conf. del Perfil es generado por el sistema" class="campoTexto"/>
            <label>Longitud Mínima para la Clave:</label>
            <input tabindex=3 title="Ingrese el longitud mínima para la clave" onKeyPress="return isNumberKey(event)" name="longitud_minclave" id="longitud_minclave" type="text" size="50" value="<?= $longitud_minclave;?>" placeholder="Ingrese el longitud mínima para la clave" class="campoTexto" required /> 
            <label>Cantidad de Letras Minúsculas:</label>
            <input tabindex=5 title="Ingrese la cantidad de letras minúsculas para la clave" onKeyPress="return isNumberKey(event)" name="cantidad_letrasminusculas" id="cantidad_letrasminusculas" type="text" size="50" value="<?= $cantidad_letrasminusculas;?>" placeholder="Ingrese la cantidad de letras minúsculas para la clave" class="campoTexto" required /> 
            <label>Cantidad de Dígitos:</label>
            <input tabindex=7 title="Ingrese la cantidad de dígitos para la clave" onKeyPress="return isNumberKey(event)" name="cantidad_numeros" id="cantidad_numeros" type="text" size="50" value="<?= $cantidad_numeros;?>" placeholder="Ingrese la cantidad de dígitos para la clave" class="campoTexto" required /> 
            <label>Días de Vigencia de la Clave:</label>
            <input tabindex=9 title="Ingrese la cantidad de días de vigencia de la clave" onKeyPress="return isNumberKey(event)" name="dias_vigenciaclave" id="dias_vigenciaclave" type="text" size="50" value="<?= $dias_vigenciaclave;?>" placeholder="Ingrese la cantidad de días de vigencia de la clave" class="campoTexto" required /> 
            <label>Cantidad de Últimas Claves:</label>
            <input tabindex=11 title="Ingrese la cantidad de últimas claves a validar" onKeyPress="return isNumberKey(event)" name="numero_ultimasclaves" id="numero_ultimasclaves" type="text" size="50" value="<?= $numero_ultimasclaves;?>" placeholder="Ingrese la cantidad de últimas claves a validar" class="campoTexto" required /> 
            <label>Cantidad de Preguntas Secretas:</label>
            <input tabindex=13 title="Ingrese la cantidad de preguntas secretas" onKeyPress="return isNumberKey(event)" name="numero_preguntas" id="numero_preguntas" type="text" size="50" value="<?= $numero_preguntas;?>" placeholder="Ingrese la cantidad de preguntas secretas" class="campoTexto" required /> 
          </div>
          <div class="span6">
            <label>Nombre de la Configuración:</label>
            <input tabindex=2 title="Ingrese el nombre de la Configuración del Perfil" onKeyUp="this.value=this.value.toUpperCase()" name="descripcion" id="descripcion" type="text" size="50" value="<?= $descripcion;?>" required="" placeholder="Ingrese el nombre de la Configuración del Perfil" class="campoTexto"/>
            <label>Longitud Máxima para la Clave:</label>
            <input tabindex=4 title="Ingrese el longitud máxima para la clave" onKeyPress="return isNumberKey(event)" name="longitud_maxclave" id="longitud_maxclave" type="text" size="50" value="<?= $longitud_maxclave;?>" placeholder="Ingrese el longitud máxima para la clave" class="campoTexto" required /> 
            <label>Cantidad de Letras Mayúsculas:</label>
            <input tabindex=6 title="Ingrese la cantidad de letras mayúsculas para la clave" onKeyPress="return isNumberKey(event)" name="cantidad_letrasmayusculas" id="cantidad_letrasmayusculas" type="text" size="50" value="<?= $cantidad_letrasmayusculas;?>" placeholder="Ingrese la cantidad de letras mayúsculas para la clave" class="campoTexto" required /> 
            <label>Cantidad de Carácteres Especiales:</label>
            <input tabindex=8 title="Ingrese la cantidad de carácteres especiales para la clave" onKeyPress="return isNumberKey(event)" name="cantidad_caracteresespeciales" id="cantidad_caracteresespeciales" type="text" size="50" value="<?= $cantidad_caracteresespeciales;?>" placeholder="Ingrese la cantidad de carácteres especiales para la clave" class="campoTexto" required /> 
            <label>Días de Aviso:</label>
            <input tabindex=10 title="Ingrese la cantidad de días de aviso de expiración de la clave" onKeyPress="return isNumberKey(event)" name="dias_aviso" id="dias_aviso" type="text" size="50" value="<?= $dias_aviso;?>" placeholder="Ingrese la cantidad de días de aviso de expiración de la clave" class="campoTexto" required /> 
            <label>Intentos Fallidos:</label>
            <input tabindex=12 title="Ingrese la cantidad de intentos fallidos de acceso" onKeyPress="return isNumberKey(event)" name="intentos_fallidos" id="intentos_fallidos" type="text" size="50" value="<?= $intentos_fallidos;?>" placeholder="Ingrese la cantidad de intentos fallidos de acceso" class="campoTexto" required /> 
            <label>Cantidad de Preguntas a Responder:</label>
            <input tabindex=14 title="Ingrese la cantidad de preguntas secretas a responder" onKeyPress="return isNumberKey(event)" name="numero_preguntasaresponder" id="numero_preguntasaresponder" type="text" size="50" value="<?= $numero_preguntasaresponder;?>" placeholder="Ingrese la cantidad de preguntas secretas a responder" class="campoTexto" required /> 
          </div>
        </div>
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
  <a href="../excel/excel_configuracion.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
  <table class="table table-striped table-bordered table-condensed">
   <tr> 
     <td>Código </td>
     <td>Nombre</td>
     <td>Longitud Min. Clave</td>
     <td>Longitud Max. Clave</td>
     <td>Días de Vigencia</td>
     <td>Intentos Fallidos</td>
     <td>Cant. Preguntas Secretas</td>
   </tr>
   <?php

           //Conexión a la base de datos 
   require_once("../clases/class_bd.php");
   $mysql=new Conexion();

//Sentencia sql (sin limit) 
   $_pagi_sql = "SELECT * FROM tconfiguracion where fecha_desactivacion is null order by codigo_configuracion desc"; 
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
    <td style='width:20%;'>".$row['codigo_configuracion']."</td>
    <td align='left'>".$row['descripcion']."</td>
    <td align='left'>".$row['longitud_minclave']."</td>
    <td align='left'>".$row['longitud_maxclave']."</td>
    <td align='left'>".$row['dias_vigenciaclave']."</td>
    <td align='left'>".$row['intentos_fallidos']."</td>
    <td align='left'>".$row['numero_preguntas']."</td></tr>"; 
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
<form id="form1" method="POST" action="../controladores/cont_configuracion.php">
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
<?php }else{

  include('403.php');    	
}?>