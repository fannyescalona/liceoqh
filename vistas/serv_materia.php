<?php
if(isset($_SESSION['datos']['descripcion'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='materia';
if(isset($_SESSION['datos'])){
  @$descripcion=$_SESSION['datos']['descripcion'];
  @$codigo_materia=$_SESSION['datos']['codigo_materia'];
  @$unidad_curricular=$_SESSION['datos']['unidad_curricular'];
  @$hora_academica=$_SESSION['datos']['hora_academica'];
  @$materia_compuesta=$_SESSION['datos']['materia_compuesta'];
  @$grado_escolar=$_SESSION['datos']['grado_escolar'];
  @$codigo_materia_padre=$_SESSION['datos']['codigo_materia_padre'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$descripcion=null;
  @$codigo_materia=null;
  @$unidad_curricular=null;
  @$hora_academica=null;
  @$materia_compuesta="N";
  @$grado_escolar=null;
  @$codigo_materia_padre=null;
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
      <input type="hidden" name="oldcodigo_materia" id="oldcodigo_materia" value="<?= $codigo_materia;?>">
      <input title="Ingrese el código de la materia" onKeyUp="this.value=this.value.toUpperCase()" name="codigo_materia" id="codigo_materia" type="text" size="10" value="<?= $codigo_materia;?>" required placeholder="Ingrese el código de la materia " class="campoTexto"/> 
      <label>Materia:</label>
      <input autocomplete=off title="Ingrese el nombre de la materia" onKeyUp="this.value=this.value.toUpperCase()" name="descripcion" id="descripcion" type="text" size="50" value="<?= $descripcion;?>" required placeholder="Ingrese el nombre de la materia" class="campoTexto"/>
      <label>Unidad curricular:</label>
      <input title="Ingrese la unidad curricular" onKeyPress="return isNumberKey(event)" name="unidad_curricular" id="unidad_curricular" type="text" size="50" value="<?= $unidad_curricular;?>" required placeholder="Ingrese la unidad curricular" class="campoTexto"/>
      <label>Horas Académicas:</label>
      <?php 
        require_once("../clases/class_bd.php");
        $mysql=new Conexion();
        $sql = "SELECT hora_minima_materia,hora_maxima_materia FROM tconfiguracion_negocio 
        WHERE fecha_desactivacion IS NULL";
        $query = $mysql->Ejecutar($sql);
        if($mysql->Total_Filas($query)==0)
          $carga_nota_abierta='N';
        while ($row = $mysql->Respuesta($query)){
          $hora_minima_materia = $row['hora_minima_materia'];
          $hora_maxima_materia = $row['hora_maxima_materia'];
        }
      ?>
      <input type="hidden" id="hora_minima_materia" value="<?php echo $hora_minima_materia; ?>">
      <input type="hidden" id="hora_maxima_materia" value="<?php echo $hora_maxima_materia; ?>">
      <input title="Ingrese las horas académicas" onKeyPress="return isNumberKey(event)" name="hora_academica" id="hora_academica" type="number" min=<?php echo $hora_minima_materia; ?> max=<?php echo $hora_maxima_materia; ?> size="50" value="<?= $hora_academica;?>" required placeholder="Ingrese la hora academica" class="campoTexto"/>
      <label>Grado Escolar:</label>
      <select tabindex=4 name="grado_escolar" id="grado_escolar" title="Seleccione el Grado Escolar" class='lista' required >
        <option value="">Selecione una opción</option>
        <option value="1" <?php if($grado_escolar=="1"){ echo "selected";}?>>1er Año</option>
        <option value="2" <?php if($grado_escolar=="2"){ echo "selected";}?>>2do Año</option>
        <option value="3" <?php if($grado_escolar=="3"){ echo "selected";}?>>3er Año</option>
        <option value="4" <?php if($grado_escolar=="4"){ echo "selected";}?>>4to Año</option>
        <option value="5" <?php if($grado_escolar=="5"){ echo "selected";}?>>5to Año</option>
      </select>
     <label>Depende de otra Materia:</label>
      <input type="hidden" name="materia_compuesta_oculta" id="materia_compuesta_oculta" >
      <input tabindex=1 name="materia_compuesta" id="materia_compuestaY" type="radio" value="Y" <?php if($materia_compuesta=="Y"){ echo "checked='checked'"; } ?>  required />
      <span>SÍ</span>
      <input tabindex=2 name="materia_compuesta" id="materia_compuestaN" type="radio" value="N" <?php if($materia_compuesta=="N"){ echo "checked='checked'"; } ?> required />
      <span>NO</span>
      <br>
      <div id="materia_oculta" style="display: none;">
        <label>Seleccione una Materia:</label>
        <select name="codigo_materia_padre" id="codigo_materia_padre" title="Seleccione una Materia" required="" class="campoTexto"/>
        <option value=''>Seleccione una Materia</option>
          <?php
            require_once("../clases/class_bd.php");
            $mysql=new Conexion();
            $sql = "SELECT codigo_materia,INITCAP(CONCAT(codigo_materia,' - ',descripcion)) AS descripcion FROM tmateria WHERE materia_compuesta = 'N' AND fecha_desactivacion IS NULL ORDER BY codigo_materia_padre";
            $query = $mysql->Ejecutar($sql);
            while ($row = $mysql->Respuesta($query)){
              if($row['codigo_materia']==$codigo_materia_padre){
                echo "<option value='".$row['codigo_materia']."' selected>".$row['descripcion']."</option>";
              }else{
                echo "<option value='".$row['codigo_materia']."'>".$row['descripcion']."</option>";
              }
            }
          ?>
        </select>
      </div>
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
    <a href="?materia" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
    <a href="../excel/excel_materia.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
    <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>        
    <table class="table table-striped table-bordered table-condensed">
     <tr> 
       <td>Código </td>
       <td>Materia</td>
       <td>Horas Académias</td>
       <td>Unidad Curricular</td>
       <td>Grado Escolar</td>
     </tr>
     <?php
    //Conexión a la base de datos 
    require_once("../clases/class_bd.php");
    $mysql=new Conexion();
    //Sentencia sql (sin limit) 
    $_pagi_sql = "SELECT codigo_materia,descripcion,hora_academica,unidad_curricular,
    CASE grado_escolar WHEN '1' THEN '1er Año' WHEN '2' THEN '2do Año' WHEN '3' THEN '3er Año' WHEN '4' THEN '4to Año' WHEN '5' THEN '5to Año' WHEN '6' THEN '6to Año' END AS grado_escolar
    FROM tmateria where fecha_desactivacion is null order by codigo_materia desc";
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
      echo "<tr style='cursor: pointer;' id='".$row['codigo_materia']."' onclick='enviarForm(this.id)'>
      <td style='width:20%;'>".$row['codigo_materia']."</td>
      <td align='left'>".$row['descripcion']."</td>
      <td align='left'>".$row['hora_academica']."</td>
      <td align='left'>".$row['unidad_curricular']."</td>
      <td align='left'>".$row['grado_escolar']."</td></tr>"; 
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
  <form id="form1" method="POST" action="../controladores/cont_materia.php">
    <input type="hidden" name="codigo_materia" id="campo_oculto" value="" />
    <input type="hidden" name="operacion" id="operacion" value="Consultar" />
  </form>
  <div class="pagination">
    <ul>
      <?php echo"<li>".$_pagi_navegacion."</li>";?>
    </ul>
  </div>
</div>
<?php }?>