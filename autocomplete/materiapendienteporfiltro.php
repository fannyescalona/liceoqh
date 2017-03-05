<?php
require_once('../clases/class_bd.php');
$conexion = new Conexion();

$term=$_REQUEST['items'][0]['term'];
if(isset($_REQUEST['items'][1]['term']))
	$grado_escolar=$_REQUEST['items'][1]['term'];
else 
	$grado_escolar=null;

if(isset($_REQUEST['items'][2]['term'])){
	$codigo_materia='(';
	for($i=2;$i<count($_REQUEST['items']);$i++)
		$codigo_materia.="'".$_REQUEST['items'][$i]['term']."',";

    $codigo_materia=substr($codigo_materia,0,-1);
    $codigo_materia.=')';
}

//	Definimos la clausula where segun parametros
$clauseWhere="WHERE CONCAT(codigo_materia,'_',descripcion) LIKE '%$term%' ";
if($grado_escolar!=null)
	$clauseWhere.=" AND grado_escolar < $grado_escolar";
if($codigo_materia!=null)
	$clauseWhere.=" AND codigo_materia NOT IN $codigo_materia";

$sql = "SELECT CONCAT(codigo_materia,'_',descripcion) AS materia 
	FROM tmateria
   	$clauseWhere ";
$query = $conexion->Ejecutar($sql);
while($Obj=$conexion->Respuesta($query)){
	$rows[]=array(
		'label' => $Obj['materia'],
		'value' => $Obj['materia'],
		'sql' => $_REQUEST['items']
		);
}
echo json_encode($rows);
?>