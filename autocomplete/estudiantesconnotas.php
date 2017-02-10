<?php
require_once('../clases/class_bd.php');
$conexion = new Conexion();
$sql = "SELECT TRIM(p.cedula) AS cedula,CONCAT(p.nombres,' ',p.apellidos) AS nombre 
	    FROM tpersona p  
	    WHERE p.esestudiante ='Y' AND EXISTS(SELECT 1 FROM tcontrol_notas cn WHERE cn.cedula_estudiante = p.cedula)
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