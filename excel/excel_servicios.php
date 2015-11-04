<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>Servicios</th>
                  <th>Url</th>
                  <th>C&oacute;digo M&oacute;dulo</th>
                  <th>M&oacute;dulo</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT s.cod_servicios, s.nombre_servicios,concat('?',s.url) url, s.cod_modulo, m.nombre_modulo FROM tservicios s 
INNER JOIN tmodulos m ON s.cod_modulo = m.cod_modulo 
WHERE s.fecha_desactivacion IS NULL ORDER BY s.cod_servicios, m.cod_modulo DESC";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_servicios']."</td><td>".$row['nombre_servicios']."</td><td>".$row['url']."</td><td>".$row['cod_modulo']."</td><td>".$row['nombre_modulo']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=servicios.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>