<?php
include_once("../clases/class_seccion.php");
$seccion=new Seccion();
  if(isset($_GET['codigo_seccion'])){
    $seccion_mostrar=$_GET['codigo_seccion'];
    $codigo_seccion = explode("_", $_GET['codigo_seccion']);
    $seccion=$codigo_seccion[0];
  }else{
    @$seccion=null;
    @$seccion_mostrar=null;
  }
  if(isset($_GET['codigo_materia'])){
    $materia_mostrar=$_GET['codigo_materia'];
    $materia = explode("_", $_GET['codigo_materia']);
    $codigo_materia=$materia[0];
  }else{
    @$codigo_materia=null;
    @$materia_mostrar=null;
  }
?>
<div class="form_externo" >
  <script type="text/javascript">
    $(document).ready(function(){
      $('#seccion').autocomplete({
        source:'../autocomplete/seccion.php', 
        minLength:1
      });
      $('#codigo_materia').autocomplete({
        source:'../autocomplete/materia.php', 
        minLength:1
      });
    });
    function reload_page(){
      seccion = document.getElementById('seccion').value;
      codigo_materia = document.getElementById('codigo_materia').value;
      location.href="index.php?asignar_notas&codigo_seccion="+seccion+"&codigo_materia="+codigo_materia;
    }
  </script>
  <form action="../controladores/cont_seccion.php" method="post" id="form">
    <fieldset>
      <legend>Asignación de Notas</legend>
      <center>
      <div class="row">
        <div class="span6">
          <label>Sección:</label>
          <input tabindex=2 title="Seleccione una sección" onKeyUp="this.value=this.value.toUpperCase()" name="seccion" id="seccion" type="text" size="50" value="<?= $seccion_mostrar;?>" placeholder="Seleccione una sección" class="campoTexto" />
        </div>
        <div class="span6">
          <label>Materia:</label>
          <input tabindex=2 title="Seleccione una materia" onKeyUp="this.value=this.value.toUpperCase()" name="codigo_materia" id="codigo_materia" type="text" size="50" value="<?= $materia_mostrar;?>" placeholder="Seleccione una materia" class="campoTexto" />
        </div>
      </div>
      </center>
      <input type="button" class="btn btn-primary" value="Buscar" onclick="reload_page()">
      <input type="button" class="btn btn-primary" value="Limpiar" onclick="limpiar()">
      <br>
      <input type="hidden" name="operacion" value="Asignar_Notas" id="operacion" />
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
        </tr>
        <?php
          //Conexión a la base de datos 
          require_once("../clases/class_bd.php");
          $mysql=new Conexion();
          $stringClause="WHERE msd.cedula_docente = '".$_SESSION['user_cedula']."' ";
          if($seccion!="" && $codigo_materia!="")
            $stringClause.="AND s.seccion = '$seccion' AND m.codigo_materia = '$codigo_materia'";
          if($seccion!="" && $codigo_materia=="")
            $stringClause.="AND s.seccion = '$seccion'";
          if($seccion=="" && $codigo_materia!="")
            $stringClause.="AND m.codigo_materia = '$codigo_materia'";
          //Sentencia sql (sin limit) 
          $_pagi_sql = "SELECT msd.codigo_msd,pi.cedula_estudiante,
          CONCAT(pi.cedula_estudiante,' ',p.nombres,' ',p.apellidos) AS estudiante,
          s.descripcion AS seccion, CONCAT(msd.codigo_materia,' ',m.descripcion) AS materia,
          (SELECT codigo_lapso FROM tlapso WHERE CURDATE() BETWEEN fecha_inicio AND fecha_fin+interval 15 day) AS codigo_lapso,
          (SELECT descripcion FROM tlapso WHERE CURDATE() BETWEEN fecha_inicio AND fecha_fin+interval 15 day) AS lapso,
          COALESCE(cn.notafinal,0) AS notafinal
          FROM tmateria_seccion_docente msd 
          INNER JOIN tseccion s ON msd.seccion = s.seccion 
          INNER JOIN tmateria m ON m.codigo_materia = msd.codigo_materia 
          INNER JOIN tproceso_inscripcion pi ON msd.seccion = pi.seccion 
          INNER JOIN tpersona p ON pi.cedula_estudiante = p.cedula 
          LEFT JOIN tcontrol_notas cn ON msd.codigo_msd = cn.codigo_msd 
          $stringClause
          ORDER BY msd.codigo_msd,s.seccion,m.descripcion,p.cedula ASC"; 
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
          echo "<tr>
          <td style='width: 5%; text-align:center;'><input id='msd_".$con."' type='checkbox' name='msd[]' value='".$row['codigo_msd']."'></td>
          <td style='width: 15%'><input name='estudiante[]' id='estudiante_".$con."' type='hidden' value='".$row['cedula_estudiante']."'/>".$row['estudiante']."</td>
          <td align='left'>".$row['seccion']."</td>
          <td align='left'>".$row['materia']."</td>
          <td align='left'><input name='lapso[]' id='lapso_".$con."' type='hidden' value='".$row['codigo_lapso']."'/>".$row['lapso']."</td>
          <td align='left'><input maxlength=2 title='Ingrese la nota del estudiante' onKeyUp='validarNota(this)' onKeyPress='return isNumberKey(event)' name='notas[]' id='nota_".$con."' type='text' placeholder='Ingrese la nota del estudiante' value='".$row['notafinal']."' /></td>
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

    function validarNota(obj){
      if(obj.value!=""){
        if(parseInt(obj.value)<=20){
          return true;
        }
        else{
          alert("¡La nota a ingresar debe ser de 0 a 20!");
          obj.value=obj.value.slice(0,-1);
          return false;
        }
      }
      else
        return true;
    }

  </script>
</div>