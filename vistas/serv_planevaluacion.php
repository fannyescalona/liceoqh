<div class="form_externo" >
  <?php
    require_once("../clases/class_bd.php");
    if(isset($_SESSION['datos']['codigo_msd'])){ 
      $disabledRC='disabled';
      $disabledMD='';
      $estatus=null;
    }else {
      $disabledRC='';
      $disabledMD='disabled';
    }
    $servicios='planevaluacion';
    if(isset($_SESSION['datos'])){
      @$seccion=$_SESSION['datos']['seccion'];
      @$materia=$_SESSION['datos']['materia'];
      @$codigo_materia=$_SESSION['datos']['codigo_materia'];
      @$codigo_msd=$_SESSION['datos']['codigo_msd'];
      @$codigo_lapso=$_SESSION['datos']['codigo_lapso'];
      @$estatus=$_SESSION['datos']['estatus'];
    }
    else{
      @$seccion=null;
      @$materia=null;
      @$codigo_materia=null;
      @$codigo_msd=null;
      @$codigo_lapso=null;
      @$estatus=null;
    }
  ?>
  <br><br>
  <?php if(!isset($_GET['l'])){?>
    <script src="../js/uds_planevaluacion.js"> </script>
    <form action="../controladores/cont_planevaluacion.php" method="post" id="form">
      <fieldset>
        <legend>Plan de Evaluación</legend>
        <div id="contenedorFormulario">
          <label>Docente: <?php echo $_SESSION['fullname_user']; ?></label>
          <input type="hidden" name="cedula_docente" id="cedula_docente" value="<?= $_SESSION['user_cedula'];?>" required />
          <label>Sección:</label>
          <select name="seccion" id="seccion" title="Seleccione una sección" required="" class="campoTexto"/>
            <option value='0'>Seleccione una sección</option>
            <?php
              require_once("../clases/class_bd.php");
              $mysql=new Conexion();
              $sql = "SELECT DISTINCT s.seccion,upper(s.descripcion) descripcion FROM tseccion s 
              INNER JOIN tmateria_seccion_docente msd ON s.seccion = msd.seccion 
              WHERE s.fecha_desactivacion IS NULL AND msd.cedula_docente = '".$_SESSION['user_cedula']."' 
              ORDER BY s.seccion";
              $query = $mysql->Ejecutar($sql);
              while ($row = $mysql->Respuesta($query)){
                if($row['seccion']==$seccion){
                  echo "<option value='".$row['seccion']."' selected>".$row['descripcion']."</option>";
                }else{
                  echo "<option value='".$row['seccion']."'>".$row['descripcion']."</option>";
                }
              }
            ?>
          </select> 
          <label>Materia</label>
          <label id="materia"><?php echo $materia; ?></label>
          <input type="hidden" id="codigo_materia" name="codigo_materia" value="<?= $codigo_materia?>"/>
          <input type="hidden" name="codigo_msd" id="codigo_msd" value="<?= $codigo_msd;?>" />
          <label>Lapso Académico:</label>
          <select name="codigo_lapso" id="codigo_lapso" title="Seleccione un lapso académico" required="" class="campoTexto"/>
            <option value='0'>Seleccione un lapso</option>
            <?php
              require_once("../clases/class_bd.php");
              $mysql=new Conexion();
              $sql = "SELECT l.codigo_lapso, CONCAT(l.descripcion,' (',aa.descripcion,')') AS descripcion 
              FROM tlapso l 
              INNER JOIN tano_academico aa ON l.codigo_ano_academico = aa.codigo_ano_academico  
              WHERE l.fecha_desactivacion IS NULL AND aa.cerrado = 'N' 
              ORDER BY l.fecha_inicio,l.fecha_fin ASC";
              $query = $mysql->Ejecutar($sql);
              while ($row = $mysql->Respuesta($query)){
                if($row['codigo_lapso']==$codigo_lapso){
                  echo "<option value='".$row['codigo_lapso']."' selected>".$row['descripcion']."</option>";
                }else{
                  echo "<option value='".$row['codigo_lapso']."'>".$row['descripcion']."</option>";
                }
              }
            ?>
          </select>
          <br/>
          <table id='tablaPlanEvaluacion' class="table-bordered zebra-striped">
            <tr>
              <td><center><label class="control-label" >Descripción:</label></center></td>
              <td><center><label class="control-label" >% Nota:</label></center></td>
              <td><center><button type="button" onclick="agrega_campos()" class="boton"><i class="icon-plus"></i></button></center></td>
            </tr>
            <?php
              $mysql=new Conexion();
              $sql = "SELECT pe.codigo_plan_evaluacion,pe.descripcion,pe.codigo_lapso,pe.porcentaje 
              FROM tplan_evaluacion pe 
              INNER JOIN tmateria_seccion_docente msd ON pe.codigo_msd = msd.codigo_msd 
              INNER JOIN tlapso l ON pe.codigo_lapso = l.codigo_lapso 
              WHERE pe.codigo_msd = $codigo_msd 
              ORDER BY pe.codigo_plan_evaluacion ASC";
              $query = $mysql->Ejecutar($sql);
              $con=0;
              while ($row = $mysql->Respuesta($query)){
                echo "<tr id='$con'>";
                echo "<td><input type='hidden' name='codigo_plan_evaluaciones[]' id='codigo_plan_evaluacion_".$con."' value='".$row['codigo_plan_evaluacion']."' /><input type='text' onKeyUp='this.value=this.value.toUpperCase()' name='descripciones[]' id='descripcion_".$con."' title='Ingrese una descripción' placeholder='Ingrese una descripción' class='campoTexto' value='".$row['descripcion']."'/></td>";
                echo "<td><input type='text' onKeyPress='return isNumberKey(event)' name='porcentajes[]' id='porcentaje_".$con."' title='Ingrese el porcentaje de la unidad' placeholder='Ingrese el porcentaje de la unidad' class='campoTexto' value='".$row['porcentaje']."'/></td>";
                echo "<td><button type='button' class='boton' onclick='elimina_me(".$con.")'><i class='icon-minus'></i></button></td>";
                echo "</tr>";
                $con++;
              }
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
      var codigo_plan_evaluaciones = document.getElementsByName('codigo_plan_evaluaciones[]');
      var descripciones = document.getElementsByName('descripciones[]');
      var porcentajes = document.getElementsByName('porcentajes[]');
      var contador=codigo_plan_evaluaciones.length;
        function agrega_campos(){
            $("#tablaPlanEvaluacion").append("<tr id='"+contador+"' >"+
            "<td><input type='hidden' name='codigo_plan_evaluaciones[]' id='codigo_plan_evaluacion_"+contador+"' /><input type='text' onKeyUp='this.value=this.value.toUpperCase()' name='descripciones[]' id='descripcion_"+contador+"' title='Ingrese una descripción' placeholder='Ingrese una descripción' class='campoTexto'/></td>"+
            "<td><input type='text' onKeyPress='return isNumberKey(event)' name='porcentajes[]' id='porcentaje_"+contador+"' title='Ingrese el porcentaje de la unidad' placeholder='Ingrese el porcentaje de la unidad' class='campoTexto' value='0'/></td>"+
            "<td><button type='button' class='boton' onclick='elimina_me("+contador+")'><i class='icon-minus'></button></td>"+
            "</tr>");
            contador++;
        }
        function elimina_me(elemento){
          $("#"+elemento).remove();
          for(var i=0;i<codigo_plan_evaluaciones.length;i++){
            codigo_plan_evaluaciones[i].removeAttribute('id');
            descripciones[i].removeAttribute('id');
            porcentajes[i].removeAttribute('id');
          }
          for(var i=0;i<codigo_plan_evaluaciones.length;i++){
            codigo_plan_evaluaciones[i].setAttribute('id','codigo_plan_evaluacion_'+i);
            descripciones[i].setAttribute('id','descripcion_'+i);
            porcentajes[i].setAttribute('id','porcentaje_'+i);
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
    <form id="form1" method="POST" action="../controladores/cont_planevaluacion.php">
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