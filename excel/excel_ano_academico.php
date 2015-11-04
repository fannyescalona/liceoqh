<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>A&ntilde;o Acad&eacute;mico</th>
                  <th>C&oacute;digo Carrera</th>
                  <th>Carrera</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT a.cod_ano_academico, a.ano, a.cod_carrera, c.nombre_carrera FROM tano_academico a 
INNER JOIN tcarrera c ON a.cod_carrera = c.cod_carrera 
WHERE a.fecha_desactivacion IS NULL ORDER BY a.cod_ano_academico, c.cod_carrera DESC";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_ano_academico']."</td><td>".$row['ano']."</td><td>".$row['cod_carrera']."</td><td>".$row['nombre_carrera']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=ano_academicos.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>