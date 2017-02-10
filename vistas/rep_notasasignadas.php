<div class="form_externo" >
  <form method="post" id="form" class="form-horizontal">
    <fieldset>
      <legend>Notas Asignadas</legend>
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
        <label>Lapso Académico:</label>
        <input type="hidden" id="lapso" name="lapso" value=""/>
        <select required class="campoTexto" name='codigo_lapso' id='codigo_lapso' title="Seleccione un lapso académico">
        </select>
        <label>Cédula Docente:</label>
        <input title="Seleccione la cédula del docente" onKeyUp="this.value=this.value.toUpperCase()" name="cedula" id="cedula" type="text" size="10" placeholder="Seleccione la cédula del docente" class="campoTexto"/>
        <label>Sección:</label>
        <input type="hidden" id="seccionhide" name="seccionhide" value=""/>
        <select required class="campoTexto" name='seccion' id='seccion' title="Seleccione una Sección">
        </select>
        <label>Estudiante:</label>
        <input type="hidden" id="estudiante" name="estudiante" value=""/>
        <select required class="campoTexto" name='cedula_estudiante' id='cedula_estudiante' title="Seleccione un estudiante">
        </select>
        <label>Materia:</label>
        <input type="hidden" id="materia" name="materia" value=""/>
        <select required class="campoTexto" name='codigo_materia' id='codigo_materia' title="Seleccione una materia">
        </select>
        <br>
        <input name='cmdImprimir' type='button' id='cmdImprimir' class='btn btn-large' value='Enviar' />
      </div>
    </fieldset>
  </form>
  <script type="text/javascript">
    //  Buscar Lapsos
    $("#codigo_ano_academico").on("change",function(){
      var Combo = {"operacion":"ComboLapso","codigo_ano_academico":$(this).val()};
      comboDependiente(Combo,"../controladores/cont_lapso.php",$("#codigo_lapso"),['lapso']);
    });
    //  Buscar Estudiantes
    $('#cedula').autocomplete({
      source:'../autocomplete/docente.php', 
      minLength:1,
      select: function (event, ui){
        var cedula_docente = ui.item.value.split('_');
        cedula_docente = cedula_docente[0];
        var Combo = {"operacion":"ComboSeccion","cedula_docente":cedula_docente};
        comboDependiente(Combo,"../controladores/cont_seccion.php",$("#seccion"),['seccionhide']);
      }
    });
    $("#seccion").on("change",function(){
      var cedula_docente = $("#cedula").val().split('_');
      cedula_docente = cedula_docente[0];
      var Combo = {"operacion":"ComboMateria","seccion":$(this).val(),"cedula_docente":cedula_docente};
      comboDependiente(Combo,"../controladores/cont_materia.php",$("#codigo_materia"),['materia']);
      var ComboE = {"operacion":"ComboEstudiante","seccion":$(this).val(),"cedula_docente":cedula_docente};
      comboDependiente(ComboE,"../controladores/cont_estudiante.php",$("#cedula_estudiante"),['estudiante']);
    });
    // Generar Reporte
    $('#cmdImprimir').click(function(){
      if($('#cedula').val()!=""){
        cedula = $('#cedula').val();
        cedula = cedula.split('_');
        cedula = cedula[0];
        codigo_ano_academico = $('#codigo_ano_academico').val();
        codigo_lapso = $('#codigo_lapso').val();
        seccion = $('#seccion').val();
        cedula_estudiante = $('#cedula_estudiante').val();
        codigo_materia = $('#codigo_materia').val();
        url = "../informe_pdf/notas_asignadas.php?codigo_ano_academico="+codigo_ano_academico+"&codigo_lapso="+codigo_lapso+"&cedula_docente="+cedula+"&seccion="+seccion+"&cedula_estudiante="+cedula_estudiante+"&codigo_materia="+codigo_materia;
        window.open(url, '_blank'); 
      }
      else{
        alert("Debe seleccionar un docente");
      }
    })
  </script>
</div>