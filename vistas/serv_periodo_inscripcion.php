<?php
if(isset($_SESSION['datos']['descripcion'])){ 
                 $disabledRC='disabled';
                  $disabledMD='';
                  $estatus=null;
                }else {
                     $disabledRC='';
                     $disabledMD='disabled';
                  }
                  $servicios='periodo_inscripcion';
if(isset($_SESSION['datos'])){
            @$codigo_inscripcion=$_SESSION['datos']['cod_inscripcion'];
            @$codigo_periodo=$_SESSION['datos']['cod_periodo'];
            @$descripcion=$_SESSION['datos']['descripcion'];
            @$fecha_inicio=$_SESSION['datos']['fecha_inicio'];
            @$fecha_fin=$_SESSION['datos']['fecha_fin'];
            @$fecha_cierre=$_SESSION['datos']['fecha_cierre'];
            @$estatus=$_SESSION['datos']['estatus'];
            }
       else{
            @$descripcion=null;
            @$codigo_inscripcion=null;
            @$fecha_inicio=null;
            @$fecha_fin=null;;
            @$fecha_cierre=null;
            @$estatus=null;
            }
?>
<br><br>
  <?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
<script src="../js/uds_periodo_inscripcion.js"> </script>
          <form action="../controladores/cont_periodo_inscripcion.php" method="post" id="form">
     <fieldset>
      <legend>Periodo de Inscripci&oacute;n</legend>
        <div id="contenedorFormulario">
          <label>Código:</label>
            <input title="el c&oacute;digo del periodo de iscripci&oacute;n es generado por el sistema" name="cod_inscripcion" id="cod_inscripcion" type="text" size="10" readonly value="<?= $codigo_inscripcion;?>" placeholder="El Código es generado por el sistema" class="campoTexto" required />            
            <input name="cod_periodo" id="cod_periodo" type="hidden" size="10" value="<?= $codigo_periodo;?>" /></tr>
            <label>Nombre o descripción del Periodo:</label>
            <input title="Ingrese el nombre del periodo de inscripci&oacute;n" onKeyUp="this.value=this.value.toUpperCase()" name="descripcion" id="descripcion" type="text" size="50" value="<?= $descripcion;?>" placeholder="Ingrese el nombre del periodo de iscripci&oacute;n" class="campoTexto" required />
            <label>Fecha de Inicio:</label>
            <input title="Seleccione la fecha de inicio del periodo de iscripci&oacute;n" type="text" size="35" name="fecha_inicio" id="fecha_inicio" value="<?= $fecha_inicio;?>" placeholder="Seleccione la fecha de inicio" class="campoTexto" required />
            <label>Fecha de Culminación:</label>
            <input title="Seleccione la fecha de culminaci&oacute;n del periodo de iscripci&oacute;n" type="text" size="35" name="fecha_fin" id="fecha_fin" value="<?= $fecha_fin;?>" placeholder="Seleccione la fecha de culminaci&oacute;" class="campoTexto" required />
            <label>Fecha de Cierre:</label>
            <input title="Seleccione la fecha de cierre del periodo de iscripci&oacute;n" type="text" size="35" name="fecha_cierre" id="fecha_cierre" value="<?= $fecha_cierre;?>" placeholder="Seleccione la fecha de cierre" class="campoTexto" required />
            <br/>
           <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
      </div>    
             <br><br>
           <?php echo '<tr><td colspan="2" class="'.$estatus.'" id="estatus_registro">'.$estatus.'</td></tr>'; ?>

                      <?php
                      imprimir_boton($disabledRC,$disabledMD,$estatus,$servicios);
                     ?>  
      </fieldset>
     </form>
<br>
  <?php }else{ ?>
  <a href="?periodo_inscripcion" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_periodo_inscripcion.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>

     <table class="table table-striped table-bordered table-condensed">
           <tr> 
               <td> C&oacute;digo </td>
               <td>Descripci&oacute;n</td>
               <td>Fecha Inicio</td>
			   <td>Fecha Fin</td>
         <td>Fecha Cierre</td>
           </tr>
         <?php

           //Conexión a la base de datos 
  require_once("../clases/class_bd.php");
  $mysql=new Conexion();

//Sentencia sql (sin limit) 
$_pagi_sql = "SELECT i.cod_inscripcion,p.descripcion,date_format(p.fecha_inicio,'%d/%m/%Y') fecha_inicio
,date_format(p.fecha_fin,'%d/%m/%Y') fecha_fin,date_format(i.fecha_cierre,'%d/%m/%Y') fecha_cierre
FROM tinscripcion i INNER JOIN tperiodo p ON i.cod_periodo = p.cod_periodo AND p.esinscripcion = 'Y' 
WHERE i.fecha_desactivacion IS NULL ORDER BY i.cod_inscripcion DESC"; 
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
    echo "<tr><td style='width:20%;'>".$row['cod_inscripcion']."</td>
    <td align='left'>".$row['descripcion']."</td>
    <td align='left'>".$row['fecha_inicio']."</td>
    <td align='left'>".$row['fecha_fin']."</td>
    <td align='left'>".$row['fecha_cierre']."</td></tr>"; 
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