<div class="form_externo" >
  <form id="form2" name="form" method="POST" action="../controladores/cont_procesoinscripcion.php">
    <fieldset>
      <?php
      require_once('../clases/class_bd.php');
      if(isset($_SESSION['datos'])){
        $cedula_estudiante=$_SESSION['datos']['cedula'];
      }
      $mysql=new Conexion();
      $sql="SELECT pi.cedula_estudiante,CONCAT(est.nombres,' ',est.apellidos) AS estudiante,
      Date_Format((est.fecha_nacimiento - interval 12 year),'%d/%m/%Y') AS fecha_nacimiento_estudiante,
      pad.cedula AS cedula_padre,pad.nombres AS nombre_padre,pad.apellidos AS apellido_padre,
      Date_Format(pad.fecha_nacimiento,'%d/%m/%Y') AS fn_padre,CONCAT(pad.lugar_nacimiento,'_',ppad.descripcion) AS ln_padre,
      pad.direccion AS dir_padre,pad.telefono_habitacion AS th_padre,pad.telefono_movil AS tm_padre,pad.email AS email_padre,
      mad.cedula AS cedula_madre,mad.nombres AS nombre_madre,mad.apellidos AS apellido_madre,
      Date_Format(mad.fecha_nacimiento,'%d/%m/%Y') AS fn_madre,CONCAT(mad.lugar_nacimiento,'_',pmad.descripcion) AS ln_madre,
      mad.direccion AS dir_madre,mad.telefono_habitacion AS th_madre,mad.telefono_movil AS tm_madre,mad.email AS email_madre
      FROM tpersona est 
      INNER JOIN tproceso_inscripcion pi ON est.cedula = pi.cedula_estudiante 
      LEFT JOIN tpersona pad ON pi.cedula_padre = pad.cedula
      LEFT JOIN tpersona mad ON pi.cedula_madre = mad.cedula 
      LEFT JOIN tparroquia ppad ON pad.lugar_nacimiento = ppad.codigo_parroquia 
      LEFT JOIN tparroquia pmad ON mad.lugar_nacimiento = pmad.codigo_parroquia 
      WHERE pi.cedula_estudiante = '".$cedula_estudiante."'";
      $query = $mysql->Ejecutar($sql);
      while($row = $mysql->Respuesta($query)){
        ?>
        <div id="contenedorInscripcion">
          <h1>Estudiante</h1>
          <div class="row">
            <div class="span6">
              <label>Cédula Estudiante:</label>
              <input type="hidden" id="fne" value="<?=$row['fecha_nacimiento_estudiante']?>">
              <input title="Cédula del Estudiante" name="cedula_estudiante" id="cedula" type="text" size="10" value="<?=$row['cedula_estudiante'];?>" class="campoTexto" readonly />
            </div>
            <div class="span6">
              <label>Estudiante:</label>
              <input title="Nombre y Apellido del Estudiante" name="estudiante" id="estudiante" type="text" size="10" value="<?=$row['estudiante'];?>" class="campoTexto" readonly />
            </div>
          </div>
          <h1>Datos de la Madre</h1>
          <div class="row">
            <div class="span6">
              <label>Cédula:</label>
              <input tabindex=1 maxlength="10" onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el número de cédula de la madre" maxlength=10 name="cedula_madre" id="cedula_madre" type="text" size="10" value="<?=$row['cedula_madre'];?>" placeholder="Ingrese el número de Cédula de la Madre" class="campoTexto" />
              <label>Nombre(s):</label>
              <input tabindex=3 title="Ingrese el(los) nombre(s) de la Madre" onKeyPress="return isCharKey(event)" onKeyUp="this.value=this.value.toUpperCase()" name="nombre_madre" id="nombre_madre" type="text" size="50" value="<?=$row['nombre_madre'];?>" placeholder="Ingrese el(los) Nombre(s) de la Madre" class="campoTexto" />
              <label>Fecha de Nacimiento:</label>
              <input tabindex=5 title="Seleccione el fecha de Nacimiento de la Madre" name="fecha_nacimiento_madre" id="fecha_nacimiento_madre" type="text" size="50" value="<?=$row['fn_madre'];?>" placeholder="Ingrese la Fecha de Nacimiento de la Madre" class="campoTexto" readonly />
              <label>Dirección:</label>
              <textarea tabindex=7 onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese la dirección de la madre" name="direccion_madre" id="direccion_madre" rows=5 placeholder="Ingrese la Dirección de la Madre" /><?php echo $row['dir_madre'];?></textarea>
            </div>
            <div class="span6">
              <label>Correo Electrónico:</label>
              <input tabindex=2 title="Ingrese el correo electrónico de la madre" onKeyPress="return isEmail(event,this.value)" onKeyUp="this.value=this.value.toLowerCase()" name="email_madre" id="email_madre" type="text" size="50" value="<?=$row['email_madre'];?>" placeholder="Ingrese el Correo Electrónico de la Madre" class="campoTexto" />
              <label>Apellido(s):</label>
              <input tabindex=4 title="Ingrese el(los) apellido(s) de la Madre" onKeyPress="return isCharKey(event)" onKeyUp="this.value=this.value.toUpperCase()" name="apellido_madre" id="apellido_madre" type="text" size="50" value="<?=$row['apellido_madre'];?>" placeholder="Ingrese el(los) Apellido(s) de la Madre" class="campoTexto" />
              <label>Lugar de Nacimiento:</label>
              <input tabindex=6 title="Seleccione una Parroquia" onKeyUp="this.value=this.value.toUpperCase()" name="lugar_nacimiento_madre" id="lugar_nacimiento_madre" type="text" size="50" value="<?=$row['ln_madre'];?>" placeholder="Seleccione una Parroquia" class="campoTexto" />
              <label>Teléfono de Habitación:</label>
              <input tabindex=8 maxlength=11 title="Ingrese el número de habitación de la madre" onKeyPress="return isNumberKey(event)" name="telefono_habitacion_madre" id="telefono_habitacion_madre" type="text" size="50" value="<?=$row['th_madre'];?>" placeholder="Ingreso el Número Teléfonico de Habitación de la Madre" class="campoTexto" />
              <label>Teléfono Celular:</label>
              <input tabindex=9 maxlength=11 title="Ingrese el número de celular de la madre" onKeyPress="return isNumberKey(event)" name="telefono_movil_madre" id="telefono_movil_madre" type="text" size="50" value="<?=$row['tm_madre'];?>" placeholder="Ingrese el Número Celular de la Madre" class="campoTexto" />
            </div> 
          </div>
          <h1>Datos del Padre</h1>
          <div class="row">
            <div class="span6">
              <label>Cédula:</label>
              <input tabindex=10 maxlength="10" onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el número de cédula del padre" maxlength=10 name="cedula_padre" id="cedula_padre" type="text" size="10" value="<?=$row['cedula_padre'];?>" placeholder="Ingrese el número de Cédula del Padre" class="campoTexto" />
              <label>Nombre(s):</label>
              <input tabindex=12 title="Ingrese el(los) nombre(s) del Padre" onKeyPress="return isCharKey(event)" onKeyUp="this.value=this.value.toUpperCase()" name="nombre_padre" id="nombre_padre" type="text" size="50" value="<?=$row['nombre_padre'];?>" placeholder="Ingrese el(los) Nombre(s) del Padre" class="campoTexto" />
              <label>Fecha de Nacimiento:</label>
              <input tabindex=14 title="Seleccione el fecha de Nacimiento del Padre" name="fecha_nacimiento_padre" id="fecha_nacimiento_padre" type="text" size="50" value="<?=$row['fn_padre'];?>" placeholder="Ingrese la Fecha de Nacimiento del Padre" class="campoTexto" readonly />
              <label>Dirección:</label>
              <textarea tabindex=16 onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese la dirección de la madre" name="direccion_padre" id="direccion_padre" rows=5 placeholder="Ingrese la Dirección del Padre" /><?php echo $row['dir_padre'];?></textarea>
            </div>
            <div class="span6">
              <label>Correo Electrónico:</label>
              <input tabindex=11 title="Ingrese el correo electrónico del padre" onKeyPress="return isEmail(event,this.value)" onKeyUp="this.value=this.value.toLowerCase()" name="email_padre" id="email_padre" type="text" size="50" value="<?=$row['email_padre'];?>" placeholder="Ingrese el Correo Electrónico del Padre" class="campoTexto" />
              <label>Apellido(s):</label>
              <input tabindex=13 title="Ingrese el(los) apellido(s) del Padre" onKeyPress="return isCharKey(event)" onKeyUp="this.value=this.value.toUpperCase()" name="apellido_padre" id="apellido_padre" type="text" size="50" value="<?=$row['apellido_padre'];?>" placeholder="Ingrese el(los) Apellido(s) del Padre" class="campoTexto" />
              <label>Lugar de Nacimiento:</label>
              <input tabindex=15 title="Seleccione una Parroquia" onKeyUp="this.value=this.value.toUpperCase()" name="lugar_nacimiento_padre" id="lugar_nacimiento_padre" type="text" size="50" value="<?=$row['ln_padre'];?>" placeholder="Seleccione una Parroquia" class="campoTexto" />
              <label>Teléfono de Habitación:</label>
              <input tabindex=17 maxlength=11 title="Ingrese el número de habitación del padre" onKeyPress="return isNumberKey(event)" name="telefono_habitacion_padre" id="telefono_habitacion_padre" type="text" size="50" value="<?=$row['th_padre'];?>" placeholder="Ingreso el Número Teléfonico de Habitación del Padre" class="campoTexto" />
              <label>Teléfono Celular:</label>
              <input tabindex=18 maxlength=11 title="Ingrese el número de celular del padre" onKeyPress="return isNumberKey(event)" name="telefono_movil_padre" id="telefono_movil_padre" type="text" size="50" value="<?=$row['tm_padre'];?>" placeholder="Ingrese el Número Celular del Padre" class="campoTexto" />
            </div> 
          </div>    
          <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
        </div>
        <br><br>
        <?php 
      } ?>
      <p>
        <label>
          <input type="hidden" name="operacion" value="" id="operacion_tab2" />
          <input name="cmdRegistrar" type="button" id="cmdForm1" class="btn btn-large" value="Guardar" />
        </label>
      </p>
    </fieldset>
  </form>
</div>