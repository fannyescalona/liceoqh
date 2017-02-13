<?php
session_start();
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include_once('../librerias/phpjasperxml/class/tcpdf/tcpdf.php');
include_once("../librerias/phpjasperxml/class/PHPJasperXML.inc.php");
include_once ('../librerias/phpjasperxml/setting.php');

$xml =  simplexml_load_file("horario.jrxml");

$codigo_ano_academico = $_GET['codigo_ano_academico'];
$cedula_docente = $_GET['cedula_docente'];
$seccion = $_GET['seccion'];

$PHPJasperXML = new PHPJasperXML();
//$PHPJasperXML->debugsql=true;
$PHPJasperXML->generatestatus=true;
$PHPJasperXML->arrayParameter=array("codigo_ano_academico"=>"'$codigo_ano_academico'"
	,"cedula_docente"=>$cedula_docente!=null ? "'".$cedula_docente."'" : "null"
	,"seccion"=>$seccion!=null ? "'".$seccion."'" : "null","nro_registro"=>"null");
$PHPJasperXML->xml_dismantle($xml);

$PHPJasperXML->transferDBtoArray($server,$user,$pass,$db,'mysql',true);

if($PHPJasperXML->query_status==1){
	require_once('../clases/class_auditoria_proceso.php');
	$Auditoria_Proceso = new Auditoria_Proceso();
	$Auditoria_Proceso->nombre_usuario($_SESSION['user_name']);
	$Auditoria_Proceso->proceso($_SESSION['uri_service']);

	$cedula_docente = $cedula_docente != null ? $cedula_docente : 'vacio';
	$seccion = $seccion != null ? $seccion : 'vacio';

	$Auditoria_Proceso->parametro_valor("{codigo_ano_academico: \'".$codigo_ano_academico."\',
		cedula_docente: \'".$cedula_docente."\',seccion: \'".$seccion."\'}");
	if(!$Auditoria_Proceso->Registrar())
		die('Error: '.$Auditoria_Proceso->error());
	
	if($Auditoria_Proceso->Obtener_Nro_Registro()){
		$nro_registro = $Auditoria_Proceso->nro_registro();
		$PHPJasperXML->arrayParameter=array("codigo_ano_academico"=>"'$codigo_ano_academico'"
	,"cedula_docente"=>$cedula_docente!=null ? "'".$cedula_docente."'" : "null"
	,"seccion"=>$seccion!=null ? "'".$seccion."'" : "null","nro_registro"=>"'$nro_registro");
	}
	else
		die('Error: '.$Auditoria_Proceso->error());
}
$PHPJasperXML->transferDBtoArray($server,$user,$pass,$db,'mysql',false);

$PHPJasperXML->outpage("I");    //page output method I:standard output  D:Download file
?>