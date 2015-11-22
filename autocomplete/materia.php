<?php
require_once('../clases/class_bd.php');
$conexion = new Conexion();
$sql = "SELECT CONCAT(codigo_materia,'_',descripcion) AS materia 
	FROM tmateria
   	WHERE CONCAT(codigo_materia,'_',descripcion) LIKE '%".$_REQUEST['term']."%'";
$query = $conexion->Ejecutar($sql);
while($Obj=$conexion->Respuesta($query)){
	$rows[]=array(
		'label' => $Obj['materia'],
		'value' => $Obj['materia']
		);
}
echo json_encode($rows);
?>