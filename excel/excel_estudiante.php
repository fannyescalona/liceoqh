<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&eacute;dula</th>
                  <th>Nombres y Apellidos</th>
                  <th>G&eacute;nero</th>
                  <th>Fecha de Nacimiento</th>
                  <th>C&oacute;digo de Estudiante</th>
                  <th>Rol</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT CONCAT((CASE pa.nombre_pais WHEN 'VENEZUELA' THEN 'V-' ELSE 'E-' END),p.cedula) cedula, 
CONCAT(p.nombres,' ',p.apellidos) nomape, CASE p.sexo WHEN 'F' THEN 'FEMENINO' ELSE 'MASCULINO' END genero, 
DATE_FORMAT(p.fecha_nacimiento,'%d/%m/%Y') fecha_nacimiento, pr.cod_personal, r.nombre_rol rol 
FROM tpersonas p INNER JOIN tpais pa ON p.nacionalidad = pa.cod_pais INNER JOIN tpersonales pr ON p.cedula = pr.cedula 
INNER JOIN trol r ON pr.cod_rol = r.cod_rol WHERE UPPER(r.nombre_rol) LIKE '%ESTUDIANTE%' ORDER BY cedula DESC";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cedula']."</td>
  <td align='left'>".$row['nomape']."</td>
  <td align='left'>".$row['genero']."</td>
  <td align='left'>".$row['fecha_nacimiento']."</td>
  <td align='left'>".$row['cod_personal']."</td><td align='left'>".$row['rol']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=estudiantes.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>