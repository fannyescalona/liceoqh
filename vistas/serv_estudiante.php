<?php
if(isset($_SESSION['datos']['cedula'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='estudiante';
if(isset($_SESSION['datos'])){
  @$cedula_docente=$_SESSION['datos']['cedula_docente'];
  @$seccion=$_SESSION['datos']['seccion'];
  @$cedula=$_SESSION['datos']['cedula'];
  @$nombres=$_SESSION['datos']['nombres'];
  @$apellidos=$_SESSION['datos']['apellidos'];
  @$genero=$_SESSION['datos']['genero'];
  @$fecha_nacimiento=$_SESSION['datos']['fecha_nacimiento'];
  @$lugar_nacimiento=$_SESSION['datos']['lugar_nacimiento'];
  @$direccion=$_SESSION['datos']['direccion'];
  @$telefono_habitacion=$_SESSION['datos']['telefono_habitacion'];
  @$telefono_movil=$_SESSION['datos']['telefono_movil'];
  @$email=$_SESSION['datos']['email'];
  @$esestudiante=$_SESSION['datos']['esestudiante'];
  @$codigo_plantel=$_SESSION['datos']['codigo_plantel'];
  @$cedula_representante=$_SESSION['datos']['cedula_representante'];
  @$codigo_parentesco=$_SESSION['datos']['codigo_parentesco'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$cedula_docente=null;
  @$seccion=null;
  @$cedula=null;
  @$nombres=null;
  @$apellidos=null;
  @$genero=null;
  @$fecha_nacimiento=null;
  @$lugar_nacimiento=null;
  @$direccion=null;
  @$telefono_habitacion=null;
  @$telefono_movil=null;
  @$email=null;
  @$esestudiante=null;
  @$codigo_plantel=null;
  @$cedula_representante=null;
  @$codigo_parentesco=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){
  ?>
<div class="form_externo" >
  <script src="../js/uds_estudiante.js"> </script>
  <form action="../controladores/cont_estudiante.php" method="POST" id="form">
    <fieldset>
      <legend>Estudiante</legend>
      <div id="contenedorFormulario">
        <div class="row">
          <div class="span6">
            <label>Cédula Docente:</label>
            <input tabindex=1 onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el número de cédula del docente" name="cedula_docente" id="cedula_docente" type="text" size="10" value="<?= $cedula_docente;?>" placeholder="Ingrese el número de Cédula del Docente" class="campoTexto" required />
            <label>Cédula:</label>
            <input tabindex=3 maxlength="10" onKeyPress="return isRif(event,this.value)" maxlength=10 onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el número de cédula del docente" name="cedula" id="cedula" type="text" size="10" value="<?= $cedula;?>" placeholder="Ingrese el número de Cédula" class="campoTexto" required />
            <label>Nombre(s):</label>
            <input tabindex=5 title="Ingrese el(los) nombre(s) de la estudiante" onKeyPress="return isCharKey(event)" onKeyUp="this.value=this.value.toUpperCase()" name="nombres" id="nombres" type="text" size="50" value="<?= $nombres;?>" placeholder="Ingrese el Nombre" class="campoTexto" required />
            <label>Fecha de Nacimiento:</label>
            <input tabindex=7 title="Seleccione el fecha de Nacimiento" name="fecha_nacimiento" id="fecha_nacimiento" type="text" size="50" value="<?= $fecha_nacimiento;?>" placeholder="Ingrese la Fecha de Nacimiento" class="campoTexto" readonly required />
            <label>Dirección:</label>
            <textarea tabindex=9 onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese la dirección del estudiante" name="direccion" id="direccion" rows=5 placeholder="Ingrese la Dirección" required /><?php echo $direccion;?></textarea>
            <label>Correo Electrónico:</label>
            <input tabindex=12 title="Ingrese el correo electrónico del estudiante" onKeyPress="return isEmail(event,this.value)" onKeyUp="this.value=this.value.toLowerCase()" name="email" id="email" type="text" size="50" value="<?= $email;?>" placeholder="Ingrese el Correo Electrónico" class="campoTexto" />
            <label>Cédula Representante:</label>
            <input tabindex=14 onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el número de cédula del representante" name="cedula_representante" id="cedula_representante" type="text" size="10" value="<?= $cedula_representante;?>" placeholder="Ingrese el número de Cédula del Representante" class="campoTexto" required />
          </div>
          <div class="span6">
            <label>Sección:</label>
            <input tabindex=2 title="Seleccione una sección" onKeyUp="this.value=this.value.toUpperCase()" name="seccion" id="seccion" type="text" size="50" value="<?= $seccion;?>" placeholder="Seleccione una sección" class="campoTexto" />
            <label>Género:</label>
            <select tabindex=4 name="genero" id="genero" title="Seleccione el Género" class='lista' required >
              <option value="">Selecione una opción</option>
              <option value="F" <?php if($genero=="F"){ echo "selected";}?>>Femenino</option>
              <option value="M" <?php if($genero=="M"){ echo "selected";}?>>Masculino</option>
            </select>
            <label>Apellido(s):</label>
            <input tabindex=6 title="Ingrese el(los) apellido(s) de la estudiante" onKeyPress="return isCharKey(event)" onKeyUp="this.value=this.value.toUpperCase()" name="apellidos" id="apellidos" type="text" size="50" value="<?= $apellidos;?>" placeholder="Ingrese el Apellido" class="campoTexto" required />
            <label>Lugar de Nacimiento:</label>
            <input tabindex=8 title="Seleccione una Parroquia" onKeyUp="this.value=this.value.toUpperCase()" name="lugar_nacimiento" id="lugar_nacimiento" type="text" size="50" value="<?= $lugar_nacimiento;?>" placeholder="Seleccione una parroquia" class="campoTexto" required />
            <label>Teléfono de Habitación:</label>
            <input tabindex=10 maxlength=11 title="Ingrese el número de habitación" onKeyPress="return isNumberKey(event)" name="telefono_habitacion" id="telefono_habitacion" type="text" size="50" value="<?= $telefono_habitacion;?>" placeholder="Ingreso el Número de Habitación" class="campoTexto" />
            <label>Teléfono Celular:</label>
            <input tabindex=11 maxlength=11 title="Ingrese el número de celular" onKeyPress="return isNumberKey(event)" name="telefono_movil" id="telefono_movil" type="text" size="50" value="<?= $telefono_movil;?>" placeholder="Ingrese el Número Celular" class="campoTexto" />
            <label>Plantel Procedencia:</label>
            <select tabindex=13 id="codigo_plantel" name="codigo_plantel" title="Seleccione un Plantel" class="lista" required >
              <option value="" selected>Seleccione un Plantel</option>
              <?php
                require_once("../clases/class_bd.php");
                $mysql=new Conexion();
                $sql = "SELECT codigo_plantel,nombre FROM tplantel WHERE fecha_desactivacion IS NULL ORDER BY codigo_plantel ASC";
                $query = $mysql->Ejecutar($sql);
                while ($row = $mysql->Respuesta($query)){
                  if($row['codigo_plantel']==$codigo_plantel){
                    echo "<option value='".$row['codigo_plantel']."' selected>".$row['nombre']."</option>";
                  }else{
                    echo "<option value='".$row['codigo_plantel']."'>".$row['nombre']."</option>";
                  }
                }
              ?>
              </select>
            <label>Parentesco:</label>
            <input tabindex=15 onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el parentesco del representante" name="codigo_parentesco" id="codigo_parentesco" type="text" size="10" value="<?= $codigo_parentesco;?>" placeholder="Ingrese el parentesco del representante" class="campoTexto" required />
          </div> 
        </div>    
          <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
      </div>    
      <br><br>
      <?php echo '<p class="'.$estatus.'" id="estatus_registro">'.$estatus.'</p>';
        imprimir_boton($disabledRC,$disabledMD,$estatus,$servicios);
      ?>
    </fieldset>
  </form>
</div>
  <?php //}
    }else{ 
    require_once("../clases/class_perfil.php");
    $perfil=new Perfil();
    $perfil->codigo_perfil(@$_SESSION['user_codigo_perfil']);
    $servicios_permitidos=$perfil->IMPRIMIR_SERVICIOS_USUARIO();
    $servicio_solicitado=strtolower(preg_replace('/(serv_)|(\.php)/','',basename(__FILE__))); 
  ?>
  <a href="?estudiante" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_estudiante.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
  <table class="table table-striped table-bordered table-condensed">
    <tr> 
      <td style="width:10%;"> C&eacute;dula </td>
      <td align='left'>Nombres y Apellidos</td>
      <td align='left'>G&eacute;nero</td>
      <td align='left'>Fecha de Nacimiento</td>
      <td align='left'>Sección</td>
    </tr>
    <?php
      //Conexión a la base de datos 
      require_once("../clases/class_bd.php");
      $mysql=new Conexion();
      //Sentencia sql (sin limit) 
      $_pagi_sql = "SELECT p.cedula,CONCAT(p.nombres,' ',p.apellidos) AS nomape,CASE p.genero WHEN 'F' THEN 'Femenino' ELSE 'Masculino' END AS genero,
      date_format(p.fecha_nacimiento,'%d/%m/%Y') AS fecha_nacimiento,CONCAT(p.lugar_nacimiento,'_',par.descripcion) AS lugar_nacimiento,p.direccion,p.telefono_habitacion,
      p.telefono_movil,p.email,(CASE WHEN p.fecha_desactivacion IS NULL THEN 'Activo' ELSE 'Desactivado' END) AS estatus,
      s.descripcion AS seccion 
      FROM tpersona p 
      INNER JOIN tproceso_inscripcion pi ON p.cedula = pi.cedula_estudiante 
      INNER JOIN tparroquia par ON p.lugar_nacimiento = par.codigo_parroquia 
      LEFT JOIN tseccion s ON pi.seccion = s.seccion 
      WHERE p.esestudiante='Y' ORDER BY p.cedula DESC"; 
      //cantidad de resultados por página (opcional, por defecto 20) 
      $_pagi_cuantos = 10; 
      //Cadena que separa los enlaces numéricos en la barra de navegación entre páginas.
      $_pagi_separador = " ";
      //Cantidad de enlaces a los números de página que se mostrarán como máximo en la barra de navegación.
      $_pagi_nav_num_enlaces=5;
      //Incluimos el script de paginación. Éste ya ejecuta la consulta automáticamente 
      @include("../librerias/paginador/paginator.inc.php"); 
      //Leemos y escribimos los registros de la página actual 
      while($row = mysql_fetch_array($_pagi_result)){ 
      echo "<tr style='cursor: pointer;' id='".$row['cedula']."' onclick='enviarForm(this.id)'>
        <td style='width:10%;'>".$row['cedula']."</td>
        <td align='left'>".$row['nomape']."</td>
        <td align='left'>".$row['genero']."</td>
        <td style='width:15%;' align='left'>".$row['fecha_nacimiento']."</td>
        <td align='left'>".$row['seccion']."</td>
        </tr>"; 
      } 
      //Incluimos la barra de navegación 
    ?>
  </table>
<script type="text/javascript">
function enviarForm(value){
  document.getElementById('campo_oculto').value=value;
  document.getElementById('form1').submit();
}
</script>
<form id="form1" method="POST" action="../controladores/cont_estudiante.php">
  <input type="hidden" name="cedula" id="campo_oculto" value="" />
  <input type="hidden" name="operacion" id="operacion" value="Consultar" />
</form>
  <div class="pagination">
    <ul>
      <?php echo"<li>".$_pagi_navegacion."</li>";?>
    </ul>
  </div>
  <?php }?>