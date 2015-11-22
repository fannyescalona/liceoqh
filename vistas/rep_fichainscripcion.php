<div class="form_externo" >
  <form action="../controladores/cont_pais.php" method="post" id="form" class="form-horizontal">
    <fieldset>
      <legend>Ficha de Inscripción</legend>
      <div id="contenedorFormulario">
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
      source:'../autocomplete/estudiante.php', 
      minLength:1
    });
    // Generar Reporte
    $('#cmdImprimir').click(function(){
      if($('#cedula').val()!=""){
        cedula = $('#cedula').val();
        cedula = cedula.split('_');
        cedula = cedula[0];
        console.log(cedula);
        url = "../informe_pdf/ficha_inscripcion.php?cedula_estudiante="+cedula;
        window.open(url, '_blank'); 
      }
      else{
        alert("Debe seleccionar un estudiante");
      }
    })
  </script>
</di>