<div class="form_externo" >
  <?php
  if(isset($_SESSION['datos']['cedula_estudiante'])){ 
    $disabledRC='disabled';
    $disabledMD='';
    $estatus=null;
  }else {
    $disabledRC='';
    $disabledMD='disabled';
  }
  $servicios='inscripcion';
  if(isset($_SESSION['datos'])){
    @$pais=$_SESSION['datos']['pais'];
    @$estado=$_SESSION['datos']['estado'];
    @$ciudad=$_SESSION['datos']['ciudad'];
    @$municipio=$_SESSION['datos']['municipio'];
    @$parroquia=$_SESSION['datos']['parroquia'];
    @$cedula_estudiante=$_SESSION['datos']['cedula_estudiante'];
    @$nombre_estudiante=$_SESSION['datos']['nombre_estudiante'];
    @$apellido_estudiante=$_SESSION['datos']['apellido_estudiante'];
    @$sexo=$_SESSION['datos']['sexo'];
    @$edocivil=$_SESSION['datos']['edocivil'];
    @$pais_residencia=$_SESSION['datos']['pais_residencia'];
    @$aniosresidencia=$_SESSION['datos']['aniosresidencia'];
    @$tlf_fijo=$_SESSION['datos']['tlf_fijo'];
    @$tlf_movil=$_SESSION['datos']['tlf_movil'];
    @$email=$_SESSION['datos']['email'];
    @$fecha_nacimiento=$_SESSION['datos']['fecha_nacimiento'];
    @$trabaja=$_SESSION['datos']['trabaja'];
    @$dondetrabaja=$_SESSION['datos']['dondetrabaja'];
    @$tlf_trabajo=$_SESSION['datos']['tlf_trabajo'];
    @$direcciontrabajo=$_SESSION['datos']['direcciontrabajo'];
    @$cargo=$_SESSION['datos']['cargo'];
    @$antiguedad=$_SESSION['datos']['antiguedad'];
    @$discapacidad_visual=$_SESSION['datos']['discapacidad_visual'];
    @$discapacidad_auditiva=$_SESSION['datos']['discapacidad_auditiva'];
    @$discapacidad_motora=$_SESSION['datos']['discapacidad_motora'];
    @$discapacidad_verbal=$_SESSION['datos']['discapacidad_verbal'];
    @$estatus=$_SESSION['datos']['estatus'];
  }
  else{
    @$pais=null;
    @$estado=null;
    @$ciudad=null;;
    @$municipio=null;
    @$parroquia=null;
    @$cedula_estudiante=null;
    @$nombre_estudiante=null;
    @$apellido_estudiante=null;
    @$sexo=null;;
    @$edocivil=null;
    @$pais_residencia=null;
    @$aniosresidencia=null;
    @$tlf_fijo=null;
    @$tlf_movil=null;
    @$email=null;
    @$fecha_nacimiento=null;
    @$trabaja=null;
    @$dondetrabaja=null;
    @$tlf_trabajo=null;
    @$direcciontrabajo=null;
    @$cargo=null;
    @$antiguedad=null;
    @$discapacidad_visual=null;
    @$discapacidad_auditiva=null;
    @$discapacidad_motora=null;;
    @$discapacidad_verbal=null;
    @$estatus=null;
  }
  echo "<input type='hidden' id='cedula' value='".$cedula_estudiante."' />";
  if(!isset($_GET['l'])){
    ?>
    <form id="form1" name="form" method="POST" action="../controladores/cont_inscripcion.php">
      <table width="95%" border="0">
        <tr align="center"><th colspan=4><div class="encabezado_tabla">DATOS PERSONALES <br/><br/></div></th></tr>
        <tr>
          <td><div align="right"><strong>Pa&iacute;s de Nacimiento:</strong></div></td>
          <td>
            <label>
              <select name='pais' id='pais' class='select' title="Seleccione su pa&iacute;s de nacimiento" required />
              <option value='0'selected>Seleccione</option>
              <?php
              require_once("../clases/class_bd.php");
              $mysql=new Conexion();
              $sql = "SELECT cod_pais,nombre_pais FROM tpais WHERE fecha_desactivacion IS NULL ORDER BY nombre_pais ASC";
              $query = $mysql->Ejecutar($sql);
              while ($row = $mysql->Respuesta($query)){
                if($row['cod_pais']==$pais){
                  echo "<option value='".$row['cod_pais']."' selected>".$row['nombre_pais']."</option>";
                }
                else{
                  echo "<option value='".$row['cod_pais']."'>".$row['nombre_pais']."</option>";
                }
              }
              ?>
            </select>
          </label>
        </td>
        <td><div align="right"><strong>C&eacute;dula:</strong></div></td>
        <td>
          <label>
            <input required maxlength=8 name="cedula_estudiante" type="text" id="cedula_estudiante" onKeyPress="return isNumberKey(event)" 
            title="Ingrese la c&eacute;dula del estudiante" value="<?= $cedula_estudiante;?>"/>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Estado de Nacimiento:</strong></div></td>
        <td>
          <label>
            <input type="hidden" id="lvl1" name="lvl1" value="<?= $estado?>"/>
            <select required name='estado' id='estado' class='select' title="Seleccione su estado de nacimiento">
            </select>
          </label>
        </td>
        <td><div align="right"><strong>Nombres:</strong></div></td>
        <td>
          <label>
            <input required title="Ingrese su(s) nombre(s)" name="nombre_estudiante" type="text" id="nombre_estudiante" 
            onKeyUp="this.value=this.value.toUpperCase()" onKeyPress="return isCharKey(event)" value="<?= $nombre_estudiante;?>"/>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Ciudad de Nacimiento:</strong></div></td>
        <td>
          <label>
            <input type="hidden" id="lvl2" name="lvl2" value="<?= $ciudad?>"/>
            <select required name='ciudad' id='ciudad' class='select' title="Seleccione su ciudad de nacimiento">
            </select>
          </label>
        </td>
        <td><div align="right"><strong>Apellidos:</strong></div></td>
        <td>
          <label>
            <input required title="Ingrese su(s) apellido(s)" name="apellido_estudiante" type="text" id="apellido_estudiante" 
            onKeyUp="this.value=this.value.toUpperCase()" value="<?= $apellido_estudiante;?>"/>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Municipio de Nacimiento:</strong></div></td>
        <td>
          <label>
            <input type="hidden" id="lvl3" name="lvl3" value="<?= $municipio?>"/>
            <select required name='municipio' id='municipio' class='select' title="Seleccione su municipio de nacimiento">
            </select>
          </label>
        </td>
        <td><div align="right"><strong>G&eacute;nero:</strong></div></td>
        <td>
          <label>
            <select required name="sexo" id="sexo" title="Seleccione su g&eacute;nero">
              <option value='0'>Seleccione</option>
              <option value='F' <?php if($sexo=='F'){echo "selected";}?> >FEMENINO</option>
              <option value='M' <?php if($sexo=='M'){echo "selected";}?> >MASCULINO</option>
            </select>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Parroquia de Nacimiento:</strong></div></td>
        <td>
          <label>
            <input type="hidden" id="lvl4" name="lvl4" value="<?= $parroquia?>"/>
            <select required name='parroquia' id='parroquia' class='select' title="Seleccione su parroquia de nacimiento">
            </select>
          </label>
        </td>
        <td><div align="right"><strong>Estado Civil:</strong></div></td>
        <td>
          <label>
            <select required name="edocivil" id="edocivil" title="Seleccione su estado civil">
              <option value='0'>Seleccione</option>
              <option value='S' <?php if($edocivil=='S'){echo "selected";}?> >SOLTERO(A)</option>
              <option value='C' <?php if($edocivil=='C'){echo "selected";}?> >CASADO(A)</option>
              <option value='D' <?php if($edocivil=='D'){echo "selected";}?> >DIVORCIADO(A)</option>
              <option value='V' <?php if($edocivil=='V'){echo "selected";}?> >VIUDO(A)</option>
            </select>
          </label>
        </td>
      </tr>
      <tr>
        <td><div align="right"><strong>Pa&iacute;s de Residencia:</strong></div></td>
        <td>
          <label>
            <select name='pais_residencia' id='pais_residencia' class='select' title="Seleccione su pa&iacute;s de nacimiento" required />
            <option value='0'>Seleccione</option>
            <?php
            require_once("../clases/class_bd.php");
            $mysql=new Conexion();
            $sql = "SELECT cod_pais,nombre_pais FROM tpais WHERE fecha_desactivacion IS NULL ORDER BY nombre_pais ASC";
            $query = $mysql->Ejecutar($sql);
            while ($row = $mysql->Respuesta($query)){
              if($row['cod_pais']==$pais_residencia){
                echo "<option value='".$row['cod_pais']."' selected>".$row['nombre_pais']."</option>";
              }
              else{
                echo "<option value='".$row['cod_pais']."'>".$row['nombre_pais']."</option>";
              }
            }
            ?>
          </select>
        </label>
      </td>
      <td class="temp"><div align="right"><strong>Años de Residencia:</strong></div></td>
      <td class="temp">
        <label>
          <input title="Ingrese los años de residencia" name="aniosresidencia" type="text" id="aniosresidencia" 
          onKeyPress="return isNumberKey(event)" value="<?= $aniosresidencia;?>"/>
        </label>
      </td>
    </tr>
    <tr>
      <td><div align="right"><strong>Teléfono Fijo:</strong></div></td>
      <td>
        <label>
          <input required name="tlf_fijo" type="text" id="tlf_fijo" maxlength=11 title="Ingrese su n&uacute;mero de habitaci&oacute;n" 
          onKeyPress="return isNumberKey(event)" value="<?= $tlf_fijo;?>"/>
        </label>
      </td>
      <td><div align="right"><strong>Teléfono M&oacute;vil:</strong></div></td>
      <td>
        <label>
          <input name="tlf_movil" type="text" id="tlf_movil" maxlength=11 title="Ingrese su n&uacute;mero de celular" 
          onKeyPress="return isNumberKey(event)"  value="<?= $tlf_movil;?>"/>
        </label>
      </td>
    </tr>
    <tr>
      <td><div align="right"><strong>Fecha Nacimiento:</strong></div></td>
      <td>
        <label>
          <input required title="Seleccione su fecha de nacimiento" name="fecha_nacimiento" readonly type="text" id="fecha_nacimiento" 
          size="10" maxlength="10" value="<?= $fecha_nacimiento;?>"/>
        </label>
      </td>
      <td><div align="right"><strong>Correo:</strong></div></td>
      <td>
        <label>
          <input required title="Ingrese su direcci&oacute;n de correo electr&oacute;nico" name="email" type="text" id="email" 
          onKeyUp="this.value=this.value.toUpperCase()" value="<?= $email;?>"/>
        </label>
      </td>
    </tr>
    <tr>
      <td><div align="right"><strong>¿Trabaja?</strong></div></td>
      <td>
        <label>
          <select required name="trabaja" id="trabaja" title="Indiqu&eacute; si trabaja">
            <option value='0'>Seleccione</option>
            <option value='S' <?php if($trabaja=='S'){echo "selected";}?> >SI</option>
            <option value='N' <?php if($trabaja=='N'){echo "selected";}?> >NO</option>
          </select>
        </label>
      </td>
      <td class="tmp"><div align="right"><strong>¿D&oacute;nde Trabaja?</strong></div></td>
      <td class="tmp">
        <label>
          <input title="Ingrese el lugar de su trabajo" name="dondetrabaja" type="text" id="dondetrabaja" 
          onKeyUp="this.value=this.value.toUpperCase()" value="<?= $dondetrabaja;?>"/>
        </label>
      </td>
    </tr>
    <tr>
      <td class="tmp"><div align="right"><strong>Teléfono Trabajo:</strong></div></td>
      <td class="tmp">
        <label>
          <input name="tlf_trabajo" type="text" id="tlf_trabajo" maxlength=11 title="Ingrese su n&uacute;mero de celular" 
          onKeyPress="return isNumberKey(event)" value="<?= $tlf_trabajo;?>"/>
        </label>
      </td>
      <td class="tmp"><div align="right"><strong>Direcci&oacute;n de Trabajo:</strong></div></td>
      <td class="tmp">
        <label>
          <textarea title="Ingrese la direcci&oacute;n de trabajo" name="direcciontrabajo" id="direcciontrabajo" 
          onKeyUp="this.value=this.value.toUpperCase()" required /><?= $direcciontrabajo;?></textarea>
        </label>
      </td>
    </tr>
    <tr>
      <td class="tmp"><div align="right"><strong>Cargo:</strong></div></td>
      <td class="tmp">
        <label>
          <input title="Ingrese el cargo que ocupa en su trabajo" name="cargo" type="text" id="cargo" 
          onKeyUp="this.value=this.value.toUpperCase()" value="<?= $cargo;?>"/>
        </label>
      </td>
      <td class="tmp"><div align="right"><strong>Antigüedad:</strong></div></td>
      <td class="tmp">
        <label>
          <input title="Ingrese la antigüedad en su trabajo" name="antiguedad" type="text" id="antiguedad" 
          onKeyUp="this.value=this.value.toUpperCase()" value="<?= $antiguedad;?>" />
        </label>
      </td>
    </tr>
    <tr>
      <td><div align="right"><strong>¿Posee alguna Discapacidad?</strong></div></td>
      <td>
        <label>
          <input title="Seleccione una discapacidad" name="discapacidad_visual" type="checkbox" 
          id="discapacidad_visual" <?php if($discapacidad_visual=='Y'){echo "checked='checked'";}?> /> Visual 
          <input title="Seleccione una discapacidad" name="discapacidad_auditiva" type="checkbox" 
          id="discapacidad_auditiva" <?php if($discapacidad_auditiva=='Y'){echo "checked='checked'";}?> /> Auditiva 
          <input title="Seleccione una discapacidad" name="discapacidad_motora" type="checkbox" 
          id="discapacidad_motora" <?php if($discapacidad_motora=='Y'){echo "checked='checked'";}?> /> Motora 
          <input title="Seleccione una discapacidad" name="discapacidad_verbal" type="checkbox" 
          id="discapacidad_verbal" <?php if($discapacidad_verbal=='Y'){echo "checked='checked'";}?> /> Verbal 
        </label>
      </td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <?php
    echo '<tr><td colspan="6" class="'.$estatus.'" id="estatus_registro">'.$estatus.' <br /></td></tr>';
    ?>
  </table>
  <?php 
  imprimir_boton($disabledRC,$disabledMD,$estatus,$servicios);
  ?>
</form>
<?php }else{ ?>
<a href="?inscripcion" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
<a href="../excel/excel_inscripcion.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
<a href="<?php echo  '../pdf/?serv=comprobante_inscripcion'?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
<br /><br />
<table class="table table-striped table-bordered table-condensed">
  <tr> 
    <td> C&oacute;digo </td>
    <td>Descripci&oacute;n</td>
    <td>Fecha Inscripci&oacute;n</td>
    <td>C&eacute;dula</td>
    <td>Nombres y Apellidos</td>
    <td>C&oacute;digo de Carrera</td>
    <td>Carrera</td>
  </tr>
  <?php

             //Conexión a la base de datos 
  require_once("../clases/class_bd.php");
  $mysql=new Conexion();

  //Sentencia sql (sin limit) 
  $_pagi_sql = "SELECT i.cod_inscripcion,pr.descripcion,DATE_FORMAT(pi.fecha_inscripcion,'%d/%m/%Y') fecha_inscripcion,CASE p.nombre_pais WHEN 'VENEZUELA' THEN CONCAT('V-',per.cedula) ELSE CONCAT('E-',per.cedula) END cedula,
  CONCAT(per.nombres,' ',per.apellidos) nombre, pi.cod_carrera,c.nombre_carrera 
  FROM tpersonas per 
  INNER JOIN tpais p ON per.nacionalidad = p.cod_pais 
  INNER JOIN tproceso_inscripcion pi ON per.cedula = pi.cedula 
  INNER JOIN tinscripcion i ON pi.cod_inscripcion = i.cod_inscripcion 
  INNER JOIN tperiodo pr ON i.cod_periodo = pr.cod_periodo AND pr.esinscripcion = 'Y' 
  INNER JOIN tcarrera c ON pi.cod_carrera = c.cod_carrera 
  WHERE i.fecha_desactivacion IS NULL 
  ORDER BY i.cod_inscripcion,pi.fecha_inscripcion,per.cedula,c.cod_carrera"; 
  //cantidad de resultados por página (opcional, por defecto 20) 
  $_pagi_cuantos = 10; 
  //Cadena que separa los enlaces numéricos en la barra de navegación entre páginas.
  $_pagi_separador = " ";
  //Cantidad de enlaces a los números de página que se mostrarán como máximo en la barra de navegación.
  $_pagi_nav_num_enlaces=5;
  //Incluipos el script de paginación. Éste ya ejecuta la consulta automáticamente 
  @include("../librerias/paginador/paginator.inc.php"); 

  //Leemos y escribimos los registros de la página actual 
  while($row = mysql_fetch_array($_pagi_result)){ 
    echo "<tr><td style='width:5%;'>".$row['cod_inscripcion']."</td>
    <td align='left'>".$row['descripcion']."</td>
    <td align='left'>".$row['fecha_inscripcion']."</td>
    <td align='left'>".$row['cedula']."</td>
    <td align='left'>".$row['nombre']."</td>
    <td align='left'>".$row['cod_carrera']."</td>
    <td align='left'>".$row['nombre_carrera']."</td>
    </tr>"; 
  } 
  //Incluimos la barra de navegación 
  ?>
</table>
<div class="pagination">
  <ul>
    <?php echo"<li>".$_pagi_navegacion."</li>";?>
  </ul>
</div>
<?php }?>
</div>