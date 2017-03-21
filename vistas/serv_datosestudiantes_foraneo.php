<script type="text/javascript">
  $(document).ready(function(){
    var edad = '-'+$('#edad_maxima_primer_anio').val()+'y';
    //Agregar Objeto Calendario al input fecha_nacimiento.
    $('#fecha_nacimiento_estudiante').datepicker({
        minDate: edad,
        maxDate: '-10y',
        showOn: 'both',
        numberOfMonths: 1,
        buttonImage: '../images/calendario.png',
        buttonImageOnly: true
    });
    //  Mostrar/Ocultar codigo canaima
    if($('#canaima_operativa').val()=="Y")
      $('#codigo_canaima').attr("readonly",false);
    else{
      $('#codigo_canaima').val("");
      $('#codigo_canaima').attr("readonly",true);
    }

    $('#canaima_operativa').on("change",function(){
      if($(this).val()=="Y")
        $('#codigo_canaima').attr("readonly",false);
      else{
        $('#codigo_canaima').val("");
        $('#codigo_canaima').attr("readonly",true);
      }  
    });

    $('input[name=tiene_materia_pendiente]').on("change",function(){
      if($('input:radio[name=tiene_materia_pendiente]:checked').val()=='Y'){
        $('#MateriasPendientes').show();
      }
      else if($('input:radio[name=tiene_materia_pendiente]:checked').val()=='N'){
        $('#MateriasPendientes').hide();
      }
    });
  });
