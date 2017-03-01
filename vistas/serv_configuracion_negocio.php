<?php
  require_once('../clases/class_bd.php'); 
  $conexion = new Conexion();
  $sql = "SELECT * FROM tconfiguracion_negocio";
  $query=$conexion->Ejecutar($sql);
  $filas=$conexion->Respuesta($query);
?>
<article>
  <form action="../controladores/cont_configuarion_negocio.php" method='post' id="form_interior" name="form_interior" onsubmit='return validar()' enctype='multipart/form-data'>
    <fieldset>
      <legend>Configuración del Negocio</legend>
      <div id="contenedorFormulario">
        <label>Plantel:</label>
        <select tabindex=0 id="codigo_plantel" name="codigo_plantel" title="Seleccione un Plantel" class="lista">
        <option value=NULL selected>Seleccione un Plantel</option>
        <?php
          require_once("../clases/class_bd.php");
          $mysql=new Conexion();
          $sql = "SELECT codigo_plantel,nombre FROM tplantel WHERE fecha_desactivacion IS NULL ORDER BY codigo_plantel ASC";
          $query = $mysql->Ejecutar($sql);
          while ($row = $mysql->Respuesta($query)){
            if($row['codigo_plantel']==$filas['codigo_plantel']){
              echo "<option value='".$row['codigo_plantel']."' selected>".$row['nombre']."</option>";
            }else{
              echo "<option value='".$row['codigo_plantel']."'>".$row['nombre']."</option>";
            }
          }
        ?>
        </select>
        <div class="row">
          <div class="span6">
            <input type="hidden" name="codigo_configuracion_negocio" id="codigo_configuracion_negocio" value="<?php echo !empty($filas['codigo_configuracion_negocio']) ? $filas['codigo_configuracion_negocio'] : null; ?>"/>
            <label>Abrir Inscripción:</label>
            <input tabindex=1 name="inscripcion_abierta" id="inscripcion_abierta" type="radio" value="Y" <?php if($filas['inscripcion_abierta']=="Y"){ echo "checked='checked'"; } ?>  required />
            <span>SÍ</span>
            <input tabindex=2 name="inscripcion_abierta" id="inscripcion_abierta" type="radio" value="N" <?php if($filas['inscripcion_abierta']=="N"){ echo "checked='checked'"; } ?> required />
            <span>NO</span>
            <label>Datos del Padre Obligatorio:</label>
            <input tabindex=5 name="datos_padre_obligatorio" id="datos_padre_obligatorio" type="radio" value="Y" <?php if($filas['datos_padre_obligatorio']=="Y"){ echo "checked='checked'"; } ?>  required />
            <span>SÍ</span>
            <input tabindex=6 name="datos_padre_obligatorio" id="datos_padre_obligatorio" type="radio" value="N" <?php if($filas['datos_padre_obligatorio']=="N"){ echo "checked='checked'"; } ?> required />
            <span>NO</span>
            <label>Nota Mínima:</label>
            <input tabindex=9 type="number" id="nota_minima" name="nota_minima" size="25" title="Ingrese la Nota Mínima" placeholder="Ingrese la Nota Mínima" class="campoTexto" onKeyPress="return isNumberKey(event)" required value="<?php echo !empty($filas['nota_minima']) ? $filas['nota_minima'] : 0; ?>"/>
            <label>Edad Máxima para nuevo ingreso a la Institución:</label>
            <input tabindex=11 type="number" id="edad_maxima_primer_anio" name="edad_maxima_primer_anio" size="25" title="Ingrese la Edad máxima para cursar el 1er año" placeholder="Ingrese la Edad máxima para cursar el 1er año" class="campoTexto" onKeyPress="return isNumberKey(event)" required value="<?php echo !empty($filas['edad_maxima_primer_anio']) ? $filas['edad_maxima_primer_anio'] : 0; ?>"/>
            <label>Cantidad Materias aplazadas para Reprobar:</label>
            <input tabindex=13 type="number" max=10 id="cantidad_materia_reprobada" name="cantidad_materia_reprobada" size="25" title="Ingrese la Edad máxima para cursar el 1er año" placeholder="Ingrese la Edad máxima para cursar el 1er año" class="campoTexto" onKeyPress="return isNumberKey(event)" required value="<?php echo !empty($filas['cantidad_materia_reprobada']) ? $filas['cantidad_materia_reprobada'] : 0; ?>"/>
            <label>Carga Horaria Mínima del Docente:</label>
            <input tabindex=15 type="number" id="hora_minima_docente" name="hora_minima_docente" size="25" title="Ingrese la cantidad de horas mínimas que puede asignarle a un docente" placeholder="Ingrese la Carga Horaria Mínima del Docente" class="campoTexto" onKeyPress="return isNumberKey(event)" required value="<?php echo !empty($filas['hora_minima_docente']) ? $filas['hora_minima_docente'] : 0; ?>"/>
            <label>Carga Horaria Mínima de la Materia:</label>
            <input tabindex=17 type="number" id="hora_minima_materia" name="hora_minima_materia" size="25" title="Ingrese la cantidad de horas mínimas que puede asignarle a una materia" placeholder="Ingrese la Carga Horaria Mínima de la Materia" class="campoTexto" onKeyPress="return isNumberKey(event)" required value="<?php echo !empty($filas['hora_minima_materia']) ? $filas['hora_minima_materia'] : 0; ?>"/>
            <label>Url del Cintillo para los reportes</label>
            <input tabindex=19 type=file accept="image/*" name="archivo_reporte">
          </div>
          <div class="span6">
            <label>Abrir Notas:</label>
            <input tabindex=3 name="carga_nota_abierta" id="carga_nota_abierta" type="radio" value="Y" <?php if($filas['carga_nota_abierta']=="Y"){ echo "checked='checked'"; } ?>  required />
            <span>SÍ</span>
            <input tabindex=4 name="carga_nota_abierta" id="carga_nota_abierta" type="radio" value="N" <?php if($filas['carga_nota_abierta']=="N"){ echo "checked='checked'"; } ?> required />
            <span>NO</span>
            <label>Datos de la Madre Obligatorio:</label>
            <input tabindex=7 name="datos_madre_obligatorio" id="datos_madre_obligatorio" type="radio" value="Y" <?php if($filas['datos_madre_obligatorio']=="Y"){ echo "checked='checked'"; } ?>  required />
            <span>SÍ</span>
            <input tabindex=8 name="datos_madre_obligatorio" id="datos_madre_obligatorio" type="radio" value="N" <?php if($filas['datos_madre_obligatorio']=="N"){ echo "checked='checked'"; } ?> required />
            <span>NO</span>
            <label>Nota Máxima:</label>
            <input tabindex=10 type="number" id="nota_maxima" name="nota_maxima" size="25" title="Ingrese la Nota Máxima" placeholder="Ingrese la Nota Máxima" class="campoTexto" onKeyPress="return isNumberKey(event)" required value="<?php echo !empty($filas['nota_maxima']) ? $filas['nota_maxima'] : 0; ?>"/>
            <label>Nota para Aprobar:</label>
            <input tabindex=12 type="number" id="nota_aprobacion" name="nota_aprobacion" size="25" title="Ingrese la Nota para Aprobar las materias" placeholder="Ingrese la Nota para Aprobar las materias" class="campoTexto" onKeyPress="return isNumberKey(event)" required value="<?php echo !empty($filas['nota_aprobacion']) ? $filas['nota_aprobacion'] : 0; ?>"/>
            <label>Cantidad de Materias por Sección:</label>
            <input tabindex=14 type="number" max=10 id="cantidad_materia_maxima" name="cantidad_materia_maxima" size="25" title="Ingrese la Edad máxima para cursar el 1er año" placeholder="Ingrese la Edad máxima para cursar el 1er año" class="campoTexto" onKeyPress="return isNumberKey(event)" required value="<?php echo !empty($filas['cantidad_materia_maxima']) ? $filas['cantidad_materia_maxima'] : 0; ?>"/>
            <label>Carga Horaria Máxima del Docente:</label>
            <input tabindex=16 type="number" id="hora_maxima_docente" name="hora_maxima_docente" size="25" title="Ingrese la cantidad de horas máximas que puede asignarle a un docente" placeholder="Ingrese la Carga Horaria Máxima del Docente" class="campoTexto" onKeyPress="return isNumberKey(event)" required value="<?php echo !empty($filas['hora_maxima_docente']) ? $filas['hora_maxima_docente'] : 0; ?>"/>
            <label>Carga Horaria Máxima de la Materia:</label>
            <input tabindex=18 type="number" id="hora_maxima_materia" name="hora_maxima_materia" size="25" title="Ingrese la cantidad de horas máximas que puede asignarle a una materia" placeholder="Ingrese la Carga Horaria Máxima de la Materia" class="campoTexto" onKeyPress="return isNumberKey(event)" required value="<?php echo !empty($filas['hora_maxima_materia']) ? $filas['hora_maxima_materia'] : 0; ?>"/>
          </div>
        </div>
        <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong><br />
        <button tabindex=9 type="submit" value="<?php echo !empty($filas['codigo_configuracion_negocio']) ? "Modificar" : "Registrar"; ?>" class="btn btn-info" name="operacion" id="operacion">Procesar</button>
      </div>
    </fieldset> 
  </form>
