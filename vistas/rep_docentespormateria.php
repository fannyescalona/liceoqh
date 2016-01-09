<div class="form_externo" >
  <form method="post" id="form" class="form-horizontal">
    <fieldset>
      <legend>Listado de Docentes</legend>
      <div id="contenedorFormulario">
        <label>Materia:</label>
        <input title="Seleccione la materia" onKeyUp="this.value=this.value.toUpperCase()" name="codigo_materia" id="codigo_materia" type="text" size="10" placeholder="Seleccione la materia" class="campoTexto"/>
        <br>
        <input name='cmdImprimir' type='button' id='cmdImprimir' class='btn btn-large' value='Enviar' />
      </div>
    </fieldset>
  </form>
  <script type="text/javascript">
    //  Buscar Estudiantes
    $('#codigo_materia').autocomplete({
      source:'../autocomplete/materia.php', 
      minLength:1
    });
    // Generar Reporte
    $('#cmdImprimir').click(function(){
      if($('codigo_materia').val()!=""){
        codigo_materia = $('#codigo_materia').val();
        codigo_materia = codigo_materia.split('_');
        codigo_materia = codigo_materia[0];
        url = "../informe_pdf/listado_docentes.php?codigo_materia="+codigo_materia;
        window.open(url, '_blank');
      }
      else{
        alert("Debe seleccionar una materia");
      }
    })
  </script>
</div>