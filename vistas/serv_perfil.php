<?php
if(isset($_SESSION['datos']['descripcion'])){ 
                 $disabledRC='disabled';//para desactivar el boton registrar y consultar (RC)
                  $disabledMD='';//para activar el boton Modificar y Desactivar (MD)
                }else {
                     $disabledRC='';//para activar el boton registrar y consultar (RC)
                     $disabledMD='disabled'; //para desactivar el boton Modificar y Desactivar (MD)
                	}
                	$servicios='perfiles';
if(isset($_SESSION['datos'])){
            @$descripcion=$_SESSION['datos']['descripcion'];
            @$codigo_perfil=$_SESSION['datos']['codigo_perfil'];
            @$codigo_configuracion=$_SESSION['datos']['codigo_configuracion'];
            @$estatus=$_SESSION['datos']['estatus'];
            }
       else{
            $descripcion=null;
            $codigo_perfil=null;
            $codigo_configuracion=null;
            $estatus=null;
            }
?>
  <?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
<script src="../js/uds_perfil.js"> </script>
<form action="../controladores/cont_perfil.php" method="post" id="form">
    <fieldset>
      <legend>Perfil de Usuario</legend>
      <div id="contenedorFormulario">
        <label>Código:</label>
        <input title="el c&oacute;digo del perfil es generado por el sistema" style="width:3em" name="codigo_perfil" id="codigo_perfil" type="text" size=5 readonly value="<?= $codigo_perfil;?>" placeholder="El Código es generado por el sistema" class="campoTexto"/> 
        <label>Nombre del Perfil:</label>
        <input title="Ingrese el nombre del perfil de usuario" onKeyUp="this.value=this.value.toUpperCase()" name="descripcion" 
        id="descripcion" type="text" size="20" value="<?= $descripcion;?>"placeholder="Ingrese el Perfil de Usuario" class="campoTexto" required />
        <label>Seleccione una Configuración:</label>
        <select name="codigo_configuracion" id="codigo_configuracion" title="Seleccione una Configuración" class="campoTexto" required="">
          <option value='0'>Seleccione una Configuración</option>
          <?php
          require_once("../clases/class_bd.php");
          $mysql=new Conexion();
          $sql = "SELECT codigo_configuracion,upper(descripcion) descripcion FROM tconfiguracion WHERE fecha_desactivacion IS NULL ORDER BY codigo_configuracion";
          $query = $mysql->Ejecutar($sql);
          while ($row = $mysql->Respuesta($query)){
            if($row['codigo_configuracion']==$codigo_configuracion){
              echo "<option value='".$row['codigo_configuracion']."' selected>".$row['descripcion']."</option>";
            }else{
              echo "<option value='".$row['codigo_configuracion']."'>".$row['descripcion']."</option>";
            }
          }
          ?>
        </select> 
        <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
      </div>    
      <br>
      <?php echo '<p class="'.$estatus.'" id="estatus_registro">'.$estatus.'</p>'; ?>
      <?php
      imprimir_boton($disabledRC,$disabledMD,$estatus,$servicios);
     ?>   

      <br>
          <?php 
            include_once('../clases/class_html.php');
            $html=new Html();
            $html->configurar_menu($codigo_perfil);   
          ?> 
    </fieldset> 
</form>   
   
  <?php }elseif(true){
require_once("../clases/class_perfil.php");
$perfil=new Perfil();
$perfil->codigo_perfil(@$_SESSION['user_codigo_perfil']);
$servicios_permitidos=$perfil->IMPRIMIR_SERVICIOS_USUARIO();
$servicio_solicitado=strtolower(preg_replace('/(serv_)|(\.php)/','',basename(__FILE__)));  	
  	
  	 ?>
  <a href="?perfiles" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
    <a href="../excel/excel_perfil.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
    <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>     
    <table class="table table-striped table-bordered table-condensed">
           <tr> 
               <td> Codigo </td>
               <td>Perfil de usuario</td>
               <td>Configuración del Perfil</td>
           </tr>
         <?php

           //Conexión a la base de datos 
  include_once("../clases/class_bd.php");
  $mysql=new Conexion();

//Sentencia sql (sin limit) 
$_pagi_sql = "SELECT p.codigo_perfil,p.descripcion,c.descripcion AS configuracion 
FROM tperfil p 
INNER JOIN tconfiguracion c ON p.codigo_configuracion = c.codigo_configuracion 
WHERE p.fecha_desactivacion IS NULL ORDER BY p.codigo_perfil DESC"; 
//cantidad de resultados por página (opcional, por defecto 20) 
$_pagi_cuantos = 10; 
//Cadena que separa los enlaces numéricos en la barra de navegación entre páginas.
$_pagi_separador = " ";
//Cantidad de enlaces a los números de página que se mostrarán como máximo en la barra de navegación.
$_pagi_nav_num_enlaces=5;
//Incluimos el script de paginación. Éste ya ejecuta la consulta automáticamente 
@include_once("../librerias/paginador/paginator.inc.php"); 

//Leemos y escribimos los registros de la página actual 
while($row = mysql_fetch_array($_pagi_result)){ 
    echo "<tr style='cursor: pointer;' id='".$row['descripcion']."' onclick='enviarForm(this.id)'>
    <td style='width:20%;'>".$row['codigo_perfil']."</td>
    <td align='left'>".$row['descripcion']."</td> 
    <td align='left'>".$row['configuracion']."</td></tr>"; 
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
<form id="form1" method="POST" action="../controladores/cont_perfil.php">
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
