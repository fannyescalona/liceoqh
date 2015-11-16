<?php
  if(isset($_SESSION['datos'])){
    $pais_residencia=$_SESSION['datos']['pais_residencia'];
    $cedula_estudiante=$_SESSION['datos']['cedula_estudiante'];
  }
  echo "<input type='hidden' id='cedula' value='".$cedula_estudiante."' />";
?>
<div class="form_externo" >
  <form id="form3" name="form" method="POST" action="cont_preinscripcion.php">
    <table width="80%" border="0">
      <tr align="center"><th colspan=4><div class="encabezado_tabla">PLANTEL DONDE CURSO EL ÚLTIMO AÑO DE EDUCACIÓN MEDIA DIVERSIFICADA<br/><br/></div></th></tr>
      <tr>
        <?php
          require_once('../../clases/class_bd.php');
          $con = new Conexion();
          $sql="SELECT CONCAT((CASE pa.nombre_pais WHEN 'VENEZUELA' THEN 'V-' ELSE 'E-' END),p.cedula) vcedula,p.cedula, 
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
        <td><div align="right"><strong>Nombre del Plantel:</strong></div></td>
        <td>
          <label>
            <input title="Ingrese el nombre del plantel donde curso el último año de E.M.D." name="plantel_edu" id="plantel_edu"  type="text" onKeyUp="this.value=this.value.toUpperCase()" required />
          </label>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><div align="right"><strong>Estado:</strong></div></td>
        <td>
          <label>
            <select name='estado' id='estado_plantel' class='select' title="Seleccione su estado de residencia" required />
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
            <select required name='ciudad' id='ciudad_plantel' class='select' title="Seleccione su ciudad de residencia" required />
            </select>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Año de Egreso:</strong></div></td>
        <td>
          <label>
            <input title="Ingrese el año de egreso del plantel de E.M.D." name="anio_egreso" id="anio_egreso" type="text" onKeyUp="this.value=this.value.toUpperCase()" />
          </label>
        </td>
        <td><div align="right"><strong>Dependencia del Plantel:</strong></div></td>
        <td>
          <label>
            <input title="Seleccione si el tipo de dependencia del plantel de E.M.D. era Oficial" name="dependencia_plantel" id="dependencia_plantel" type="radio" value="O" checked="checked" /> Oficial
            <input title="Seleccione si el tipo de dependencia del plantel de E.M.D. era Privada" name="dependencia_plantel" id="dependencia_plantel" type="radio" value="P" /> Privado
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Sistema de Estudio:</strong></div></td>
        <td>
          <label>
            <input title="Seleccione si el sistema de estudio del plantel de E.M.D. era Regular" name="sistema_plantel" id="sistema_plantel" type="radio" value="R" checked="checked" /> Regular 
            <input title="Seleccione si el sistema de estudio del plantel de E.M.D. era Parasistema" name="sistema_plantel" id="sistema_plantel" type="radio" value="P" /> Parasistema <br>
            <input title="Seleccione si el sistema de estudio del plantel de E.M.D. era Misión Ribas" name="sistema_plantel" id="sistema_plantel" type="radio" value="P" /> Misión Ribas
          </label>
        </td>
        <td><div align="right"><strong>Rama de Educación Media Cursada:</strong></div></td>
        <td>
          <label>
            <input title="Seleccione si la rama de E.M. era Ciencias" name="rama_plantel" id="rama_plantel" type="radio" value="C" checked="checked" /> Ciencias
            <input title="Seleccione si la rama de E.M. era Humanidades" name="rama_plantel" id="rama_plantel" type="radio" value="H" /> Humanidades <br>
            <input title="Seleccione si la rama de E.M. era Deportes" name="rama_plantel" id="rama_plantel" type="radio" value="D" /> Deportes 
            <input title="Seleccione si la rama de E.M. era Técnica" name="rama_plantel" id="rama_plantel" type="radio" value="T" /> Técnica
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Prueba de Actitud Académica:</strong></div></td>
        <td>
          <label>
            <input title="Seleccione si realizó la prueba de actitud académica" name="prueba_act_acad" id="prueba_act_acad" type="radio" value="S"  /> SI
            <input title="Seleccione si no realizó la prueba de actitud académica" name="prueba_act_acad" id="prueba_act_acad" type="radio" value="N" checked="checked" /> NO
          </label>
        </td>
        <td><div align="right"><strong>Año:</strong></div></td>
        <td>
          <label>
            <input name='anio_paa' id='anio_paa' type="text" title="Seleccione el año que realizó la prueba" />
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Nro. de RUSNIEU:</strong></div></td>
        <td>
          <label>
            <input title="Ingrese el Nro. de RUSNIEU" name="nro_rusnieu" id="nro_rusnieu" onKeyPress="return isNumberKey(event)" type="text" maxlength=10 />
          </label>
        </td>
        <td><div align="right"><strong>Año:</strong></div></td>
        <td>
          <label>
            <input name='anio_rusnieu' id='anio_rusnieu' type="text" title="Seleccione el año que recibió el nro. de RUSNIEU" />
          </label>
        </td>
      </tr>
    </table>
    <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong><br /><br />
      <p>
        <label>
          <input type="hidden" name="operacion" value="" id="operacion_tab3" />
          <input name="cmdRegistrar" type="button" id="cmdForm3" class="btn btn-large" value="Guardar" />
        </label>
      </p>
  </form>
</div>