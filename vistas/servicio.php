<?php
if(isset($_SESSION['datos']['descripcion'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='servicio';
if(isset($_SESSION['datos'])){
  @$codigo_servicio=$_SESSION['datos']['codigo_servicio'];
  @$descripcion=$_SESSION['datos']['descripcion'];
  @$url=$_SESSION['datos']['url'];
  @$orden=$_SESSION['datos']['orden'];
  @$codigo_modulo=$_SESSION['datos']['codigo_modulo'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$codigo_servicio=null;
  @$descripcion=null;
  @$url=null;
  @$orden=null;
  @$codigo_modulo=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_servicio.js"> </script>
  <form action="../controladores/cont_servicio.php" method="post" id="form">
   <fieldset>
    <legend>Servicios</legend>
    <div id="contenedorFormulario">
      <label>Código</label>
      <input title="El c&oacute;digo del servicio es generado por el sistema" name="codigo_servicio" id="codigo_servicio" type="text" size="10" readonly value="<?= $codigo_servicio;?>" placeholder="El código del Servicio es generado por el Sistema" class="campoTexto"/>
      <label>Ingrese el nombre del servicio</label>
      <input title="Ingrese el nombre del servicio" onKeyUp="this.value=this.value.toUpperCase()" name="descripcion" id="descripcion" type="text" size="50" value="<?= $descripcion;?>" placeholder="Ingrese el Nombre del Servicio" class="campoTexto" required>
      <label>Ingrese la url del servicio</label>
      <input title="Ingrese la url del servicio" onKeyUp="this.value=this.value.toUpperCase()" name="url" id="url" type="text" size="50" value="<?= $url;?>" placeholder="Ingrese la URL del Servicio" class="campoTexto">    
      <label>Módulo</label>
      <select name="codigo_modulo" id="codigo_modulo" title="Seleccione un m&oacute;dulo" placeholder="Seleccione un Módulo" class="campoTexto" required>
        <option value='0'>Seleccione un M&oacute;dulo</option>
        <?php
        require_once("../clases/class_bd.php");
        $mysql=new Conexion();
        $sql = "SELECT codigo_modulo,upper(descripcion) descripcion FROM tmodulo WHERE fecha_desactivacion IS NULL ORDER BY codigo_modulo";
        $query = $mysql->Ejecutar($sql);
        while ($row = $mysql->Respuesta($query)){
          if($row['codigo_modulo']==$codigo_modulo){
            echo "<option value='".$row['codigo_modulo']."' selected>".$row['descripcion']."</option>";
          }else{
            echo "<option value='".$row['codigo_modulo']."'>".$row['descripcion']."</option>";
          }
        }
        ?>
      </select>
      <label>Órden del Servicio</label>
      <input title="Ingrese el orden del servicio" onKeyPress="return isNumberKey(event)" maxlength=2 name="orden" id="orden" type="text" size="50" value="<?= $orden;?>" placeholder="Ingrese el órden del Servicio" class="campoTexto">
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
  <a href="?servicio" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_servicio.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
<table class="table table-striped table-bordered table-condensed">
 <tr> 
   <td>Código </td>
   <td>Nombre</td>
   <td>Url</td>
   <td>Módulo</td>
   <td>Órden</td>
 </tr>
 <?php

           //Conexión a la base de datos 
 require_once("../clases/class_bd.php");
 $mysql=new Conexion();

//Sentencia sql (sin limit) 
 $_pagi_sql = "SELECT s.codigo_servicio,s.descripcion AS servicio,s.url,s.fecha_desactivacion,m.codigo_modulo,m.descripcion AS modulo,s.orden FROM tservicio s 
 INNER JOIN tmodulo m ON s.codigo_modulo = m.codigo_modulo WHERE s.fecha_desactivacion IS NULL ORDER BY s.codigo_servicio DESC"; 
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
  echo "<tr style='cursor: pointer;' id='".$row['servicio']."' onclick='enviarForm(this.id)'>
  <td style='width:20%;'>".$row['codigo_servicio']."</td>
  <td align='left'>".$row['servicio']."</td>
  <td align='left'>".$row['url']."</td>
  <td align='left'>".$row['modulo']."</td>
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
<form id="form1" method="POST" action="../controladores/cont_servicio.php">
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