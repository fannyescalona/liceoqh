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
  @$esrepresentante=$_SESSION['datos']['esrepresentante'];
  @$espersonalinstitucion=$_SESSION['datos']['espersonalinstitucion'];
  @$fecha_ingreso=$_SESSION['datos']['fecha_ingreso'];
  @$codigo_cargo=$_SESSION['datos']['codigo_cargo'];
  @$codigo_dependencia=$_SESSION['datos']['codigo_dependencia'];
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
  @$esrepresentante=null;
  @$espersonalinstitucion=null;
  @$fecha_ingreso=null;
  @$codigo_cargo=null;
  @$codigo_dependencia=null;
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
  <form action="../controladores/cont_persona.php" method="post" id="form">
   <fieldset>
    <legend>Persona</legend>
    <div id="contenedorFormulario">
      <div class="row">
      <div class="span6">
        <label>Ingrese el Número de Cédula:</label>
        <input onKeyPress="return isRif(event,this.value)" onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el número de cédula" maxlength=10 name="cedula" id="cedula" type="text" size="10" value="<?= $cedula;?>" placeholder="Ingrese el número de Cedula" class="campoTexto" required />
        <label>Ingrese el(los) nombre(s) del la Persona:</label>
        <input title="Ingrese el(los) nombre(s) del la Persona" onKeyUp="this.value=this.value.toUpperCase()" name="nombres" id="nombres" type="text" size="50" value="<?= $nombres;?>" placeholder="Ingrese el Nombre" class="campoTexto" required />
        <label>Fecha de Nacimiento:</label>
        <input title="Seleccione el fecha de Nacimiento" name="fecha_nacimiento" id="fecha_nacimiento" type="text" size="50" value="<?= $fecha_nacimiento;?>" placeholder="Ingrese la Fecha de Nacimiento" class="campoTexto" readonly required />
        <label>Ingrese Dirección de la Persona:</label>
        <textarea onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese la dirección del persona" name="direccion" id="direccion" rows=5 placeholder="Ingrese la Dirección" required /><?php echo $direccion;?></textarea>
        <label>Correo Electrónico:</label>
        <input title="Ingrese el correo electrónico del persona" onKeyUp="this.value=this.value.toUpperCase()" name="email" id="email" type="text" size="50" value="<?= $email;?>" placeholder="Ingrese el Correo Electrónico" class="campoTexto" required />
        <label>Personal del Plantel:</label>
        <input type="radio" name="espersonalinstitucion" id="espersonalinstitucion" value="Y" <?php if($espersonalinstitucion=="Y"){echo "checked"; }?>> SÍ <input type="radio" name="espersonalinstitucion" id="espersonalinstitucion" value="N" <?php if($espersonalinstitucion=="N" || $espersonalinstitucion==NULL){echo "checked"; }?>> NO
        <div id="personal1">
          <label>Fecha de Ingreso:</label>
          <input title="Seleccione el fecha de Ingreso" name="fecha_ingreso" id="fecha_ingreso" type="text" size="50" value="<?= $fecha_ingreso;?>" placeholder="Ingrese la Fecha de Ingreso" class="campoTexto" readonly required />
          <label>Cargo:</label>
          <select id="codigo_cargo" name="codigo_cargo" title="Seleccione un Cargo" placeholder="Seleccione un Cargo" class="lista">
            <option value=0 selected>Seleccione un Cargo</option>
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
          <input title="Ingrese el Nivel Acádemico de la persona" onKeyUp="this.value=this.value.toUpperCase()" name="nivel_academico" id="nivel_academico" type="text" size="50" value="<?= $nivel_academico;?>" placeholder="Ingrese el Nivel Acádemico" class="campoTexto" />
        </div>
      </div>
      <div class="span6">
        <label>Género:</label>
        <select name="genero" id="genero" title="Seleccione el Género" class='lista' required >
          <option value="">Selecione una opción</option>
          <option value="F" <?php if($genero=="F"){ echo "selected";}?>>Femenino</option>
          <option value="M" <?php if($genero=="M"){ echo "selected";}?>>Masculino</option>
        </select>
        <label>Ingrese el(los) apellido(s) del la Persona:</label>
        <input title="Ingrese el(los) apellido(s) del la Persona" onKeyUp="this.value=this.value.toUpperCase()" name="apellidos" id="apellidos" type="text" size="50" value="<?= $apellidos;?>" placeholder="Ingrese el Apellido" class="campoTexto" required />
        <label>Lugar de Nacimiento:</label>
        <input title="Seleccione un Municipio" onKeyUp="this.value=this.value.toUpperCase()" name="lugar_nacimiento" id="lugar_nacimiento" type="text" size="50" value="<?= $lugar_nacimiento;?>" placeholder="Seleccione un municipio" class="campoTexto" required />
        <label>Número de Habitación:</label>
        <input maxlength=11 title="Ingrese el número de habitación" onKeyPress="return isNumberKey(event)" name="telefono_habitacion" id="telefono_habitacion" type="text" size="50" value="<?= $telefono_habitacion;?>" placeholder="Ingreso el Número de Habitación" class="campoTexto" required />
        <label>Teléfono Celular:</label>
        <input maxlength=11 title="Ingrese el número de celular" onKeyPress="return isNumberKey(event)" name="telefono_movil" id="telefono_movil" type="text" size="50" value="<?= $telefono_movil;?>" placeholder="Ingrese el Número Celular" class="campoTexto" required />
        <label>Representante:</label>
        <input type="radio" name="esrepresentante" id="esrepresentante" value="Y" <?php if($esrepresentante=="Y"){echo "checked"; }?>> SÍ <input type="radio" name="esrepresentante" id="esrepresentante" value="N" <?php if($esrepresentante=="N" || $esrepresentante==NULL){echo "checked"; }?>> NO
        <div id="personal2">
          <label>Plantel:</label>
          <select id="codigo_plantel" name="codigo_plantel" title="Seleccione un Plantel" class="lista">
            <option value=0 selected>Seleccione un Plantel</option>
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
          <label>Código de Dependencia:</label>
          <input title="Ingrese el Código de Dependencia" onKeyUp="this.value=this.value.toUpperCase()" name="codigo_dependencia" id="codigo_dependencia" type="text" size="50" value="<?= $codigo_dependencia;?>" placeholder="Ingrese el Código de Dependencia" class="campoTexto" required />
          <label>Condición del Cargo:</label>
          <select name="condicion_cargo" id="condicion_cargo" title="Seleccione la Condición del Cargo" class='lista' >
            <option value="">Selecione una opción</option>
            <option value="F" <?php if($genero=="C"){ echo "selected";}?>>Contratado</option>
            <option value="M" <?php if($genero=="T"){ echo "selected";}?>>Titular</option>
          </select>
          <label>Carga Horaria:</label>
          <input maxlength=2 title="Ingrese la carga horaria" onKeyPress="return isNumberKey(event)" name="carga_horaria" id="carga_horaria" type="text" size="50" value="<?= $telefono_movil;?>" placeholder="Ingrese la carga horaria" class="campoTexto" required />
        </div> 
      </div>
      <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
    </div>    
    </div>    
    <br><br>
    <?php echo '<tr><td colspan="2" class="'.$estatus.'" id="estatus_registro">'.$estatus.'</td></tr>'; ?>

    <?php
    imprimir_boton($disabledRC,$disabledMD,$estatus,$servicios);
    ?>  
  </fieldset>
