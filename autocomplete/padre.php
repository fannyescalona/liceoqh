<?php
require_once('../clases/class_bd.php');
$conexion = new Conexion();
$sql = "SELECT TRIM(cedula) AS cedula,CONCAT(nombres,' ',apellidos) AS nombre 
	    FROM tpersona  
   		WHERE genero='M' AND esestudiante = 'N'  
   		AND (cedula LIKE '%".$_REQUEST['term']."%' OR CONCAT(nombres,' ',apellidos) LIKE '%".$_REQUEST['term']."%')";
$query = $conexion->Ejecutar($sql);
while($Obj=$conexion->Respuesta($query)){
	$rows[]=array(
		'label' => $Obj['cedula'].'_'.$Obj['nombre'],
		'value' => $Obj['cedula']
		);
}
echo json_encode($rows);
?>