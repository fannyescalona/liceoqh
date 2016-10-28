<?php
  require_once("../clases/class_bd.php");
  include_once("../clases/class_seccion.php");
  $seccion=new Seccion();
  if(isset($_GET['codigo_seccion']) && $_GET['codigo_seccion']!="0"){
    $seccion=$_GET['codigo_seccion'];
  }else{
    @$seccion=null;
  }
  if(isset($_GET['cedula_estudiante'])){
    $estudiante_mostrar=$_GET['cedula_estudiante'];
    $estudiante = explode("_", $_GET['cedula_estudiante']);
    $cedula_estudiante=$estudiante[0];
  }else{
    @$cedula_estudiante=null;
    @$estudiante_mostrar=null;
  }
  $mysql=new Conexion();
  $sql = "SELECT carga_nota_abierta,nota_aprobacion
  FROM tconfiguracion_negocio WHERE fecha_desactivacion IS NULL";
  $nota_aprobacion = 0;
  $query = $mysql->Ejecutar($sql);
  if($mysql->Total_Filas($query)==0)
    $carga_nota_abierta='N';
  while ($row = $mysql->Respuesta($query)){
    $carga_nota_abierta=$row['carga_nota_abierta'];
    $nota_aprobacion = $row['nota_aprobacion'];
  }
  if($carga_nota_abierta=="N"){
    echo "<strong class='obligatorio'>¡No es posible cargar el formulario, ya que la Carga de Notas esta cerrado!</strong>";
    }
  else{
  ?>
  <script type="text/javascript">
    $(document).ready(function(){
      $('#seccion').autocomplete({
        source:'../autocomplete/seccion.php', 
        minLength:1
      });
      $('#cedula_estudiante').autocomplete({
        source:'../autocomplete/estudianteevaluado.php?cedula_docente='+$('#cedula_docente').val()+'&seccion='+$('#seccion').val(), 
        minLength:1
      });
    });
    function reload_page(){
      seccion = document.getElementById('seccion').value;
      cedula_estudiante = document.getElementById('cedula_estudiante').value;
      location.href="index.php?aplicar_notas&codigo_seccion="+seccion+"&cedula_estudiante="+cedula_estudiante;
    }
  </script>
<div class="form_externo">
  <form action="../controladores/cont_seccion.php" method="post" id="form">
    <fieldset>
      <legend>Aplicar Notas Finales <br> Docente: <?php echo $_SESSION['fullname_user']; ?></legend>
      <center>
        <div class="row">
          <div class="span6">
            <label>Sección:</label>
            <input type="hidden" name="cedula_docente" id="cedula_docente" value="<?php echo $_SESSION['user_cedula'];?>"></input>
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
          </div>
          <div class="span6">
            <label>Estudiante:</label>
            <input tabindex=2 title="Seleccione un estudiante" onKeyUp="this.value=this.value.toUpperCase()" name="cedula_estudiante" id="cedula_estudiante" type="text" size="50" value="<?= $estudiante_mostrar;?>" placeholder="Seleccione un estudiante" class="campoTexto" />
          </div>
        </div>
      </center>
      <input type="button" class="btn btn-primary" value="Buscar" onclick="reload_page()">
      <input type="button" class="btn btn-primary" value="Limpiar" onclick="limpiar()">
      <br>
      <input type="hidden" name="operacion" value="Aplicar_Notas" id="operacion" />
      Todos&nbsp;&nbsp;<input onclick=seleccionar_todos(true) type='checkbox' name='todos' id='todos'/> 
      / Ninguno&nbsp;&nbsp;<input onclick=seleccionar_todos(false) type='checkbox' name='ninguno' id='ninguno'/>
      <table class="table table-striped table-bordered table-condensed">
        <tr> 
          <td>Seleccione</td>
          <td>Estudiante</td>
          <td>Sección</td>
          <td>Materia</td>
          <td>Lapso</td>
          <td>Nota</td>
          <td>Aprobado</td>
        </tr>
        <?php
          //Conexión a la base de datos 
          require_once("../clases/class_bd.php");
          $mysql=new Conexion();
          $stringClause="WHERE msd.cedula_docente = '".$_SESSION['user_cedula']."' ";
          if($seccion!="" && $cedula_estudiante!="")
            $stringClause.="AND msd.seccion = '$seccion' AND an.cedula_estudiante = '$cedula_estudiante'";
          if($seccion!="" && $cedula_estudiante=="")
            $stringClause.="AND msd.seccion = '$seccion'";
          if($seccion=="" && $cedula_estudiante!="")
            $stringClause.="AND an.cedula_estudiante = '$cedula_estudiante'";
          //Sentencia sql (sin limit) 
          $_pagi_sql = "SELECT msd.codigo_msd,an.cedula_estudiante,
          CONCAT(an.cedula_estudiante,' ',p.nombres,' ',p.apellidos) AS estudiante,
          s.descripcion AS seccion, CONCAT(msd.codigo_materia,' ',m.descripcion) AS materia,pe.codigo_lapso,CONCAT(l.descripcion,' (',aa.descripcion,')') AS lapso,ROUND(AVG(notaobtenida),2) AS notafinal 
          FROM tmateria_seccion_docente msd 
          INNER JOIN tseccion s ON msd.seccion = s.seccion 
          INNER JOIN tmateria m ON msd.codigo_materia = m.codigo_materia 
          INNER JOIN tplan_evaluacion pe ON msd.codigo_msd = pe.codigo_msd 
          INNER JOIN tlapso l ON pe.codigo_lapso = l.codigo_lapso 
          INNER JOIN tano_academico aa ON l.codigo_ano_academico = aa.codigo_ano_academico 
          INNER JOIN tasignacion_nota an ON pe.codigo_plan_evaluacion = an.codigo_plan_evaluacion 
          INNER JOIN tpersona p ON an.cedula_estudiante = p.cedula 
          $stringClause  
          GROUP BY msd.codigo_msd,an.cedula_estudiante,an.cedula_estudiante,p.nombres,p.apellidos,s.descripcion,msd.codigo_materia,m.descripcion,pe.codigo_lapso,l.descripcion,aa.descripcion 
          ORDER BY pe.codigo_lapso,msd.seccion,msd.codigo_materia,an.cedula_estudiante ASC"; 
          //cantidad de resultados por página (opcional, por defecto 20) 
          $_pagi_cuantos = 10; 
          //Cadena que separa los enlaces numéricos en la barra de navegación entre páginas.
          $_pagi_separador = " ";
          //Cantidad de enlaces a los números de página que se mostrarán como máximo en la barra de navegación.
          $_pagi_nav_num_enlaces=5;
          //Incluimos el script de paginación. Éste ya ejecuta la consulta automáticamente 
          @include("../librerias/paginador/paginator.inc.php"); 
          //Leemos y escribimos los registros de la página actual 
          $con=0;
          while($row = mysql_fetch_array($_pagi_result)){ 
            $aprobado = $row['notafinal']>=$nota_aprobacion ? 'Y' : 'N';
            $texto_aprobado = $row['notafinal']>=$nota_aprobacion ? 'Sí' : 'No';
          echo "<tr>
          <td style='width: 5%; text-align:center;'><input id='msd_".$con."' type='checkbox' name='msd[]' value='".$row['codigo_msd']."'></td>
          <td style='width: 15%'><input name='estudiante[]' id='estudiante_".$con."' type='hidden' value='".$row['cedula_estudiante']."'/>".$row['estudiante']."</td>
          <td>".$row['seccion']."</td>
          <td>".$row['materia']."</td>
          <td><input name='lapso[]' id='lapso_".$con."' type='hidden' value='".$row['codigo_lapso']."'/>".$row['lapso']."</td>
          <td><input name='notas[]' id='nota_".$con."' type='hidden' value='".$row['notafinal']."' /><span align='right'>".$row['notafinal']."</span></td>
          <td><input name='aprobados[]' id='aprobado_".$con."' type='hidden' value='".$aprobado."' /><span align='center'>".$texto_aprobado."</span></td>
          </tr>"; 
          $con++;
          } 
          //Incluimos la barra de navegación 
        ?>
      </table>
      <button type="submit" id="btnGuardar" class="btn btn-large btn-primary"><i class="icon-hdd"></i>&nbsp;Procesar</button>
      <div class="pagination">
        <ul>
          <?php echo"<li>".$_pagi_navegacion."</li>";?>
        </ul>
      </div>
    </fieldset>
  </form>
  <script type="text/javascript">
    function seleccionar_todos(param){
      var t=document.getElementsByTagName('input');
      for(i=0;i<t.length;i++){
        if(t[i].type=='checkbox')
          t[i].checked=param; 
      }
      document.getElementById('todos').checked=true;
      if(param==true){
        document.getElementById('todos').checked=true;
        document.getElementById('ninguno').checked=false;
      }else{
        document.getElementById('todos').checked=false;
        document.getElementById('ninguno').checked=true;
      }         
    }
  </script>
</div> 
</div>
<?php
  }
?>