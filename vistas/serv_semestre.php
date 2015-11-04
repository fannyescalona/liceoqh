<?php
if(isset($_SESSION['datos']['semestre'])){ 
                 $disabledRC='disabled';
                  $disabledMD='';
                  $estatus=null;
                }else {
                     $disabledRC='';
                     $disabledMD='disabled';
                	}
                  $servicios='semestre';
if(isset($_SESSION['datos'])){
            @$semestre=$_SESSION['datos']['semestre'];
            @$cod_semestre=$_SESSION['datos']['cod_semestre'];
            @$cod_ano_academico=$_SESSION['datos']['cod_ano_academico'];
            @$estatus=$_SESSION['datos']['estatus'];
            }
       else{
            @$semestre=null;
            @$cod_semestre=null;
            @$cod_ano_academico=null;
            @$estatus=null;
            }
?>
<br><br>
  <?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
<script src="../js/uds_semestre.js"> </script>
<form action="../controladores/cont_semestre.php" method="post" id="form">
     <fieldset>
      <legend>Semestre</legend>
      <div id="contenedorFormulario">
        <label>Código:</label>
          <input title="el código del semestre es generado por el sistema" name="cod_semestre" id="cod_semestre" type="text" size="10" readonly value="<?= $cod_semestre;?>" placeholder="El Código del Semestre es generado por el sistema" class="campoTexto"/> 
          <label>Nombre:</label>
          <input title="Ingrese el nombre del semestre" onKeyUp="this.value=this.value.toUpperCase()" name="semestre" id="semestre" type="text" size="50" value="<?= $semestre;?>" placeholder="Ingrese el nombre del Semestre" class="campoTexto" required />
          <label>Asigne Año Académico:</label>
          <select name="cod_ano_academico" id="cod_ano_academico" title="Seleccione un año académico" placeholder="Seleccione un año Académico" class="campoTexto"required >
                <option value='0'>Seleccione un Año Académico</option>
                <?php
                  require_once("../clases/class_bd.php");
                  $mysql=new Conexion();
                  $sql = "SELECT a.cod_ano_academico,a.ano,c.nombre_carrera FROM tano_academico a 
                  INNER JOIN tcarrera c ON a.cod_carrera = c.cod_carrera 
                  WHERE a.fecha_desactivacion IS NULL ORDER BY cod_ano_academico";
                  $query = $mysql->Ejecutar($sql);
                  while ($row = $mysql->Respuesta($query)){
                    if($row['cod_ano_academico']==$cod_ano_academico){
                      echo "<option value='".$row['cod_ano_academico']."' selected>".$row['ano']." (".$row['nombre_carrera'].")</option>";
                    }else{
                      echo "<option value='".$row['cod_ano_academico']."'>".$row['ano']." (".$row['nombre_carrera'].")</option>";
                    }
                  }
                ?>
              </select>
            <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
      </div>    
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
    <a href="?semestre" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_semestre.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
  <table class="table table-striped table-bordered table-condensed">
           <tr>
               <td>Código</td>
               <td>Semestre</td>
               <td>Año Académico</td>
               <td>Carrera</td>
           </tr>
         <?php

           //Conexión a la base de datos 
  require_once("../clases/class_bd.php");
  $mysql=new Conexion();

//Sentencia sql (sin limit) 
$_pagi_sql = "SELECT sm.cod_semestre, sm.semestre, a.ano,c.nombre_carrera FROM tsemestre sm 
INNER JOIN tano_academico a ON sm.cod_ano_academico = a.cod_ano_academico 
INNER JOIN tcarrera c ON a.cod_carrera = c.cod_carrera 
WHERE sm.fecha_desactivacion IS NULL ORDER BY c.nombre_carrera,sm.semestre ASC"; 

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
    echo "<tr><td style='width:20%;'>".$row['cod_semestre']."</td>
    <td align='left'>".$row['semestre']."</td>
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