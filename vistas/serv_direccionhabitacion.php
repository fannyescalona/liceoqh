<?php
  if(isset($_SESSION['datos'])){
    $pais_residencia=$_SESSION['datos']['pais_residencia'];
    $cedula_estudiante=$_SESSION['datos']['cedula_estudiante'];
  }
  echo "<input type='hidden' id='cedula' value='".$cedula_estudiante."' />";
?>
<div class="form_externo" >
  <form id="form2" name="form" method="POST" action="../controladores/cont_inscripcion.php">
    <table width="80%" border="0">
      <tr align="center"><th colspan=4><div class="encabezado_tabla">DIRECCIÓN DE HABITACIÓN<br/><br/></div></th></tr>
      <tr>
        <?php
          require_once('../clases/class_bd.php');
          $con = new Conexion();
          $sql="SELECT CONCAT((CASE pa.nombre_pais WHEN 'VENEZUELA' THEN 'V-' ELSE 'E-' END),p.cedula) vcedula, p.cedula, 
          CONCAT(p.nombres,' ',p.apellidos) nomape,p.direccion,pi.direccion_temp,pi.etnia,
          e.cod_estado,est.cod_estado estado_temp,c.cod_ciudad,ciu.cod_ciudad ciudad_temp,m.cod_municipio,mun.cod_municipio municipio_temp,
          par.cod_parroquia,pi.parroquia_temp
          FROM tpersonas p 
          LEFT JOIN tparroquia par ON p.cod_parroquia=par.cod_parroquia 
          LEFT JOIN tmunicipio m ON par.cod_municipio = m.cod_municipio 
          LEFT JOIN tciudad c ON m.cod_ciudad = c.cod_ciudad 
          LEFT JOIN testado e ON c.cod_estado = e.cod_estado 
          LEFT JOIN tpais pa ON e.cod_pais = pa.cod_pais 
          LEFT JOIN tpre_inscripcion pi ON p.cedula = pi.cedula 
          LEFT JOIN tparroquia parroq ON pi.parroquia_temp=parroq.cod_parroquia 
          LEFT JOIN tmunicipio mun ON parroq.cod_municipio = mun.cod_municipio 
          LEFT JOIN tciudad ciu ON mun.cod_ciudad = ciu.cod_ciudad 
          LEFT JOIN testado est ON ciu.cod_estado = est.cod_estado 
          WHERE p.cedula = '$cedula_estudiante'";
          $query = $con->Ejecutar($sql);
          while($row = $con->Respuesta($query)){
          ?>
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
        <td><div align="right"><strong>Estado:</strong></div></td>
        <td>
          <label>
            <select required name='estado_residencia' id='estado_residencia' class='select' title="Seleccione su estado de residencia" required />
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
            <input type="hidden" id="lvl6" name="lvl6" value="<?= $row['cod_ciudad'];?>"/>
            <select required name='ciudad_residencia' id='ciudad_residencia' class='select' title="Seleccione su ciudad de residencia" required />
            </select>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Municipio:</strong></div></td>
        <td>
          <label>
            <input type="hidden" id="lvl7" name="lvl7" value="<?= $row['cod_municipio'];?>"/>
            <select required name='municipio_residencia' id='municipio_residencia' class='select' title="Seleccione su municipio de residencia" required />
            </select>
          </label>
        </td>
        <td><div align="right"><strong>Parroquia:</strong></div></td>
        <td>
          <label>
            <input type="hidden" id="lvl8" name="lvl8" value="<?= $row['cod_parroquia'];?>"/>
            <select required name='parroquia_residencia' id='parroquia_residencia' class='select' title="Seleccione su parroquia de residencia" required />
            </select>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Dirección:</strong></div></td>
        <td>
          <label>
            <textarea title="Ingrese su dirección de residencia" name="direccionresidencia" id="direccionresidencia" 
            onKeyUp="this.value=this.value.toUpperCase()" required /><?= $row['direccion'];?></textarea>
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
                  require_once("../clases/class_bd.php");
                  $mysql=new Conexion();
                  $sql = "SELECT cod_estado,nombre_estado FROM testado WHERE cod_pais = '$pais_residencia' AND fecha_desactivacion IS NULL ORDER BY nombre_estado ASC";
                  $query = $mysql->Ejecutar($sql);
                  while ($rows = $mysql->Respuesta($query)){
                    if($rows['cod_estado']==$row['estado_temp'])
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
            <input type="hidden" id="lvl10" name="lvl10" value="<?= $row['ciudad_temp'];?>"/>
            <select required name='ciudad_temp' id='ciudad_temp' class='select' title="Seleccione su ciudad de residencia temporal">
            </select>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Municipio:</strong></div></td>
        <td>
          <label>
            <input type="hidden" id="lvl11" name="lvl11" value="<?= $row['municipio_temp'];?>"/>
            <select required name='municipio_temp' id='municipio_temp' class='select' title="Seleccione su municipio de residencia temporal">
            </select>
          </label>
        </td>
        <td><div align="right"><strong>Parroquia:</strong></div></td>
        <td>
          <label>
            <input type="hidden" id="lvl12" name="lvl12" value="<?= $row['parroquia_temp'];?>"/>
            <select required name='parroquia_temp' id='parroquia_temp' class='select' title="Seleccione su parroquia de residencia temporal">
            </select>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Dirección:</strong></div></td>
        <td>
          <label>
            <textarea title="Ingrese su dirección de residencia" name="direccion_temp" id="direccion_temp" 
            onKeyUp="this.value=this.value.toUpperCase()" /><?= $row['direccion_temp'];?></textarea>
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
              <option value='ACAHUAYO' <? if($row['etnia']=="ACAHUAYO"){echo "selected";}?> >ACAHUAYO</option>
              <option value='ARAHUAC DEL DELTA AMACURO' <? if($row['etnia']=="ARAHUAC DEL DELTA AMACURO"){echo "selected";}?> >ARAHUAC DEL DELTA AMACURO</option>
              <option value='ARAHUAC DEL RÍO NEGRO' <? if($row['etnia']=="ARAHUAC DEL RÍO NEGRO"){echo "selected";}?> >ARAHUAC DEL RÍO NEGRO</option>
              <option value='ARUTANI' <? if($row['etnia']=="ARUTANI"){echo "selected";}?> >ARUTANI</option>
              <option value='BARI' <? if($row['etnia']=="BARI"){echo "selected";}?> >BARI</option>
              <option value='CARIÑA' <? if($row['etnia']=="CARIÑA"){echo "selected";}?> >CARIÑA</option>
              <option value='GUAJIBO' <? if($row['etnia']=="GUAJIBO"){echo "selected";}?> >GUAJIBO</option>
              <option value='GUAJIRO' <? if($row['etnia']=="GUAJIRO"){echo "selected";}?> >GUAJIRO</option>
              <option value='GUARAO O WARAO' <? if($row['etnia']=="GUARAO O WARAO"){echo "selected";}?> >GUARAO O WARAO</option>
              <option value='GUAYQUERI' <? if($row['etnia']=="GUAYQUERI"){echo "selected";}?> >GUAYQUERI</option>
              <option value='MAPOYO O YAHUANA' <? if($row['etnia']=="MAPOYO O YAHUANA"){echo "selected";}?> >MAPOYO O YAHUANA</option>
              <option value='MAQUIRITARE' <? if($row['etnia']=="MAQUIRITARE"){echo "selected";}?> >MAQUIRITARE</option>
              <option value='PANARE' <? if($row['etnia']=="PANARE"){echo "selected";}?> >PANARE</option>
              <option value='PUINABE' <? if($row['etnia']=="PUINABE"){echo "selected";}?> >PUINABE</option>
              <option value='PARAUJANO' <? if($row['etnia']=="PARAUJANO"){echo "selected";}?> >PARAUJANO</option>
              <option value='PEMÓN' <? if($row['etnia']=="PEMÓN"){echo "selected";}?> >PEMÓN</option>
              <option value='PIAROA' <? if($row['etnia']=="PIAROA"){echo "selected";}?> >PIAROA</option>
              <option value='SAPE' <? if($row['etnia']=="SAPE"){echo "selected";}?> >SAPE</option>
              <option value='YANOMAMI' <? if($row['etnia']=="YANOMAMI"){echo "selected";}?> >YARURO</option>
              <option value='YUCPA' <? if($row['etnia']=="YUCPA"){echo "selected";}?> >YUCPA</option>
            </select>
          </label>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
        <?php
          }
        ?>
    </table>
      <p>
        <label>
          <input type="hidden" name="operacion" value="" id="operacion_tab2" />
          <input name="cmdRegistrar" type="button" id="cmdForm2" class="btn btn-large" value="Modificar" />
        </label>
      </p>
  </form>
</div>