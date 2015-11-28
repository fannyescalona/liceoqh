<?php
if(isset($_SESSION['datos']['descripcion'])){ 
                 $disabledRC='disabled';
                  $disabledMD='';
                  $estatus=null;
                }else {
                     $disabledRC='';
                     $disabledMD='disabled';
                	}
                  $servicios='estado';
if(isset($_SESSION['datos'])){
            @$descripcion=$_SESSION['datos']['descripcion'];
            @$codigo_estado=$_SESSION['datos']['codigo_estado'];
            @$codigo_pais=$_SESSION['datos']['codigo_pais'];
            @$estatus=$_SESSION['datos']['estatus'];
           // unset($_SESSION['datos']);
             
            }
       else{
            @$descripcion=null;
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
            <input title="El código del estado es generado por el sistema" name="codigo_estado" id="codigo_estado" type="text" size="10" readonly value="<?= $codigo_estado;?>" placeholder="El código del estado es generado por el sistema" class="campoTexto"/> 
            <label>Nombre del Estado:</label>
             <input title="Ingrese el nombre del estado" onKeyUp="this.value=this.value.toUpperCase()" name="descripcion" id="descripcion" type="text" size="50" value="<?= $descripcion;?>" required="" placeholder="Ingrese el nombre del estado" class="campoTexto">
             <label>Seleccione un País:</label>
              <select name="codigo_pais" id="codigo_pais" title="Seleccione un país" required="" class="campoTexto"/>
                <option value='0'>Seleccione un País</option>
                <?php
                  require_once("../clases/class_bd.php");
                  $mysql=new Conexion();
                  $sql = "SELECT codigo_pais,upper(descripcion) descripcion FROM tpais WHERE fecha_desactivacion IS NULL ORDER BY codigo_pais";
                  $query = $mysql->Ejecutar($sql);
                  while ($row = $mysql->Respuesta($query)){
                    if($row['codigo_pais']==$codigo_pais){
                      echo "<option value='".$row['codigo_pais']."' selected>".$row['descripcion']."</option>";
                    }else{
                      echo "<option value='".$row['codigo_pais']."'>".$row['descripcion']."</option>";
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
$_pagi_sql = "SELECT e.codigo_estado,e.descripcion AS estado,e.fecha_desactivacion,p.codigo_pais,p.descripcion AS pais FROM testado e 
INNER JOIN tpais p ON e.codigo_pais = p.codigo_pais WHERE e.fecha_desactivacion IS NULL ORDER BY e.codigo_estado DESC"; 
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
    echo "<tr style='cursor: pointer;' id='".$row['estado']."' onclick='enviarForm(this.id)'>
    <td style='width:20%;'>".$row['codigo_estado']."</td>
    <td align='left'>".$row['estado']."</td>
    <td align='left'>".$row['pais']."</td></tr>"; 
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
<form id="form1" method="POST" action="../controladores/cont_estado.php">
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