</form>
<br>

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
     <td style="width:20%;"> C&eacute;dula </td>
     <td align='left'>Nombres y Apellidos</td>
     <td align='left'>G&eacute;nero</td>
     <td align='left'>Fecha de Nacimiento</td>
     <td align='left'>C&oacute;digo de Persona</td>
     <td align='left'>codigo_cargo</td>
   </tr>
   <?php

           //Conexión a la base de datos 
   require_once("../clases/class_bd.php");
   $mysql=new Conexion();

//Sentencia sql (sin limit) 
   $_pagi_sql = "SELECT p.cedula,p.nombres,p.apellidos,p.genero,date_format(p.fecha_nacimiento,'%d/%m/%Y') fecha_nacimiento,
    CONCAT(p.lugar_nacimiento,'_',par.descripcion) AS lugar_nacimiento,p.direccion,p.telefono_habitacion,p.telefono_movil,p.email,
    p.esestudiante,p.esrepresentante,p.espersonalinstitucion,(CASE WHEN p.fecha_desactivacion IS NULL THEN  'Activo' 
    ELSE 'Desactivado' END) AS estatus,date_format(p.fecha_ingreso,'%d/%m/%Y)',p.codigo_cargo,p.codigo_dependencia,p.condicion_cargo,
    p.nivel_academico,p.carga_horaria,p.codigo_plantel
    FROM tpersona p 
    INNER JOIN tparroquia par ON p.lugar_nacimiento = par.codigo_parroquia 
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
    echo "<tr><td style='width:20%;'>".$row['cedula']."</td><td align='left'>".$row['nomape']."</td><td align='left'>".$row['genero']."</td><td align='left'>".$row['fecha_nacimiento']."</td><td align='left'>".$row['cod_personal']."</td><td align='left'>".$row['codigo_cargo']."</td></tr>"; 
  } 
//Incluimos la barra de navegación 
  ?>
</table>
<div class="pagination">
 <ul>
   <?php echo"<li>".$_pagi_navegacion."</li>";?>
 </ul>
</div>
</div>
<?php }?>