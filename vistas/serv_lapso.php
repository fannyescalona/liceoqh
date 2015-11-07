<?php
if(isset($_SESSION['datos']['descripcion'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='lapso';
if(isset($_SESSION['datos'])){
  @$codigo_lapso=$_SESSION['datos']['codigo_lapso'];
  @$descripcion=$_SESSION['datos']['descripcion'];
  @$fecha_inicio=$_SESSION['datos']['fecha_inicio'];
  @$fecha_fin=$_SESSION['datos']['fecha_fin'];
  @$codigo_ano_academico=$_SESSION['datos']['codigo_ano_academico'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$codigo_lapso=null;
  @$descripcion=null;
  @$fecha_inicio=null;
  @$fecha_fin=null;
  @$codigo_ano_academico=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_lapso.js"> </script>
  <form action="../controladores/cont_lapso.php" method="post" id="form">
   <fieldset>
    <legend>Lapso</legend>
    <div id="contenedorFormulario">
      <label>Código</label>
      <input title="El c&oacute;digo del lapso es generado por el sistema" name="codigo_lapso" id="codigo_lapso" type="text" size="10" readonly value="<?= $codigo_lapso;?>" placeholder="El código del lapso es generado por el Sistema" class="campoTexto"/>
      <label>Nombre del lapso</label>
      <input title="Ingrese el nombre del lapso" onKeyUp="this.value=this.value.toUpperCase()" name="descripcion" id="descripcion" type="text" size="50" value="<?= $descripcion;?>" placeholder="Ingrese el lapso" class="campoTexto" required>
      <label>Fecha Inicio del lapso</label>
      <input title="Ingrese la fecha inicio del lapso" onKeyPress="return isNumberKey(event)" name="fecha_inicio" id="fecha_inicio" type="text" size="50" value="<?= $fecha_inicio;?>" placeholder="Ingrese la fecha inicio del lapso" class="campoTexto">    
      <label>Fecha Fin del lapso</label>
      <input title="Ingrese la fecha fin del lapso" onKeyPress="return isNumberKey(event)" name="fecha_fin" id="fecha_fin" type="text" size="50" value="<?= $fecha_fin;?>" placeholder="Ingrese la fecha fin del lapso" class="campoTexto">    
      <label>Año Académico</label>
      <select name="codigo_ano_academico" id="codigo_ano_academico" title="Seleccione un año" required class="campoTexto"/>
                <option value='0'>Seleccione un Año</option>
                <?php
                  require_once("../clases/class_bd.php");
                  $mysql=new Conexion();
                  $sql = "SELECT codigo_ano_academico,upper(descripcion) descripcion FROM tano_academico WHERE fecha_desactivacion IS NULL ORDER BY codigo_ano_academico";
                  $query = $mysql->Ejecutar($sql);
                  while ($row = $mysql->Respuesta($query)){
                    if($row['codigo_ano_academico']==$codigo_ano_academico){
                      echo "<option value='".$row['codigo_ano_academico']."' selected>".$row['descripcion']."</option>";
                    }else{
                      echo "<option value='".$row['codigo_ano_academico']."'>".$row['descripcion']."</option>";
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
       </form>
    </fieldset>
</form>
<br>
<?php }else{ 
  require_once("../clases/class_perfil.php");
  $perfil=new Perfil();
  $perfil->codigo_perfil(@$_SESSION['user_codigo_perfil']);
  $lapsos_permitidos=$perfil->IMPRIMIR_lapsoS_USUARIO();
  $lapso_solicitado=strtolower(preg_replace('/(serv_)|(\.php)/','',basename(__FILE__))); 
  ?>
  <a href="?lapso" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_lapso.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$lapso_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
<table class="table table-striped table-bordered table-condensed">
 <tr> 
   <td>Código </td>
   <td>Lapso</td>
   <td>Fecha Inicio</td>
   <td>Fecha Fin</td>
   <td>Año Académico</td>
 </tr>
 <?php

           //Conexión a la base de datos 
 require_once("../clases/class_bd.php");
 $mysql=new Conexion();

//Sentencia sql (sin limit) 
 $_pagi_sql = "SELECT s.codigo_lapso,s.descripcion AS lapso,date_format(s.fecha_inicio,'%d/%m/%Y') fecha_inicio,date_format(s.fecha_fin,'%d/%m/%Y') fecha_fin,fecha_desactivacion,a.codigo_ano_academico,
 a.descripcion AS ano_academico FROM tlapso s 
 INNER JOIN tano_academico a ON s.codigo_ano_academico = a.codigo_ano_academico WHERE s.fecha_desactivacion IS NULL ORDER BY s.codigo_lapso DESC"; 
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
  echo "<tr><td style='width:20%;'>".$row['codigo_lapso']."</td>
  <td align='left'>".$row['lapso']."</td>
  <td align='left'>".$row['fecha_inicio']."</td>
    <td align='left'>".$row['fecha_fin']."</td>
    <td align='left'>".$row['ano_academico']."</td></tr>"; 
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