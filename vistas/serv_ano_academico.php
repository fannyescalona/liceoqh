<?php
if(isset($_SESSION['datos']['ano'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='ano_academico';
if(isset($_SESSION['datos'])){
  @$ano=$_SESSION['datos']['ano'];
  @$codigo_ano_academico=$_SESSION['datos']['cod_ano_academico'];
  @$codigo_carrera=$_SESSION['datos']['cod_carrera'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$ano=null;
  @$codigo_ano_academico=null;
  @$codigo_carrera=null;
  @$estatus=null;
}
?>
<br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_ano_academico.js"> </script>
  <form action="../controladores/cont_ano_academico.php" method="post" id="form">
   <fieldset>
    <legend>Año Académico</legend>
    <div id="contenedorFormulario">
      <label>Código:</label>
     <input title="El código del año académico es generado por el sistema" name="cod_ano_academico" id="cod_ano_academico" type="text" size="10" readonly value="<?= $codigo_ano_academico;?>" placeholder="El Código del Año Académico es generado por el sistema" class="campoTexto"</td></tr>
     <label>Nombre del Año Académico:</label>
     <input title="Ingrese el nombre del año académico" onKeyUp="this.value=this.value.toUpperCase()" name="ano" id="ano" type="text" size="50" value="<?= $ano;?>" placeholder="Ingrese el nombre del Año académico" class="campoTexto" required /> </td></tr>
     <label>Asigne la Carrera:</label>
     <select name="cod_carrera" id="cod_carrera" title="Seleccione una carrera" placeholder="Seleccione una Carrera" class="campoTexto" required >
      <option value='0'>Seleccione una Carrera</option>
      <?php
      require_once("../clases/class_bd.php");
      $mysql=new Conexion();
      $sql = "SELECT cod_carrera,upper(nombre_carrera) nombre_carrera FROM tcarrera WHERE fecha_desactivacion IS NULL ORDER BY cod_carrera";
      $query = $mysql->Ejecutar($sql);
      while ($row = $mysql->Respuesta($query)){
        if($row['cod_carrera']==$codigo_carrera){
          echo "<option value='".$row['cod_carrera']."' selected>".$row['nombre_carrera']."</option>";
        }else{
          echo "<option value='".$row['cod_carrera']."'>".$row['nombre_carrera']."</option>";
        }
      }
      ?>
    </select>
    <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
  </div>    
  <br><br>
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
  <a href="?ano_academico" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_ano_academico.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>

  <table class="table table-striped table-bordered table-condensed">
   <tr> 
     <td>Código </td>
     <td>Nombre</td>
     <td>Carrera</td>
   </tr>
   <?php

           //Conexión a la base de datos 
   require_once("../clases/class_bd.php");
   $mysql=new Conexion();

//Sentencia sql (sin limit) 
   $_pagi_sql = "SELECT a.cod_ano_academico,a.ano,a.fecha_desactivacion,c.cod_carrera,c.nombre_carrera FROM tano_academico a 
   INNER JOIN tcarrera c ON a.cod_carrera = c.cod_carrera WHERE a.fecha_desactivacion IS NULL ORDER BY a.cod_ano_academico DESC"; 
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
    echo "<tr><td style='width:20%;'>".$row['cod_ano_academico']."</td>
    <td align='left'>".$row['ano']."</td>
    <td align='left'>".$row['nombre_carrera']."</td></tr>"; 
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