<div class="form_externo" >
  <form id="form4" name="form" method="POST" action="../controladores/cont_procesoinscripcion.php">
    <fieldset>
      <?php
      require_once('../clases/class_bd.php');
      if(isset($_SESSION['datos'])){
        $cedula_estudiante=$_SESSION['datos']['cedula'];
      }
      $mysql=new Conexion();
      $sql="SELECT pi.cedula_estudiante,CONCAT(est.nombres,' ',est.apellidos) AS estudiante,
      CONCAT(pi.cedula_docente,'_',doc.nombres,' ',doc.apellidos) AS cedula_docente,
      rep.cedula AS cedula_representante,rep.nombres AS nombre_representante,rep.apellidos AS apellido_representante,
      Date_Format(rep.fecha_nacimiento,'%d/%m/%Y') AS fn_representante,CONCAT(rep.lugar_nacimiento,'_',prep.descripcion) AS ln_representante,
      rep.direccion AS dir_representante,rep.telefono_habitacion AS th_representante,rep.telefono_movil AS tm_representante,rep.email AS email_representante,
      CONCAT(pi.codigo_parentesco,'_',par.descripcion) AS parentesco,CONCAT(pi.lugar_trabajo,'_',plugt.descripcion) AS lugar_trabajo,rep.genero AS genero_representante,
      pi.proceso_completado 
      FROM tpersona est 
      INNER JOIN tproceso_inscripcion pi ON est.cedula = pi.cedula_estudiante 
      LEFT JOIN tpersona rep ON pi.cedula_representante = rep.cedula 
      LEFT JOIN tpersona doc ON pi.cedula_docente = doc.cedula
      LEFT JOIN tparroquia prep ON rep.lugar_nacimiento = prep.codigo_parroquia 
      LEFT JOIN tparroquia plugt ON pi.lugar_trabajo = plugt.codigo_parroquia 
      LEFT JOIN tparentesco par ON pi.codigo_parentesco = par.codigo_parentesco 
      WHERE pi.cedula_estudiante = '".$cedula_estudiante."'";
      $query = $mysql->Ejecutar($sql);
      while($row = $mysql->Respuesta($query)){
        $proceso_completado = $row['proceso_completado'];
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
          <h1>Docente</h1>
          <div class="row">
            <div class="span6">
              <label>Cédula Docente:</label>
              <input tabindex=0 onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el número de cédula del docente" maxlength=10 name="cedula_docente" id="cedula_docente" type="text" size="10" value="<?=$row['cedula_docente'];?>" placeholder="Ingrese el número de Cédula del docente" class="campoTexto" required />
            </div>
          </div>
          <h1>Datos del Representante Legal</h1>
          <div class="row">
            <div class="span6">
              <label>Cédula:</label>
              <input tabindex=1 maxlength="10" onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el número de cédula del representante" maxlength=10 name="cedula_representante" id="cedula_representante" type="text" size="10" value="<?=$row['cedula_representante'];?>" placeholder="Ingrese el número de Cédula del representante" class="campoTexto" required />
              <label>Nombre(s):</label>
              <input tabindex=3 title="Ingrese el(los) nombre(s) del representante" onKeyPress="return isCharKey(event)" onKeyUp="this.value=this.value.toUpperCase()" name="nombre_representante" id="nombre_representante" type="text" size="50" value="<?=$row['nombre_representante'];?>" placeholder="Ingrese el(los) Nombre(s) del representante" class="campoTexto" required />
              <label>Fecha de Nacimiento:</label>
              <input tabindex=5 title="Seleccione el fecha de Nacimiento del representante" name="fecha_nacimiento_representante" id="fecha_nacimiento_representante" type="text" size="50" value="<?=$row['fn_representante'];?>" placeholder="Ingrese la Fecha de Nacimiento del representante" class="campoTexto" readonly required />
              <label>Dirección:</label>
              <textarea tabindex=7 onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese la dirección de la madre" name="direccion_representante" id="direccion_representante" rows=5 placeholder="Ingrese la Dirección del representante" required /><?php echo $row['dir_representante'];?></textarea>
              <label>Lugar de Trabajo:</label>
              <input tabindex=10 title="Seleccione una Parroquia" onKeyUp="this.value=this.value.toUpperCase()" name="lugar_trabajo" id="lugar_trabajo" type="text" size="50" value="<?=$row['lugar_trabajo'];?>" placeholder="Seleccione una Parroquia" class="campoTexto" required />
              <label>Parentesco:</label>
              <input tabindex=12 title="Seleccione un parentesco" onKeyUp="this.value=this.value.toUpperCase()" name="parentesco" id="parentesco" type="text" size="50" value="<?=$row['parentesco'];?>" placeholder="Seleccione un parentesco" class="campoTexto" required />
            </div>
            <div class="span6">
              <label>Género:</label>
              <select tabindex=2 name="genero_representante" id="genero_representante" title="Seleccione el Género" class='lista' required >
                <option value="">Selecione una opción</option>
                <option value="F" <?php if($row['genero_representante']=="F"){ echo "selected";}?>>Femenino</option>
                <option value="M" <?php if($row['genero_representante']=="M"){ echo "selected";}?>>Masculino</option>
              </select>
              <label>Apellido(s):</label>
              <input tabindex=4 title="Ingrese el(los) apellido(s) del representante" onKeyPress="return isCharKey(event)" onKeyUp="this.value=this.value.toUpperCase()" name="apellido_representante" id="apellido_representante" type="text" size="50" value="<?=$row['apellido_representante'];?>" placeholder="Ingrese el(los) Apellido(s) del representante" class="campoTexto" required />
              <label>Lugar de Nacimiento:</label>
              <input tabindex=6 title="Seleccione una Parroquia" onKeyUp="this.value=this.value.toUpperCase()" name="lugar_nacimiento_representante" id="lugar_nacimiento_representante" type="text" size="50" value="<?=$row['ln_representante'];?>" placeholder="Seleccione una Parroquia" class="campoTexto" required />
              <label>Teléfono de Habitación:</label>
              <input tabindex=8 maxlength=11 title="Ingrese el número de habitación del representante" onKeyPress="return isNumberKey(event)" name="telefono_habitacion_representante" id="telefono_habitacion_representante" type="text" size="50" value="<?=$row['th_representante'];?>" placeholder="Ingreso el Número Teléfonico de Habitación del representante" class="campoTexto" />
              <label>Teléfono Celular:</label>
              <input tabindex=9 maxlength=11 title="Ingrese el número de celular del representante" onKeyPress="return isNumberKey(event)" name="telefono_movil_representante" id="telefono_movil_representante" type="text" size="50" value="<?=$row['tm_representante'];?>" placeholder="Ingrese el Número Celular del representante" class="campoTexto" />
              <label>Correo Electrónico:</label>
              <input tabindex=11 title="Ingrese el correo electrónico del representante" onKeyPress="return isEmail(event,this.value)" onKeyUp="this.value=this.value.toLowerCase()" name="email_representante" id="email_representante" type="text" size="50" value="<?=$row['email_representante'];?>" placeholder="Ingrese el Correo Electrónico del representante" class="campoTexto" />
            </div> 
          </div>    
          <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
        </div>
        <br><br>
        <?php 
      } ?>
      <p>
        <label>
          <input type="hidden" name="operacion" value="" id="operacion_tab4" />
          <input name="cmdRegistrar" type="button" id="cmdForm3" class="btn btn-large" value="Guardar" />
          <?php
            if($proceso_completado=="Y")
              echo "<input name='cmdImprimir' type='button' id='cmdImprimir' class='btn btn-large' value='Imprimir Ficha' />";
          ?>
        </label>
      </p>
    </fieldset>
  </form>
</div>