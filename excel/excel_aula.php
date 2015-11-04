<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>Aula de Clases</th>
                  <th>Tipo de Aula</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT cod_ambiente,nombre_ambiente,CASE tipo_ambiente WHEN 'A' THEN 'Aula' WHEN 'C' THEN 'Cancha' ELSE 'Laboratorio' END tipo FROM tambiente where fecha_desactivacion is null order by cod_ambiente desc";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_ambiente']."</td><td>".$row['nombre_ambiente']."</td><td>".$row['tipo']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=aulas.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>