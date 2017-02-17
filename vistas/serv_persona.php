<?php
if(isset($_SESSION['datos']['cedula'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='persona';
if(isset($_SESSION['datos'])){
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
  @$esrepresentante=$_SESSION['datos']['esrepresentante'];
  @$espersonalinstitucion=$_SESSION['datos']['espersonalinstitucion'];
  @$fecha_ingreso=$_SESSION['datos']['fecha_ingreso'];
  @$codigo_cargo=$_SESSION['datos']['codigo_cargo'];
  @$codigo_dependencia=$_SESSION['datos']['codigo_dependencia'];
  @$codigo_dependencia_anterior=$_SESSION['datos']['codigo_dependencia_anterior'];
  @$condicion_cargo=$_SESSION['datos']['condicion_cargo'];
  @$nivel_academico=$_SESSION['datos']['nivel_academico'];
  @$carga_horaria=$_SESSION['datos']['carga_horaria'];
  @$codigo_plantel=$_SESSION['datos']['codigo_plantel'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
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
  @$esrepresentante=null;
  @$espersonalinstitucion=null;
  @$fecha_ingreso=null;
  @$codigo_cargo=null;
  @$codigo_dependencia=null;
  @$codigo_dependencia_anterior=null;
  @$condicion_cargo=null;
  @$nivel_academico=null;
  @$carga_horaria=null;
  @$codigo_plantel=null;
  @$estatus=null;
}
?>
<br><br>
<?php if(!isset($_GET['l'])){?>
<div class="form_externo" >
  <script src="../js/uds_persona.js"> </script>
  <form action="../controladores/cont_persona.php" method="POST" id="form">
    <fieldset>
      <legend>Persona</legend>
      <div id="contenedorFormulario">
        <div class="row">
          <div class="span6">
            <label>Cédula:</label>
            <input type="hidden" name="oldci" value="<?= $cedula;?>">
            <input tabindex=1 maxlength="10" onKeyPress="return isRif(event,this.value)" onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el número de cédula" maxlength=10 name="cedula" id="cedula" type="text" size="10" value="<?= $cedula;?>" placeholder="Ingrese el número de Cédula" class="campoTexto" required />
            <label>Nombre(s):</label>
            <input tabindex=3 title="Ingrese el(los) nombre(s) de la Persona" onKeyPress="return isCharKey(event)" onKeyUp="this.value=this.value.toUpperCase()" name="nombres" id="nombres" type="text" size="50" value="<?= $nombres;?>" placeholder="Ingrese el Nombre" class="campoTexto" required />
            <label>Fecha de Nacimiento:</label>
            <input tabindex=5 title="Seleccione el fecha de Nacimiento" name="fecha_nacimiento" id="fecha_nacimiento" type="text" size="50" value="<?= $fecha_nacimiento;?>" placeholder="Ingrese la Fecha de Nacimiento" class="campoTexto" readonly required />
            <label>Dirección:</label>
            <textarea tabindex=7 onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese la dirección del persona" name="direccion" id="direccion" rows=5 placeholder="Ingrese la Dirección" required /><?php echo $direccion;?></textarea>
            <label>Correo Electrónico:</label>
            <input tabindex=10 title="Ingrese el correo electrónico del persona ejemplo: usuario@dominio.com" onKeyPress="return isEmail(event,this.value)" onKeyUp="this.value=this.value.toLowerCase()" name="email" id="email" type="text" size="50" value="<?= $email;?>" placeholder="Ingrese el Correo Electrónico ejemplo: usuario@dominio.com" class="campoTexto" />
            <label>Personal del Plantel:</label>
            <input tabindex=12 type="radio" name="espersonalinstitucion" id="epiSI" value="Y" <?php if($espersonalinstitucion=="Y"){echo "checked"; }?>> SÍ <input type="radio" name="espersonalinstitucion" id="epiNO" value="N" <?php if($espersonalinstitucion=="N" || $espersonalinstitucion==NULL){echo "checked"; }?>> NO
            <div id="personal1">
              <label>Cargo:</label>
              <select tabindex=14 id="codigo_cargo" name="codigo_cargo" title="Seleccione un Cargo" placeholder="Seleccione un Cargo" class="lista">
              <option value=NULL selected>Seleccione un Cargo</option>
              <?php
                require_once("../clases/class_bd.php");
                $mysql=new Conexion();
                $sql = "SELECT codigo_cargo,descripcion FROM tcargo WHERE fecha_desactivacion IS NULL ORDER BY codigo_cargo ASC";
                $query = $mysql->Ejecutar($sql);
                while ($row = $mysql->Respuesta($query)){
                  if($row['codigo_cargo']==$codigo_cargo){
                    echo "<option value='".$row['codigo_cargo']."' selected>".$row['descripcion']."</option>";
                  }else{
                    echo "<option value='".$row['codigo_cargo']."'>".$row['descripcion']."</option>";
                  }
                }
              ?>
              </select>
              <label>Nivel Acádemico:</label>
              <select tabindex=16 name="nivel_academico" id="nivel_academico" title="Seleccione el Nivel Acádemico" class='lista' >
                <option value="">Selecione el Nivel Acádemico</option>
                <option value="Bachiller" <?php if($nivel_academico=="Bachiller"){ echo "selected";}?>>Bachiller</option>
                <option value="T.S.U." <?php if($nivel_academico=="T.S.U."){ echo "selected";}?>>T.S.U.</option>
                <option value="LCDO(A)." <?php if($nivel_academico=="LCDO(A)."){ echo "selected";}?>>LCDO(A).</option>
                <option value="ING." <?php if($nivel_academico=="ING."){ echo "selected";}?>>ING.</option>
                <option value="DR(A)." <?php if($nivel_academico=="DR(A)."){ echo "selected";}?>>DR(A).</option>
              </select>
              <label>Fecha de Ingreso:</label>
              <input tabindex=18 title="Seleccione el fecha de Ingreso" name="fecha_ingreso" id="fecha_ingreso" type="text" size="50" value="<?= $fecha_ingreso;?>" placeholder="Ingrese la Fecha de Ingreso" class="campoTexto" readonly required />
            </div>
          </div>
          <div class="span6">
            <label>Género:</label>
            <select tabindex=2 name="genero" id="genero" title="Seleccione el Género" class='lista' required >
              <option value="">Selecione una opción</option>
              <option value="F" <?php if($genero=="F"){ echo "selected";}?>>Femenino</option>
              <option value="M" <?php if($genero=="M"){ echo "selected";}?>>Masculino</option>
            </select>
            <label>Apellido(s):</label>
            <input tabindex=4 title="Ingrese el(los) apellido(s) de la Persona" onKeyPress="return isCharKey(event)" onKeyUp="this.value=this.value.toUpperCase()" name="apellidos" id="apellidos" type="text" size="50" value="<?= $apellidos;?>" placeholder="Ingrese el Apellido" class="campoTexto" required />
            <label>Lugar de Nacimiento:</label>
            <input tabindex=6 title="Seleccione una Parroquia" onKeyUp="this.value=this.value.toUpperCase()" name="lugar_nacimiento" id="lugar_nacimiento" type="text" size="50" value="<?= $lugar_nacimiento;?>" placeholder="Seleccione una parroquia" class="campoTexto" required />
            <label>Teléfono de Habitación:</label>
            <input tabindex=8 maxlength=11 title="Ingrese el número de habitación" onKeyPress="return isNumberKey(event)" name="telefono_habitacion" id="telefono_habitacion" type="text" size="50" value="<?= $telefono_habitacion;?>" placeholder="Ingreso el Número de Habitación" class="campoTexto" />
            <label>Teléfono Celular:</label>
            <input tabindex=9 maxlength=11 title="Ingrese el número de celular" onKeyPress="return isNumberKey(event)" name="telefono_movil" id="telefono_movil" type="text" size="50" value="<?= $telefono_movil;?>" placeholder="Ingrese el Número Celular" class="campoTexto" />
            <label>Representante:</label>
            <input tabindex=11 type="radio" name="esrepresentante" id="esrepresentante" value="Y" <?php if($esrepresentante=="Y"){echo "checked"; }?>> SÍ <input type="radio" name="esrepresentante" id="esrepresentante" value="N" <?php if($esrepresentante=="N" || $esrepresentante==NULL){echo "checked"; }?>> NO
            <div id="personal2">
              <label>Código de Dependencia Anterior:</label>
              <input tabindex=13 maxlength=10 title="Ingrese el Código de Dependencia Anterior" onKeyUp="this.value=this.value.toUpperCase()" name="codigo_dependencia_anterior" id="codigo_dependencia_anterior" type="text" size="50" value="<?= $codigo_dependencia_anterior;?>" placeholder="Ingrese el Código de Dependencia Anterior" class="campoTexto" />
              <div style="display: none;">
                <label>Plantel:</label>
                <select id="codigo_plantel" name="codigo_plantel" title="Seleccione un Plantel" class="lista">
                <option value=NULL selected>Seleccione un Plantel</option>
                <?php
                  require_once("../clases/class_bd.php");
                  $mysql=new Conexion();
                  $sql = "SELECT p.codigo_plantel,p.nombre FROM tplantel p 
                  INNER JOIN tconfiguracion_negocio cn ON p.codigo_plantel = cn.codigo_plantel 
                  WHERE p.fecha_desactivacion IS NULL ORDER BY codigo_plantel ASC";
                  $query = $mysql->Ejecutar($sql);
                  while ($row = $mysql->Respuesta($query)){
                    $codigo_dependencia = $row['codigo_plantel'];
                    $codigo_plantel = $row['codigo_plantel'];
                    if($row['codigo_plantel']==$codigo_plantel){
                      echo "<option value='".$row['codigo_plantel']."' selected>".$row['nombre']."</option>";
                    }else{
                      echo "<option value='".$row['codigo_plantel']."'>".$row['nombre']."</option>";
                    }
                  }
                ?>
                </select>
                <label>Código de Dependencia:</label>
                <input maxlength=10 title="Ingrese el Código de Dependencia" onKeyUp="this.value=this.value.toUpperCase()" name="codigo_dependencia" id="codigo_dependencia" type="text" size="50" value="<?= $codigo_dependencia;?>" placeholder="Ingrese el Código de Dependencia" class="campoTexto" required />
              </div>
              <label>Condición del Cargo:</label>
              <select tabindex=15 name="condicion_cargo" id="condicion_cargo" title="Seleccione la Condición del Cargo" class='lista' >
                <option value="">Selecione una opción</option>
                <option value="C" <?php if($genero=="C"){ echo "selected";}?>>Contratado</option>
                <option value="F" <?php if($genero=="F"){ echo "selected";}?>>Fijo</option>
              </select>
              <label>Carga Horaria:</label>
              <?php 
                require_once("../clases/class_bd.php");
                $mysql=new Conexion();
                $sql = "SELECT hora_minima_docente,hora_maxima_docente FROM tconfiguracion_negocio 
                WHERE fecha_desactivacion IS NULL";
                $query = $mysql->Ejecutar($sql);
                if($mysql->Total_Filas($query)==0)
                  $carga_nota_abierta='N';
                while ($row = $mysql->Respuesta($query)){
                  $hora_minima_docente = $row['hora_minima_docente'];
                  $hora_maxima_docente = $row['hora_maxima_docente'];
                }
              ?>
              <input type="hidden" id="hora_minima_docente" value="<?php echo $hora_minima_docente; ?>">
              <input type="hidden" id="hora_maxima_docente" value="<?php echo $hora_maxima_docente; ?>">
              <input tabindex=17 maxlength=2 title="Ingrese la carga horaria" name="carga_horaria" id="carga_horaria" type="number" min=<?php echo $hora_minima_docente; ?> max=<?php echo $hora_maxima_docente; ?> size="50" value="<?= $carga_horaria;?>" placeholder="Ingrese la carga horaria" class="campoTexto" value=0 required />
            </div>
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
</div>
  <?php }else{ 
    require_once("../clases/class_perfil.php");
    $perfil=new Perfil();
    $perfil->codigo_perfil(@$_SESSION['user_codigo_perfil']);
    $servicios_permitidos=$perfil->IMPRIMIR_SERVICIOS_USUARIO();
    $servicio_solicitado=strtolower(preg_replace('/(serv_)|(\.php)/','',basename(__FILE__))); 
  ?>
  <a href="?persona" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
  <a href="../excel/excel_persona.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
  <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
  <table class="table table-striped table-bordered table-condensed">
    <tr> 
      <td style="width:10%;"> C&eacute;dula </td>
      <td align='left'>Nombres y Apellidos</td>
      <td align='left'>G&eacute;nero</td>
      <td align='left'>Fecha de Nacimiento</td>
      <td align='left'>Cargo</td>
    </tr>
    <?php
      //Conexión a la base de datos 
      require_once("../clases/class_bd.php");
      $mysql=new Conexion();
      //Sentencia sql (sin limit) 
      $_pagi_sql = "SELECT p.cedula,CONCAT(p.nombres,' ',p.apellidos) AS nomape,CASE p.genero WHEN 'F' THEN 'Femenino' ELSE 'Masculino' END AS genero,
      date_format(p.fecha_nacimiento,'%d/%m/%Y') AS fecha_nacimiento,CONCAT(p.lugar_nacimiento,'_',par.descripcion) AS lugar_nacimiento,p.direccion,p.telefono_habitacion,
      p.telefono_movil,p.email, p.esestudiante,p.esrepresentante,p.espersonalinstitucion,
      (CASE WHEN p.fecha_desactivacion IS NULL THEN 'Activo' ELSE 'Desactivado' END) AS estatus,
      p.fecha_ingreso,c.descripcion,codigo_dependencia,p.condicion_cargo, p.nivel_academico,
      p.carga_horaria,p.codigo_plantel 
      FROM tpersona p 
      INNER JOIN tparroquia par ON p.lugar_nacimiento = par.codigo_parroquia 
      LEFT JOIN tcargo c ON p.codigo_cargo = c.codigo_cargo 
      WHERE p.esestudiante='N' ORDER BY p.cedula DESC"; 
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
      <td align='left'>".$row['descripcion']."</td></tr>"; 
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
<form id="form1" method="POST" action="../controladores/cont_persona.php">
  <input type="hidden" name="cedula" id="campo_oculto" value="" />
  <input type="hidden" name="operacion" id="operacion" value="Consultar" />
</form>
  <div class="pagination">
    <ul>
      <?php echo"<li>".$_pagi_navegacion."</li>";?>
    </ul>
  </div>
  <?php }?>