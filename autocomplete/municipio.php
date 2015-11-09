<?php
require_once('../clases/class_bd.php');
$conexion = new Conexion();
$sql = "SELECT codigo_municipio,m.descripcion AS municipio,CONCAT(m.descripcion,' (',e.descripcion,', ',p.descripcion,')') AS descripcion 
		FROM tmunicipio m 
		INNER JOIN testado e ON m.codigo_estado = e.codigo_estado 
		INNER JOIN tpais p ON e.codigo_pais = p.codigo_pais 
   		WHERE CONCAT(m.descripcion,' (',e.descripcion,', ',p.descripcion,')') LIKE '%".$_REQUEST['term']."%'";
$query = $conexion->Ejecutar($sql);
while($Obj=$conexion->Respuesta($query)){
	$rows[]=array(
		'label' => $Obj['descripcion'],
		'value' => $Obj['codigo_municipio'].'_'.$Obj['municipio']
		);
}
echo json_encode($rows);
?>