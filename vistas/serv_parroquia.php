<?php
if(isset($_SESSION['datos']['descripcion'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='parroquia';
if(isset($_SESSION['datos'])){
  @$descripcion=$_SESSION['datos']['descripcion'];
  @$codigo_parroquia=$_SESSION['datos']['codigo_parroquia'];
  @$codigo_municipio=$_SESSION['datos']['codigo_municipio'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$descripcion=null;
  @$codigo_parroquia=null;
  @$codigo_municipio=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_parroquia.js"> </script>
  <form action="../controladores/cont_parroquia.php" method="post" id="form">
   <fieldset>
    <legend>Parroquia</legend>
    <div id="contenedorFormulario">
      <label>Código:</label>
      <input title="El código de la parroquia es generado por el sistema" name="codigo_parroquia" id="codigo_parroquia" type="text" size="10" readonly value="<?= $codigo_parroquia;?>" required="" placeholder="El código de parroquia es generado por el sistema" class="campoTexto"/> 
      <label>Nombre de la Parroquia:</label>
      <input title="Ingrese el nombre de la parroquia" onKeyUp="this.value=this.value.toUpperCase()" name="descripcion" id="descripcion" type="text" size="50" value="<?= $descripcion;?>" required="" placeholder="Ingrese el nombre de la parroquia" class="campoTexto"/>
      <label>Seleccione un Municipio:</label>
      <select name="codigo_municipio" id="codigo_municipio" title="Seleccione un municipio" required="" class="campoTexto">
        <option value='0'>Seleccione un Municipio</option>
        <?php
        require_once("../clases/class_bd.php");
        $mysql=new Conexion();
        $sql = "SELECT codigo_municipio,upper(descripcion) descripcion FROM tmunicipio WHERE fecha_desactivacion IS NULL ORDER BY codigo_municipio";
        $query = $mysql->Ejecutar($sql);
        while ($row = $mysql->Respuesta($query)){
          if($row['codigo_municipio']==$codigo_municipio){
            echo "<option value='".$row['codigo_municipio']."' selected>".$row['descripcion']."</option>";
          }else{
            echo "<option value='".$row['codigo_municipio']."'>".$row['descripcion']."</option>";
          }
        }
        ?>
      </select>            
      <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
    </div>
    <br>
    <?php echo '<p class="'.$estatus.'" id="estatus_registro">'.$estatus.'</p>'; ?>
    <tr>

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
    <a href="?parroquia" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
    <a href="../excel/excel_parroquia.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
    <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>        
    
    <table class="table table-striped table-bordered table-condensed">
     <tr> 
       <td>Código </td>
       <td>Nombre</td>
       <td>Municipio</td>
     </tr>
     <?php

           //Conexión a la base de datos 
     require_once("../clases/class_bd.php");
     $mysql=new Conexion();

//Sentencia sql (sin limit) 
     $_pagi_sql = "SELECT p.codigo_parroquia,p.descripcion AS parroquia,p.fecha_desactivacion,m.codigo_municipio,m.descripcion AS municipio FROM tparroquia p 
     INNER JOIN tmunicipio m ON p.codigo_municipio = m.codigo_municipio WHERE p.fecha_desactivacion IS NULL ORDER BY p.codigo_parroquia DESC"; 
//cantidad de resultados por página (opcional, por defecto 20) 
     $_pagi_cuantos = 10; 
//Cadena que separa los enlaces numéricos en la barra de navegación entre páginas.
     $_pagi_separador = " ";
//Cantidad de enlaces a los números de página que se mostrarán como máximo en la barra de navegación.
     $_pagi_nav_num_enlaces=5;
//Incluipos el script de paginación. Éste ya ejecuta la consulta automáticamente 
     @include("../librerias/paginador/paginator.inc.php"); 

//Leemos y escribimos los registros de la página actual 
     while($row = mysql_fetch_array($_pagi_result)){ 
      echo "<tr style='cursor: pointer;' id='".$row['parroquia']."' onclick='enviarForm(this.id)'>
      <td style='width:20%;'>".$row['codigo_parroquia']."</td>
      <td align='left'>".$row['parroquia']."</td>
      <td align='left'>".$row['municipio']."</td></tr>"; 
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
<form id="form1" method="POST" action="../controladores/cont_parroquia.php">
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