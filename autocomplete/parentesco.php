<?php
require_once('../clases/class_bd.php');
$conexion = new Conexion();
$sql = "SELECT codigo_parentesco,descripcion,CONCAT(codigo_parentesco,'_',descripcion) AS parentesco 
	FROM tparentesco
   	WHERE CONCAT(codigo_parentesco,'_',descripcion) LIKE '%".$_REQUEST['term']."%'";
$query = $conexion->Ejecutar($sql);
while($Obj=$conexion->Respuesta($query)){
	$rows[]=array(
		'label' => $Obj['parentesco'],
		'value' => $Obj['codigo_parentesco'].'_'.$Obj['descripcion']
		);
}
echo json_encode($rows);
?>