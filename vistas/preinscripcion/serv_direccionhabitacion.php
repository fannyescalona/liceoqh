<?php
  if(isset($_SESSION['datos'])){
    $pais_residencia=$_SESSION['datos']['pais_residencia'];
    $cedula_estudiante=$_SESSION['datos']['cedula_estudiante'];
  }
  echo "<input type='hidden' id='cedula' value='".$cedula_estudiante."' />";
?>
<div class="form_externo" >
  <form id="form2" name="form" method="POST" action="cont_preinscripcion.php">
    <table width="80%" border="0">
      <tr align="center"><th colspan=4><div class="encabezado_tabla">DIRECCIÓN DE HABITACIÓN<br/><br/></div></th></tr>
      <tr>
        <?php
          require_once('../../clases/class_bd.php');
          $con = new Conexion();
          $sql="SELECT CONCAT((CASE pa.nombre_pais WHEN 'VENEZUELA' THEN 'V-' ELSE 'E-' END),p.cedula) vcedula, p.cedula, 
          CONCAT(p.nombres,' ',p.apellidos) nomape FROM tpersonas p INNER JOIN tpais pa ON p.nacionalidad = pa.cod_pais 
          WHERE p.cedula = '$cedula_estudiante'";
          $query = $mysql->Ejecutar($sql);
          while($row = $mysql->Respuesta($query)){
            echo "<td><div align='right'><strong>Cédula:</strong></div></td>";
            echo "<td>
              <label>
                <input name='cedula_estudiante' type='hidden' id='cedula_estudiante' value='".$row['cedula']."' />
                <input readonly title='Cédula' name='cedula' type='text' id='cedula' value='".$row['vcedula']."' />
              </label>
            </td>";
            echo "<td><div align='right'><strong>Nombres y Apellidos:</strong></div></td>";
            echo "<td>
              <label>
                <input readonly title='Cédula' name='nombre_estudiante' type='text' id='nombre_estudiante' value='".$row['nomape']."' />
              </label>
            </td>";
          }
        ?>
      </tr>
      <tr>
        <td><div align="right"><strong>Estado:</strong></div></td>
        <td>
          <label>
            <select required name='estado' id='estado_residencia' class='select' title="Seleccione su estado de residencia" required />
              <option value='0'>Seleccione</option>
              <?php
                  require_once("../../clases/class_bd.php");
                  $mysql=new Conexion();
                  $sql = "SELECT cod_estado,nombre_estado FROM testado WHERE cod_pais = '$pais_residencia' AND fecha_desactivacion IS NULL ORDER BY nombre_estado ASC";
                  $query = $mysql->Ejecutar($sql);
                  while ($row = $mysql->Respuesta($query)){
                    echo "<option value='".$row['cod_estado']."'>".$row['nombre_estado']."</option>";
                  }
              ?>
            </select>
          </label>
        </td>
        <td><div align="right"><strong>Ciudad:</strong></div></td>
        <td>
          <label>
            <select required name='ciudad' id='ciudad_residencia' class='select' title="Seleccione su ciudad de residencia" required />
            </select>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Municipio:</strong></div></td>
        <td>
          <label>
            <select required name='municipio' id='municipio_residencia' class='select' title="Seleccione su municipio de residencia" required />
            </select>
          </label>
        </td>
        <td><div align="right"><strong>Parroquia:</strong></div></td>
        <td>
          <label>
            <select required name='parroquia' id='parroquia_residencia' class='select' title="Seleccione su parroquia de residencia" required />
            </select>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Dirección:</strong></div></td>
        <td>
          <label>
            <textarea title="Ingrese su dirección de residencia" name="direccionresidencia" id="direccionresidencia" onKeyUp="this.value=this.value.toUpperCase()" required/></textarea>
          </label>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr align="center"><th colspan=4><div class="encabezado_tabla">DIRECCIÓN MIENTRAS CURSARÁ ESTUDIOS<br/><br/></div></th></tr>
      <tr>
        <td><div align="right"><strong>Estado:</strong></div></td>
        <td>
          <label>
            <select required name='estado_temp' id='estado_temp' class='select' title="Seleccione su estado de residencia temporal">
              <option value='0'>Seleccione</option>
              <?php
                  require_once("../../clases/class_bd.php");
                  $mysql=new Conexion();
                  $sql = "SELECT cod_estado,nombre_estado FROM testado WHERE cod_pais = '$pais_residencia' AND fecha_desactivacion IS NULL ORDER BY nombre_estado ASC";
                  $query = $mysql->Ejecutar($sql);
                  while ($row = $mysql->Respuesta($query)){
                    echo "<option value='".$row['cod_estado']."'>".$row['nombre_estado']."</option>";
                  }
              ?>
            </select>
          </label>
        </td>
        <td><div align="right"><strong>Ciudad:</strong></div></td>
        <td>
          <label>
            <select required name='ciudad_temp' id='ciudad_temp' class='select' title="Seleccione su ciudad de residencia temporal">
            </select>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Municipio:</strong></div></td>
        <td>
          <label>
            <select required name='municipio_temp' id='municipio_temp' class='select' title="Seleccione su municipio de residencia temporal">
            </select>
          </label>
        </td>
        <td><div align="right"><strong>Parroquia:</strong></div></td>
        <td>
          <label>
            <select required name='parroquia_temp' id='parroquia_temp' class='select' title="Seleccione su parroquia de residencia temporal">
            </select>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Dirección:</strong></div></td>
        <td>
          <label>
            <textarea title="Ingrese su dirección de residencia" name="direccion_temp" id="direccion_temp" onKeyUp="this.value=this.value.toUpperCase()" /></textarea>
          </label>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><div align="right"><strong>Etnia Indígena:</strong></div></td>
        <td>
          <label>
            <select title="Seleccione una etnia indígena" name="etnia" id="etnia">
              <option value=''>Seleccione una etnia indígena</option>
              <option value='ACAHUAYO'>ACAHUAYO</option>
              <option value='ARAHUAC DEL DELTA AMACURO'>ARAHUAC DEL DELTA AMACURO</option>
              <option value='ARAHUAC DEL RÍO NEGRO'>ARAHUAC DEL RÍO NEGRO</option>
              <option value='ARUTANI'>ARUTANI</option>
              <option value='BARI'>BARI</option>
              <option value='CARIÑA'>CARIÑA</option>
              <option value='GUAJIBO'>GUAJIBO</option>
              <option value='GUAJIRO'>GUAJIRO</option>
              <option value='GUARAO O WARAO'>GUARAO O WARAO</option>
              <option value='GUAYQUERI'>GUAYQUERI</option>
              <option value='MAPOYO O YAHUANA'>MAPOYO O YAHUANA</option>
              <option value='MAQUIRITARE'>MAQUIRITARE</option>
              <option value='PANARE'>PANARE</option>
              <option value='PUINABE'>PUINABE</option>
              <option value='PARAUJANO'>PARAUJANO</option>
              <option value='PEMÓN'>PEMÓN</option>
              <option value='PIAROA'>PIAROA</option>
              <option value='SAPE'>SAPE</option>
              <option value='YANOMAMI'>YARURO</option>
              <option value='YUCPA'>YUCPA</option>
            </select>
          </label>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
    <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong><br /><br />
      <p>
        <label>
          <input type="hidden" name="operacion" value="" id="operacion_tab2" />
          <input name="cmdRegistrar" type="button" id="cmdForm2" class="btn btn-large" value="Guardar" />
        </label>
      </p>
  </form>
</div>