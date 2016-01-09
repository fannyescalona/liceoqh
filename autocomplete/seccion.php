<?php
require_once('../clases/class_bd.php');
$conexion = new Conexion();
$sql = "SELECT CONCAT(seccion,'_',descripcion) AS id,
	CONCAT(seccion,'_',descripcion,'( ',s.capacidad_max-(SELECT COUNT(pi.cedula_estudiante) FROM tproceso_inscripcion pi WHERE pi.seccion = s.seccion),' CUPOS DISPONIBLES )') AS value  
	FROM tseccion s 
   	WHERE s.capacidad_max-(SELECT COUNT(pi.cedula_estudiante) FROM tproceso_inscripcion pi WHERE pi.seccion = s.seccion) <>0 
   	AND CONCAT(seccion,'_',descripcion) LIKE '%".$_REQUEST['term']."%'";
$query = $conexion->Ejecutar($sql);
while($Obj=$conexion->Respuesta($query)){
	$rows[]=array(
		'label' => $Obj['value'],
		'value' => $Obj['id']
		);
}
echo json_encode($rows);
?>