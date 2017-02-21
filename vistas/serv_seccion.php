<div class="form_externo" >
  <?php
    require_once("../clases/class_bd.php");
    if(isset($_SESSION['datos']['seccion'])){ 
      $disabledRC='disabled';
      $disabledMD='';
      $estatus=null;
    }else {
      $disabledRC='';
      $disabledMD='disabled';
    }
    $servicios='seccion';
    if(isset($_SESSION['datos'])){
      @$seccion=$_SESSION['datos']['seccion'];
      @$descripcion=$_SESSION['datos']['descripcion'];
      @$turno=$_SESSION['datos']['turno'];
      @$grado_escolar=$_SESSION['datos']['grado_escolar'];
      @$capacidad_min=$_SESSION['datos']['capacidad_min'];
      @$capacidad_max=$_SESSION['datos']['capacidad_max'];
      @$estatus=$_SESSION['datos']['estatus'];
    }
    else{
      @$seccion=null;
      @$descripcion=null;
      @$turno=null;
      @$grado_escolar=null;
      @$capacidad_min=null;
      @$capacidad_max=null;
      @$estatus=null;
    }
  ?>
  <br><br>
  <?php if(!isset($_GET['l'])){?>
    <script src="../js/uds_seccion.js"> </script>
    <form action="../controladores/cont_seccion.php" method="post" id="form">
      <fieldset>
        <legend>Sección</legend>
        <div id="contenedorFormulario">
          <label>Código de la sección:</label>
          <input type="hidden" name="oldseccion" value="<?= @$seccion?>">
          <input title="Ingrese el Código de la sección" onKeyUp="this.value=this.value.toUpperCase()" maxlength=5 name="seccion" id="seccion" type="text" size="50" value="<?= $seccion;?>" placeholder="Ingrese el Código de la Sección" class="campoTexto" required />
          <label>Sección</label>
          <input type="text" name="descripcion" id="descripcion" onKeyUp="this.value=this.value.toUpperCase()" title="Ingrese el nombre de la sección" size="50" placeholder="Ingrese el nombre de la sección" class="campoTexto" value="<?= $descripcion;?>" required />
          <label>Asigne el Turno:</label>
          <select name="turno" id="turno" title="Seleccione un turno para la secci&oacute;n" placeholder="Seleccione un turno" class="campoTexto"  required >
            <option value='0'>Seleccione un Turno</option>
            <option value='M' <?php if($turno=='M'){ echo 'selected'; }?>> Integral</option>
            <option value='T' <?php if($turno=='T'){ echo 'selected'; }?>> Medio Turno</option>
          </select>
          <label>Grado Escolar:</label>
          <select tabindex=4 name="grado_escolar" id="grado_escolar" title="Seleccione el Grado Escolar" class='lista' required >
            <option value="">Selecione una opción</option>
            <option value="1" <?php if($grado_escolar=="1"){ echo "selected";}?>>1er Año</option>
            <option value="2" <?php if($grado_escolar=="2"){ echo "selected";}?>>2do Año</option>
            <option value="3" <?php if($grado_escolar=="3"){ echo "selected";}?>>3er Año</option>
            <option value="4" <?php if($grado_escolar=="4"){ echo "selected";}?>>4to Año</option>
            <option value="5" <?php if($grado_escolar=="5"){ echo "selected";}?>>5to Año</option>
          </select>
          <label>Capacidad Mínima de la Sección:</label>
          <input title="Ingrese la capacidad mínima de la sección" onKeyPress="return isNumberKey(event)" name="capacidad_min" id="capacidad_min" maxlength=2 type="text" size="50" value="<?= $capacidad_min;?>" placeholder="Ingrese la Capacidad Mínima" class="campoTexto" required />
          <label>Capacidad Máxima de la sección:</label>
          <input title="Ingrese la capacidad máxima de la sección" onKeyPress="return isNumberKey(event)" name="capacidad_max" id="capacidad_max" maxlength=2 type="text" size="50" value="<?= $capacidad_max;?>" placeholder="Ingrese la Capacidad Máxima" class="campoTexto" required />
          <br/>
          <table id='tablaMaterias' class="table-bordered zebra-striped">
            <tr>
              <td><center><label class="control-label" >Materias:</label></center></td>
              <td><center><label class="control-label" >Docentes:</label></center></td>
              <td><center><button type="button" onclick="agrega_campos()" class="boton"><i class="icon-plus"></i></button></center></td>
            </tr>
            <?php
              $mysql=new Conexion();
              $sql = "SELECT msd.codigo_msd,CONCAT(msd.codigo_materia,'_',m.descripcion) AS materia,
              CONCAT(msd.cedula_docente,'_',p.nombres,' ',p.apellidos) AS docente  
              FROM tmateria_seccion_docente msd 
              INNER JOIN tmateria m ON msd.codigo_materia = m.codigo_materia 
              INNER JOIN tpersona p ON msd.cedula_docente = p.cedula 
              WHERE msd.seccion = '$seccion' 
              ORDER BY msd.codigo_msd ASC";
              $query = $mysql->Ejecutar($sql);
              $con=0;
              $id_msd = "";
              while ($row = $mysql->Respuesta($query)){
                $id_msd .= $row['codigo_msd']."_";
                echo "<tr id='$con'>";
                echo "<td><input type='hidden' name='codigo_msds[]' id='codigo_msd_".$con."' value='".$row['codigo_msd']."' /><input type='hidden' name='oldmateria[]' id='oldmateria_".$con."' value='".$row['materia']."'><input type='text' name='materias[]' id='materia_".$con."' onKeyPress='return ACDataGridPorFiltro(this.id,\"materiaporfiltro.php\",[&#39;grado_escolar&#39;])' onKeyUp='this.value=this.value.toUpperCase()' title='Seleccione una materia' placeholder='Seleccione una materia' class='campoTexto' value='".$row['materia']."'/></td>";
                echo "<td><input type='hidden' name='olddocente[]' id='olddocente_".$con."' value='".$row['docente']."'><input type='text' name='docentes[]' id='docente_".$con."' onKeyPress='return ACDataGrid(this.id,\"docente.php\")' onKeyUp='this.value=this.value.toUpperCase()' title='Seleccione un docente' placeholder='Seleccione un docente' class='campoTexto' value='".$row['docente']."'/></td>";
                echo "<td><button type='button' class='boton' onclick='elimina_me(".$con.")'><i class='icon-minus'></i></button></td>";
                echo "</tr>";
                $con++;
              }
              $id_msd=substr($id_msd,0,-1);
              echo "<input type='hidden' name='oldcodigo_msd' value='$id_msd' />";
            ?>
          </table>
          <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
        </div>    
        <br><br>
        <?php echo '<p class="'.$estatus.'" id="estatus_registro">'.$estatus.'</p>'; 
          imprimir_boton($disabledRC,$disabledMD,$estatus,$servicios);
        ?>  
      </fieldset>
    </form>
    <script type="text/javascript">
      var materias = document.getElementsByName('materias[]');
      var docentes = document.getElementsByName('docentes[]');
      var contador=materias.length;
        function agrega_campos(){
            $("#tablaMaterias").append("<tr id='"+contador+"' >"+
            "<td><input type='hidden' name='codigo_msds[]' id='codigo_msd_"+contador+"' /><input type='hidden' name='oldmateria[]' id='oldmateria_"+contador+"' /><input type='text' name='materias[]' id='materia_"+contador+"' onKeyPress='return ACDataGridPorFiltro(this.id,\"materiaporfiltro.php\",[&#39;grado_escolar&#39;])' onKeyUp='this.value=this.value.toUpperCase()' title='Seleccione una materia' placeholder='Seleccione una materia' class='campoTexto'/></td>"+
            "<td><input type='hidden' name='olddocente[]' id='olddocente_"+contador+"' /><input type='text' name='docentes[]' id='docente_"+contador+"' onKeyPress='return ACDataGrid(this.id,\"docente.php\")' onKeyUp='this.value=this.value.toUpperCase()' title='Seleccione un docente' placeholder='Seleccione un docente' class='campoTexto'/></td>"+
            "<td><button type='button' class='boton' onclick='elimina_me("+contador+")'><i class='icon-minus'></button></td>"+
            "</tr>");
            $('#materia_'+contador)
            contador++;
        }
        function elimina_me(elemento){
          $("#"+elemento).remove();
          for(var i=0;i<materias.length;i++){
            materias[i].removeAttribute('id');
            docentes[i].removeAttribute('id');
          }
          for(var i=0;i<materias.length;i++){
            materias[i].setAttribute('id','materia_'+i);
            docentes[i].setAttribute('id','docente_'+i);
          }
        }
    </script>
    <br>
  <?php
    }else{ 
    require_once("../clases/class_perfil.php");
    $perfil=new Perfil();
    $perfil->codigo_perfil(@$_SESSION['user_codigo_perfil']);
    $servicios_permitidos=$perfil->IMPRIMIR_SERVICIOS_USUARIO();
    $servicio_solicitado=strtolower(preg_replace('/(serv_)|(\.php)/','',basename(__FILE__))); 
  ?>
    <a href="?seccion" ><img src="../images/cerrar.png" alt="Cerrar" style="width:40px;heigth:40px;float:right;"></a>
    <a href="../excel/excel_seccion.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
    <a href="<?php echo  '../pdf/?serv='.$servicio_solicitado;?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
    <table class="table table-striped table-bordered table-condensed">
      <tr> 
        <td>Código Sección</td>
        <td>Sección</td>
        <td>Turno</td>
        <td>Grado Escolar</td>
        <td>Capacidad Mínima</td>
        <td>Capacidad Máxima</td>
      </tr>
      <?php
        //Conexión a la base de datos 
        require_once("../clases/class_bd.php");
        $mysql=new Conexion();
        //Sentencia sql (sin limit) 
        $_pagi_sql = "SELECT seccion,descripcion,CASE turno WHEN 'M' THEN 'MAÑANA' ELSE 'TARDE' END AS turno, 
        capacidad_max,capacidad_min,
        CASE grado_escolar WHEN '1' THEN '1er Año' WHEN '2' THEN '2do Año' WHEN '3' THEN '3er Año' WHEN '4' THEN '4to Año' WHEN '5' THEN '5to Año' WHEN '6' THEN '6to Año' END AS grado_escolar
        FROM tseccion where fecha_desactivacion is null order by seccion desc";  
        //Booleano. Define si se utiliza pg_num_rows() (true) o COUNT(*) (false).
        $_pagi_conteo_alternativo = true;
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
          echo "<tr style='cursor: pointer;' id='".$row['seccion']."' onclick='enviarForm(this.id)'>
          <td style='width:20%;'>".$row['seccion']."</td>
          <td align='left'>".$row['descripcion']."</td>
          <td align='left'>".$row['turno']."</td>
          <td align='left'>".$row['grado_escolar']."</td>
          <td align='left'>".$row['capacidad_min']."</td>
          <td align='left'>".$row['capacidad_max']."</td></tr>"; 
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
    <form id="form1" method="POST" action="../controladores/cont_seccion.php">
      <input type="hidden" name="seccion" id="campo_oculto" value="" />
      <input type="hidden" name="operacion" id="operacion" value="Consultar" />
    </form>
    <div class="pagination">
      <ul>
        <?php echo"<li>".$_pagi_navegacion."</li>";?>
      </ul>
    </div>
  <?php }?>
</div>