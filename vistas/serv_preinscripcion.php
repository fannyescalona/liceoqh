<script type="text/javascript">
  $(document).ready(init);
  function init(){
    $("td[id=cedula]").map(function(){
        $(this).click(function(){
            alertDGC(document.getElementById('info'),'./?inscribir_pre_inscripcion');
            buscarInfo($('#ci_'+$(this).attr('name')).val());
        })
    });

    function buscarInfo(value){
      var Datos = {"operacion": "BuscarInfo", "cedula": value};
        $.ajax({
          url: '../controladores/cont_preinscripcion.php',
          type: 'POST',
          async: true,
          data: Datos,
          dataType: 'JSON',
          success: function(resp){
            $('#ci').text(resp[0].cedula);
            $('#nombre').text(resp[0].nombre_completo);
            $('#fecha_nac').text(resp[0].fecha_nacimiento);
            $('#email').text(resp[0].email);
            $('#sexo').text(resp[0].sexo);
            $('#edocivil').text(resp[0].edocivil);
            $('#tlf_fijo').text(resp[0].telefono_fijo);
            $('#tlf_movil').text(resp[0].telefono_movil);
            $('#direccionhab').text(resp[0].direccionhab);
            $('#direccionresid').text(resp[0].direccionresid);
            $('#modalidadingreso').text(resp[0].modalidad_ingreso);
            $('#modalidadestudio').text(resp[0].modalidad_estudio);
            $('#turno').text(resp[0].turno);
            $('#carrera').text(resp[0].carrera);
          },
          error: function(){
            alert("¡Error al procesar la petición!");
          }
        });
    }
  }

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
<?php
  if($_SERVER['REQUEST_URI']=="/udesur/vistas/?actualizar_pre_inscripcion" || $_SERVER['REQUEST_URI']=="/udesur/vistas/index.php?actualizar_pre_inscripcion"){
?>
<div class="form_externo" >
    <fieldset style="padding: 30px">
      <legend>Listado de Preinscritos</legend>
        <form action="../controladores/cont_preinscripcion.php" method="post" id="form">
          Todos&nbsp;&nbsp;<input onclick=seleccionar_todos(true) type='checkbox' name='todos' id='todos'/> 
          / Ninguno&nbsp;&nbsp;<input onclick=seleccionar_todos(false) type='checkbox' name='ninguno' id='ninguno'/>
          <a href="../excel/excel_preinscrito.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
          <a href="<?php echo  '../pdf/?serv=preinscrito'?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
          <table border="1" style="width: 100%" class="table table-striped table-bordered table-condensed">
            <tr>
              <td>Seleccione</td>
              <td>C&eacute;dula</td>
              <td>Nombres y Apellidos</td>
              <td>Fecha PreInscripci&oacute;n</td>
              <td>Carrera</td>
              <td>Estatus</td>
            </tr>
              <?php
                //Conexión a la base de datos 
                require_once("../clases/class_bd.php");
                $mysql=new Conexion();

                //Sentencia sql (sin limit) 
                $_pagi_sql = "SELECT pi.cod_preinscripcion,CASE pa.nombre_pais WHEN 'VENEZUELA' THEN CONCAT('V-',p.cedula) ELSE CONCAT('E-',p.cedula) END cedula, 
                CONCAT(p.nombres,' ',p.apellidos) nombre_estudiante,date_format(pi.fecha,'%d/%m/%Y') fecha,c.nombre_carrera,
                CASE pi.estatus WHEN '1' THEN 'PREINSCRITO' WHEN '2' THEN 'POR PRUEBAS' 
                WHEN '3' THEN 'SELECCIONADO' WHEN '4' THEN 'NO SELECCIONADO' ELSE 'INSCRITO' END estatus
                FROM tpersonas p 
                INNER JOIN tpais pa ON p.nacionalidad=pa.cod_pais 
                INNER JOIN tpre_inscripcion pi ON p.cedula = pi.cedula 
                INNER JOIN tcarrera c ON pi.cod_carrera = c.cod_carrera 
                WHERE pi.estatus = '1' AND NOT EXISTS (SELECT 1 FROM tproceso_inscripcion pis WHERE pis.cod_preinscripcion = pi.cod_preinscripcion) 
                ORDER BY pi.fecha,p.cedula,c.nombre_carrera DESC"; 
                //Booleano. Define si se utiliza pg_num_rows() (true) o COUNT(*) (false).
                $_pagi_conteo_alternativo = true;
                //cantidad de resultados por página (opcional, por defecto 20) 
                $_pagi_cuantos = 15; 
                //Cadena que separa los enlaces numéricos en la barra de navegación entre páginas.
                $_pagi_separador = " ";
                //Cantidad de enlaces a los números de página que se mostrarán como máximo en la barra de navegación.
                $_pagi_nav_num_enlaces=5;
                //Incluimos el script de paginación. Éste ya ejecuta la consulta automáticamente 
                @include("../librerias/paginador/paginator.inc.php"); 
                //Leemos y escribimos los registros de la página actual 
                while($row = mysql_fetch_array($_pagi_result)){ 
                  echo "<tr><td><center><input type='checkbox' name='preinscritos[]' value='".$row['cod_preinscripcion']."'></center></td>";
                  echo "<td>".$row['cedula']."</td>";
                  echo "<td>".$row['nombre_estudiante']."</td>";
                  echo "<td>".$row['fecha']."</td>";
                  echo "<td>".$row['nombre_carrera']."</td>";
                  echo "<td>".$row['estatus']."</td></tr>";
                }
              ?>
          </table>
          <table>
            <tr>
              <td colspan="2" style="padding-top:12px;padding-bottom:12px; ">
                <input type="hidden" name="operacion" value="PorPrueba" id="operacion" />
                <input type="submit" class="btn btn-primary" value="Procesar">         
              </td>
            </tr>
          </table>
          <div class="pagination">
            <ul>
              <?php echo"<li>".$_pagi_navegacion."</li>";?>
            </ul>
          </div>
       </form>
    </fieldset>
</div>
<?php
  }else if($_SERVER['REQUEST_URI']=="/udesur/vistas/?seleccionar_pre_inscripcion" || $_SERVER['REQUEST_URI']=="/udesur/vistas/index.php?seleccionar_pre_inscripcion"){
?>
<div class="form_externo" >
    <fieldset style="padding: 30px">
      <legend>Listado de Seleccionados Por Pruebas</legend>
        <form action="../controladores/cont_preinscripcion.php" method="post" id="form">
          Todos&nbsp;&nbsp;<input onclick=seleccionar_todos(true) type='checkbox' name='todos' id='todos'/> 
          / Ninguno&nbsp;&nbsp;<input onclick=seleccionar_todos(false) type='checkbox' name='ninguno' id='ninguno'/>
          <a href="../excel/excel_porprueba.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
          <a href="<?php echo  '../pdf/?serv=porprueba'?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
          <table border="1" style="width: 100%" class="table table-striped table-bordered table-condensed">
            <tr>
              <td>Seleccione</td>
              <td>C&eacute;dula</td>
              <td>Nombres y Apellidos</td>
              <td>Fecha PreInscripci&oacute;n</td>
              <td>Carrera</td>
              <td>Estatus</td>
            </tr>
              <?php
                //Conexión a la base de datos 
                require_once("../clases/class_bd.php");
                $mysql=new Conexion();

                //Sentencia sql (sin limit) 
                $_pagi_sql = "SELECT pi.cod_preinscripcion,CASE pa.nombre_pais WHEN 'VENEZUELA' THEN CONCAT('V-',p.cedula) ELSE CONCAT('E-',p.cedula) END cedula, 
                CONCAT(p.nombres,' ',p.apellidos) nombre_estudiante,date_format(pi.fecha,'%d/%m/%Y') fecha,c.nombre_carrera,
                CASE pi.estatus WHEN '1' THEN 'PREINSCRITO' WHEN '2' THEN 'POR PRUEBAS' 
                WHEN '3' THEN 'SELECCIONADO' WHEN '4' THEN 'NO SELECCIONADO' ELSE 'INSCRITO' END estatus
                FROM tpersonas p 
                INNER JOIN tpais pa ON p.nacionalidad=pa.cod_pais 
                INNER JOIN tpre_inscripcion pi ON p.cedula = pi.cedula 
                INNER JOIN tcarrera c ON pi.cod_carrera = c.cod_carrera 
                WHERE pi.estatus = '2' AND NOT EXISTS (SELECT 1 FROM tproceso_inscripcion pis WHERE pis.cod_preinscripcion = pi.cod_preinscripcion) 
                ORDER BY pi.fecha,p.cedula,c.nombre_carrera DESC"; 
                //Booleano. Define si se utiliza pg_num_rows() (true) o COUNT(*) (false).
                $_pagi_conteo_alternativo = true;
                //cantidad de resultados por página (opcional, por defecto 20) 
                $_pagi_cuantos = 15; 
                //Cadena que separa los enlaces numéricos en la barra de navegación entre páginas.
                $_pagi_separador = " ";
                //Cantidad de enlaces a los números de página que se mostrarán como máximo en la barra de navegación.
                $_pagi_nav_num_enlaces=5;
                //Incluimos el script de paginación. Éste ya ejecuta la consulta automáticamente 
                @include("../librerias/paginador/paginator.inc.php"); 
                //Leemos y escribimos los registros de la página actual 
                while($row = mysql_fetch_array($_pagi_result)){ 
                  echo "<tr><td><center><input type='checkbox' name='preinscritos[]' value='".$row['cod_preinscripcion']."'></center></td>";
                  echo "<td>".$row['cedula']."</td>";
                  echo "<td>".$row['nombre_estudiante']."</td>";
                  echo "<td>".$row['fecha']."</td>";
                  echo "<td>".$row['nombre_carrera']."</td>";
                  echo "<td>".$row['estatus']."</td></tr>";
                }
              ?>
          </table>
          <table>
            <tr>
              <td colspan="2" style="padding-top:12px;padding-bottom:12px; ">
                <input type="hidden" name="operacion" value="Seleccionado" id="operacion" />
                <input type="submit" class="btn btn-primary" value="Procesar">         
              </td>
            </tr>
          </table>
          <div class="pagination">
            <ul>
              <?php echo"<li>".$_pagi_navegacion."</li>";?>
            </ul>
          </div>
       </form>
    </fieldset>
</div>
<?php
  }else if($_SERVER['REQUEST_URI']=="/udesur/vistas/?inscribir_pre_inscripcion" || $_SERVER['REQUEST_URI']=="/udesur/vistas/index.php?inscribir_pre_inscripcion"){
?>
<div class="form_externo" >
    <fieldset style="padding: 30px">
      <legend>Listado de Seleccionados</legend>
        <form action="../controladores/cont_preinscripcion.php" method="post" id="form">
          Todos&nbsp;&nbsp;<input onclick=seleccionar_todos(true) type='checkbox' name='todos' id='todos'/> 
          / Ninguno&nbsp;&nbsp;<input onclick=seleccionar_todos(false) type='checkbox' name='ninguno' id='ninguno'/>
          <a href="../excel/excel_seleccionado.php" ><img src="../images/icon-excel.png" alt="Exportar a Excel" style="width:40px;heigth:40px;float:right;"></a>
          <a href="<?php echo  '../pdf/?serv=seleccionado'?>" target="_blank"><img src="../images/icon-pdf.png" alt="Exportar a PDF" style="width:40px;heigth:40px;float:right;margin:0.3em;margin-left:1em;"></a>
          <table border="1" style="width: 100%" class="table table-striped table-bordered table-condensed">
            <tr>
              <td>Seleccione</td>
              <td>C&eacute;dula</td>
              <td>Nombres y Apellidos</td>
              <td>Fecha PreInscripci&oacute;n</td>
              <td>Carrera</td>
              <td>Sección</td>
              <td>Estatus</td>
            </tr>
              <?php
                //Conexión a la base de datos 
                require_once("../clases/class_bd.php");
                $mysql=new Conexion();

                //Sentencia sql (sin limit) 
                $_pagi_sql = "SELECT pi.cod_preinscripcion,CASE pa.nombre_pais WHEN 'VENEZUELA' THEN CONCAT('V-',p.cedula) ELSE CONCAT('E-',p.cedula) END cedula, 
                CONCAT(p.nombres,' ',p.apellidos) nombre_estudiante,date_format(pi.fecha,'%d/%m/%Y') fecha,c.nombre_carrera,
                CASE pi.estatus WHEN '1' THEN 'PREINSCRITO' WHEN '2' THEN 'POR PRUEBAS' 
                WHEN '3' THEN 'SELECCIONADO' WHEN '4' THEN 'NO SELECCIONADO' ELSE 'INSCRITO' END estatus, p.cedula ci 
                FROM tpersonas p 
                INNER JOIN tpais pa ON p.nacionalidad=pa.cod_pais 
                INNER JOIN tpre_inscripcion pi ON p.cedula = pi.cedula 
                INNER JOIN tcarrera c ON pi.cod_carrera = c.cod_carrera 
                WHERE pi.estatus = '3' AND NOT EXISTS (SELECT 1 FROM tproceso_inscripcion pis WHERE pis.cod_preinscripcion = pi.cod_preinscripcion) 
                ORDER BY pi.fecha,p.cedula,c.nombre_carrera DESC"; 
                //Booleano. Define si se utiliza pg_num_rows() (true) o COUNT(*) (false).
                $_pagi_conteo_alternativo = true;
                //cantidad de resultados por página (opcional, por defecto 20) 
                $_pagi_cuantos = 15; 
                //Cadena que separa los enlaces numéricos en la barra de navegación entre páginas.
                $_pagi_separador = " ";
                //Cantidad de enlaces a los números de página que se mostrarán como máximo en la barra de navegación.
                $_pagi_nav_num_enlaces=5;
                //Incluimos el script de paginación. Éste ya ejecuta la consulta automáticamente 
                @include("../librerias/paginador/paginator.inc.php"); 
                //Leemos y escribimos los registros de la página actual 
                $pos=0;
                while($row = mysql_fetch_array($_pagi_result)){ 
                  $carrera = $row['nombre_carrera'];
                  echo "<tr><td><center><input type='checkbox' name='preinscritos[]' id='preinscrito_".$pos."' value='".$row['cod_preinscripcion']."'></center></td>";
                  echo "<td id='cedula' name='".$row['ci']."' style='cursor: pointer;'><input type='hidden' id='ci_".$row['ci']."' value='".$row['ci']."'/>".$row['cedula']."</td>";
                  echo "<td>".$row['nombre_estudiante']."</td>";
                  echo "<td>".$row['fecha']."</td>";
                  echo "<td>".$row['nombre_carrera']."</td>";
                  echo "<td><select name='secciones[".$row['cod_preinscripcion']."][]' id='seccion_".$pos."' title='Seleccione una sección' />
                  <option value=''>Seleccione una sección</option>";
                  $sql="SELECT s.seccion id, CONCAT(s.nombre_seccion,'(',MAX(s.capacidad_max)-COUNT(isec.seccion),')') name                         FROM tcarrera c 
                        INNER JOIN tano_academico a on c.cod_carrera = a.cod_carrera 
                        INNER JOIN tsemestre sem on a.cod_ano_academico = sem.cod_ano_academico 
                        INNER JOIN tseccion s on sem.cod_semestre = s.cod_semestre  
                        LEFT JOIN tinscrito_seccion isec on s.seccion = isec.seccion 
                        WHERE c.nombre_carrera = '$carrera' 
                        GROUP BY s.seccion,s.nombre_seccion 
                        ORDER BY MAX(s.capacidad_max)-COUNT(isec.seccion) DESC";
                  $query=mysql_query($sql);
                  while ($rows = mysql_fetch_array($query)) {
                    echo "<option value='".$rows['id']."'>".$rows['name']."</option>";
                  }
                  echo "</td>";
                  echo "<td>".$row['estatus']."</td></tr>";
                  $pos++;
                }
              ?>
          </table>
          <div id="info" style="display: none;">
            <table align="center" width="100%" class="table table-striped table-bordered table-condensed">
              <tr>
                <td>
                  <span class="lead">Cédula:</span>&nbsp;&nbsp;<span id="ci"></span>
                </td>
                <td>
                  <span class="lead">Nombre Completo:</span>&nbsp;&nbsp;<span id="nombre"></span>
                </td>
              </tr>
              <tr>
                <td>
                  <span class="lead">Fecha de Nacimiento:</span>&nbsp;&nbsp;<span id="fecha_nac"></span>
                </td>
                <td>
                  <span class="lead">Correo Electrónico:</span>&nbsp;&nbsp;<span id="email"></span>
                </td>
              </tr>
              <tr>
                <td>
                  <span class="lead">Género:</span>&nbsp;&nbsp;<span id="sexo"></span>
                </td>
                <td>
                  <span class="lead">Estado Civil:</span>&nbsp;&nbsp;<span id="edocivil"></span>
                </td>
              </tr>
              <tr>
                <td>
                  <span class="lead">Tlf. Fijo:</span>&nbsp;&nbsp;<span id="tlf_fijo"></span>
                </td>
                <td>
                  <span class="lead">Tlf. Móvil:</span>&nbsp;&nbsp;<span id="tlf_movil"></span>
                </td>
              </tr>
              <tr>
                <td>
                  <span class="lead">Dirección Habitación:</span>&nbsp;&nbsp;<span id="direccionhab"></span>
                </td>
                <td>
                  <span class="lead">Dirección Residencia:</span>&nbsp;&nbsp;<span id="direccionresid"></span>
                </td>
              </tr>
              <tr>
                <td>
                  <span class="lead">Modalidad de Ingreso:</span>&nbsp;&nbsp;<span id="modalidadingreso"></span>
                </td>
                <td>
                  <span class="lead">Modalidad de Estudio:</span>&nbsp;&nbsp;<span id="modalidadestudio"></span>
                </td>
              </tr>
              <tr>
                <td>
                  <span class="lead">Turno:</span>&nbsp;&nbsp;<span id="turno"></span>
                </td>
                <td>
                  <span class="lead">Programa de Formación:</span>&nbsp;&nbsp;<span id="carrera"></span>
                </td>
              </tr>
            </table>
          </div>
          <table>
            <tr>
              <td colspan="2" style="padding-top:12px;padding-bottom:12px; ">
                <input type="hidden" name="operacion" value="Inscribir" id="operacion" />
                <input type="submit" class="btn btn-primary" value="Procesar">         
              </td>
            </tr>
          </table>
          <div class="pagination">
            <ul>
              <?php echo"<li>".$_pagi_navegacion."</li>";?>
            </ul>
          </div>
       </form>
    </fieldset>
</div>
<?php
  }
?>