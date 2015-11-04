<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>Secci&oacute;n</th>
                  <th>Turno</th>
                  <th>Capacidad M&iacute;nima</th>
                  <th>Capacidad M&aacute;xima</th>
                  <th>C&oacute;digo Per&iacute;odo</th>
                  <th>Per&iacute;odo</th>
                  <th>C&oacute;digo Semestre</th>
                  <th>Semestre</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT s.seccion, CASE s.turno WHEN 'D' THEN 'Diurno' ELSE 'Nocturno' END turno,s.capacidad_min,s.capacidad_max, s.cod_periodo, p.descripcion, s.cod_semestre, sm.semestre FROM tseccion s INNER JOIN tperiodo p ON s.cod_periodo = p.cod_periodo INNER JOIN tsemestre sm ON s.cod_semestre = sm.cod_semestre WHERE s.fecha_desactivacion IS NULL ORDER BY s.seccion, p.cod_periodo, sm.cod_semestre";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['seccion']."</td><td>".$row['turno']."</td><td>".$row['capacidad_min']."</td><td>".$row['capacidad_max']."</td><td>".$row['cod_periodo']."</td><td>".$row['descripcion']."</td><td>".$row['cod_semestre']."</td><td>".$row['semestre']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=secciones.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>