</article>
<script type="text/javascript">
  function validar(){
    var validado = false;
    if($('#codigo_plantel').val()=="NULL"){
      alert("Debe seleccionar el plantel!");
      validado=false;
    }
    else if($('#nota_minima').val()==""){
      alert("Debe ingresar la nota mínima!");
      validado=false;
    }
    else if($('#nota_maxima').val()==""){
      alert("Debe ingresar la nota maxima!");
      validado=false;
    }
    else if(parseFloat($('#nota_minima').val()) > parseFloat($('#nota_maxima').val())){
      alert("La nota mínima debe ser menor o igual a la nota máxima!");
      validado=false;
    }
    else if($('#edad_maxima_primer_anio').val()==""){
      alert("Debe ingresar la edad máxima para cursar el primer año!");
      validado=false;
    }
    else if(parseInt($('#edad_maxima_primer_anio').val())<10){
      alert("La edad máxima para cursar el primer año debe ser mayor que 10!");
      validado=false;
    }
    else if($('#nota_aprobacion').val()==""){
      alert("Debe ingresar la nota para aprobar las materias!");
      validado=false;
    }
    else if( (parseFloat($('#nota_aprobacion').val())<parseFloat($('#nota_minima').val())) || (parseFloat($('#nota_aprobacion').val())>parseFloat($('#nota_maxima').val())) ){
      alert("La nota de aprobación debe estar entre "+parseFloat($('#nota_minima').val())+" y "+parseFloat($('#nota_maxima').val())+"!");
      validado=false;
    }
    else if($('#hora_minima_docente').val()==""){
      alert("Debe ingresar la carga horaria mínima del docente!");
      validado=false;
    }
    else if($('#hora_maxima_docente').val()==""){
      alert("Debe ingresar la carga horaria maxima del docente!");
      validado=false;
    }
    else if(parseInt($('#hora_minima_docente').val()) > parseInt($('#hora_maxima_docente').val())){
      alert("La carga horaria mínima del docente debe ser menor o igual a la carga horaria máxima del docente!");
      validado=false;
    }
    else if($('#hora_minima_materia').val()==""){
      alert("Debe ingresar la carga horaria mínima de la materia!");
      validado=false;
    }
    else if($('#hora_maxima_materia').val()==""){
      alert("Debe ingresar la carga horaria maxima de la materia!");
      validado=false;
    }
    else if(parseInt($('#hora_minima_materia').val()) > parseInt($('#hora_maxima_materia').val())){
      alert("La carga horaria mínima de la materia debe ser menor o igual a la carga horaria máxima de la materia!");
      validado=false;
    }
    else 
      validado = true;

    return validado;
  }
</script>