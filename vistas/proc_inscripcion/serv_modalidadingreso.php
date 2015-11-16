<?php
  if(isset($_SESSION['datos'])){
    $cedula_estudiante=$_SESSION['datos']['cedula_estudiante'];
  }
  echo "<input type='hidden' id='cedula' value='".$cedula_estudiante."' />";
?>
<div class="form_externo" >
  <form id="form4" name="form" method="POST" action="cont_preinscripcion.php">
    <table width="80%" border="0">
      <tr align="center"><th colspan=4><div class="encabezado_tabla">ESTUDIOS A CURSAR EN LA UNIVERSIDAD DEPORTIVA DEL SUR<br/><br/></div></th></tr>
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
        <td><div align="right"><strong>Modalidad de Ingreso:</strong></div></td>
        <td>
          <label>
            <input title="Seleccione si desea ingresar por Prueba de Selección Interna" name="modalidad_ingreso" id="modalidad_ingreso" type="radio" value="1" /> Prueba de Selección Interna <br>
            <input title="Seleccione si desea ingresar por Atletas de Alta Competencia" name="modalidad_ingreso" id="modalidad_ingreso" type="radio" value="2" /> Atletas de Alta Competencia  
          </label>
        </td>
        <td>
          <label>
            <input title="Seleccione si desea ingresar por Convenio Fundayacucho" name="modalidad_ingreso" id="modalidad_ingreso" type="radio" value="3"  /> Convenio Fundayacucho 
          </label>
        </td>
        <td>
          <label>
            <input title="Seleccione si desea ingresar por Asignados CNU-OPSU" name="modalidad_ingreso" id="modalidad_ingreso" type="radio" value="4" /> Asignados CNU-OPSU  <br>
            <input title="Seleccione si desea ingresar por Ninguno de los Anteriores" name="modalidad_ingreso" id="modalidad_ingreso" type="radio" value="0" checked="checked" /> Ninguno de los Anteriores 
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Modalidad de Estudio:</strong></div></td>
        <td>
          <label>
            <input title="Seleccione si desea estudiar Educación a Distancia" name="modalidad_estudio" id="modalidad_estudio1" type="radio" value="1"  /> Educación a Distancia <br>
            <input title="Seleccione si desea estudiar Especialidades Sin Maestrias" name="modalidad_estudio" id="modalidad_estudio2" type="radio" value="2" /> Especialidades Sin Maestrias <br>
            <input title="Seleccione si desea estudiar Presencial" name="modalidad_estudio" id="modalidad_estudio3" type="radio" value="0" checked="checked" /> Presencial 
          </label>
        </td>
        <td class="temp1"><div align="right"><strong>Atleta:</strong></div></td>
        <td class="temp1">
          <label>
            <input title="Seleccione si es atleta activo" name="esatleta" id="esatleta1" type="radio" value="1"  /> Activo
            <input title="Seleccione si es atleta inactivo" name="esatleta" id="esatleta2" type="radio" value="0" checked="checked" /> Inactivo 
          </label>
        </td>
      </tr>
      <tr>
        <td class="temp2"><div align="right"><strong>Tipo de Atleta:</strong></div></td>
        <td class="temp2">
          <label>
            <input title="Seleccione si es tipo de atleta por federación" name="tipo_atleta" id="tipo_atleta" type="radio" value="FEDERACION" checked="checked" /> Federación
            <input title="Seleccione si es tipo de atleta por asociación" name="tipo_atleta" id="tipo_atleta" type="radio" value="ASOCIACIÓN" /> Asociación 
          </label>
        </td>
        <td class="temp2"><div align="right"><strong>Disciplina:</strong></div></td>
        <td class="temp2">
          <label>
            <input title="Ingrese la disciplina que practica" name="disciplina" id="disciplina" type="text" onKeyUp="this.value=this.value.toUpperCase()" />
          </label>
        </td>
      </tr>
      <tr>
        <td class="temp2"><div align="right"><strong>Entrenador:</strong></div></td>
        <td class="temp2">
          <label>
            <input title="Ingrese el entrenador" name="entrenador" id="entrenador" type="text" onKeyUp="this.value=this.value.toUpperCase()" />
          </label>
        </td>
        <td class="temp2"><div align="right"><strong>Institución:</strong></div></td>
        <td class="temp2">
          <label>
            <input title="Ingrese la institucion" name="institucion" id="institucion" type="text" onKeyUp="this.value=this.value.toUpperCase()" />
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>¿Posee un título universitario?</strong></div></td>
        <td>
          <label>
            <input title="Seleccione si posee algún título" name="posee_titulo" id="posee_titulo1" type="radio" value="S" /> SI
            <input title="Seleccione si no posee título" name="posee_titulo" id="posee_titulo2" type="radio" value="N" checked="checked" /> NO 
          </label>
        </td>
        <td class="temp3"><div align="right"><strong>Título:</strong></div></td>
        <td class="temp3">
          <label>
            <input name='titulo' id='titulo' type="text" title="Ingrese el título que posee" onKeyUp="this.value=this.value.toUpperCase()" />
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Turno:</strong></div></td>
        <td>
          <label>
            <input title="Seleccione si desea estudiar en el turno de la Mañana" name="turno" id="turno" type="radio" value="M" checked="checked" /> MAÑANA
            <input title="Seleccione si desea estudiar en el turno de la Tarde" name="turno" id="turno" type="radio" value="T" /> TARDE 
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Sede:</strong></div></td>
        <td>
          <select name='rif_universidad' id='rif_universidad' class='select' title="Seleccione una sede" required />
            <option value='0'>Seleccione una sede</option>
            <?php
              require_once("../../clases/class_bd.php");
              $mysql=new Conexion();
              $sql = "SELECT rif,nombre_corto FROM tuniversidad";
              $query = $mysql->Ejecutar($sql);
              while ($row = $mysql->Respuesta($query)){
                echo "<option value='".$row['rif']."'>".$row['nombre_corto']."</option>";
              }
            ?>
          </select>
        </td>
        <td><div align="right"><strong>Programa de Formación:</strong></div></td>
        <td>
          <select name='cod_carrera' id='cod_carrera' class='select' title="Seleccione una carrera" required />
            <option value='0'>Seleccione una carrera</option>
            <?php
              require_once("../../clases/class_bd.php");
              $mysql=new Conexion();
              $sql = "SELECT cod_carrera,nombre_carrera FROM tcarrera";
              $query = $mysql->Ejecutar($sql);
              while ($row = $mysql->Respuesta($query)){
                echo "<option value='".$row['cod_carrera']."'>".$row['nombre_carrera']."</option>";
              }
            ?>
          </select>
        </td>
      </tr>
    </table>
    <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong><br /><br />
      <p>
        <label>
          <input type="hidden" name="operacion" value="" id="operacion_tab4" />
          <input name="cmdRegistrar" type="button" id="cmdForm4" class="btn btn-large" value="Guardar" />
        </label>
      </p>
  </form>
</div>