<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>Materia</th>
                  <th>Unidad Curricular</th>
                  <th>Tipo de Materia</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT cod_materia,nombre_materia,unidad_curricular, Case tipo_materia When 'N' Then 'Normal' Else 'Electiva' End tipo 
FROM tmateria where fecha_desactivacion is null order by cod_materia desc";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_materia']."</td><td>".$row['nombre_materia']."</td><td>".$row['unidad_curricular']." UC</td><td>".$row['tipo']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=materias.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>