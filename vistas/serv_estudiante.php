<?php
if(isset($_SESSION['datos']['cedula_estudiante'])){ 
 $disabledRC='disabled';
 $disabledMD='';
 $estatus=null;
}else {
 $disabledRC='';
 $disabledMD='disabled';
}
$servicios='estudiante';
if(isset($_SESSION['datos'])){
  @$nacionalidad=$_SESSION['datos']['nacionalidad'];
  @$cedula_estudiante=$_SESSION['datos']['cedula_estudiante'];
  @$nombre_estudiante=$_SESSION['datos']['nombre_estudiante'];
  @$apellido_estudiante=$_SESSION['datos']['apellido_estudiante'];
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
  @$nacionalidad=null;
  @$cedula_estudiante=null;
  @$nombre_estudiante=null;
  @$apellido_estudiante=null;
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
  <script src="../js/uds_estudiante.js"> </script>
  <form action="../controladores/cont_estudiante.php" method="post" id="form">
   <fieldset>
    <legend>Estudiante</legend>
    <div id="contenedorFormulario">
      <div class="row">
        <div class="span6">
          <label>Seleccione un País:</label>
          <select id="nacionalidad" name="nacionalidad" title="Seleccione un país" placeholder="Seleccione un País" class="campoTexto" required >
            <option value=0 selected>Seleccione un País</option>
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
          <label>Número de Cédula de Identidad:</label>
          <input onKeyPress="return isNumberKey(event)" title="Ingrese la c&eacute;dula del estudiante" name="cedula_estudiante" id="cedula_estudiante" type="text" size="10" value="<?= $cedula_estudiante;?>" placeholder="Ingrese el número de Cedula del Estudiante" class="campoTexto"  required /> </td></tr>
          <label>Ingrese el(los) nombre(s) del estudiante:</label>
          <input title="Ingrese el(los) nombre(s) del estudiante" onKeyUp="this.value=this.value.toUpperCase()" name="nombre_estudiante" id="nombre_estudiante" type="text" size="50" value="<?= $nombre_estudiante;?>" placeholder="Ingrese el Nombre del Estudiante" class="campoTexto"  required /></td></tr>
          <label>Ingrese el(los) apellido(s) del estudiante:</label>
          <input title="Ingrese el(los) apellido(s) del estudiante" onKeyUp="this.value=this.value.toUpperCase()" name="apellido_estudiante" id="apellido_estudiante" type="text" size="50" value="<?= $apellido_estudiante;?>" placeholder="Ingrese el Apellido del Estudiante" class="campoTexto"  required /></td></tr>
          <label>Seleccione el Género:</label>
          <select name="sexo" id="sexo" title="Seleccione el Género" placeholder="Seleccione el Género" class="campoTexto"required >
            <option value='0'>Seleccione el Género</option>
            <option value="F" <? if($sexo=="F"){ echo "selected";}?> >Femenino</option>
            <option value="M" <? if($sexo=="M"){ echo "selected";}?> >Masculino</option>
          </select>
          <label>Seleccione el fecha de nacimiento:</label>
          <input title="Seleccione el fecha de nacimiento" name="fecha_nacimiento" id="fecha_nacimiento" type="text" size="50" value="<?= $fecha_nacimiento;?>" placeholder="Ingrese la Fecha de Nacimiento" class="campoTexto" required /></td></tr>
        </div>

        <div class="span6">
          <label>Seleccione el estado civil:</label>
          <select name="edocivil" id="edocivil" title="Seleccione el estado civil" placeholder="Seleccione el Estado Civil" class="campoTexto"required >
            <option value='0'>Seleccione el estado Civil</option>
            <option value="S" <? if($sexo=="S"){ echo "selected";}?> >Soltero(a)</option>
            <option value="C" <? if($sexo=="C"){ echo "selected";}?> >Casado(a)</option>
            <option value="D" <? if($sexo=="D"){ echo "selected";}?> >Divorciado(a)</option>
            <option value="V" <? if($sexo=="V"){ echo "selected";}?> >Viudo(a)</option>
          </select>
          <label>Ingrese el n&uacute;mero de habitaci&oacute;n:</label>
          <input maxlength=11 title="Ingrese el n&uacute;mero de habitaci&oacute;n" onKeyPress="return isNumberKey(event)" name="tlf_fijo" id="tlf_fijo" type="text" size="50" value="<?= $tlf_fijo;?>" placeholder="Ingrese el número de Habitación" class="campoTexto"  required /></td></tr>
          <label>Ingrese el n&uacute;mero de celular:</label>
          <input maxlength=11 title="Ingrese el n&uacute;mero de celular" onKeyPress="return isNumberKey(event)" name="tlf_movil" id="tlf_movil" type="text" size="50" value="<?= $tlf_movil;?>" placeholder="Ingrese el número de Celular" class="campoTexto"  required /></td></tr>
          <label>Ingrese el correo electr&oacute;nico:</label>
          <input title="Ingrese el correo electr&oacute;nico del estudiante" onKeyUp="this.value=this.value.toUpperCase()" name="email" id="email" type="text" size="50" value="<?= $email;?>" placeholder="Ingrese el correo electrónico" class="campoTexto" required /></td></tr>
          <label>Seleccione una parroquia:</label>
          <select name="cod_parroquia" id="cod_parroquia" title="Seleccione una parroquia" placeholder="Seleccione el Género" class="campoTexto" required >
          </select>
          <input type="hidden" id="lvl4" name="lvl4" value="<?= $cod_parroquia?>"/>
          <label>Ingrese la direcci&oacute;n:</label>
          <textarea onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese la direcci&oacute;n del estudiante" name="direccion" id="direccion" value="<?= $direccion;?>" placeholder="Ingrese la Dirección" class="campoTexto" required /></textarea>
          <label>Ingrese el t&iacute;tulo o profesi&oacute;n:</label>
          <input title="Ingrese el t&iacute;tulo o profesi&oacute;n del estudiante" onKeyUp="this.value=this.value.toUpperCase()" name="titulo" id="titulo" type="text" size="50" value="<?= $titulo;?>" placeholder="Ingrese el Título o Profesión" class="campoTexto"  required /></td></tr>
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
<?php }else{ ?>
<a href="?estudiante" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
<a href="../excel/excel_estudiante.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
<table class="table table-striped table-bordered table-condensed">
 <tr> 
   <td>Cédula</td>
   <td>Nombres y Apellidos</td>
   <td>Género</td>
   <td>Fecha de Nacimiento</td>
   <td>Código de Estudiante</td>
   <td>Rol o Cargo</td>
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
 INNER JOIN trol r ON pr.cod_rol = r.cod_rol WHERE UPPER(r.nombre_rol) LIKE '%ESTUDIANTE%' ORDER BY cedula DESC"; 
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