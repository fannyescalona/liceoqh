<div class="form_externo" >
  <form id="form3" name="form" method="POST" action="../controladores/cont_procesoinscripcion.php">
    <fieldset>
      <?php
      require_once('../clases/class_bd.php');
      if(isset($_SESSION['datos'])){
        $cedula_estudiante=$_SESSION['datos']['cedula'];
      }
      $mysql=new Conexion();
      $sql="SELECT pi.cedula_estudiante,CONCAT(est.nombres,' ',est.apellidos) AS estudiante,
      pi.certificado_sextogrado,pi.notascertificadas,pi.cartabuenaconducta,pi.fotoestudiante,
      pi.fotorepresentante,pi.fotocopia_ciestudiante,pi.fotocopia_cirepresentante,pi.fotocopia_pnestudiante,
      pi.kitscomedor,pi.becado,pi.tipobeca 
      FROM tpersona est 
      INNER JOIN tproceso_inscripcion pi ON est.cedula = pi.cedula_estudiante 
      WHERE pi.cedula_estudiante = '".$cedula_estudiante."'";
      $query = $mysql->Ejecutar($sql);
      while($row = $mysql->Respuesta($query)){
        ?>
        <div id="contenedorInscripcion">
          <h1>Estudiante</h1>
          <div class="row">
            <div class="span6">
              <label>Cédula Estudiante:</label>
              <input title="Cédula del Estudiante" name="cedula_estudiante" id="cedula" type="text" size="10" value="<?=$row['cedula_estudiante'];?>" class="campoTexto" readonly />
            </div>
            <div class="span6">
              <label>Estudiante:</label>
              <input title="Nombre y Apellido del Estudiante" name="estudiante" id="estudiante" type="text" size="10" value="<?=$row['estudiante'];?>" class="campoTexto" readonly />
            </div>
          </div>
          <h1>Documentos Consignados</h1>
          <div class="row">
            <div class="span6">
              <label>Tiene Beca:</label>
              <input tabindex=1 type="radio" name="becado" id="becado" value="Y" <?php if($row['becado']=="Y"){echo "checked"; }?>> SÍ <input type="radio" name="becado" id="becado" value="N" <?php if($row['becado']=="N"){echo "checked"; }?>> NO
              <label>Certificado de 6to Grado:</label>
              <input tabindex=3 type="radio" name="certificado_sextogrado" id="certificado_sextogrado" value="Y" <?php if($row['certificado_sextogrado']=="Y"){echo "checked"; }?>> SÍ <input type="radio" name="certificado_sextogrado" id="certificado_sextogrado" value="N" <?php if($row['certificado_sextogrado']=="N"){echo "checked"; }?>> NO
              <label>Notas Certificadas:</label>
              <input tabindex=5 type="radio" name="notascertificadas" id="notascertificadas" value="Y" <?php if($row['notascertificadas']=="Y"){echo "checked"; }?>> SÍ <input type="radio" name="notascertificadas" id="notascertificadas" value="N" <?php if($row['notascertificadas']=="N"){echo "checked"; }?>> NO
              <label>Carta de Buena Conducta:</label>
              <input tabindex=7 type="radio" name="cartabuenaconducta" id="cartabuenaconducta" value="Y" <?php if($row['cartabuenaconducta']=="Y"){echo "checked"; }?>> SÍ <input type="radio" name="cartabuenaconducta" id="cartabuenaconducta" value="N" <?php if($row['cartabuenaconducta']=="N"){echo "checked"; }?>> NO
              <label>Foto del Estudiante:</label>
              <input tabindex=9 type="radio" name="fotoestudiante" id="fotoestudiante" value="Y" <?php if($row['fotoestudiante']=="Y"){echo "checked"; }?>> SÍ <input type="radio" name="fotoestudiante" id="fotoestudiante" value="N" <?php if($row['fotoestudiante']=="N"){echo "checked"; }?>> NO
              <label>Kits para el Comedor:</label>
              <input tabindex=11 type="radio" name="kitscomedor" id="kitscomedor" value="Y" <?php if($row['kitscomedor']=="Y"){echo "checked"; }?>> SÍ <input type="radio" name="kitscomedor" id="kitscomedor" value="N" <?php if($row['kitscomedor']=="N"){echo "checked"; }?>> NO
            </div>
            <div class="span6">
              <label>Tipo de Beca:</label>
              <select tabindex=2 name="tipobeca" id="tipobeca" title="Seleccione el Tipo de Beca" class='lista' >
                <option value="0">Selecione el Tipo de Beca</option>
                <option value="N" <?php if($row['tipobeca']=="N"){ echo "selected";}?>>Nacional</option>
                <option value="E" <?php if($row['tipobeca']=="E"){ echo "selected";}?>>Estadal</option>
                <option value="M" <?php if($row['tipobeca']=="M"){ echo "selected";}?>>Madres del Barrio</option>
                <option value="H" <?php if($row['tipobeca']=="H"){ echo "selected";}?>>Hijos de Venezuela</option>
              </select>
              <label>Fotocopia de C.I. del Estudiante:</label>
              <input tabindex=4 type="radio" name="fotocopia_ciestudiante" id="fotocopia_ciestudiante" value="Y" <?php if($row['fotocopia_ciestudiante']=="Y"){echo "checked"; }?>> SÍ <input type="radio" name="fotocopia_ciestudiante" id="fotocopia_ciestudiante" value="N" <?php if($row['fotocopia_ciestudiante']=="N"){echo "checked"; }?>> NO
              <label>Fotocopia de Partida de Nacimiento del Estudiante:</label>
              <input tabindex=6 type="radio" name="fotocopia_pnestudiante" id="fotocopia_pnestudiante" value="Y" <?php if($row['fotocopia_pnestudiante']=="Y"){echo "checked"; }?>> SÍ <input type="radio" name="fotocopia_pnestudiante" id="fotocopia_pnestudiante" value="N" <?php if($row['fotocopia_pnestudiante']=="N"){echo "checked"; }?>> NO
              <label>Fotos del Representante:</label>
              <input tabindex=8 type="radio" name="fotorepresentante" id="fotorepresentante" value="Y" <?php if($row['fotorepresentante']=="Y"){echo "checked"; }?>> SÍ <input type="radio" name="fotorepresentante" id="fotorepresentante" value="N" <?php if($row['fotorepresentante']=="N"){echo "checked"; }?>> NO
              <label>Fotocopia de C.I. del Representante:</label>
              <input tabindex=10 type="radio" name="fotocopia_cirepresentante" id="fotocopia_cirepresentante" value="Y" <?php if($row['fotocopia_cirepresentante']=="Y"){echo "checked"; }?>> SÍ <input type="radio" name="fotocopia_cirepresentante" id="fotocopia_cirepresentante" value="N" <?php if($row['fotocopia_cirepresentante']=="N"){echo "checked"; }?>> NO
            </div> 
          </div>   
          <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
        </div>
        <br><br>
        <?php 
      } ?>
      <p>
        <label>
          <input type="hidden" name="operacion" value="" id="operacion_tab3" />
          <input name="cmdRegistrar" type="button" id="cmdForm2" class="btn btn-large" value="Modificar" />
        </label>
      </p>
    </fieldset>
  </form>
</div>