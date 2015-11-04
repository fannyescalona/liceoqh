<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>Perfil</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT * FROM tperfil where fecha_desactivacion is null order by cod_perfil desc";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_perfil']."</td><td>".$row['nombre_perfil']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=perfiles.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>