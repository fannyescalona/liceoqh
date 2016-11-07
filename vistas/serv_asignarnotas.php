<?php
  require_once("../clases/class_bd.php");
  $mysql=new Conexion();
  $sql = "SELECT carga_nota_abierta,nota_minima,nota_maxima  
  FROM tconfiguracion_negocio WHERE fecha_desactivacion IS NULL";
  $nota_minima = 0;
  $nota_maxima = 999;
  $query = $mysql->Ejecutar($sql);
  if($mysql->Total_Filas($query)==0)
    $carga_nota_abierta='N';
  while ($row = $mysql->Respuesta($query)){
    $carga_nota_abierta=$row['carga_nota_abierta'];
    $nota_minima = $row['nota_minima'];
    $nota_maxima = $row['nota_maxima'];
  }
  if($carga_nota_abierta=="N"){
    echo "<strong class='obligatorio'>¡No es posible cargar el formulario, ya que la Carga de Notas esta cerrado!</strong>";
  }
  else{
?>
<div class="form_externo">
  <script src="../js/jp.js"> </script>
  <script src="../js/uds_asignacionnotas.js"> </script>
  <form action="../controladores/cont_seccion.php" method="post" id="form">
    <fieldset>
      <legend>Asignación de Notas <br> Docente: <?php echo $_SESSION['fullname_user']; ?></legend>
      <center>
        <div class="row">
          <div class="span6">
            <input type='hidden' name="nota_minima" id="nota_minima" value="<?php echo $nota_minima; ?>">
            <input type='hidden' name="nota_maxima" id="nota_maxima" value="<?php echo $nota_maxima; ?>">
            <input type="hidden" name="cedula_docente" id="cedula_docente" value="<?= $_SESSION['user_cedula'];?>" required />
            <label>Sección:</label>
            <select name="seccion" id="seccion" title="Seleccione una sección" required="" class="campoTexto"/>
              <option value='0'>Seleccione una sección</option>
              <?php
                require_once("../clases/class_bd.php");
                $mysql=new Conexion();
                $sql = "SELECT DISTINCT s.seccion,upper(s.descripcion) descripcion FROM tseccion s 
                INNER JOIN tmateria_seccion_docente msd ON s.seccion = msd.seccion 
                WHERE s.fecha_desactivacion IS NULL AND msd.cedula_docente = '".$_SESSION['user_cedula']."' 
                ORDER BY s.seccion";
                $query = $mysql->Ejecutar($sql);
                while ($row = $mysql->Respuesta($query)){
                  if($row['seccion']==$seccion){
                    echo "<option value='".$row['seccion']."' selected>".$row['descripcion']."</option>";
                  }else{
                    echo "<option value='".$row['seccion']."'>".$row['descripcion']."</option>";
                  }
                }
              ?>
            </select> 
            <label>Materia:</label>
            <input type="hidden" id="materia" name="materia" value=""/>
            <select required class="campoTexto" name='codigo_materia' id='codigo_materia' title="Seleccione una materia">
            </select>
            <input type="hidden" name="codigo_msd" id="codigo_msd" value="" />
          </div>
          <div class="span6">
            <label>Lapso Académico:</label>
            <select name="codigo_lapso" id="codigo_lapso" title="Seleccione un lapso académico" required="" class="campoTexto"/>
              <option value='0'>Seleccione un lapso</option>
              <?php
                require_once("../clases/class_bd.php");
                $mysql=new Conexion();
                $sql = "SELECT l.codigo_lapso, CONCAT(l.descripcion,' (',aa.descripcion,')') AS descripcion 
                FROM tlapso l 
                INNER JOIN tano_academico aa ON l.codigo_ano_academico = aa.codigo_ano_academico  
                WHERE l.fecha_desactivacion IS NULL AND aa.cerrado = 'N' 
                ORDER BY l.fecha_inicio,l.fecha_fin ASC";
                $query = $mysql->Ejecutar($sql);
                while ($row = $mysql->Respuesta($query)){
                  if($row['codigo_lapso']==$codigo_lapso){
                    echo "<option value='".$row['codigo_lapso']."' selected>".$row['descripcion']."</option>";
                  }else{
                    echo "<option value='".$row['codigo_lapso']."'>".$row['descripcion']."</option>";
                  }
                }
              ?>
            </select>
          </div>
        </div>
        <table id='tablaAsignacionNotas' style="display: none;" class="table table-striped table-bordered table-condensed">
        </table>
        <input type="hidden" name="operacion" value="Asignar_Notas" id="operacion" />
        <button type="submit" id="btnGuardar" class="btn btn-large btn-primary"><i class="icon-hdd"></i>&nbsp;Procesar</button>
      </center>
    </fieldset>
  </form>
</div>
<?php
  }
?>