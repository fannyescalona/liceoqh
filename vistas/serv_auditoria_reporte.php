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
  if(isset($_GET['reporte'])) {
    $reporte = $_GET['reporte'];
  }else{
    @$reporte=null;
  }
  if(isset($_GET['nro_registro'])) {
    $nro_registro = $_GET['nro_registro'];
  }else{
    @$nro_registro=null;
  }
  
?>
<br>
<div class="form_externo"  style="margin:0 auto; padding:5px; width:100%;">
<script type="text/javascript">
  function reload_page(){
    fechad = document.getElementById('fecha_desde').value;
    fechah = document.getElementById('fecha_hasta').value;
    usuario = document.getElementById('usuario').value;
    reporte = document.getElementById('reporte').value;
    nro_registro = document.getElementById('nro_registro').value;
    location.href="index.php?auditoria_reporte&fecha_desde="+fechad+"&fecha_hasta="+fechah+"&usuario="+usuario+"&reporte="+reporte+"&nro_registro="+nro_registro;
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
              $sql = "SELECT nombre_usuario FROM tusuario WHERE fecha_desactivacion IS NULL ORDER BY nombre_usuario";
              $proceso = $mysql->Ejecutar($sql);
              while ($row = $mysql->Respuesta($proceso)){
              if($row['nombre_usuario']==$usuario){
              echo "<option value='".$row['nombre_usuario']."' selected>".$row['nombre_usuario']."</option>";
              }else{
              echo "<option value='".$row['nombre_usuario']."'>".$row['nombre_usuario']."</option>";
              }
              }
              ?>
            </select>
            <label>Nro Registro:</label>
            <input onKeyPress="return isNumberKey(event)" type="text" class="campoTexto" title="Ingrese el nro de registro" placeholder="Ingrese el nro de registro" name="nro_registro" id="nro_registro" maxlength=10 value="<?=$nro_registro?>">
          </div>
          <div class="span6">
            <label>Fecha Hasta:</label>
          <input name="fecha_hasta" id="fecha_hasta" type="text" value="<?= $fecha_hasta;?>" title="Seleccione la fecha Fin" placeholder="Seleccione la fecha Fin" class="campoTexto"/>
            <label>Reporte:</label>
            <select id="reporte" name="reporte" title="Seleccione un reporte" class="campoTexto">
              <option value=''>Seleccione un Reporte</option>
              <?php
                require_once("../clases/class_bd.php");
                $mysql=new Conexion();
                $sql = "SELECT s.url,s.descripcion AS reporte FROM tservicio s INNER JOIN tmodulo m ON s.codigo_modulo = m.codigo_modulo WHERE m.descripcion LIKE '%REPORTE%' AND s.fecha_desactivacion IS NULL ORDER BY s.orden ASC";
                $proceso = $mysql->Ejecutar($sql);
                while ($row = $mysql->Respuesta($proceso)){
                  if($row['url']==$reporte){
                    echo "<option value='".$row['url']."' selected>".$row['reporte']."</option>";
                  }else{
                    echo "<option value='".$row['url']."'>".$row['reporte']."</option>";
                  }
                }
              ?>
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
          <td>Usuario Aplicacion </td>
          <td>Nro Registro</td>
          <td>Reporte</td>
          <td>Parámetro - Valor</td>
        </tr>
         <?php
           //Conexión a la base de datos 
  require_once("../clases/class_bd.php");
  $mysql=new Conexion();
$clausuleWhere = "";

if($fecha_desde!="" && $fecha_hasta!=""){
  $clausuleWhere.="WHERE DATE_FORMAT(fecha,'%Y-%m-%d') BETWEEN '$fecha_desde' AND '$fecha_hasta'";
}
else if($fecha_desde!="" && $fecha_hasta==""){
  $clausuleWhere.="WHERE DATE_FORMAT(fecha,'%Y-%m-%d') >= '$fecha_desde'";
}
else if($fecha_desde=="" && $fecha_hasta!=""){
  $clausuleWhere.="WHERE DATE_FORMAT(fecha,'%Y-%m-%d') <= '$fecha_hasta'"; 
}

if($usuario!=""){
  if(!empty($clausuleWhere))
    $clausuleWhere.=" AND nombre_usuario='$usuario'";
  else
    $clausuleWhere.="WHERE nombre_usuario='$usuario'";
}

if($reporte!=""){
  if(!empty($clausuleWhere))
    $clausuleWhere.=" AND proceso = LOWER('$reporte')";
  else
    $clausuleWhere.="WHERE proceso = LOWER('$reporte')";
}

if($nro_registro!=""){
  if(!empty($clausuleWhere))
    $clausuleWhere.=" AND LPAD(id,10,'0') LIKE '%$nro_registro%'";
  else
    $clausuleWhere.="WHERE LPAD(id,10,'0') LIKE '%$nro_registro%'";
}

//Sentencia sql (sin limit) 
$_pagi_sql = "SELECT date_format(ap.fecha,'%d/%m/%Y') as fecha,date_format(ap.fecha,'%H:%i:%s') as hora,
ap.nombre_usuario,LPAD(ap.id,10,'0') AS nro_registro,s.descripcion AS reporte,ap.parametro_valor  
FROM tauditoria_proceso ap INNER JOIN tservicio s ON ap.proceso = s.url $clausuleWhere ORDER BY id DESC"; 
//cantidad de resultados por página (opcional, por defecto 20) 
$_pagi_cuantos = 20; 
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
  <td>".$row['nombre_usuario']."</td>
  <td>".$row['nro_registro']."</td>
  <td>".$row['reporte']."</td>      
  <td onclick='javascript:alert(this.innerHTML)' title='".$row['parametro_valor']."'>".$row['parametro_valor']."</td>    
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
