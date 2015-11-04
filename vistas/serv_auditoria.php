<?php
  if(isset($_GET['fecha_desde'])){
    $fecha_desde = $_GET['fecha_desde'];
  }else{
    @$fecha_desde=null;
  }
  if(isset($_GET['fecha_hasta'])){
    $fecha_hasta = $_GET['fecha_hasta'];
  }else{
    @$fecha_hasta=null;
  }
  if(isset($_GET['usuario'])) {
    $usuario = $_GET['usuario'];
  }else{
    @$usuario=null;
  }
  if(isset($_GET['operacion'])) {
    $operacion = $_GET['operacion'];
  }else{
    @$operacion=null;
  }
  
  
?>
<br>
<div class="form_externo"  style="margin:0 auto; padding:5px; width:100%;">
<script type="text/javascript">
  function reload_page(){
    fechad = document.getElementById('fecha_desde').value;
    fechah = document.getElementById('fecha_hasta').value;
    usuario = document.getElementById('usuario').value;
    operacion = document.getElementById('operacion').value;
    location.href="index.php?auditoria&fecha_desde="+fechad+"&fecha_hasta="+fechah+"&usuario="+usuario+"&operacion="+operacion;
  }
</script>
<fieldset>
  <legend>Auditoria </legend>
       <div id="contenedorFormulario">
        <div class="row">
          <div class="span6">
            <label>Fecha Desde:</label>
            <input name="fecha_desde" id="fecha_desde" type="text" value="<?= $fecha_desde;?>" title="Seleccione la fecha inicio" placeholder="Seleccione la fecha inicio" class="campoTexto"/>
            <label>Usuario:</label>
           <select id="usuario" name="usuario" title="Seleccione un usuario" class="campoTexto">
              <option value=''>Seleccione un Usuario</option>
              <?php
                require_once("../clases/class_bd.php");
                $mysql=new Conexion();
                $sql = "SELECT nombre_usuarios FROM tusuarios WHERE fecha_desactivacion IS NULL ORDER BY nombre_usuarios";
                $query = $mysql->Ejecutar($sql);
                while ($row = $mysql->Respuesta($query)){
                  if($row['nombre_usuarios']==$usuario){
                    echo "<option value='".$row['nombre_usuarios']."' selected>".$row['nombre_usuarios']."</option>";
                  }else{
                    echo "<option value='".$row['nombre_usuarios']."'>".$row['nombre_usuarios']."</option>";
                  }
                }
              ?>
            </select>
          </div>
          <div class="span6">
            <label>Fecha Hasta:</label>
          <input name="fecha_hasta" id="fecha_hasta" type="text" value="<?= $fecha_hasta;?>" title="Seleccione la fecha Fin" placeholder="Seleccione la fecha Fin" class="campoTexto"/>
            <label>Operaci&oacute;n:</label>
            <select id="operacion" name="operacion" title="Seleccione una operación" class="campoTexto">
              <option value=''>Seleccione una Operación</option>
              <option value="select" <?php if($operacion=="select"){ echo "selected";} ?> >Select</option>
              <option value="insert" <?php if($operacion=="insert"){ echo "selected";} ?> >Insert</option>
              <option value="update" <?php if($operacion=="update"){ echo "selected";} ?> >Update</option>
              <option value="delete" <?php if($operacion=="delete"){ echo "selected";} ?> >Delete</option>
            </select>
          </div>
        </div>

      <input type="button" class="btn btn-primary" value="Buscar" onclick="reload_page()">
      <input type="button" class="btn btn-primary" value="Limpiar" onclick="limpiar()">
    </fieldset>  
<br>
<table class="table table-striped table-bordered table-condensed">
        <tr> 
          <td>Fecha</td>
          <td>Hora</td>
          <td>IP</td>
          <td>Usuario Aplicacion </td>
          <td>Usuario BD</td>
          <td>Navegador Web</td>
          <td>SO</td>
          <td>Acción realizada en la Base de Datos</td>
        </tr>
         <?php
           //Conexión a la base de datos 
  require_once("../clases/class_bd.php");
  $mysql=new Conexion();
