<div class="form_externo" >
  <form action="../controladores/cont_procesoinscripcion.php" method="post" id="form">
    <fieldset>
      <legend>Asignación de Secciones</legend>
      <input type="hidden" name="operacion" value="Asignar_Seccion" id="operacion" />
      Todos&nbsp;&nbsp;<input onclick=seleccionar_todos(true) type='checkbox' name='todos' id='todos'/> 
      / Ninguno&nbsp;&nbsp;<input onclick=seleccionar_todos(false) type='checkbox' name='ninguno' id='ninguno'/>
      <table class="table table-striped table-bordered table-condensed">
        <tr> 
          <td>Seleccione</td>
          <td>Sección</td>
          <td>Estudiante </td>
          <td>Género</td>
          <td>Edad</td>
          <td>Peso</td>
          <td>Talla</td>
        </tr>
        <?php
          //Conexión a la base de datos 
          require_once("../clases/class_bd.php");
          $mysql=new Conexion();
          //Sentencia sql (sin limit) 
          $_pagi_sql = "SELECT pi.cedula_estudiante,CONCAT(pi.cedula_estudiante,' - ',p.nombres,' ',p.apellidos) AS estudiante,
          TIMESTAMPDIFF(YEAR, p.fecha_nacimiento, CURDATE()) AS edad,CASE p.genero WHEN 'F' THEN 'FEMENINO' ELSE 'MASCULINO' END AS genero,
          pi.peso,pi.estatura AS talla  
          FROM tproceso_inscripcion pi 
          INNER JOIN tpersona p ON pi.cedula_estudiante = p.cedula  
          WHERE pi.seccion IS NULL 
          ORDER BY codigo_procesoinscripcion ASC"; 
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
          <td style='width: 5%; text-align:center;'><input id='estudiante_".$con."' type='checkbox' name='estudiantes[]' value='".$row['cedula_estudiante']."'></td>
          <td style='width: 10%'><input title='Seleccione una sección' onKeyPress='return ACDataGrid(this.id,\"seccion.php\")' onKeyUp='this.value=this.value.toUpperCase()' name='secciones[]' id='seccion_".$con."' type='text' placeholder='Seleccione una sección'/></td>
          <td align='left'>".$row['estudiante']."</td>
          <td align='left'>".$row['genero']."</td>
          <td align='left'>".$row['edad']."</td>
          <td align='left'>".$row['peso']."</td>
          <td align='left'>".$row['talla']."</td>
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