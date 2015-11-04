<?php
if(isset($_SESSION['datos']['seccion'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='seccion';
if(isset($_SESSION['datos'])){
  @$seccion=$_SESSION['datos']['seccion'];
  @$nombre_seccion=$_SESSION['datos']['nombre_seccion'];
  @$capacidad_min=$_SESSION['datos']['capacidad_min'];
  @$capacidad_max=$_SESSION['datos']['capacidad_max'];
  @$turno=$_SESSION['datos']['turno'];
  @$codigo_periodo=$_SESSION['datos']['cod_periodo'];
  @$codigo_semestre=$_SESSION['datos']['cod_semestre'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$seccion=null;
  @$nombre_seccion=null;
  @$capacidad_min=null;
  @$capacidad_max=null;
  @$turno=null;
  @$codigo_periodo=null;
  @$codigo_semestre=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_seccion.js"> </script>
  <form action="../controladores/cont_seccion.php" method="post" id="form">
   <fieldset>
    <legend>Sección</legend>
    <div id="contenedorFormulario">
      <label>Código de la sección:</label>
      <input type="hidden" name="oldseccion" value="<?= @$seccion?>">
      <input title="Ingrese el Código de la sección" onKeyUp="this.value=this.value.toUpperCase()" maxlength=5 name="seccion" id="seccion" type="text" size="50" value="<?= $seccion;?>" placeholder="Ingrese el Código de la Sección" class="campoTexto" required />
      <label>Sección</label>
      <input type="text" name="nombre_seccion" id="nombre_seccion" onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el nombre de la sección" size="50" placeholder="Ingrese el nombre de la sección" class="campoTexto" value="<?= $nombre_seccion;?>" required />
      <label>Capacidad Mínima de la Sección:</label>
      <input title="Ingrese la capacidad mínima de la sección" onKeyPress="return isNumberKey(event)" name="capacidad_min" id="capacidad_min" maxlength=2 type="text" size="50" value="<?= $capacidad_min;?>" placeholder="Ingrese la Capacidad Mínima" class="campoTexto" required />
      <label>Capacidad Máxima de la sección:</label>
      <input title="Ingrese la capacidad máxima de la sección" onKeyPress="return isNumberKey(event)" name="capacidad_max" id="capacidad_max" maxlength=2 type="text" size="50" value="<?= $capacidad_max;?>" placeholder="Ingrese la Capacidad Máxima" class="campoTexto" required />
      <label>Asigne el Turno:</label>
      <select name="turno" id="turno" title="Seleccione un turno para la secci&oacute;n" placeholder="Seleccione un turno" class="campoTexto"  required >
        <option value='0'>Seleccione un Turno</option>
        <option value='D' <? if($turno=='D'){ echo 'selected'; }?> >Diurno</option>
        <option value='N' <? if($turno=='N'){ echo 'selected'; }?> >Nocturno</option>
      </select>
      <label>Código:</label>
      <select name="cod_periodo" id="cod_periodo" title="Seleccione un trayecto para la secci&oacute;n" placeholder="Seleccione un Trayecto" class="campoTexto" required >
        <option value='0'>Seleccione un Trayecto</option>
        <?php
        require_once("../clases/class_bd.php");
        $mysql=new Conexion();
        $sql = "SELECT cod_periodo,descripcion FROM tperiodo WHERE fecha_desactivacion IS NULL AND esinscripcion='N' ORDER BY cod_periodo";
        $query = $mysql->Ejecutar($sql);
        while ($row = $mysql->Respuesta($query)){
          if($row['cod_periodo']==$codigo_periodo){
            echo "<option value='".$row['cod_periodo']."' selected>".$row['descripcion']."</option>";
          }else{
            echo "<option value='".$row['cod_periodo']."'>".$row['descripcion']."</option>";
          }
        }
        ?>
      </select>
      <label>Asigne un Semestre:</label>
      <select name="cod_semestre" id="cod_semestre" title="Seleccione un semestre para la secci&oacute;n" placeholder="Seleccione un Semestre" class="campoTexto" required>
        <option value='0'>Seleccione un Semestre</option>
        <?php
        require_once("../clases/class_bd.php");
        $mysql=new Conexion();
        $sql = "SELECT sm.cod_semestre,sm.semestre,c.nombre_carrera FROM tsemestre sm 
        INNER JOIN tano_academico a ON sm.cod_ano_academico = a.cod_ano_academico 
        INNER JOIN tcarrera c ON a.cod_carrera = c.cod_carrera 
        WHERE sm.fecha_desactivacion IS NULL ORDER BY c.nombre_carrera,sm.semestre ASC";
        $query = $mysql->Ejecutar($sql);
        while ($row = $mysql->Respuesta($query)){
          if($row['cod_semestre']==$codigo_semestre){
            echo "<option value='".$row['cod_semestre']."' selected>".$row['semestre']." (".$row['nombre_carrera'].")</option>";
          }else{
            echo "<option value='".$row['cod_semestre']."'>".$row['semestre']." (".$row['nombre_carrera'].")</option>";
          }
        }
        ?>
      </select>
      <table id="tablaMaterias">
        <tr>
          <td>
            <label>Agregar Materias&nbsp;</label>
          </td>
          <td>
            <input type="button" onclick="agrega_campos()" value="+">
          </td>
        </tr>
        <?php
        $mysql=new Conexion();
        $sql = "SELECT cod_materia FROM tmateria_seccion 
        WHERE seccion = '$seccion' 
        ORDER BY cod_materia ASC";
        $query = $mysql->Ejecutar($sql);
        $con=0;
        while ($row = $mysql->Respuesta($query)){
            echo "<tr id='$con'><td>";
            echo "<select name='materias[]' id='materia_".$con."' title='Seleccione una materia para la secci&oacute;n' class='campoTexto'>";
            $sqlx ="SELECT cod_materia,nombre_materia FROM tmateria WHERE fecha_desactivacion IS NULL ORDER BY cod_materia ASC";
            $querys = $mysql->Ejecutar($sqlx);
            while ($rows = $mysql->Respuesta($querys)){
              if($rows['cod_materia']==$row['cod_materia'])
                echo "<option value='".$rows['cod_materia']."' selected>".$rows['nombre_materia']."(".$rows['cod_materia'].")</option>";
              else
                echo "<option value='".$rows['cod_materia']."'>".$rows['nombre_materia']."(".$rows['cod_materia'].")</option>";
            }
            echo "</select></td>";
            echo "<td><input type='button' class='boton' onclick='elimina_me(".$con.")' value='-'></td></tr>";
            $con++;
        }
        ?>
      </table>
      <br/>
      <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
    </div>    
    <br><br>
    <?php echo '<p class="'.$estatus.'" id="estatus_registro">'.$estatus.'</p>'; ?>

    <?php
    imprimir_boton($disabledRC,$disabledMD,$estatus,$servicios);
    ?>  
  </fieldset>
</form>
  <script type="text/javascript">
    var materias = document.getElementsByName('materias[]');
    var contador=materias.length;
      function agrega_campos(){
          $("#tablaMaterias").append("<tr id='"+contador+"' ><td><select name='materias[]' id='materia_"+contador+"' title='Seleccione una materia para la secci&oacute;n' class='campoTexto'><?php require_once('../clases/class_bd.php'); $mysql=new Conexion(); $sql='SELECT cod_materia,nombre_materia FROM tmateria WHERE fecha_desactivacion IS NULL ORDER BY cod_materia ASC'; $comillasimple=chr(39); $query = $mysql->Ejecutar($sql); while ($row = $mysql->Respuesta($query)){ echo '<option value='.$comillasimple.$row['cod_materia'].$comillasimple.'>'.$row['nombre_materia'].'('.$row['cod_materia'].')</option>';}?></select></td><td><input type='button' class='boton' onclick='elimina_me("+contador+")' value='-'></td></tr>");
          contador++;
      }
  
      function elimina_me(elemento){
        $("#"+elemento).remove();
        for(var i=0;i<materias.length;i++){
          materias[i].removeAttribute('id');
        }
        for(var i=0;i<materias.length;i++){
          materias[i].setAttribute('id','materia_'+i);
        }
      }
  </script>
<br>
<?php }else{ 
  require_once("../clases/class_perfil.php");
  $perfil=new Perfil();
  $perfil->codigo_perfil(@$_SESSION['user_codigo_perfil']);
  $servicios_permitidos=$perfil->IMPRIMIR_SERVICIOS_USUARIO();
  $servicio_solicitado=strtolower(preg_replace('/(serv_)|(\.php)/','',basename(__FILE__))); 
  ?>
  <a href="?seccion" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_seccion.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
  
  <table class="table table-striped table-bordered table-condensed">
   <tr> 
     <td>Código Sección</td>
     <td>Sección</td>
     <td>Capacidad Mínima</td>
     <td>Capacidad Máxima</td>
     <td>Turno</td>
     <td>Período</td>
     <td>Semestre</td>
   </tr>
   <?php

           //Conexión a la base de datos 
   require_once("../clases/class_bd.php");
   $mysql=new Conexion();

//Sentencia sql (sin limit) 
   $_pagi_sql = "SELECT s.seccion,s.nombre_seccion,s.capacidad_min,s.capacidad_max,
   CASE s.turno WHEN 'D' THEN 'DIURNO' ELSE 'NOCTURNO' END turno, p.descripcion AS periodo, concat(sm.semestre,' (',c.nombre_carrera,')') AS semestre
   FROM tseccion s 
   INNER JOIN tperiodo p ON s.cod_periodo = p.cod_periodo 
   INNER JOIN tsemestre sm ON s.cod_semestre = sm.cod_semestre 
  INNER JOIN tano_academico a ON sm.cod_ano_academico = a.cod_ano_academico 
  INNER JOIN tcarrera c ON a.cod_carrera = c.cod_carrera 
   WHERE s.fecha_desactivacion IS NULL ORDER BY seccion DESC"; 
//Booleano. Define si se utiliza pg_num_rows() (true) o COUNT(*) (false).
   $_pagi_conteo_alternativo = true;
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
    echo "<tr><td style='width:20%;'>".$row['seccion']."</td>
    <td align='left'>".$row['nombre_seccion']."</td>
    <td align='left'>".$row['capacidad_min']."</td>
    <td align='left'>".$row['capacidad_max']."</td>
    <td align='left'>".$row['turno']."</td>
    <td align='left'>".$row['periodo']."</td>
    <td align='left'>".$row['semestre']."</td></tr>"; 
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