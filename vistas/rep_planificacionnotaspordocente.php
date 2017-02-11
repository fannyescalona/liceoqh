<div class="form_externo" >
  <form method="post" id="form" class="form-horizontal">
    <fieldset>
      <legend>Planificación de Notas por Docente</legend>
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
        <label>Cédula Docente:</label>
        <input title="Seleccione la cédula del docente" name="cedula" id="cedula" type="text" size="10" class="campoTexto" readonly value="<?php echo $_SESSION['user_cedula'].'_'.$_SESSION['fullname_user'];?>" />
        <br>
        <input name='cmdImprimir' type='button' id='cmdImprimir' class='btn btn-large' value='Enviar' />
      </div>
    </fieldset>
  </form>
  <script type="text/javascript">
    //  Buscar Estudiantes
    $('#cedula').autocomplete({
      source:'../autocomplete/docente.php', 
      minLength:1
    });
    // Generar Reporte
    $('#cmdImprimir').click(function(){
      if($('#cedula').val()!=""){
        cedula = $('#cedula').val();
        cedula = cedula.split('_');
        cedula = cedula[0];
        codigo_ano_academico = $('#codigo_ano_academico').val();
        url = "../informe_pdf/planificacion_notas.php?codigo_ano_academico="+codigo_ano_academico+"&cedula_docente="+cedula;
        window.open(url, '_blank'); 
      }
      else{
        alert("Debe seleccionar un docente");
      }
    })
  </script>
</div>