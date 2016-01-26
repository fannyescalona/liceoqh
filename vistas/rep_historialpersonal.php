<div class="form_externo" >
  <form method="post" id="form" class="form-horizontal">
    <fieldset>
      <legend>Historial del Personal Administrativo</legend>
      <div id="contenedorFormulario">
        <label>Cédula Personal:</label>
        <input title="Seleccione la cédula del personal" onKeyUp="this.value=this.value.toUpperCase()" name="cedula" id="cedula" type="text" size="10" placeholder="Seleccione la cédula del personal" class="campoTexto"/>
        <br>
        <input name='cmdImprimir' type='button' id='cmdImprimir' class='btn btn-large' value='Enviar' />
      </div>
    </fieldset>
  </form>
  <script type="text/javascript">
    //  Buscar Estudiantes
    $('#cedula').autocomplete({
      source:'../autocomplete/personalinstitucion.php', 
      minLength:1
    });
    // Generar Reporte
    $('#cmdImprimir').click(function(){
      if($('#cedula').val()!=""){
        cedula = $('#cedula').val();
        cedula = cedula.split('_');
        cedula = cedula[0];
        url = "../informe_pdf/historial_personal.php?cedula="+cedula;
        window.open(url, '_blank'); 
      }
      else{
        alert("Debe seleccionar un personal");
      }
    })
  </script>
</div>