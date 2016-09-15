<?php
require_once('../clases/class_bd.php');
$conexion = new Conexion();
//	Create Where Clausule
$clauseWhere="WHERE (c.descripcion LIKE '%DOCENTE%' OR c.descripcion LIKE '%MAESTRO%' OR c.descripcion LIKE '%PROFESOR%')
   		AND (cedula LIKE '%".$_REQUEST['term']."%' OR CONCAT(nombres,' ',apellidos) LIKE '%".$_REQUEST['term']."%') ";
if(isset($_REQUEST['seccion']) && !empty($_REQUEST['seccion']))
	$clauseWhere.="AND msd.seccion='".$_REQUEST['seccion']."'";
if(isset($_REQUEST['codigo_materia']) && !empty($_REQUEST['codigo_materia']))
	$clauseWhere.="AND msd.codigo_materia='".$_REQUEST['codigo_materia']."'";

$sql = "SELECT DISTINCT TRIM(p.cedula) AS cedula,CONCAT(p.nombres,' ',p.apellidos) AS nombre 
	    FROM tpersona p 
	    INNER JOIN tcargo c ON p.codigo_cargo = c.codigo_cargo 
	    LEFT JOIN tmateria_seccion_docente msd ON p.cedula = msd.cedula_docente 
	    $clauseWhere ";
$query = $conexion->Ejecutar($sql);
while($Obj=$conexion->Respuesta($query)){
	$rows[]=array(
		'label' => $Obj['cedula'].'_'.$Obj['nombre'],
		'value' => $Obj['cedula'].'_'.$Obj['nombre'] 
		);
}
echo json_encode($rows);
?>