<?php
if(isset($_SESSION['datos']['cedula_persona'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='persona';
if(isset($_SESSION['datos'])){
  @$rol=$_SESSION['datos']['rol'];
  @$nacionalidad=$_SESSION['datos']['nacionalidad'];
  @$cedula_persona=$_SESSION['datos']['cedula_persona'];
  @$nombre_persona=$_SESSION['datos']['nombre_persona'];
  @$apellido_persona=$_SESSION['datos']['apellido_persona'];
  @$sexo=$_SESSION['datos']['sexo'];
  @$edo_civil=$_SESSION['datos']['edo_civil'];
  @$tlf_fijo=$_SESSION['datos']['tlf_fijo'];
  @$tlf_movil=$_SESSION['datos']['tlf_movil'];
  @$cod_parroquia=$_SESSION['datos']['cod_parroquia'];
  @$direccion=$_SESSION['datos']['direccion'];
  @$email=$_SESSION['datos']['email'];
  @$fecha_nacimiento=$_SESSION['datos']['fecha_nacimiento'];
  @$titulo=$_SESSION['datos']['titulo'];
  @$estatus=$_SESSION['datos']['estatus'];
}
else{
  @$rol=null;
  @$nacionalidad=null;
  @$cedula_persona=null;
  @$nombre_persona=null;
  @$apellido_persona=null;
  @$sexo=null;
  @$edo_civil=null;
  @$tlf_fijo=null;
  @$tlf_movil=null;
  @$cod_parroquia=null;
  @$direccion=null;
  @$email=null;
  @$fecha_nacimiento=null;
  @$titulo=null;
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
        <label>Seleccione un Rol o Cargo:</label>
        <select id="rol" name="rol" title="Seleccione un rol" placeholder="Seleccione un Rol" class="campoTexto">
          <option value=0 selected>Seleccione un Rol</option>
          <?php
          require_once("../clases/class_bd.php");
          $mysql=new Conexion();
          $sql = "SELECT cod_rol,nombre_rol FROM trol WHERE fecha_desactivacion IS NULL AND UPPER(nombre_rol) NOT LIKE '%ESTUDIANTE%' ORDER BY nombre_rol ASC";
          $query = $mysql->Ejecutar($sql);
          while ($row = $mysql->Respuesta($query)){
            if($row['cod_rol']==$rol){
              echo "<option value='".$row['cod_rol']."' selected>".$row['nombre_rol']."</option>";
            }else{
              echo "<option value='".$row['cod_rol']."'>".$row['nombre_rol']."</option>";
            }
          }
          ?>
        </select>
        <label>Seleccione un País:</label>
        <select id="nacionalidad" name="nacionalidad" title="Seleccione un país" placeholder="Seleccione un País" class="campoTexto" required >
          <option value=0 selected>Seleccione un Pa&iacute;s</option>
          <?php
          require_once("../clases/class_bd.php");
          $mysql=new Conexion();
          $sql = "SELECT cod_pais,nombre_pais FROM tpais WHERE fecha_desactivacion IS NULL ORDER BY nombre_pais ASC";
          $query = $mysql->Ejecutar($sql);
          while ($row = $mysql->Respuesta($query)){
            if($row['cod_pais']==$nacionalidad){
              echo "<option value='".$row['cod_pais']."' selected>".$row['nombre_pais']."</option>";
            }else{
              echo "<option value='".$row['cod_pais']."'>".$row['nombre_pais']."</option>";
            }
          }
          ?>
        </select>
        <label>Ingrese el Número de Cédula:</label>
        <input onKeyPress="return isNumberKey(event)" title="Ingrese el número de cédula" name="cedula_persona" id="cedula_persona" type="text" size="10" value="<?= $cedula_persona;?>" placeholder="Ingrese el número de Cedula" class="campoTexto" required />
        <label>Ingrese el(los) nombre(s) del la Persona:</label>
        <input title="Ingrese el(los) nombre(s) del la Persona" onKeyUp="this.value=this.value.toUpperCase()" name="nombre_persona" id="nombre_persona" type="text" size="50" value="<?= $nombre_persona;?>" placeholder="Ingrese el Nombre" class="campoTexto" required />
        <label>Ingrese el(los) apellido(s) del la Persona:</label>
        <input title="Ingrese el(los) apellido(s) del la Persona" onKeyUp="this.value=this.value.toUpperCase()" name="apellido_persona" id="apellido_persona" type="text" size="50" value="<?= $apellido_persona;?>" placeholder="Ingrese el Apellido" class="campoTexto" required />
        <label>Seleccione el Género:</label>
        <select name="sexo" id="sexo" title="Seleccione el Género" placeholder="Seleccione el Género" class="campoTexto"required >
          <option value="">Selecione una opción</option>
          <option value="F" <? if($sexo=="F"){ echo "selected";}?> >Femenino</option>
          <option value="M" <? if($sexo=="M"){ echo "selected";}?> >Masculino</option>
        </select>
        <label>Fecha de Nacimiento:</label>
        <input title="Seleccione el fecha de Nacimiento" name="fecha_nacimiento" id="fecha_nacimiento" type="text" size="50" value="<?= $fecha_nacimiento;?>" placeholder="Ingrese la Fecha de Nacimiento" class="campoTexto" required />
      </div>
      <div class="span6">
        <label>Estado Civil:</label>
        <select name="edocivil" id="edocivil" title="Seleccione el estado civil" placeholder="Seleccione el Estado Civil" class="campoTexto" required="" >
          <option value="">Selecione una opción</option>
          <option value="S" <? if($sexo=="S"){ echo "selected";}?> >Soltero(a)</option>
          <option value="C" <? if($sexo=="C"){ echo "selected";}?> >Casado(a)</option>
          <option value="D" <? if($sexo=="D"){ echo "selected";}?> >Divorciado(a)</option>
          <option value="V" <? if($sexo=="V"){ echo "selected";}?> >Viudo(a)</option>
        </select>
        <label>Número de Habitación:</label>
        <input maxlength=11 title="Ingrese el número de habitación" onKeyPress="return isNumberKey(event)" name="tlf_fijo" id="tlf_fijo" type="text" size="50" value="<?= $tlf_fijo;?>" placeholder="Ingreso el Número de Habitación" class="campoTexto" required />
        <label>Teléfono Celular:</label>
        <input maxlength=11 title="Ingrese el número de celular" onKeyPress="return isNumberKey(event)" name="tlf_movil" id="tlf_movil" type="text" size="50" value="<?= $tlf_movil;?>" placeholder="Ingrese el Número Celular" class="campoTexto" required />
        <label>Correo Electrónico:</label>
        <input title="Ingrese el correo electrónico del persona" onKeyUp="this.value=this.value.toUpperCase()" name="email" id="email" type="text" size="50" value="<?= $email;?>" placeholder="Ingrese el Correo Electrónico" class="campoTexto" required />
        <label>Asigne la Parroquia:</label>
        <select name="cod_parroquia" id="cod_parroquia" title="Seleccione una parroquia" placeholder="Seleccione una Parroquia" class="campoTexto" required>
          <input type="hidden" id="lvl4" name="lvl4" value="<?= $cod_parroquia?>"/>
        </select>
        <label>Ingrese Dirección de la Persona:</label>
        <textarea onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese la dirección del persona" name="direccion" id="direccion" value="<?= $direccion;?>" placeholder="Ingrese la Dirección" class="campoTexto" required /></textarea>
        <label>Título o Profesión:</label>
        <input title="Ingrese el título o profesión del persona" onKeyUp="this.value=this.value.toUpperCase()" name="titulo" id="titulo" type="text" size="50" value="<?= $titulo;?>" placeholder="Ingrese el Título o Profesión" class="campoTexto" required />
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
     <td align='left'>Rol</td>
   </tr>
   <?php

           //Conexión a la base de datos 
   require_once("../clases/class_bd.php");
   $mysql=new Conexion();

//Sentencia sql (sin limit) 
   $_pagi_sql = "SELECT CONCAT((CASE pa.nombre_pais WHEN 'VENEZUELA' THEN 'V-' ELSE 'E-' END),p.cedula) cedula, 
   CONCAT(p.nombres,' ',p.apellidos) nomape, CASE p.sexo WHEN 'F' THEN 'FEMENINO' ELSE 'MASCULINO' END genero, 
   DATE_FORMAT(p.fecha_nacimiento,'%d/%m/%Y') fecha_nacimiento,pr.cod_personal, r.nombre_rol rol 
   FROM tpersonas p INNER JOIN tpais pa ON p.nacionalidad = pa.cod_pais INNER JOIN tpersonales pr ON p.cedula = pr.cedula 
   INNER JOIN trol r ON pr.cod_rol = r.cod_rol WHERE UPPER(r.nombre_rol) NOT LIKE '%ESTUDIANTE%' ORDER BY p.cedula DESC"; 
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
    echo "<tr><td style='width:20%;'>".$row['cedula']."</td><td align='left'>".$row['nomape']."</td><td align='left'>".$row['genero']."</td><td align='left'>".$row['fecha_nacimiento']."</td><td align='left'>".$row['cod_personal']."</td><td align='left'>".$row['rol']."</td></tr>"; 
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