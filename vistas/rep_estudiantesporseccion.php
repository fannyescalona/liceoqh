<div class="form_externo" >
  <form method="post" id="form" class="form-horizontal">
    <fieldset>
      <legend>Listado de Estudiantes por Sección</legend>
      <div id="contenedorFormulario">
        <label>Sección:</label>
        <input type="hidden" name="grado_escolar" id="grado_escolar">
        <input title="Seleccione una sección" onKeyUp="this.value=this.value.toUpperCase()" name="seccion" id="seccion" type="text" size="50" placeholder="Seleccione una sección" class="campoTexto" />
        <br>
        <input name='cmdImprimir' type='button' id='cmdImprimir' class='btn btn-large' value='Enviar' />
      </div>
    </fieldset>
  </form>
  <script type="text/javascript">
    //  Buscar Estudiantes
    $('#seccion').autocomplete({
      source:'../autocomplete/seccion.php', 
      minLength:1
    });
    // Generar Reporte
    $('#cmdImprimir').click(function(){
      if($('#seccion').val()!=""){
        grado_escolar = $('#grado_escolar').val();
        seccion = $('#seccion').val();
        seccion = seccion.split('_');
        seccion = seccion[0];
        url = "../informe_pdf/listado_estudiantes.php?seccion="+seccion+"&grado_escolar="+grado_escolar;
        window.open(url, '_blank'); 
      }
      else{
        alert("Debe seleccionar una sección");
      }
    })
  </script>
</div>