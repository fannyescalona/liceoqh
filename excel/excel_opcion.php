<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>Opci&oacute;n</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT * FROM topciones where fecha_desactivacion is null order by cod_opciones desc";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_opciones']."</td><td>".$row['nombre_opciones']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=opciones.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>