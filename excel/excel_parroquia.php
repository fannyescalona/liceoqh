<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>Parroquia</th>
                  <th>C&oacute;digo Municipio</th>
                  <th>Municipio</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT m.cod_municipio, m.nombre_municipio, p.cod_parroquia, p.nombre_parroquia FROM tparroquia p 
INNER JOIN tmunicipio m ON m.cod_municipio = p.cod_municipio 
WHERE p.fecha_desactivacion IS NULL ORDER BY p.cod_parroquia,m.cod_municipio DESC";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_parroquia']."</td><td>".$row['nombre_parroquia']."</td><td>".$row['cod_municipio']."</td><td>".$row['nombre_municipio']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=parroquias.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>