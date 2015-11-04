<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>Municipio</th>
                  <th>C&oacute;digo Ciudad</th>
                  <th>Ciudad</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT m.cod_municipio, m.nombre_municipio, c.cod_ciudad, c.nombre_ciudad FROM tmunicipio m 
INNER JOIN tciudad c ON m.cod_ciudad = c.cod_ciudad 
WHERE m.fecha_desactivacion IS NULL ORDER BY m.cod_municipio,c.cod_ciudad DESC";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_municipio']."</td><td>".$row['nombre_municipio']."</td><td>".$row['cod_ciudad']."</td><td>".$row['nombre_ciudad']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=municipios.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>