</script>
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
  $servicios='proceso_inscripcion_foraneo';
  if(isset($_SESSION['datos'])){
  @$cedula=$_SESSION['datos']['cedula'];
  @$cedula_escolar=$_SESSION['datos']['cedula_escolar'];
  @$lateralidad=$_SESSION['datos']['lateralidad'];
  @$codigo_canaima=$_SESSION['datos']['codigo_canaima'];
  @$canaima_operativa=$_SESSION['datos']['canaima_operativa'];
  @$nombres=$_SESSION['datos']['nombres'];
  @$apellidos=$_SESSION['datos']['apellidos'];
  @$genero=$_SESSION['datos']['genero'];
  @$peso=$_SESSION['datos']['peso'];
  @$estatura=$_SESSION['datos']['estatura'];
  @$fecha_nacimiento=$_SESSION['datos']['fecha_nacimiento'];
  @$lugar_nacimiento=$_SESSION['datos']['lugar_nacimiento'];
  @$direccion=$_SESSION['datos']['direccion'];
  @$telefono_habitacion=$_SESSION['datos']['telefono_habitacion'];
  @$codigo_plantel=$_SESSION['datos']['codigo_plantel'];
  @$email=$_SESSION['datos']['email'];
  @$seccion=$_SESSION['datos']['seccion'];
  @$grado_escolar=$_SESSION['datos']['grado_escolar'];
  @$estatus=$_SESSION['datos']['estatus'];
  }
  else{
    @$cedula=null;
    @$cedula_escolar=null;
    @$lateralidad=null;
    @$codigo_canaima=null;
    @$canaima_operativa=null;
    @$nombres=null;
    @$apellidos=null;
    @$genero=null;
    @$peso=null;
    @$estatura=null;
    @$fecha_nacimiento=null;
    @$lugar_nacimiento=null;
    @$direccion=null;
    @$telefono_habitacion=null;
    @$codigo_plantel=null;
    @$email=null;
    @$seccion=null;
    @$grado_escolar=null;
    @$estatus=null;
  }
  echo "<input type='hidden' id='cedula' value='".$cedula."' />";
  if(!isset($_GET['l'])){
    ?>
    <input type="hidden" name="estudiante_registrado" id="estudiante_registrado" value="<?=$_SESSION['datos']['estudiante_registrado']?>">
    <form id="form1" name="form" method="POST" action="../controladores/cont_procesoinscripcion_foraneo.php">  
      <fieldset>
        <h1>Datos del Estudiante</h1>
        <div id="contenedorInscripcion">
          <div class="row">
            <div class="span6">
              <label>Cédula:</label>
              <input tabindex=1 maxlength="9" onKeyPress="return isRif(event,this.value)" onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el número de cédula" maxlength=10 name="cedula_estudiante" id="cedula_estudiante" type="text" size="10" value="<?= $cedula;?>" placeholder="Ingrese el número de Cédula" class="campoTexto" />
              <label>Cédula Escolar:</label>
              <input tabindex=3 maxlength="11" onKeyPress="return isNumberKey(event)" onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el número de cédula escolar" maxlength=10 name="cedula_escolar" id="cedula_escolar" type="text" size="10" value="<?= $cedula_escolar;?>" placeholder="Ingrese el número de Cédula Escolar" class="campoTexto" />
              <label>Canaima Operativa:</label>
              <select tabindex=5 name="canaima_operativa" id="canaima_operativa" title="Indique si la canaima esta operativa o no" class='lista' required >
                <option value="">Selecione una opción</option>
                <option value="Y" <?php if($canaima_operativa=="Y"){ echo "selected";}?>>Sí</option>
                <option value="N" <?php if($canaima_operativa=="N"){ echo "selected";}?>>No</option>
              </select><label>Nombre(s):</label>
              <input tabindex=7 title="Ingrese el(los) nombre(s) del Estudiante" onKeyPress="return isCharKey(event)" onKeyUp="this.value=this.value.toUpperCase()" name="nombres" id="nombres" type="text" size="50" value="<?= $nombres;?>" placeholder="Ingrese el Nombre" class="campoTexto" required />
              <label>Peso (Kg):</label>
              <input tabindex=9 maxlength=5 title="Ingrese el peso del estudiante expresado en kg" onKeyPress="return isNumberKey(event)" name="peso" id="peso" type="text" size="50" value="<?= $peso;?>" placeholder="Ingreso el Peso del Estudiante expresado en Kg" class="campoTexto" required />
              <label>Fecha de Nacimiento:</label>
              <input tabindex=11 title="Seleccione el fecha de Nacimiento" name="fecha_nacimiento_estudiante" id="fecha_nacimiento_estudiante" type="text" size="50" value="<?= $fecha_nacimiento;?>" placeholder="Ingrese la Fecha de Nacimiento" class="campoTexto" readonly required />
              <label>Dirección:</label>
              <textarea tabindex=13 onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese la dirección del persona" name="direccion" id="direccion" rows=5 placeholder="Ingrese la Dirección" required /><?php echo $direccion;?></textarea>
              <label>Grado Escolar:</label>
              <select tabindex=16 name="grado_escolar" id="grado_escolar" title="Seleccione el Grado Escolar" class='lista' required >
                <option value="">Selecione una opción</option>
                <option value="1" <?php echo ((empty($grado_escolar) || $grado_escolar=="1") ? 'selected' : ''); ?>>1er Año</option>
                <option value="2" <?php echo ((!empty($grado_escolar) || $grado_escolar=="2") ? 'selected' : ''); ?>>2do Año</option>
                <option value="3" <?php echo ((!empty($grado_escolar) && $grado_escolar=="3") ? 'selected' : ''); ?>>3er Año</option>
                <option value="4" <?php echo ((!empty($grado_escolar) && $grado_escolar=="4") ? 'selected' : ''); ?>>4to Año</option>
                <option value="5" <?php echo ((!empty($grado_escolar) && $grado_escolar=="5") ? 'selected' : ''); ?>>5to Año</option>
              </select>
              <label>Plantel de Procedencia:</label>
              <select tabindex=18 id="codigo_plantel" name="codigo_plantel" title="Seleccione un Plantel" class="lista" required >
              <option value="" selected>Seleccione un Plantel</option>
              <?php
                require_once("../clases/class_bd.php");
                $mysql=new Conexion();
                $sql = "SELECT codigo_plantel,nombre 
                FROM tplantel 
                WHERE fecha_desactivacion IS NULL 
                AND NOT EXISTS (SELECT 1 FROM tconfiguracion_negocio WHERE tconfiguracion_negocio.codigo_plantel = tplantel.codigo_plantel)
                ORDER BY codigo_plantel ASC";
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
            </div>
            <div class="span6">
              <label>Género:</label>
              <select tabindex=2 name="genero" id="genero" title="Seleccione el Género" class='lista' required >
                <option value="">Selecione una opción</option>
                <option value="F" <?php if($genero=="F"){ echo "selected";}?>>Femenino</option>
                <option value="M" <?php if($genero=="M"){ echo "selected";}?>>Masculino</option>
              </select>
              <label>Lateralidad:</label>
              <select tabindex=4 name="lateralidad" id="lateralidad" title="Seleccione la Lateralidad del estudiante" class='lista' required >
                <option value="">Selecione una opción</option>
                <option value="D" <?php if($lateralidad=="D"){ echo "selected";}?>>Derecho</option>
                <option value="I" <?php if($lateralidad=="I"){ echo "selected";}?>>Izquierdo</option>
              </select>
              <div id="codigo_canaima_oculto">
                <label>Código de la Canaima:</label>
                <input tabindex=6 onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el código de la canaima asignada" maxlength=20 name="codigo_canaima" id="codigo_canaima" type="text" size="10" value="<?= $codigo_canaima;?>" placeholder="Ingrese el código de la canaima" class="campoTexto" />
              </div>
              <label>Apellido(s):</label>
              <input tabindex=8 title="Ingrese el(los) apellido(s) del Estudiante" onKeyPress="return isCharKey(event)" onKeyUp="this.value=this.value.toUpperCase()" name="apellidos" id="apellidos" type="text" size="50" value="<?= $apellidos;?>" placeholder="Ingrese el Apellido" class="campoTexto" required />
              <label>Estatura (Cm):</label>
              <input tabindex=10 maxlength=5 title="Ingrese la estatura del estudiante expresado en cm" onKeyPress="return isNumberKey(event)" name="estatura" id="estatura" type="text" size="50" value="<?= $estatura;?>" placeholder="Ingreso la Estatura del Estudiante expresado en Cm" class="campoTexto" required />
              <label>Lugar de Nacimiento:</label>
              <input tabindex=12 title="Seleccione un Municipio" onKeyUp="this.value=this.value.toUpperCase()" name="lugar_nacimiento" id="lugar_nacimiento" type="text" size="50" value="<?= $lugar_nacimiento;?>" placeholder="Seleccione un municipio" class="campoTexto" required />
              <label>Teléfono de Habitación:</label>
              <input tabindex=14 maxlength=11 title="Ingrese el número de habitación" onKeyPress="return isNumberKey(event)" name="telefono_habitacion" id="telefono_habitacion" type="text" size="50" value="<?= $telefono_habitacion;?>" placeholder="Ingreso el Número de Habitación" class="campoTexto" required />
              <label>Correo Electrónico:</label>
              <input tabindex=15 title="Ingrese el correo electrónico del persona ejemplo: usuario@dominio.com" onKeyPress="return isEmail(event,this.value)" onKeyUp="this.value=this.value.toLowerCase()" name="email" id="email" type="text" size="50" value="<?= $email;?>" placeholder="Ingrese el Correo Electrónico ejemplo: usuario@dominio.com" class="campoTexto" />
              <label>Sección:</label>
              <input tabindex=17 title="Seleccione una sección" onKeyUp="this.value=this.value.toUpperCase()" name="seccion" id="seccion" type="text" size="50" value="<?= $seccion;?>" placeholder="Seleccione una sección" class="campoTexto" />
              <label>¿Tiene materias pendientes?:</label>
              <input type="radio" name="tiene_materia_pendiente" id="tiene_materia_pendienteY" value="Y"> Sí
              <input type="radio" name="tiene_materia_pendiente" id="tiene_materia_pendienteN" value="N" checked > No
            </div> 
          </div>
          <div id="MateriasPendientes" style="display:none;">
            <br/>
            <table id='tablaMaterias' class="table-bordered zebra-striped">
              <tr>
                <td><center><label class="control-label" >Materias:</label></center></td>
                <td><center><button type="button" onclick="agrega_campos()" class="boton"><i class="icon-plus"></i></button></center></td>
              </tr>
            </table>
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
    <script type="text/javascript">
      var materias = document.getElementsByName('materias[]');
      var contador=materias.length;
        function agrega_campos(){
          if(contador<8){
            $("#tablaMaterias").append("<tr id='"+contador+"' >"+
            "<td><input type='text' name='materias[]' id='materia_"+contador+"' onKeyPress='return ACDataGridPorFiltro(this.id,\"materiapendienteporfiltro.php\",[&#39;grado_escolar&#39;])' onKeyUp='this.value=this.value.toUpperCase()' title='Seleccione una materia' placeholder='Seleccione una materia' class='campoTexto'/></td>"+
            "<td><button type='button' class='boton' onclick='elimina_me("+contador+")'><i class='icon-minus'></button></td>"+
            "</tr>");
            $('#materia_'+contador)
            contador++;
          }
          else{
            alert('No puede agregar más de 8 materias');
          }
        }
        function elimina_me(elemento){
          $("#"+elemento).remove();
          for(var i=0;i<materias.length;i++){
            materias[i].removeAttribute('id');
          }
          for(var i=0;i<materias.length;i++){
            materias[i].setAttribute('id','materia_'+i);
          }
          contador--;
        }
    </script>
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
      WHERE i.fecha_desactivacion IS NULL AND a.cerrado = 'N'
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