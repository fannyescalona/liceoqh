<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>M&oacute;dulo</th>
                  <th>Icono</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT * FROM tmodulos where fecha_desactivacion is null order by cod_modulo desc";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_modulo']."</td><td>".$row['nombre_modulo']."</td><td>".$row['icono']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=modulos.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>