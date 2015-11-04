<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>Pa&iacute;s</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT * FROM tpais where fecha_desactivacion is null order by cod_pais desc";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_pais']."</td><td>".$row['nombre_pais']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=paises.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>