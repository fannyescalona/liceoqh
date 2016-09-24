<div class="form_externo" >
  <form method="post" id="form" class="form-horizontal">
    <fieldset>
      <legend>Horario Académico</legend>
      <div id="contenedorFormulario">
        <label>Año Académico:</label>
        <select name="codigo_ano_academico" id="codigo_ano_academico" title="Seleccione un año" required class="campoTexto"/>
          <option value='0'>Seleccione un Año</option>
          <?php
            require_once("../clases/class_bd.php");
            $mysql=new Conexion();
            $sql = "SELECT codigo_ano_academico,upper(descripcion) descripcion FROM tano_academico WHERE fecha_desactivacion IS NULL ORDER BY codigo_ano_academico";
            $query = $mysql->Ejecutar($sql);
            while ($row = $mysql->Respuesta($query)){
              echo "<option value='".$row['codigo_ano_academico']."'>".$row['descripcion']."</option>";
            }
          ?>
        </select>
        <label>Sección:</label>
        <input title="Seleccione una sección" onKeyUp="this.value=this.value.toUpperCase()" name="seccion" id="seccion" type="text" size="50" placeholder="Seleccione una sección" class="campoTexto" />
        <label>Cédula Docente:</label>
        <input title="Seleccione la cédula del estudiante" onKeyUp="this.value=this.value.toUpperCase()" name="cedula_docente" id="cedula_docente" type="text" size="10" placeholder="Seleccione la cédula del docente" class="campoTexto"/>
        <br>
        <input name='cmdImprimir' type='button' id='cmdImprimir' class='btn btn-large' value='Enviar' />
      </div>
    </fieldset>
  </form>
  <script type="text/javascript">
    //  Buscar Docentes
    $('#cedula').autocomplete({
      source:'../autocomplete/docente.php', 
      minLength:1
    });
    //  Buscar Seccion
    $('#seccion').autocomplete({
      source:'../autocomplete/seccion.php', 
      minLength:1
    });
    // Generar Reporte
    $('#cmdImprimir').click(function(){
      if($('#codigo_ano_academico').val()!=""){
        cedula = $('#cedula_docente').val();
        cedula = cedula.split('_');
        cedula = cedula[0];
        seccion = $('#seccion').val();
        seccion = seccion.split('_');
        seccion = seccion[0];
        codigo_ano_academico = $('#codigo_ano_academico').val();
        url = "../informe_pdf/horario.php?codigo_ano_academico="+codigo_ano_academico+"&cedula_docente="+cedula+"&seccion="+seccion;
        window.open(url, '_blank'); 
      }
      else{
        alert("Debe seleccionar un año académico");
      }
    })
  </script>
</div>