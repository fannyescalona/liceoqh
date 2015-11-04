<?php
if(isset($_SESSION['datos']['nombre_estado'])){ 
                 $disabledRC='disabled';
                  $disabledMD='';
                  $estatus=null;
                }else {
                     $disabledRC='';
                     $disabledMD='disabled';
                	}
                  $servicios='estado';
if(isset($_SESSION['datos'])){
            @$nombre_estado=$_SESSION['datos']['nombre_estado'];
            @$codigo_estado=$_SESSION['datos']['cod_estado'];
            @$codigo_pais=$_SESSION['datos']['cod_pais'];
            @$estatus=$_SESSION['datos']['estatus'];
           // unset($_SESSION['datos']);
             
            }
       else{
            @$nombre_estado=null;
            @$codigo_estado=null;
            @$codigo_pais=null;
            @$estatus=null;
            }
?>
<br><br>
  <?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
<script src="../js/uds_estado.js"> </script>
<form action="../controladores/cont_estado.php" method="post" id="form">
     <fieldset>
      <legend>Estado</legend>
        <div id="contenedorFormulario">
          <label>Código:</label>
            <input title="El código del estado es generado por el sistema" name="cod_estado" id="cod_estado" type="text" size="10" readonly value="<?= $codigo_estado;?>" placeholder="El código del estado es generado por el sistema" class="campoTexto"/> 
            <label>Nombre del Estado:</label>
             <input title="Ingrese el nombre del estado" onKeyUp="this.value=this.value.toUpperCase()" name="nombre_estado" id="nombre_estado" type="text" size="50" value="<?= $nombre_estado;?>" required="" placeholder="Ingrese el nombre del estado" class="campoTexto">
             <label>Seleccione un País:</label>
              <select name="cod_pais" id="cod_pais" title="Seleccione un país" required="" class="campoTexto"/>
                <option value='0'>Seleccione un País</option>
                <?php
                  require_once("../clases/class_bd.php");
                  $mysql=new Conexion();
                  $sql = "SELECT cod_pais,upper(nombre_pais) nombre_pais FROM tpais WHERE fecha_desactivacion IS NULL ORDER BY cod_pais";
                  $query = $mysql->Ejecutar($sql);
                  while ($row = $mysql->Respuesta($query)){
                    if($row['cod_pais']==$codigo_pais){
                      echo "<option value='".$row['cod_pais']."' selected>".$row['nombre_pais']."</option>";
                    }else{
                      echo "<option value='".$row['cod_pais']."'>".$row['nombre_pais']."</option>";
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
<br>
  <?php }else{
require_once("../clases/class_perfil.php");
$perfil=new Perfil();
$perfil->codigo_perfil(@$_SESSION['user_codigo_perfil']);
$servicios_permitidos=$perfil->IMPRIMIR_SERVICIOS_USUARIO();
$servicio_solicitado=strtolower(preg_replace('/(serv_)|(\.php)/','',basename(__FILE__)));  	
  	 ?>
  <a href="?estado" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_estado.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>         
     <table class="table table-striped table-bordered table-condensed">
           <tr> 
               <td > Codigo </td>
               <td >Nombre</td>
               <td >País</td>
           </tr>
         <?php

           //Conexión a la base de datos 
  require_once("../clases/class_bd.php");
  $mysql=new Conexion();

//Sentencia sql (sin limit) 
$_pagi_sql = "SELECT e.cod_estado,e.nombre_estado,e.fecha_desactivacion,p.cod_pais,p.nombre_pais FROM testado e 
INNER JOIN tpais p ON e.cod_pais = p.cod_pais WHERE e.fecha_desactivacion IS NULL ORDER BY cod_estado DESC"; 
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
    echo "<tr><td style='width:20%;'>".$row['cod_estado']."</td>
    <td align='left'>".$row['nombre_estado']."</td>
    <td align='left'>".$row['nombre_pais']."</td></tr>"; 
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