<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>Descripci&oacute;n</th>
                  <th>Fecha Inscripci&oacute;n</th>
                  <th>C&eacute;dula</th>
                  <th>Nombres y Apellidos</th>
                  <th>C&oacute;digo de Carrera</th>
                  <th>Carrera</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT i.cod_inscripcion,pr.descripcion,DATE_FORMAT(pi.fecha_inscripcion,'%d/%m/%Y') fecha_inscripcion,CASE p.nombre_pais WHEN 'VENEZUELA' THEN CONCAT('V-',per.cedula) ELSE CONCAT('E-',per.cedula) END cedula,
CONCAT(per.nombres,' ',per.apellidos) nombre, pi.cod_carrera,c.nombre_carrera 
FROM tpersonas per 
INNER JOIN tpais p ON per.nacionalidad = p.cod_pais 
INNER JOIN tproceso_inscripcion pi ON per.cedula = pi.cedula 
INNER JOIN tinscripcion i ON pi.cod_inscripcion = i.cod_inscripcion 
INNER JOIN tperiodo pr ON i.cod_periodo = pr.cod_periodo AND pr.esinscripcion = 'Y' 
INNER JOIN tcarrera c ON pi.cod_carrera = c.cod_carrera 
ORDER BY i.cod_inscripcion,pi.fecha_inscripcion,per.cedula,c.cod_carrera";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_inscripcion']."</td>
    <td>".$row['descripcion']."</td>
    <td>".$row['fecha_inscripcion']."</td>
    <td>".$row['cedula']."</td>
    <td>".$row['nombre']."</td>
    <td>".$row['cod_carrera']."</td>
    <td>".$row['nombre_carrera']."</td>
  </tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=estudiantes_inscritos.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>