<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>Semestre</th>
                  <th>C&oacute;digo A&ntilde;o Acad&eacute;mico</th>
                  <th>A&ntilde;o Acad&eacute;mico</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT a.cod_ano_academico, a.ano, s.cod_semestre, s.semestre FROM tsemestre s 
INNER JOIN tano_academico a ON a.cod_ano_academico = s.cod_ano_academico 
WHERE s.fecha_desactivacion IS NULL ORDER BY s.cod_semestre,a.cod_ano_academico DESC";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_semestre']."</td><td>".$row['semestre']."</td><td>".$row['cod_ano_academico']."</td><td>".$row['ano']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=semestres.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>