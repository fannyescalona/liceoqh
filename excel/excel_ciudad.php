<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>Ciudad</th>
                  <th>C&oacute;digo Estado</th>
                  <th>Estado</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT e.cod_estado, e.nombre_estado, c.cod_ciudad, c.nombre_ciudad FROM tciudad c 
INNER JOIN testado e ON e.cod_estado = c.cod_ciudad 
WHERE c.fecha_desactivacion IS NULL ORDER BY c.cod_ciudad,e.cod_estado DESC";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_ciudad']."</td><td>".$row['nombre_ciudad']."</td><td>".$row['cod_estado']."</td><td>".$row['nombre_estado']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=ciudades.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>