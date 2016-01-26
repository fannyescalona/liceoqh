<div class="form_externo" >
  <form method="post" id="form" class="form-horizontal">
    <fieldset>
      <legend>Boletín de Notas</legend>
      <div id="contenedorFormulario">
        <label>Año Escolar:</label>
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
        <label>Cédula Estudiante:</label>
        <input title="Seleccione la cédula del estudiante" onKeyUp="this.value=this.value.toUpperCase()" name="cedula" id="cedula" type="text" size="10" placeholder="Seleccione la cédula del estudiante" class="campoTexto"/>
        <br>
        <input name='cmdImprimir' type='button' id='cmdImprimir' class='btn btn-large' value='Enviar' />
      </div>
    </fieldset>
  </form>
  <script type="text/javascript">
    //  Buscar Estudiantes
    $('#cedula').autocomplete({
      source:'../autocomplete/estudiantesconnotas.php', 
      minLength:1
    });
    // Generar Reporte
    $('#cmdImprimir').click(function(){
      if($('#cedula').val()!=""){
        cedula = $('#cedula').val();
        cedula = cedula.split('_');
        cedula = cedula[0];
        codigo_ano_academico = $('#codigo_ano_academico').val();
        url = "../informe_pdf/boletin.php?codigo_ano_academico="+codigo_ano_academico+"&cedula_estudiante="+cedula;
        window.open(url, '_blank'); 
      }
      else{
        alert("Debe seleccionar un estudiante");
      }
    })
  </script>
</div>