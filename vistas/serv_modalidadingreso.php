<?php
  if(isset($_SESSION['datos'])){
    $cedula_estudiante=$_SESSION['datos']['cedula_estudiante'];
  }
  echo "<input type='hidden' id='cedula' value='".$cedula_estudiante."' />";
?>
<div class="form_externo" >
  <form id="form4" name="form" method="POST" action="../controladores/cont_inscripcion.php">
    <table width="80%" border="0">
      <?php
        require_once('../clases/class_bd.php');
        $con = new Conexion();
        $sql="SELECT CONCAT((CASE pa.nombre_pais WHEN 'VENEZUELA' THEN 'V-' ELSE 'E-' END),p.cedula) vcedula,p.cedula, 
        CONCAT(p.nombres,' ',p.apellidos) nomape,pi.modalidad_ingreso,pi.modalidad_estudio,pi.esatleta,pi.tipo_atleta,
        pi.disciplina,pi.entrenador,pi.institucion,pi.rif_universidad,pi.turno,pi.posee_titulo,pi.titulo,i.cod_carrera,
        isec.seccion 
        FROM tpersonas p 
        INNER JOIN tpais pa ON p.nacionalidad = pa.cod_pais 
        INNER JOIN tpre_inscripcion pi ON p.cedula = pi.cedula 
        LEFT JOIN tproceso_inscripcion i ON i.cod_preinscripcion = pi.cod_preinscripcion 
        LEFT JOIN tpersonales per ON p.cedula = per.cedula 
        LEFT JOIN tinscrito_seccion isec ON per.cod_personal = isec.cod_personal 
        WHERE p.cedula = '$cedula_estudiante'";
        $query = $mysql->Ejecutar($sql);
        while($row = $mysql->Respuesta($query)){
      ?>
      <tr align="center"><th colspan=4><div class="encabezado_tabla">ESTUDIOS A CURSAR EN LA UNIVERSIDAD DEPORTIVA DEL SUR<br/><br/></div></th></tr>
      <tr>
        <td><div align='right'><strong>Cédula:</strong></div></td>
        <td>
          <label>
            <input name='cedula_estudiante' type='hidden' id='cedula_estudiante' value='<?= $row['cedula'];?>' />
            <input readonly title='Cédula' name='cedula' type='text' id='cedula' value='<?= $row['vcedula'];?>' />
          </label>
        </td>
        <td><div align='right'><strong>Nombres y Apellidos:</strong></div></td>
        <td>
          <label>
            <input readonly title='Cédula' name='nombre_estudiante' type='text' id='nombre_estudiante' value='<?= $row['nomape'];?>' />
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Modalidad de Ingreso:</strong></div></td>
        <td>
          <label>
            <input title="Seleccione si desea ingresar por Prueba de Selección Interna" name="modalidad_ingreso" 
            id="modalidad_ingreso" type="radio" value="1" <? if($row['modalidad_ingreso']=="1"){ echo "checked='checked'"; } ?> /> Prueba de Selección Interna <br>
            <input title="Seleccione si desea ingresar por Atletas de Alta Competencia" name="modalidad_ingreso" 
            id="modalidad_ingreso" type="radio" value="2" <? if($row['modalidad_ingreso']=="2"){ echo "checked='checked'"; } ?> /> Atletas de Alta Competencia  
          </label>
        </td>
        <td>
          <label>
            <input title="Seleccione si desea ingresar por Convenio Fundayacucho" name="modalidad_ingreso" 
            id="modalidad_ingreso" type="radio" value="3" <? if($row['modalidad_ingreso']=="3"){ echo "checked='checked'"; } ?> /> Convenio Fundayacucho 
          </label>
        </td>
        <td>
          <label>
            <input title="Seleccione si desea ingresar por Asignados CNU-OPSU" name="modalidad_ingreso" id="modalidad_ingreso" 
            type="radio" value="4" <? if($row['modalidad_ingreso']=="4"){ echo "checked='checked'"; } ?> /> Asignados CNU-OPSU  <br>
            <input title="Seleccione si desea ingresar por Ninguno de los Anteriores" name="modalidad_ingreso" 
            id="modalidad_ingreso" type="radio" value="0" <? if($row['modalidad_ingreso']=="0"){ echo "checked='checked'"; }else if(!isset($row['modalidad_ingreso'])){ echo "checked='checked'"; } ?> /> Ninguno de los Anteriores 
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Modalidad de Estudio:</strong></div></td>
        <td>
          <label>
            <input title="Seleccione si desea estudiar Educación a Distancia" name="modalidad_estudio" id="modalidad_estudio1" 
            type="radio" value="1" <? if($row['modalidad_estudio']=="1"){ echo "checked='checked'"; } ?> /> Educación a Distancia <br>
            <input title="Seleccione si desea estudiar Especialidades Sin Maestrias" name="modalidad_estudio" 
            id="modalidad_estudio2" type="radio" value="2" <? if($row['modalidad_estudio']=="2"){ echo "checked='checked'"; } ?> /> Especialidades Sin Maestrias <br>
            <input title="Seleccione si desea estudiar Presencial" name="modalidad_estudio" id="modalidad_estudio3" type="radio" 
            value="0" <? if($row['modalidad_estudio']=="0"){ echo "checked='checked'"; }else if(!isset($row['modalidad_estudio'])){ echo "checked='checked'"; } ?> /> Presencial 
          </label>
        </td>
        <td class="temp1"><div align="right"><strong>Atleta:</strong></div></td>
        <td class="temp1">
          <label>
            <input title="Seleccione si es atleta activo" name="esatleta" id="esatleta1" type="radio" value="1" <? if($row['esatleta']=="1"){ echo "checked='checked'"; }?> /> Activo
            <input title="Seleccione si es atleta inactivo" name="esatleta" id="esatleta2" type="radio" value="0" <? if($row['esatleta']=="0"){ echo "checked='checked'"; }else if(!isset($row['esatleta'])){ echo "checked='checked'"; } ?> /> Inactivo 
          </label>
        </td>
      </tr>
      <tr>
        <td class="temp2"><div align="right"><strong>Tipo de Atleta:</strong></div></td>
        <td class="temp2">
          <label>
            <input title="Seleccione si es tipo de atleta por federación" name="tipo_atleta" id="tipo_atleta" type="radio" 
            value="FEDERACION" <? if($row['tipo_atleta']=="FEDERACION"){ echo "checked='checked'"; }else if(!isset($row['tipo_atleta'])){ echo "checked='checked'"; } ?> /> Federación
            <input title="Seleccione si es tipo de atleta por asociación" name="tipo_atleta" id="tipo_atleta" type="radio" 
            value="ASOCIACIÓN" <? if($row['tipo_atleta']=="ASOCIACIÓN"){ echo "checked='checked'"; }?> /> Asociación 
          </label>
        </td>
        <td class="temp2"><div align="right"><strong>Disciplina:</strong></div></td>
        <td class="temp2">
          <label>
            <input title="Ingrese la disciplina que practica" name="disciplina" id="disciplina" type="text" 
            onKeyUp="this.value=this.value.toUpperCase()" value="<?= $row['disciplina'];?>"/>
          </label>
        </td>
      </tr>
      <tr>
        <td class="temp2"><div align="right"><strong>Entrenador:</strong></div></td>
        <td class="temp2">
          <label>
            <input title="Ingrese el entrenador" name="entrenador" id="entrenador" type="text" 
            onKeyUp="this.value=this.value.toUpperCase()" value="<?= $row['disciplina'];?>"/>
          </label>
        </td>
        <td class="temp2"><div align="right"><strong>Institución:</strong></div></td>
        <td class="temp2">
          <label>
            <input title="Ingrese la institucion" name="institucion" id="institucion" type="text" 
            onKeyUp="this.value=this.value.toUpperCase()" value="<?= $row['disciplina'];?>"/>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>¿Posee un título universitario?</strong></div></td>
        <td>
          <label>
            <input title="Seleccione si posee algún título" name="posee_titulo" id="posee_titulo1" type="radio" 
            value="S" <? if($row['posee_titulo']=="S"){ echo "checked='checked'"; }?> /> SI
            <input title="Seleccione si no posee título" name="posee_titulo" id="posee_titulo2" type="radio" 
            value="N" <? if($row['posee_titulo']=="N"){ echo "checked='checked'"; }else if(!isset($row['posee_titulo'])){ echo "checked='checked'"; } ?> /> NO 
          </label>
        </td>
        <td class="temp3"><div align="right"><strong>Título:</strong></div></td>
        <td class="temp3">
          <label>
            <input name='titulo' id='titulo' type="text" title="Ingrese el título que posee" 
            onKeyUp="this.value=this.value.toUpperCase()" value="<?= $row['titulo'];?>"/>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Turno:</strong></div></td>
        <td>
          <label>
            <input title="Seleccione si desea estudiar en el turno de la Mañana" name="turno" id="turno" type="radio" 
            value="M" <? if($row['turno']=="M"){ echo "checked='checked'"; }else if(!isset($row['turno'])){ echo "checked='checked'"; } ?> /> MAÑANA
            <input title="Seleccione si desea estudiar en el turno de la Tarde" name="turno" id="turno" type="radio" 
            value="T" <? if($row['turno']=="T"){ echo "checked='checked'"; }?> /> TARDE 
          </label>
        </td>
        <td><div align="right"><strong>Sede:</strong></div></td>
        <td>
          <select name='rif_universidad' id='rif_universidad' class='select' title="Seleccione una sede" required />
            <option value='0'>Seleccione una sede</option>
            <?php
              require_once("../clases/class_bd.php");
              $mysql=new Conexion();
              $sql = "SELECT rif,nombre_corto FROM tuniversidad";
              $query = $mysql->Ejecutar($sql);
              while ($rows = $mysql->Respuesta($query)){
                if($rows['rif']==$row['rif_universidad'])
                  echo "<option value='".$rows['rif']."' selected>".$rows['nombre_corto']."</option>";
                else
                  echo "<option value='".$rows['rif']."' >".$rows['nombre_corto']."</option>";
              }
            ?>
          </select>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Programa de Formación:</strong></div></td>
        <td>
          <select name='cod_carrera' id='cod_carrera' class='select' title="Seleccione una carrera" required />
            <option value='0'>Seleccione una carrera</option>
            <?php
              require_once("../clases/class_bd.php");
              $mysql=new Conexion();
              $sql = "SELECT cod_carrera,nombre_carrera FROM tcarrera";
              $query = $mysql->Ejecutar($sql);
              while ($rows = $mysql->Respuesta($query)){
                if($rows['cod_carrera']==$row['cod_carrera'])
                  echo "<option value='".$rows['cod_carrera']."' selected>".$rows['nombre_carrera']."</option>";
                else
                  echo "<option value='".$rows['cod_carrera']."'>".$rows['nombre_carrera']."</option>";
              }
            ?>
          </select>
        </td>
        <td><div align="right"><strong>Sección:</strong></div></td>
        <td>
          <label>
            <input type="hidden" id="lvl13" name="lvl13" value="<?= $row['seccion'];?>"/>
            <select required name='seccion' id='seccion' class='select' title="Seleccione una sección" required />
            </select>
          </label>
        </td>
      </tr>
        <?php
          }
        ?>
    </table>
      <p>
        <label>
          <input type="hidden" name="operacion" value="" id="operacion_tab4" />
          <input name="cmdRegistrar" type="button" id="cmdForm4" class="btn btn-large" value="Modificar" />
        </label>
      </p>
  </form>
</div>