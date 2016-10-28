<?php
require_once('../clases/class_bd.php');
$conexion = new Conexion();

$clauseWhere = "WHERE an.cedula_estudiante = p.cedula AND msd.cedula_docente = '".$_GET['cedula_docente']."'";

if(isset($_GET['seccion']) && !empty($_GET['seccion']))
	$clauseWhere.=" AND msd.seccion='".$_GET['seccion']."'";

$sql = "SELECT TRIM(p.cedula) AS cedula,CONCAT(p.nombres,' ',p.apellidos) AS nombre 
	    FROM tpersona p  
	    WHERE p.esestudiante ='Y' AND EXISTS(SELECT 1 FROM tmateria_seccion_docente msd 
	    INNER JOIN tplan_evaluacion pe ON msd.codigo_msd = pe.codigo_msd 
	    INNER JOIN tasignacion_nota an ON pe.codigo_plan_evaluacion = an.codigo_plan_evaluacion $clauseWhere)
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