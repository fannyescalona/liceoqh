<?php
require_once('../clases/class_bd.php');
$conexion = new Conexion();

$term=$_REQUEST['items'][0]['term'];
if(isset($_REQUEST['items'][1]['term']))
	$codigo_materia=$_REQUEST['items'][1]['term'];
else 
	$codigo_materia=null;
//	Definimos la clausula where segun parametros
$clauseWhere="WHERE (c.descripcion LIKE '%DOCENTE%' OR c.descripcion LIKE '%MAESTRO%' OR c.descripcion LIKE '%PROFESOR%')
   		AND (cedula LIKE '%$term%' OR CONCAT(nombres,' ',apellidos) LIKE '%$term%') ";
if($codigo_materia!=null)
	$clauseWhere.=" AND md.codigo_materia = '$codigo_materia'";


$sql = "SELECT DISTINCT TRIM(p.cedula) AS cedula,CONCAT(p.nombres,' ',p.apellidos) AS nombre 
	    FROM tpersona p 
	    INNER JOIN tcargo c ON p.codigo_cargo = c.codigo_cargo 
	    INNER JOIN tmateria_docente md ON p.cedula = md.cedula_docente 
	    $clauseWhere ";
$query = $conexion->Ejecutar($sql);
while($Obj=$conexion->Respuesta($query)){
	$rows[]=array(
		'label' => $Obj['cedula'].'_'.$Obj['nombre'],
		'value' => $Obj['cedula'].'_'.$Obj['nombre'],
		'sql' => $sql 
		);
}
echo json_encode($rows);
?>