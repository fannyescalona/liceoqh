<div class="form_externo" >
  <form method="post" id="form" class="form-horizontal">
    <fieldset>
      <legend>Listado de Docentes</legend>
      <div id="contenedorFormulario">
        <input type="hidden" name="codigo_materia" id="codigo_materia">
        <input name='cmdImprimir' type='button' id='cmdImprimir' class='btn btn-large' value='Enviar' />
      </div>
    </fieldset>
  </form>
  <script type="text/javascript">
    // Generar Reporte
    $('#cmdImprimir').click(function(){
      codigo_materia = $('#codigo_materia').val();
      url = "../informe_pdf/listado_docentes.php?codigo_materia="+codigo_materia;
      window.open(url, '_blank');
    })
  </script>
</div>