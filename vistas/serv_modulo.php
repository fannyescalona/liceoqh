<?php
if(isset($_SESSION['datos']['descripcion'])){ 
                 $disabledRC='disabled';
                  $disabledMD='';
                  $estatus=null;
                }else {
                     $disabledRC='';
                     $disabledMD='disabled';
                	}
                  $servicios='modulo';
if(isset($_SESSION['datos'])){
            @$descripcion=$_SESSION['datos']['descripcion'];
            @$codigo_modulo=$_SESSION['datos']['codigo_modulo'];
            @$icono=$_SESSION['datos']['icono'];
            @$orden=$_SESSION['datos']['orden'];
            @$estatus=$_SESSION['datos']['estatus'];
            }
       else{
            @$codigo_modulo=null;
            @$descripcion=null;
            @$icono=null;
            @$orden=null;
            @$estatus=null;
            }
?>
<br><br>
  <?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
<script src="../js/uds_modulo.js"> </script>
  <form action="../controladores/cont_modulo.php" method="post" id="form">
     <fieldset>
      <legend>M&oacute;dulo</legend>
      <div id="contenedorFormulario">
        <label>Código:</label>
        <input title="el c&oacute;digo del m&oacute;dulo es generado por el sistema" name="codigo_modulo" id="codigo_modulo" type="text" size="10" readonly value="<?= $codigo_modulo;?>" placeholder="El Código es generado por el sistema" class="campoTexto" required />
        <label>Ingrese el nombre del m&oacute;dulo:</label>
        <input title="Ingrese el nombre del m&oacute;dulo" onKeyUp="this.value=this.value.toUpperCase()" name="descripcion" id="descripcion" type="text" size="50" value="<?= $descripcion;?>" placeholder="Ingrese el Nombre del Módulo" class="campoTexto" required /> 
        <label>Ingrese el n&uacute;mero de orden</label>
        <input title="Ingrese el n&uacute;mero de orden" onKeyPress="return isNumberKey(event)" name="orden" id="orden" type="text" size="50" value="<?= $orden;?>" placeholder="Ingrese el Número de Orden" class="campoTexto" required /> 
        <label>Seleccione un &iacute;cono</label>
        <input name="icono" id="icono" type="radio" value="icon-home" title="Seleccionar icono de casa" <?php if($icono=="icon-home"){ echo "checked='checked'"; } ?>  required />
        <span class="icon-home" title="Icono de casa"></span> 
        <input name="icono" id="icono" type="radio" value="icon-list" title="Seleccionar icono de lista" <?php if($icono=="icon-list"){ echo "checked='checked'"; } ?> required />
        <span class="icon-list" title="Icono de lista"></span> 
        <input name="icono" id="icono" type="radio" value="icon-list-alt" title="Seleccionar icono de lista alternativa" <?php if($icono=="icon-list-alt"){ echo "checked='checked'"; } ?> required />
        <span class="icon-list-alt" title="Icono de lista alternativa"></span> 
        <input name="icono" id="icono" type="radio" value="icon-cog" title="Seleccionar icono de configuraci&oacute;n" <?php if($icono=="icon-cog"){ echo "checked='checked'"; } ?> required />
        <span class="icon-cog" title="Icono de configuraci&oacute;n"></span> 
        <input name="icono" id="icono" type="radio" value="icon-lock" title="Seleccionar icono de seguridad" <?php if($icono=="icon-lock"){ echo "checked='checked'"; } ?> required />
        <span class="icon-lock" title="Icono de seguridad"></span> 
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
  <a href="?modulo" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
    <a href="../excel/excel_modulo.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
    <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>     
    <table class="table table-striped table-bordered table-condensed">
           <tr> 
               <td>Código </td>
               <td>Nombre</td>
               <td>Icono</td>
               <td>Orden</td>
           </tr>
         <?php

           //Conexión a la base de datos 
  require_once("../clases/class_bd.php");
  $mysql=new Conexion();

//Sentencia sql (sin limit) 
$_pagi_sql = "SELECT * FROM tmodulo where fecha_desactivacion is null order by codigo_modulo desc"; 
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
    <td style='width:20%;'>".$row['codigo_modulo']."</td>
    <td align='left'>".$row['descripcion']."</td>
    <td align='left'><span class=".$row['icono']."></span>".$row['icono']."</td>
    <td align='left'>".$row['orden']."</td></tr>"; 
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
<form id="form1" method="POST" action="../controladores/cont_modulo.php">
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