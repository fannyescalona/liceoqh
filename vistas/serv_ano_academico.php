<?php
  if(isset($_SESSION['datos']['descripcion'])){ 
   $disabledRC='disabled';
   $disabledMD='';
   $estatus=null;
 }else {
   $disabledRC='';
   $disabledMD='disabled';
 }
 $servicios='ano_academico';
 if(isset($_SESSION['datos'])){
  @$descripcion=$_SESSION['datos']['descripcion'];
  @$codigo_ano_academico=$_SESSION['datos']['codigo_ano_academico'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$descripcion=null;
  @$codigo_ano_academico=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_ano_academico.js"> </script>
  <form action="../controladores/cont_ano_academico.php" method="post" id="form" class="form-horizontal">
   <fieldset>
    <legend>Ano Académico</legend>
    <div id="contenedorFormulario">
      <label>Código:</label>
     <input title="el código del ano académico es generado por el sistema" name="codigo_ano_academico" id="codigo_ano_academico" type="text" size="10" readonly value="<?= $codigo_ano_academico;?>" placeholder="Código del ano académico es generado por el sistema" class="campoTexto"/>
     <label>Nombre del ano académico:</label>
     <input title="Ingrese el nombre del ano académico" onKeyUp="this.value=this.value.toUpperCase()" name="descripcion" id="descripcion" type="text" size="50" value="<?= $descripcion;?>" required="" placeholder="Ingrese el nombre del ano académico" class="campoTexto"/>      
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
  <a href="?ano_academico"><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_ano_academico.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
  <table class="table table-striped table-bordered table-condensed">
   <tr> 
     <td>Código </td>
     <td>Año Académico</td>
     <td>Cerrado</td>
   </tr>
   <?php

           //Conexión a la base de datos 
   require_once("../clases/class_bd.php");
   $mysql=new Conexion();

//Sentencia sql (sin limit) 
   $_pagi_sql = "SELECT codigo_ano_academico,descripcion,CASE cerrado WHEN 'N' THEN 'No' ELSE 'Sí' END AS cerrado FROM tano_academico where fecha_desactivacion is null order by codigo_ano_academico desc"; 
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
    <td style='width:20%;'>".$row['codigo_ano_academico']."</td>
    <td align='left'>".$row['descripcion']."</td>
    <td align='left'>".$row['cerrado']."</td>
    </tr>"; 
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
<form id="form1" method="POST" action="../controladores/cont_ano_academico.php">
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