<?php
require_once('../clases/class_bd.php');
$conexion = new Conexion();
$sql = "SELECT par.codigo_parroquia,par.descripcion AS parroquia,CONCAT(par.descripcion,' (',m.descripcion,', ',e.descripcion,', ',p.descripcion,')') AS descripcion 
		FROM tparroquia par 
		INNER JOIN tmunicipio m ON par.codigo_municipio=m.codigo_municipio 
		INNER JOIN testado e ON m.codigo_estado = e.codigo_estado 
		INNER JOIN tpais p ON e.codigo_pais = p.codigo_pais 
   		WHERE CONCAT(par.descripcion,' (',m.descripcion,', ',e.descripcion,', ',p.descripcion,')') LIKE '%".$_REQUEST['term']."%'";
$query = $conexion->Ejecutar($sql);
while($Obj=$conexion->Respuesta($query)){
	$rows[]=array(
		'label' => $Obj['descripcion'],
		'value' => $Obj['codigo_parroquia'].'_'.$Obj['parroquia']
		);
}
echo json_encode($rows);
?>