<div class="form_externo" >
  <form method="post" id="form" class="form-horizontal" action="../controladores/cont_ano_academico.php">
    <fieldset>
      <legend>Cerrar Año Académico</legend>
      <div id="contenedorFormulario">
        <label>Año Académico</label>
        <input type="hidden" name="operacion" value="CerrarAñoEscolar" id="operacion" />
        <select name="codigo_ano_academico" id="codigo_ano_academico" title="Seleccione un año" required class="campoTexto"/>
          <option value='0'>Seleccione un Año</option>
          <?php
            require_once("../clases/class_bd.php");
            $mysql=new Conexion();
            $sql = "SELECT codigo_ano_academico,upper(descripcion) descripcion FROM tano_academico WHERE fecha_desactivacion IS NULL AND cerrado='N' ORDER BY codigo_ano_academico";
            $query = $mysql->Ejecutar($sql);
            while ($row = $mysql->Respuesta($query)){
              echo "<option value='".$row['codigo_ano_academico']."'>".$row['descripcion']."</option>";
            }
          ?>
        </select>
        <br>
        <input name='cmdImprimir' type='button' id='cmdEnviar' class='btn btn-large' value='Enviar' />
      </div>
    </fieldset>
  </form>
  <script type="text/javascript">
    // Generar Reporte
    $('#cmdEnviar').click(function(){
      if($('#codigo_ano_academico').val()!="0"){ 
        $('#form').submit();
      }
      else{
        alert("Debe seleccionar un año academico");
      }
    })
  </script>
</div>