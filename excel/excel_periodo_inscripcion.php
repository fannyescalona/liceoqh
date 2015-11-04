<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>Descripci&oacute;n</th>
                  <th>Fecha Inicio</th>
                  <th>Fecha F&iacute;n</th>
                  <th>Fecha Cierre</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT i.cod_inscripcion,p.descripcion,date_format(p.fecha_inicio,'%d/%m/%Y') fecha_inicio,date_format(p.fecha_fin,'%d/%m/%Y') fecha_fin,date_format(i.fecha_cierre,'%d/%m/%Y') fecha_cierre 
FROM tinscripcion i INNER JOIN tperiodo p ON i.cod_periodo = p.cod_periodo AND p.esinscripcion = 'Y' WHERE i.fecha_desactivacion IS NULL ORDER BY i.cod_inscripcion DESC";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_inscripcion']."</td><td>".$row['descripcion']."</td><td>".$row['fecha_inicio']."</td><td>".$row['fecha_fin']."</td><td>".$row['fecha_cierre']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=periodos_de_inscripcion.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>