$clausuleWhere = "";
if($fecha_desde!="" && $fecha_hasta!="" && $usuario!="" && $operacion!=""){
    $clausuleWhere.="WHERE fecha BETWEEN '$fecha_desde' AND '$fecha_hasta' AND usuario_aplicacion = '$usuario' AND LOWER(query) LIKE '%$operacion%'";
}
else if($fecha_desde!="" && $usuario!="" && $operacion!=""){
    $clausuleWhere.="WHERE fecha >= '$fecha_desde' AND usuario_aplicacion = '$usuario' AND LOWER(query) LIKE '%$operacion%'";
}
else if($fecha_hasta!="" && $usuario!="" && $operacion!=""){
    $clausuleWhere.="WHERE fecha <= '$fecha_hasta' AND usuario_aplicacion = '$usuario' AND LOWER(query) LIKE '%$operacion%'";
}
else if($fecha_desde!="" && $fecha_hasta!="" && $usuario!=""){
    $clausuleWhere.="WHERE fecha BETWEEN '$fecha_desde' AND '$fecha_hasta' AND usuario_aplicacion = '$usuario'";
}
else if($fecha_desde!="" && $fecha_hasta!="" && $operacion!=""){
    $clausuleWhere.="WHERE fecha BETWEEN '$fecha_desde' AND '$fecha_hasta' AND LOWER(query) LIKE '%$operacion%'";
}
else if($fecha_desde!="" && $fecha_hasta!=""){
    $clausuleWhere.="WHERE fecha BETWEEN '$fecha_desde' AND '$fecha_hasta'";
}
else if($fecha_desde!="" && $usuario!=""){
    $clausuleWhere.="WHERE fecha >= '$fecha_desde' AND usuario_aplicacion = '$usuario'";
}
else if($fecha_desde!="" && $operacion!=""){
    $clausuleWhere.="WHERE fecha >= '$fecha_desde' AND LOWER(query) LIKE '%$operacion%'";
}
else if($fecha_hasta!="" && $usuario!=""){
    $clausuleWhere.="WHERE fecha <= '$fecha_hasta' AND usuario_aplicacion = '$usuario'";
}
else if($fecha_hasta!="" && $operacion!=""){
    $clausuleWhere.="WHERE fecha <= '$fecha_hasta' AND LOWER(query) LIKE '%$operacion%'";
}
else if($usuario!="" && $operacion!=""){
    $clausuleWhere.="WHERE usuario_aplicacion = '$usuario' AND LOWER(query) LIKE '%$operacion%'";
}
else if($fecha_desde!=""){
    $clausuleWhere.="WHERE fecha >= '$fecha_desde'";
}
else if($fecha_hasta!=""){
    $clausuleWhere.="WHERE fecha <= '$fecha_hasta'";
}
else if($usuario!=""){
    $clausuleWhere.="WHERE usuario_aplicacion = '$usuario'";
}
else if($operacion!=""){
    $clausuleWhere.="WHERE LOWER(query) LIKE '%$operacion%'";
}

//Sentencia sql (sin limit) 
$_pagi_sql = "select *,date_format(fecha,'%d/%m/%Y') as fecha,date_format(fecha,'%H:%i:%s') as hora 
from tauditoria $clausuleWhere order by id desc"; 
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
    echo "<tr><td>".$row['fecha']."</td>
           <td>".$row['hora']."</td>
    <td>".$row['ip']."</td><td>".$row['usuario_aplicacion']."</td>
    <td>".$row['usuario_base_de_datos']."</td>
<td>".$row['navigador']."</td>    
<td>".$row['so']."</td>    
<td onclick='javascript:alert(this.innerHTML)' title='".$row['query']."'>".$row['query']."</td>    
    </tr>"; 
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
