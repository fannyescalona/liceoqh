<?php
require_once("../clases/class_bd.php");

$tbHtml = "<table>
             <header>
                <tr>
                  <th>C&eacute;dula</th>
                  <th>Nombres y Apellidos</th>
                  <th>G&eacute;nero</th>
                  <th>Estado Civil</th>
                  <th>Fecha de Nacimiento</th>
                  <th>Correo Electr&oacute;nico</th>
                  <th>Tlf. Fijo</th>
                  <th>Tlf. M&oacute;vil</th>
                  <th>Direcci&oacute;n de Habitaci&oacute;n</th>
                  <th>Direcci&oacute;n de Residencia</th>
                  <th>Modalidad de Ingreso</th>
                  <th>Modalidad de Estudio</th>
                  <th>Turno</th>
                  <th>Carrera</th>
                </tr>
            </header>";

$mysql = new Conexion();
$sql = "SELECT CASE pa.nombre_pais WHEN 'VENEZUELA' THEN CONCAT('V-',p.cedula) ELSE CONCAT('E-',p.cedula) END cedula,INITCAP(LOWER(CONCAT(p.nombres,' ',p.apellidos))) nombre_completo,
    DATE_FORMAT(p.fecha_nacimiento,'%d/%m/%Y') fecha_nacimiento,LOWER(p.email) email,CASE p.sexo WHEN 'F' THEN 'Femenino' ELSE 'Masculino' END sexo,
    CASE p.estado_civil WHEN 'S' THEN 'Soltero(a)' WHEN 'C' THEN 'Casado(a)' WHEN 'D' THEN 'Divorciado(a)' ELSE 'Viudo(a)' END edocivil,
    p.telefono_movil,p.telefono_fijo,INITCAP(LOWER(p.direccion)) direccionhab,INITCAP(LOWER(pi.direccion_temp)) direccionresid,
    CASE pi.modalidad_ingreso WHEN 1 THEN 'Prueba de Selección Interna' WHEN 2 THEN 'Atletas de Alta Competencia' WHEN 3 THEN 'Convenio Fundayacucho' WHEN 4 THEN 'Asignados CNU-OPSU' ELSE 'Ninguno' END modalidad_ingreso,
    CASE pi.modalidad_estudio WHEN 1 THEN 'Educación a Distancia' WHEN 2 THEN 'Especialidades Sin Maestrias' ELSE 'Presencial' END modalidad_estudio,
    CASE pi.turno WHEN 'M' THEN 'Integral' WHEN 'T' THEN 'Alterno' ELSE 'Noche' END turno,car.nombre_carrera carrera
    from tpersonas p 
    inner join tpais pa ON p.nacionalidad=pa.cod_pais 
    inner join tpre_inscripcion pi on p.cedula = pi.cedula 
    inner join tcarrera car on pi.cod_carrera = car.cod_carrera 
    WHERE pi.estatus = '3' AND NOT EXISTS (SELECT 1 FROM tproceso_inscripcion pis WHERE pis.cod_preinscripcion = pi.cod_preinscripcion)";
$query = $mysql->Ejecutar($sql);
while ($row = $mysql->Respuesta($query)){
	$tbHtml .= "<tr><td>".$row['cedula']."</td>
  <td align='left'>".utf8_decode($row['nombre_completo'])."</td>
  <td align='left'>".$row['sexo']."</td>
  <td align='left'>".$row['edocivil']."</td>
  <td align='left'>".$row['fecha_nacimiento']."</td>
  <td align='left'>".$row['email']."</td>
  <td align='left'>".$row['telefono_fijo']."</td>
  <td align='left'>".$row['telefono_movil']."</td>
  <td align='left'>".utf8_decode($row['direccionhab'])."</td>
  <td align='left'>".utf8_decode($row['direccionresid'])."</td>
  <td align='left'>".utf8_decode($row['modalidad_ingreso'])."</td>
  <td align='left'>".utf8_decode($row['modalidad_estudio'])."</td>
  <td align='left'>".utf8_decode($row['turno'])."</td>
  <td align='left'>".utf8_decode($row['carrera'])."</td>
  </tr>";
}

$tbHtml .= "</table>";
 
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=listado_seleccionados.xls");
header("Pragma: no-cache");
header("Expires: 0");
echo $tbHtml;
 
?>