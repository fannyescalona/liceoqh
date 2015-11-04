<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>Rol</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT * FROM trol where fecha_desactivacion is null order by cod_rol desc";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_rol']."</td><td>".$row['nombre_rol']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=roles.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>