<div class="form_externo" >
  <form method="post" id="form" class="form-horizontal">
    <fieldset>
      <legend>Listado de Estudiantes Nuevo Ingreso</legend>
      <div id="contenedorFormulario">
        <input type="hidden" name="seccion" id="seccion" value=null>
        <input type="hidden" name="grado_escolar" id="grado_escolar" value="1">
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