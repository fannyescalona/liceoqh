<?php
  if(isset($_SESSION['datos'])){
    $pais_residencia=$_SESSION['datos']['pais_residencia'];
    $cedula_estudiante=$_SESSION['datos']['cedula_estudiante'];
  }
  echo "<input type='hidden' id='cedula' value='".isset($cedula_estudiante)."' />";
?>
<div class="form_externo" >
  <form id="form1" name="form" method="POST" action="cont_preinscripcion.php">
    <table width="95%" border="0">
      <tr align="center"><th colspan=4><div class="encabezado_tabla">DATOS PERSONALES <br/><br/></div></th></tr>
      <tr>
        <td><div align="right"><strong>Pa&iacute;s de Nacimiento:</strong></div></td>
        <td>
          <label>
            <select name='pais' id='pais' class='select' title="Seleccione su pa&iacute;s de nacimiento" required />
              <option value='0' selected>Seleccione</option>
              <?php
                  require_once("../../clases/class_bd.php");
                  $mysql=new Conexion();
                  $sql = "SELECT cod_pais,nombre_pais FROM tpais WHERE fecha_desactivacion IS NULL ORDER BY nombre_pais ASC";
                  $query = $mysql->Ejecutar($sql);
                  while ($row = $mysql->Respuesta($query)){
                    echo "<option value='".$row['cod_pais']."'>".$row['nombre_pais']."</option>";
                  }
              ?>
            </select>
          </label>
        </td>
        <td><div align="right"><strong>C&eacute;dula:</strong></div></td>
        <td>
          <label>
            <input required maxlength=8 name="cedula_estudiante" type="text" id="cedula_estudiante" onKeyPress="return isNumberKey(event)" maxlength=12 title="Ingrese la c&eacute;dula del estudiante" />
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Estado de Nacimiento:</strong></div></td>
        <td>
          <label>
            <select required name='estado' id='estado' class='select' title="Seleccione su estado de nacimiento">
            </select>
          </label>
        </td>
        <td><div align="right"><strong>Nombres:</strong></div></td>
        <td>
          <label>
            <input required title="Ingrese su(s) nombre(s)" name="nombre_estudiante" type="text" id="nombre_estudiante" onKeyUp="this.value=this.value.toUpperCase()" />
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Ciudad de Nacimiento:</strong></div></td>
        <td>
          <label>
            <select required name='ciudad' id='ciudad' class='select' title="Seleccione su ciudad de nacimiento">
            </select>
          </label>
        </td>
        <td><div align="right"><strong>Apellidos:</strong></div></td>
        <td>
          <label>
            <input required title="Ingrese su(s) apellido(s)" name="apellido_estudiante" type="text" id="apellido_estudiante" onKeyUp="this.value=this.value.toUpperCase()" />
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Municipio de Nacimiento:</strong></div></td>
        <td>
          <label>
            <select required name='municipio' id='municipio' class='select' title="Seleccione su municipio de nacimiento">
            </select>
          </label>
        </td>
        <td><div align="right"><strong>G&eacute;nero:</strong></div></td>
        <td>
          <label>
            <select required name="sexo" id="sexo" title="Seleccione su g&eacute;nero">
              <option value='0' selected>Seleccione</option>
              <option value='F'>FEMENINO</option>
              <option value='M'>MASCULINO</option>
            </select>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Parroquia de Nacimiento:</strong></div></td>
        <td>
          <label>
            <select required name='parroquia' id='parroquia' class='select' title="Seleccione su parroquia de nacimiento">
            </select>
          </label>
        </td>
        <td><div align="right"><strong>Estado Civil:</strong></div></td>
        <td>
          <label>
            <select required name="edocivil" id="edocivil" title="Seleccione su estado civil">
              <option value='0' selected>Seleccione</option>
              <option value='S'>SOLTERO</option>
              <option value='C'>CASADO</option>
              <option value='D'>DIVORCIADO</option>
              <option value='V'>VIUDO</option>
            </select>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Pa&iacute;s de Residencia:</strong></div></td>
        <td>
          <label>
            <select name='pais_residencia' id='pais_residencia' class='select' title="Seleccione su pa&iacute;s de nacimiento" required />
              <option value='0' selected>Seleccione</option>
              <?php
                  require_once("../../clases/class_bd.php");
                  $mysql=new Conexion();
                  $sql = "SELECT cod_pais,nombre_pais FROM tpais WHERE fecha_desactivacion IS NULL ORDER BY nombre_pais ASC";
                  $query = $mysql->Ejecutar($sql);
                  while ($row = $mysql->Respuesta($query)){
                    echo "<option value='".$row['cod_pais']."'>".$row['nombre_pais']."</option>";
                  }
              ?>
            </select>
          </label>
        </td>
        <td class="temp"><div align="right"><strong>Años de Residencia:</strong></div></td>
        <td class="temp">
          <label>
            <input title="Ingrese los años de residencia" name="aniosresidencia" type="text" id="aniosresidencia" onKeyPress="return isNumberKey(event)" />
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Teléfono Fijo:</strong></div></td>
        <td>
          <label>
            <input required name="tlf_fijo" type="text" id="tlf_fijo" maxlength=11 title="Ingrese su n&uacute;mero de habitaci&oacute;n" onKeyPress="return isNumberKey(event)" />
          </label>
        </td>
        <td><div align="right"><strong>Teléfono M&oacute;vil:</strong></div></td>
        <td>
          <label>
            <input name="tlf_movil" type="text" id="tlf_movil" maxlength=11 title="Ingrese su n&uacute;mero de celular" onKeyPress="return isNumberKey(event)" />
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Fecha Nacimiento:</strong></div></td>
        <td>
          <label>
            <input required title="Seleccione su fecha de nacimiento" name="fecha" readonly="1" type="text"  id="fecha" size="10" maxlength="10"/>
          </label>
        </td>
        <td><div align="right"><strong>Correo:</strong></div></td>
        <td>
          <label>
            <input required title="Ingrese su direcci&oacute;n de correo electr&oacute;nico" name="email" type="text" id="email" onKeyUp="this.value=this.value.toUpperCase()" />
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>¿Trabaja?</strong></div></td>
        <td>
          <label>
            <select required name="trabaja" id="trabaja" title="Indiqu&eacute; si trabaja">
              <option value='0' selected>Seleccione</option>
              <option value='S'>SI</option>
              <option value='N'>NO</option>
            </select>
          </label>
        </td>
        <td class="tmp"><div align="right"><strong>¿D&oacute;nde Trabaja?</strong></div></td>
        <td class="tmp">
          <label>
            <input title="Ingrese el lugar de su trabajo" name="dondetrabaja" type="text" id="dondetrabaja" onKeyUp="this.value=this.value.toUpperCase()" />
          </label>
        </td>
      </tr>
      <tr>
        <td class="tmp"><div align="right"><strong>Teléfono Trabajo:</strong></div></td>
        <td class="tmp">
          <label>
            <input name="tlf_trabajo" type="text" id="tlf_trabajo" maxlength=11 title="Ingrese su n&uacute;mero de celular" onKeyPress="return isNumberKey(event)" />
          </label>
        </td>
        <td class="tmp"><div align="right"><strong>Direcci&oacute;n de Trabajo:</strong></div></td>
        <td class="tmp">
          <label>
            <textarea title="Ingrese la direcci&oacute;n de trabajo" name="direcciontrabajo" id="direcciontrabajo" onKeyUp="this.value=this.value.toUpperCase()" required></textarea>
          </label>
        </td>
      </tr>
      <tr>
        <td class="tmp"><div align="right"><strong>Cargo:</strong></div></td>
        <td class="tmp">
          <label>
            <input title="Ingrese el cargo que ocupa en su trabajo" name="cargo" type="text" id="cargo" onKeyUp="this.value=this.value.toUpperCase()" />
          </label>
        </td>
        <td class="tmp"><div align="right"><strong>Antigüedad:</strong></div></td>
        <td class="tmp">
          <label>
            <input title="Ingrese la antigüedad en su trabajo" name="antiguedad" type="text" id="antiguedad" onKeyUp="this.value=this.value.toUpperCase()" />
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>¿Posee alguna Discapacidad?</strong></div></td>
        <td>
          <label>
            <input title="Seleccione una discapacidad" name="discapacidad_visual" type="checkbox" id="discapacidad_visual" /> Visual 
            <input title="Seleccione una discapacidad" name="discapacidad_auditiva" type="checkbox" id="discapacidad_auditiva" /> Auditiva 
            
            <input title="Seleccione una discapacidad" name="discapacidad_motora" type="checkbox" id="discapacidad_motora" /> Motora 
            <input title="Seleccione una discapacidad" name="discapacidad_verbal" type="checkbox" id="discapacidad_verbal" /> Verbal 
          </label>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
    <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong><br /><br />
      <p>
        <label>
          <input type="hidden" name="operacion" value="" id="operacion_tab1" />
          <input name="cmdRegistrar" type="button" id="cmdForm1" class="btn btn-large" value="Guardar" />
        </label>
      </p>
  </form>
</div>