<div class="form_externo" >
  <?php
  if(isset($_SESSION['datos']['cedula'])){ 
    $disabledRC='disabled';
    $disabledMD='';
    $estatus=null;
  }else {
    $disabledRC='';
    $disabledMD='disabled';
  }
  $servicios='proceso_inscripcion';
  if(isset($_SESSION['datos'])){
  @$cedula=$_SESSION['datos']['cedula'];
  @$cedula_escolar=$_SESSION['datos']['cedula_escolar'];
  @$codigo_canaima=$_SESSION['datos']['codigo_canaima'];
  @$nombres=$_SESSION['datos']['nombres'];
  @$apellidos=$_SESSION['datos']['apellidos'];
  @$genero=$_SESSION['datos']['genero'];
  @$peso=$_SESSION['datos']['peso'];
  @$estatura=$_SESSION['datos']['estatura'];
  @$fecha_nacimiento=$_SESSION['datos']['fecha_nacimiento'];
  @$lugar_nacimiento=$_SESSION['datos']['lugar_nacimiento'];
  @$direccion=$_SESSION['datos']['direccion'];
  @$telefono_habitacion=$_SESSION['datos']['telefono_habitacion'];
  @$plantel_procedencia=$_SESSION['datos']['plantel_procedencia'];
  @$email=$_SESSION['datos']['email'];
  @$estatus=$_SESSION['datos']['estatus'];
  }
  else{
    @$cedula=null;
    @$cedula_escolar=null;
    @$codigo_canaima=null;
    @$nombres=null;
    @$apellidos=null;
    @$genero=null;
    @$peso=null;
    @$estatura=null;
    @$fecha_nacimiento=null;
    @$lugar_nacimiento=null;
    @$direccion=null;
    @$telefono_habitacion=null;
    @$plantel_procedencia=null;
    @$email=null;
    @$estatus=null;
  }
  echo "<input type='hidden' id='cedula' value='".$cedula."' />";
  if(!isset($_GET['l'])){
    ?>
    <form id="form1" name="form" method="POST" action="../controladores/cont_procesoinscripcion.php">  
      <fieldset>
        <h1>Datos del Estudiante</h1>
        <div id="contenedorInscripcion">
          <div class="row">
            <div class="span6">
              <label>Cédula:</label>
              <input tabindex=1 onKeyPress="return isRif(event,this.value)" onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el número de cédula" maxlength=10 name="cedula_estudiante" id="cedula_estudiante" type="text" size="10" value="<?= $cedula;?>" placeholder="Ingrese el número de Cédula" class="campoTexto" />
              <label>Cédula Escolar:</label>
              <input tabindex=3 onKeyPress="return isRif(event,this.value)" onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el número de cédula escolar" maxlength=10 name="cedula_escolar" id="cedula_escolar" type="text" size="10" value="<?= $cedula_escolar;?>" placeholder="Ingrese el número de Cédula Escolar" class="campoTexto" />
              <label>Nombre(s):</label>
              <input tabindex=5 title="Ingrese el(los) nombre(s) del Estudiante" onKeyPress="return isCharKey(event)" onKeyUp="this.value=this.value.toUpperCase()" name="nombres" id="nombres" type="text" size="50" value="<?= $nombres;?>" placeholder="Ingrese el Nombre" class="campoTexto" required />
              <label>Peso (Kg):</label>
              <input tabindex=7 maxlength=5 title="Ingrese el peso del estudiante expresado en kg" onKeyPress="return isNumberKey(event)" name="peso" id="peso" type="text" size="50" value="<?= $peso;?>" placeholder="Ingreso el Peso del Estudiante expresado en Kg" class="campoTexto" required />
              <label>Fecha de Nacimiento:</label>
              <input tabindex=9 title="Seleccione el fecha de Nacimiento" name="fecha_nacimiento_estudiante" id="fecha_nacimiento_estudiante" type="text" size="50" value="<?= $fecha_nacimiento;?>" placeholder="Ingrese la Fecha de Nacimiento" class="campoTexto" readonly required />
              <label>Dirección:</label>
              <textarea tabindex=11 onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese la dirección del persona" name="direccion" id="direccion" rows=5 placeholder="Ingrese la Dirección" required /><?php echo $direccion;?></textarea>
              <label>Plantel de Procedencia:</label>
              <input tabindex=14 onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el nombre del plantel de procedencia" maxlength=50 name="plantel_procedencia" id="plantel_procedencia" type="text" size="10" value="<?= $plantel_procedencia;?>" placeholder="Ingrese el nombre del plantel de procedencia" class="campoTexto" />
            </div>
            <div class="span6">
              <label>Género:</label>
              <select tabindex=2 name="genero" id="genero" title="Seleccione el Género" class='lista' required >
                <option value="">Selecione una opción</option>
                <option value="F" <?php if($genero=="F"){ echo "selected";}?>>Femenino</option>
                <option value="M" <?php if($genero=="M"){ echo "selected";}?>>Masculino</option>
              </select>
              <label>Código de la Canaima:</label>
              <input tabindex=4 onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el código de la canaima asignada" maxlength=20 name="codigo_canaima" id="codigo_canaima" type="text" size="10" value="<?= $codigo_canaima;?>" placeholder="Ingrese el código de la canaima" class="campoTexto" />
              <label>Apellido(s):</label>
              <input tabindex=6 title="Ingrese el(los) apellido(s) del Estudiante" onKeyPress="return isCharKey(event)" onKeyUp="this.value=this.value.toUpperCase()" name="apellidos" id="apellidos" type="text" size="50" value="<?= $apellidos;?>" placeholder="Ingrese el Apellido" class="campoTexto" required />
              <label>Estatura (Cm):</label>
              <input tabindex=8 maxlength=5 title="Ingrese la estatura del estudiante expresado en cm" onKeyPress="return isNumberKey(event)" name="estatura" id="estatura" type="text" size="50" value="<?= $estatura;?>" placeholder="Ingreso la Estatura del Estudiante expresado en Cm" class="campoTexto" required />
              <label>Lugar de Nacimiento:</label>
              <input tabindex=10 title="Seleccione un Municipio" onKeyUp="this.value=this.value.toUpperCase()" name="lugar_nacimiento" id="lugar_nacimiento" type="text" size="50" value="<?= $lugar_nacimiento;?>" placeholder="Seleccione un municipio" class="campoTexto" required />
              <label>Teléfono de Habitación:</label>
              <input tabindex=12 maxlength=11 title="Ingrese el número de habitación" onKeyPress="return isNumberKey(event)" name="telefono_habitacion" id="telefono_habitacion" type="text" size="50" value="<?= $telefono_habitacion;?>" placeholder="Ingreso el Número de Habitación" class="campoTexto" required />
              <label>Correo Electrónico:</label>
              <input tabindex=13 title="Ingrese el correo electrónico del persona" onKeyPress="return isEmail(event,this.value)" onKeyUp="this.value=this.value.toLowerCase()" name="email" id="email" type="text" size="50" value="<?= $email;?>" placeholder="Ingrese el Correo Electrónico" class="campoTexto" />
            </div> 
          </div>    
            <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
        </div>    
        <br><br>
      <?php echo '<p class="'.$estatus.'" id="estatus_registro">'.$estatus.'</p>'; ?>
        <?php
          imprimir_boton($disabledRC,$disabledMD,$estatus,$servicios);
        ?>
    </fieldset>
    </form>
  <?php }else{ ?>
    <a href="?proceso_inscripcion" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
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
        <td>Año Escolar</td>
      </tr>
      <?php
      //Conexión a la base de datos 
      require_once("../clases/class_bd.php");
      $mysql=new Conexion();
      //Sentencia sql (sin limit) 
      $_pagi_sql = "SELECT i.codigo_inscripcion,i.descripcion,
      DATE_FORMAT(pi.fecha_inscripcion,'%d/%m/%Y') fecha_inscripcion,per.cedula,
      CONCAT(per.nombres,' ',per.apellidos) nombre, pi.codigo_ano_academico,a.descripcion AS anoescolar 
      FROM tpersona per 
      INNER JOIN tproceso_inscripcion pi ON per.cedula = pi.cedula_estudiante 
      INNER JOIN tinscripcion i ON pi.codigo_inscripcion = i.codigo_inscripcion 
      INNER JOIN tano_academico a ON pi.codigo_ano_academico = a.codigo_ano_academico 
      WHERE i.fecha_desactivacion IS NULL 
      ORDER BY pi.codigo_procesoinscripcion,pi.fecha_inscripcion,per.cedula,a.codigo_ano_academico"; 
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
      echo "<tr style='cursor: pointer;' id='".$row['cedula']."' onclick='enviarForm(this.id)'>
      <td style='width:5%;'>".$row['codigo_inscripcion']."</td>
      <td align='left'>".$row['descripcion']."</td>
      <td align='left'>".$row['fecha_inscripcion']."</td>
      <td align='left'>".$row['cedula']."</td>
      <td align='left'>".$row['nombre']."</td>
      <td align='left'>".$row['anoescolar']."</td>
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
    <form id="form1" method="POST" action="../controladores/cont_procesoinscripcion.php">
      <input type="hidden" name="cedula_estudiante" id="campo_oculto" value="" />
      <input type="hidden" name="operacion" id="operacion" value="Consultar" />
    </form>
    <div class="pagination">
      <ul>
        <?php echo"<li>".$_pagi_navegacion."</li>";?>
      </ul>
    </div>
  <?php }?>
</div>