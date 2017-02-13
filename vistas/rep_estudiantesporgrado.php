<div class="form_externo" >
  <form method="post" id="form" class="form-horizontal">
    <fieldset>
      <legend>Listado de Estudiantes por Grado Escolar</legend>
      <div id="contenedorFormulario">
        <label>Grado Escolar:</label>
        <input type="hidden" name="seccion" id="seccion">
        <select tabindex=4 name="grado_escolar" id="grado_escolar" title="Seleccione el Grado Escolar" class='lista' required >
          <option value=null>Selecione una opción</option>
          <option value="1">1er Año</option>
          <option value="2">2do Año</option>
          <option value="3">3er Año</option>
          <option value="4">4to Año</option>
          <option value="5">5to Año</option>
        </select>
        <br>
        <input name='cmdImprimir' type='button' id='cmdImprimir' class='btn btn-large' value='Enviar' />
      </div>
    </fieldset>
  </form>
  <script type="text/javascript">
    // Generar Reporte
    $('#cmdImprimir').click(function(){
      if($('#grado_escolar').val()!=null){
        grado_escolar = $('#grado_escolar').val();
        seccion = $('#seccion').val();
        url = "../informe_pdf/listado_estudiantes.php?grado_escolar="+grado_escolar+"&seccion="+seccion;
        window.open(url, '_blank'); 
      }
      else{
        alert("Debe seleccionar un grado escolar");
      }
    })
  </script>
</div>