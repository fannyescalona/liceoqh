<?php
  require_once('../clases/class_bd.php'); 
  $conexion = new Conexion();
  $sql = "SELECT * FROM tconfiguracion_negocio";
  $query=$conexion->Ejecutar($sql);
  $filas=$conexion->Respuesta($query);
?>
<article>
  <form action="../controladores/cont_configuarion_negocio.php" method='post' id="form_interior" name="form_interior" onsubmit='return validar()'>
    <fieldset>
      <legend>Configuración del Negocio</legend>
      <div id="contenedorFormulario">
        <div class="row">
          <div class="span6">
            <input type="hidden" name="codigo_configuracion_negocio" id="codigo_configuracion_negocio" value="<?php echo !empty($filas['codigo_configuracion_negocio']) ? $filas['codigo_configuracion_negocio'] : null; ?>"/>
            <label>Abrir Inscripción:</label>
            <input tabindex=1 name="inscripcion_abierta" id="inscripcion_abierta" type="radio" value="Y" <?php if($filas['inscripcion_abierta']=="Y"){ echo "checked='checked'"; } ?>  required />
            <span>SÍ</span>
            <input tabindex=2 name="inscripcion_abierta" id="inscripcion_abierta" type="radio" value="N" <?php if($filas['inscripcion_abierta']=="N"){ echo "checked='checked'"; } ?> required />
            <span>NO</span>
            <label>Nota Mínima:</label>
            <input tabindex=5 type="text" id="nota_minima" name="nota_minima" size="25" title="Ingrese la Nota Mínima" placeholder="Ingrese la Nota Mínima" class="campoTexto" onKeyPress="return isNumberKey(event)" required value="<?php echo !empty($filas['nota_minima']) ? $filas['nota_minima'] : 0; ?>"/>
            <label>Edad Máxima para cursar 1er Año:</label>
            <input tabindex=7 type="text" id="edad_maxima_primer_anio" name="edad_maxima_primer_anio" size="25" title="Ingrese la Edad máxima para cursar el 1er año" placeholder="Ingrese la Edad máxima para cursar el 1er año" class="campoTexto" onKeyPress="return isNumberKey(event)" required value="<?php echo !empty($filas['edad_maxima_primer_anio']) ? $filas['edad_maxima_primer_anio'] : 0; ?>"/>
          </div>
          <div class="span6">
            <label>Abrir Notas:</label>
            <input tabindex=3 name="carga_nota_abierta" id="carga_nota_abierta" type="radio" value="Y" <?php if($filas['carga_nota_abierta']=="Y"){ echo "checked='checked'"; } ?>  required />
            <span>SÍ</span>
            <input tabindex=4 name="carga_nota_abierta" id="carga_nota_abierta" type="radio" value="N" <?php if($filas['carga_nota_abierta']=="N"){ echo "checked='checked'"; } ?> required />
            <span>NO</span>
            <label>Nota Máxima:</label>
            <input tabindex=6 type="text" id="nota_maxima" name="nota_maxima" size="25" title="Ingrese la Nota Máxima" placeholder="Ingrese la Nota Máxima" class="campoTexto" onKeyPress="return isNumberKey(event)" required value="<?php echo !empty($filas['nota_maxima']) ? $filas['nota_maxima'] : 0; ?>"/>
            <label>Nota para Aprobar:</label>
            <input tabindex=8 type="text" id="nota_aprobacion" name="nota_aprobacion" size="25" title="Ingrese la Nota para Aprobar las materias" placeholder="Ingrese la Nota para Aprobar las materias" class="campoTexto" onKeyPress="return isNumberKey(event)" required value="<?php echo !empty($filas['nota_aprobacion']) ? $filas['nota_aprobacion'] : 0; ?>"/>
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
    if($('#nota_minima').val()==""){
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
    else if($('#nota_aprobacion').val()==""){
      alert("Debe ingresar la nota para aprobar las materias!");
      validado=false;
    }
    else if( (parseFloat($('#nota_aprobacion').val())<parseFloat($('#nota_minima').val())) || (parseFloat($('#nota_aprobacion').val())>parseFloat($('#nota_maxima').val())) ){
      alert("La nota de aprobación debe estar entre "+parseFloat($('#nota_minima').val())+" y "+parseFloat($('#nota_maxima').val())+"!");
      validado=false;
    }
    else 
      validado = true;

    return validado;
  }
</script>