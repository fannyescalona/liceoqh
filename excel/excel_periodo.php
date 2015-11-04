<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>Trayecto</th>
                  <th>Fecha Inicio</th>
                  <th>Fecha F&iacute;n</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT cod_periodo, descripcion, date_format(fecha_inicio,'%d/%m/%Y') fecha_inicio, date_format(fecha_fin,'%d/%m/%Y') fecha_fin FROM tperiodo where fecha_desactivacion is null and esinscripcion = 'N' order by cod_periodo desc";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_periodo']."</td><td>".$row['descripcion']."</td><td>".$row['fecha_inicio']."</td><td>".$row['fecha_fin']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=periodos.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>