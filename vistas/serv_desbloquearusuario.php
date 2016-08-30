<div class="form_externo" >
  <form action="../controladores/cont_desbloquearusuario.php" method="post" id="form">
    <fieldset>
      <legend>Desbloquear Usuario</legend>
      <input type="hidden" name="operacion" value="DesbloquearUsuario" id="operacion" />
      Todos&nbsp;&nbsp;<input onclick=seleccionar_todos(true) type='checkbox' name='todos' id='todos'/> 
      / Ninguno&nbsp;&nbsp;<input onclick=seleccionar_todos(false) type='checkbox' name='ninguno' id='ninguno'/>
      <table class="table table-striped table-bordered table-condensed">
        <tr> 
          <td>Seleccione</td>
          <td>Nombre de Usuario</td>
          <td>Cédula</td>
          <td>Nombres y Apellidos</td>
          <td>Fecha de Bloqueo</td>
          <td>Intentos Realizados</td>
        </tr>
        <?php
          //Conexión a la base de datos 
          require_once("../clases/class_bd.php");
          $mysql=new Conexion();
          //Sentencia sql (sin limit) 
          $_pagi_sql = "SELECT u.nombre_usuario,u.cedula,INITCAP(CONCAT(p.nombres,' ',p.apellidos)) AS nombre,
		  c.fecha_modificacion,u.intento_fallido 
		  FROM tusuario u 
		  INNER JOIN tpersona p ON u.cedula = p.cedula 
		  INNER JOIN tcontrasena c ON u.nombre_usuario = c.nombre_usuario 
		  WHERE c.estado = 4 
		  ORDER BY c.fecha_modificacion ASC"; 
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
          <td style='width: 5%; text-align:center;'><input id='bloqueado_".$con."' type='checkbox' name='bloqueados[]' value='".$row['nombre_usuario']."'></td>
          <td align='left'>".$row['nombre_usuario']."</td>
          <td align='left'>".$row['cedula']."</td>
          <td align='left'>".$row['nombre']."</td>
          <td align='left'>".$row['fecha_modificacion']."</td>
          <td align='left'>".$row['intento_fallido']."</td>
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
      var e=document.getElementsByName('bloqueados[]');
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