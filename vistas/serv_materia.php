<?php
if(isset($_SESSION['datos']['nombre_materia'])){ 
                 $disabledRC='disabled';
                  $disabledMD='';
                  $estatus=null;
                }else {
                     $disabledRC='';
                     $disabledMD='disabled';
                	}
                  $servicios='materia';
if(isset($_SESSION['datos'])){
            @$nombre_materia=$_SESSION['datos']['nombre_materia'];
            @$unidad_curricular=$_SESSION['datos']['unidad_curricular'];
            @$codigo_materia=$_SESSION['datos']['cod_materia'];
            @$tipo_materia=$_SESSION['datos']['tipo_materia'];
            @$estatus=$_SESSION['datos']['estatus'];
            }
       else{
            @$nombre_materia=null;
            @$codigo_materia=null;
            @$tipo_materia=null;
            @$estatus=null;
            }
?>
<br><br>
  <?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
<script src="../js/uds_materia.js"> </script>
          <form action="../controladores/cont_materia.php" method="post" id="form">
     <fieldset>
      <legend>Materia</legend>
        <div id="contenedorFormulario">
          <label>Código:</label>
            <input class="campoTexto" placeholder="Ingrese el código de la materia" title="Ingrese el código de la materia" onKeyUp="this.value=this.value.toUpperCase()" maxlength="6" name="cod_materia" id="cod_materia" type="text" size="10" value="<?= $codigo_materia;?>" required /> 
            <label>Nombre de la Materia:</label>
            <input class="campoTexto" placeholder="Ingrese el nombre de la materia" title="Ingrese el nombre de la materia" onKeyUp="this.value=this.value.toUpperCase()" name="nombre_materia" id="nombre_materia" type="text" size="50" value="<?= $nombre_materia;?>" required />  
            <label>Valor de la Unidad de Crédito:</label>
            <input class="campoTexto" placeholder="Ingrese valor de la unidad de crédito" title="Ingrese el valor de la unidad de crédito" onKeyPress="return isNumberKey(event)" maxlength="4" name="unidad_curricular" id="unidad_curricular" type="text" size="50" value="<?= isset($unidad_curricular);?>"required />  
            <label>Tipo de Materia:</label>
            <select class="campoTexto" name="tipo_materia" id="tipo_materia" title="Seleccione un tipo de materia" required > 
              <option value=0>Seleccione un Tipo de Materia</option>
              <option value="N" <? if($tipo_materia=="N") echo "selected"; ?> >Normal</option>
              <option value="E" <? if($tipo_materia=="E") echo "selected"; ?> >Electiva</option>
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
<br>
<?php }else{ 
  require_once("../clases/class_perfil.php");
  $perfil=new Perfil();
  $perfil->codigo_perfil(@$_SESSION['user_codigo_perfil']);
  $servicios_permitidos=$perfil->IMPRIMIR_SERVICIOS_USUARIO();
  $servicio_solicitado=strtolower(preg_replace('/(serv_)|(\.php)/','',basename(__FILE__))); 
  ?>
  <a href="?materia" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_materia.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>

     <table class="table table-striped table-bordered table-condensed">
           <tr> 
               <td> Codigo </td>
               <td>Nombre</td>
               <td>Unidad Curricular</td>
               <td>Tipo Materia</td>
           </tr>
         <?php

           //Conexión a la base de datos 
  require_once("../clases/class_bd.php");
  $mysql=new Conexion();

//Sentencia sql (sin limit) 
$_pagi_sql = "SELECT cod_materia,nombre_materia,unidad_curricular, Case tipo_materia When 'N' Then 'Normal' Else 'Electiva' End tipo FROM tmateria where fecha_desactivacion is null order by cod_materia desc"; 
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
    echo "<tr><td style='width:20%;'>".$row['cod_materia']."</td><td align='left'>".$row['nombre_materia']."</td><td align='left'>".$row['unidad_curricular']." UC</td><td align='left'>".$row['tipo']."</td></tr>"; 
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