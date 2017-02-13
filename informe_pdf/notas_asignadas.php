<?php
session_start();
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include_once('../librerias/phpjasperxml/class/tcpdf/tcpdf.php');
include_once("../librerias/phpjasperxml/class/PHPJasperXML.inc.php");
include_once ('../librerias/phpjasperxml/setting.php');

$xml =  simplexml_load_file("notas_asignadas.jrxml");

$codigo_ano_academico = $_GET['codigo_ano_academico'];
$codigo_lapso = $_GET['codigo_lapso'];
$cedula_docente = $_GET['cedula_docente'];
$seccion = $_GET['seccion'];
$cedula_estudiante = $_GET['cedula_estudiante'];
$codigo_materia = $_GET['codigo_materia'];

$PHPJasperXML = new PHPJasperXML();
//$PHPJasperXML->debugsql=true;
$PHPJasperXML->generatestatus=true;
$PHPJasperXML->arrayParameter=array("codigo_ano_academico"=>"'$codigo_ano_academico'"
	,"codigo_lapso"=>"'$codigo_lapso'"
	,"cedula_docente"=>"'$cedula_docente'"
	,"seccion"=>"'$seccion'"
	,"cedula_estudiante"=> $cedula_estudiante != '0' ? "'$cedula_estudiante'" : "null"
	,"codigo_materia"=> $codigo_materia != '0' ? "'$codigo_materia'" : "null",
	"nro_registro"=>"null");
$PHPJasperXML->xml_dismantle($xml);

$PHPJasperXML->transferDBtoArray($server,$user,$pass,$db,'mysql',true);

if($PHPJasperXML->query_status==1){
	require_once('../clases/class_auditoria_proceso.php');
	$Auditoria_Proceso = new Auditoria_Proceso();
	$Auditoria_Proceso->nombre_usuario($_SESSION['user_name']);
	$Auditoria_Proceso->proceso($_SESSION['uri_service']);

	$cedula_estudiante = $cedula_estudiante!=null ? $cedula_estudiante : 'vacio';
	$codigo_materia = $codigo_materia!=null ? $codigo_materia : 'vacio';

	$Auditoria_Proceso->parametro_valor("{codigo_ano_academico: \'".$codigo_ano_academico."\',
		codigo_lapso: \'".$codigo_lapso."\',cedula_docente: \'".$cedula_docente."\',
		seccion: \'".$seccion."\',cedula_estudiante: \'".$cedula_estudiante."\',
		codigo_materia: \'".$codigo_materia."\'}");
	if(!$Auditoria_Proceso->Registrar())
		die('Error: '.$Auditoria_Proceso->error());

	if($Auditoria_Proceso->Obtener_Nro_Registro()){
		$nro_registro = $Auditoria_Proceso->nro_registro();
		$PHPJasperXML->arrayParameter=array("codigo_ano_academico"=>"'$codigo_ano_academico'"
			,"codigo_lapso"=>"'$codigo_lapso'"
			,"cedula_docente"=>"'$cedula_docente'"
			,"seccion"=>"'$seccion'"
			,"cedula_estudiante"=> $cedula_estudiante != '0' ? "'$cedula_estudiante'" : "null"
			,"codigo_materia"=> $codigo_materia != '0' ? "'$codigo_materia'" : "null",
			"nro_registro"=>"'$nro_registro");
	}
	else
		die('Error: '.$Auditoria_Proceso->error());
}
$PHPJasperXML->transferDBtoArray($server,$user,$pass,$db,'mysql',false);

$PHPJasperXML->outpage("I");    //page output method I:standard output  D:Download file
?>