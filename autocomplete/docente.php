<?php
require_once('../clases/class_bd.php');
$conexion = new Conexion();
$sql = "SELECT TRIM(p.cedula) AS cedula,CONCAT(p.nombres,' ',p.apellidos) AS nombre 
	    FROM tpersona p 
	    INNER JOIN tcargo c ON p.codigo_cargo = c.codigo_cargo  
	    WHERE (c.descripcion LIKE '%DOCENTE%' OR c.descripcion LIKE '%MAESTRO%' OR c.descripcion LIKE '%PROFESOR%')
   		AND (cedula LIKE '%".$_REQUEST['term']."%' OR CONCAT(nombres,' ',apellidos) LIKE '%".$_REQUEST['term']."%')";
$query = $conexion->Ejecutar($sql);
while($Obj=$conexion->Respuesta($query)){
	$rows[]=array(
		'label' => $Obj['cedula'].'_'.$Obj['nombre'],
		'value' => $Obj['cedula'].'_'.$Obj['nombre']
		);
}
echo json_encode($rows);
?>