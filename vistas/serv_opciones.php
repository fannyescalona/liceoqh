<?php
if(isset($_SESSION['datos']['descripcion'])){ 
                 $disabledRC='disabled';
                  $disabledMD='';
                  $estatus=null;
                }else {
                     $disabledRC='';
                     $disabledMD='disabled';
                	}
                	$servicios='botones';
if(isset($_SESSION['datos'])){
            @$descripcion=$_SESSION['datos']['descripcion'];
            @$codigo_opcion=$_SESSION['datos']['codigo_opcion'];
            @$orden=$_SESSION['datos']['orden'];
            @$icono=$_SESSION['datos']['icono'];
            @$estatus=$_SESSION['datos']['estatus'];
            }
       else{
            @$descripcion=null;
            @$codigo_opcion=null;
            @$estatus=null;
            @$orden=null;
            @$icono=null;
            }
?>
<br><br>
  <?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
<script src="../js/uds_opciones.js"> </script>
  <form action="../controladores/cont_opciones.php" method="post" id="form">
    <fieldset>
     <legend>Opciones</legend>
      <div id="contenedorFormulario">
        <label>Código:</label>
       <input title="el código de la opción es generado por el sistema" name="codigo_opcion" id="codigo_opcion" type="text" size="10" readonly value="<?= $codigo_opcion;?>" placeholder="El Código es generado por el sistema" class="campoTexto" required /> </td><tr>
       <label>Ingrese el nombre de la opción:</label>
       <input title="Ingrese el nombre de la opción" onKeyUp="this.value=this.value.toUpperCase()" name="descripcion" id="descripcion" type="text" size="50" value="<?= $descripcion;?>" placeholder="Ingrese el nombre de la opción" class="campoTexto" required />
       <label>Seleccione un &iacute;cono</label>
        <input name="icono" id="icono" type="radio" value="icon-pencil" title="Seleccionar icono de registro" <?php if($icono=="icon-pencil"){ echo "checked='checked'"; } ?>  required />
        <span class="icon-pencil" title="Icono de registro"></span> 
        <input name="icono" id="icono" type="radio" value="icon-edit" title="Seleccionar icono de editar" <?php if($icono=="icon-edit"){ echo "checked='checked'"; } ?> required />
        <span class="icon-edit" title="Icono de editar"></span> 
        <input name="icono" id="icono" type="radio" value="icon-eye-close" title="Seleccionar icono lista no visible" <?php if($icono=="icon-eye-close"){ echo "checked='checked'"; } ?> required />
        <span class="icon-eye-close" title="Icono de no visible"></span> 
        <input name="icono" id="icono" type="radio" value="icon-eye-open" title="Seleccionar icono de visible" <?php if($icono=="icon-cog"){ echo "checked='checked'"; } ?> required />
        <span class="icon-cog" title="Icono de visible"></span> 
        <input name="icono" id="icono" type="radio" value="icon-search" title="Seleccionar icono de buscar" <?php if($icono=="icon-search"){ echo "checked='checked'"; } ?> required />
        <span class="icon-search" title="Icono de buscar"></span>
        <input name="icono" id="icono" type="radio" value="icon-remove" title="Seleccionar icono de cancelar" <?php if($icono=="icon-remove"){ echo "checked='checked'"; } ?> required />
        <span class="icon-remove" title="Icono de cancelar"></span>
        <input name="icono" id="icono" type="radio" value="icon-print" title="Seleccionar icono de imprimir" <?php if($icono=="icon-print"){ echo "checked='checked'"; } ?> required />
        <span class="icon-print" title="Icono de imprimir"></span>
        <input name="icono" id="icono" type="radio" value="icon-ok" title="Seleccionar icono de aceptar" <?php if($icono=="icon-ok"){ echo "checked='checked'"; } ?> required />
        <span class="icon-ok" title="Icono de aceptar"></span> 
       <label>Seleccione la Acción que desea cambiar el nombre:</label>       
       <select  name="orden" id="orden" title="Seleccione una acci&oacute;n" placeholder="Seleccione una Opción" class="campoTexto" required >
          <option <?php  if(!is_null($orden) and $orden==0) echo "selected"; ?> value="0">Sin accion</option>
          <option <?php  if(!is_null($orden) and $orden==1) echo "selected"; ?> value="1">Insertar, Incluir, Registrar,Guardar</option>
          <option <?php  if(!is_null($orden) and $orden==2) echo "selected"; ?> value="2">Modificar,Actualizar,Guardar</option>
          <option <?php  if(!is_null($orden) and $orden==3) echo "selected"; ?> value="3">Desactivar,Deshabilitar</option>
          <option <?php  if(!is_null($orden) and $orden==4) echo "selected"; ?> value="4">Activar,Habilitar</option>
          <option <?php  if(!is_null($orden) and $orden==5) echo "selected"; ?> value="5">Buscar,Consultar</option>
          <option <?php  if(!is_null($orden) and $orden==6) echo "selected"; ?> value="6">Cancelar, Deshacer </option>
          <option <?php  if(!is_null($orden) and $orden==7) echo "selected"; ?> value="7">Listar,Imprimir</option>
          <option <?php  if(!is_null($orden) and $orden==8) echo "selected"; ?> value="8">Aceptar</option>
        </select>  
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
  <?php }else{ ?>
   <a href="./?botones" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
   <a href="../excel/excel_opcion.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
     <table class="table table-striped table-bordered table-condensed">
           <tr> 
               <td>Código </td>
               <td>Opción</td>
           </tr>
         <?php

           //Conexión a la base de datos 
  require_once("../clases/class_bd.php");
  $mysql=new Conexion();

//Sentencia sql (sin limit) 
$_pagi_sql = "SELECT * FROM topcion where fecha_desactivacion is null order by codigo_opcion desc"; 
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
    echo "<tr><td style='width:20%;'>".$row['codigo_opcion']."</td><td align='left'>".$row['descripcion']."</td></tr>"; 
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