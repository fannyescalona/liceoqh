<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&oacute;digo</th>
                  <th>Hora Inicio</th>
                  <th>Hora Fin</th>
                  <th>Turno</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT cod_bloque_hora, time_format(hora_inicio,'%h:%m %p') hora_inicio, time_format(hora_fin,'%h:%m %p') hora_fin, Case turno When 'M' Then 'Mañana' Else 'Tarde' End turno FROM bloque_hora where fecha_desactivacion is null order by cod_bloque_hora desc";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cod_bloque_hora']."</td><td>".$row['hora_inicio']."</td><td>".$row['hora_fin']."</td><td>".$row['turno']."</td></tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=bloque_horas.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>