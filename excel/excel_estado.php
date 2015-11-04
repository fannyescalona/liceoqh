<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>Estado</th>
                  <th>C&oacute;digo Pa&iacute;s</th>
                  <th>Pa&iacute;s</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT e.cod_estado, e.nombre_estado, e.cod_pais, p.nombre_pais FROM testado e 
INNER JOIN tpais p ON e.cod_pais = p.cod_pais 
WHERE e.fecha_desactivacion IS NULL ORDER BY e.cod_estado, p.cod_pais DESC";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_estado']."</td><td>".$row['nombre_estado']."</td><td>".$row['cod_pais']."</td><td>".$row['nombre_pais']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=estados.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>