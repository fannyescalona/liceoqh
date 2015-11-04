<?php
  if(isset($_SESSION['datos'])){
    $pais_residencia=$_SESSION['datos']['pais_residencia'];
    $cedula_estudiante=$_SESSION['datos']['cedula_estudiante'];
  }
  echo "<input type='hidden' id='cedula' value='".$cedula_estudiante."' />";
?>
<div class="form_externo" >
  <form id="form3" name="form" method="POST" action="../controladores/cont_inscripcion.php">
    <table width="80%" border="0">
      <?php
        require_once('../clases/class_bd.php');
        $con = new Conexion();
        $sql="SELECT CONCAT((CASE pa.nombre_pais WHEN 'VENEZUELA' THEN 'V-' ELSE 'E-' END),p.cedula) vcedula,p.cedula, 
        CONCAT(p.nombres,' ',p.apellidos) nomape,pi.plantel_edu,e.cod_estado,pi.ciudad_plantel,pi.anio_egreso,
        pi.dependencia_plantel,pi.sistema_plantel,pi.rama_plantel,pi.prueba_act_acad,pi.anio_paa,pi.nro_rusnieu,
        pi.anio_rusnieu 
        FROM tpersonas p 
        INNER JOIN tpre_inscripcion pi ON p.cedula=pi.cedula 
        LEFT JOIN tproceso_inscripcion i ON pi.cod_preinscripcion = i.cod_preinscripcion 
        LEFT JOIN tciudad c ON pi.ciudad_plantel = c.cod_ciudad 
        LEFT JOIN testado e ON c.cod_estado = e.cod_estado 
        INNER JOIN tpais pa ON p.nacionalidad = pa.cod_pais 
        WHERE p.cedula =  '$cedula_estudiante'";
        $query = $mysql->Ejecutar($sql);
        while($row = $mysql->Respuesta($query)){
        ?>
      <tr align="center"><th colspan=4><div class="encabezado_tabla">PLANTEL DONDE CURSO EL ÚLTIMO AÑO DE EDUCACIÓN MEDIA DIVERSIFICADA<br/><br/></div></th></tr>
      <tr>
        <td><div align='right'><strong>Cédula:</strong></div></td>
        <td>
          <label>
            <input name='cedula_estudiante' type='hidden' id='cedula_estudiante' value='<?=$row['cedula'];?>' />
            <input readonly title='Cédula' name='cedula' type='text' id='cedula' value='<?=$row['vcedula'];?>' />
          </label>
        </td>
        <td><div align='right'><strong>Nombres y Apellidos:</strong></div></td>
        <td>
          <label>
            <input readonly title='Cédula' name='nombre_estudiante' type='text' id='nombre_estudiante' value='<?=$row['nomape'];?>' />
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Nombre del Plantel:</strong></div></td>
        <td>
          <label>
            <input title="Ingrese el nombre del plantel donde curso el último año de E.M.D." name="plantel_edu" id="plantel_edu" 
            type="text" onKeyUp="this.value=this.value.toUpperCase()" required value='<?=$row['plantel_edu'];?>' />
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
                  require_once("../clases/class_bd.php");
                  $mysql=new Conexion();
                  $sql = "SELECT cod_estado,nombre_estado FROM testado WHERE cod_pais = '$pais_residencia' AND fecha_desactivacion IS NULL ORDER BY nombre_estado ASC";
                  $query = $mysql->Ejecutar($sql);
                  while ($rows = $mysql->Respuesta($query)){
                    if($rows['cod_estado']==$row['cod_estado'])
                      echo "<option value='".$rows['cod_estado']."' selected>".$rows['nombre_estado']."</option>";
                    else 
                      echo "<option value='".$rows['cod_estado']."'>".$rows['nombre_estado']."</option>";
                  }
              ?>
            </select>
          </label>
        </td>
        <td><div align="right"><strong>Ciudad:</strong></div></td>
        <td>
          <label>
            <input type="hidden" id="lvl2" name="lvl2" value="<?= $row['ciudad_plantel'];?>"/>
            <select required name='ciudad' id='ciudad_plantel' class='select' title="Seleccione su ciudad de residencia" required />
            </select>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Año de Egreso:</strong></div></td>
        <td>
          <label>
            <input title="Ingrese el año de egreso del plantel de E.M.D." name="anio_egreso" id="anio_egreso" type="text" 
            onKeyUp="this.value=this.value.toUpperCase()" value="<?= $row['anio_egreso'];?>"/>
          </label>
        </td>
        <td><div align="right"><strong>Dependencia del Plantel:</strong></div></td>
        <td>
          <label>
            <input title="Seleccione si el tipo de dependencia del plantel de E.M.D. era Oficial" name="dependencia_plantel" 
            id="dependencia_plantel" type="radio" value="O" checked="checked" <? if($row['dependencia_plantel']=="O"){ echo "checked='checked'"; } ?> /> Oficial
            <input title="Seleccione si el tipo de dependencia del plantel de E.M.D. era Privada" name="dependencia_plantel" 
            id="dependencia_plantel" type="radio" value="P" <? if($row['dependencia_plantel']=="P"){ echo "checked='checked'"; } ?> /> Privado
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Sistema de Estudio:</strong></div></td>
        <td>
          <label>
            <input title="Seleccione si el sistema de estudio del plantel de E.M.D. era Regular" name="sistema_plantel" 
            id="sistema_plantel" type="radio" value="R" checked="checked" <? if($row['sistema_plantel']=="R"){ echo "checked='checked'"; } ?> /> Regular 
            <input title="Seleccione si el sistema de estudio del plantel de E.M.D. era Parasistema" name="sistema_plantel" 
            id="sistema_plantel" type="radio" value="P" <? if($row['sistema_plantel']=="P"){ echo "checked='checked'"; } ?> /> Parasistema <br>
            <input title="Seleccione si el sistema de estudio del plantel de E.M.D. era Misión Ribas" name="sistema_plantel" 
            id="sistema_plantel" type="radio" value="M" <? if($row['sistema_plantel']=="M"){ echo "checked='checked'"; } ?> /> Misión Ribas
          </label>
        </td>
        <td><div align="right"><strong>Rama de Educación Media Cursada:</strong></div></td>
        <td>
          <label>
            <input title="Seleccione si la rama de E.M. era Ciencias" name="rama_plantel" id="rama_plantel" type="radio" 
            value="C" checked="checked" <? if($row['rama_plantel']=="C"){ echo "checked='checked'"; } ?> /> Ciencias
            <input title="Seleccione si la rama de E.M. era Humanidades" name="rama_plantel" id="rama_plantel" type="radio" 
            value="H" <? if($row['rama_plantel']=="H"){ echo "checked='checked'"; } ?> /> Humanidades <br>
            <input title="Seleccione si la rama de E.M. era Deportes" name="rama_plantel" id="rama_plantel" type="radio" 
            value="D" <? if($row['rama_plantel']=="D"){ echo "checked='checked'"; } ?> /> Deportes 
            <input title="Seleccione si la rama de E.M. era Técnica" name="rama_plantel" id="rama_plantel" type="radio" 
            value="T" <? if($row['rama_plantel']=="T"){ echo "checked='checked'"; } ?> /> Técnica
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Prueba de Actitud Académica:</strong></div></td>
        <td>
          <label>
            <input title="Seleccione si realizó la prueba de actitud académica" name="prueba_act_acad" id="prueba_act_acad" 
            type="radio" value="S" checked="checked" <? if($row['prueba_act_acad']=="S"){ echo "checked='checked'"; } ?> /> SI
            <input title="Seleccione si no realizó la prueba de actitud académica" name="prueba_act_acad" id="prueba_act_acad" 
            type="radio" value="N" <? if($row['prueba_act_acad']=="N"){ echo "checked='checked'"; } ?> /> NO
          </label>
        </td>
        <td><div align="right"><strong>Año:</strong></div></td>
        <td>
          <label>
            <input name='anio_paa' id='anio_paa' type="text" title="Seleccione el año que realizó la prueba" value="<?= $row['anio_paa'];?>"/>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Nro. de RUSNIEU:</strong></div></td>
        <td>
          <label>
            <input title="Ingrese el Nro. de RUSNIEU" name="nro_rusnieu" id="nro_rusnieu" onKeyPress="return isNumberKey(event)" type="text" 
            maxlength=10 value="<?= $row['nro_rusnieu'];?>"/>
          </label>
        </td>
        <td><div align="right"><strong>Año:</strong></div></td>
        <td>
          <label>
            <input name='anio_rusnieu' id='anio_rusnieu' type="text" title="Seleccione el año que recibió el nro. de RUSNIEU" value="<?= $row['anio_rusnieu'];?>"/>
          </label>
        </td>
      </tr>
        <?php
          }
        ?>
    </table>
      <p>
        <label>
          <input type="hidden" name="operacion" value="" id="operacion_tab3" />
          <input name="cmdRegistrar" type="button" id="cmdForm3" class="btn btn-large" value="Modificar" />
        </label>
      </p>
  </form>
</div>