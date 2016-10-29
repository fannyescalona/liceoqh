<?php
require_once('../clases/class_bd.php');
$conexion = new Conexion();

$term=$_REQUEST['items'][0]['term'];
if(isset($_REQUEST['items'][1]['term']))
	$grado_escolar=$_REQUEST['items'][1]['term'];
else 
	$grado_escolar=null;

//	Definimos la clausula where segun parametros
$clauseWhere="WHERE CONCAT(codigo_materia,'_',descripcion) LIKE '%$term%' ";
if($grado_escolar!=null)
	$clauseWhere.=" AND grado_escolar = '$grado_escolar'";

$sql = "SELECT CONCAT(codigo_materia,'_',descripcion) AS materia 
	FROM tmateria
   	$clauseWhere ";
$query = $conexion->Ejecutar($sql);
while($Obj=$conexion->Respuesta($query)){
	$rows[]=array(
		'label' => $Obj['materia'],
		'value' => $Obj['materia'],
		'sql' => $sql
		);
}
echo json_encode($rows);
?>