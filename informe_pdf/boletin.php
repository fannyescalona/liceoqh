<?php
session_start();
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include_once('../librerias/phpjasperxml/class/tcpdf/tcpdf.php');
include_once("../librerias/phpjasperxml/class/PHPJasperXML.inc.php");
include_once ('../librerias/phpjasperxml/setting.php');

$xml =  simplexml_load_file("boletin.jrxml");

$codigo_ano_academico = $_GET['codigo_ano_academico'];
$cedula_estudiante = $_GET['cedula_estudiante'];

$PHPJasperXML = new PHPJasperXML();
//$PHPJasperXML->debugsql=true;
$PHPJasperXML->generatestatus=true;
$PHPJasperXML->arrayParameter=array("codigo_ano_academico"=>"'$codigo_ano_academico'"
	,"cedula_estudiante"=>"'$cedula_estudiante'"
	,"nro_registro"=>"null");
$PHPJasperXML->xml_dismantle($xml);

$PHPJasperXML->transferDBtoArray($server,$user,$pass,$db,'mysql',true);

if($PHPJasperXML->query_status==1){
	require_once('../clases/class_auditoria_proceso.php');
	$Auditoria_Proceso = new Auditoria_Proceso();
	$confirmado = 0;
	$Auditoria_Proceso->nombre_usuario($_SESSION['user_name']);
	$Auditoria_Proceso->proceso('rep_boletin');
	$Auditoria_Proceso->parametro_valor("{codigo_ano_academico: \'".$codigo_ano_academico."\',cedula_estudiante: \'".$cedula_estudiante."\'}");
	if(!$Auditoria_Proceso->Registrar()){
		$confirmado = -1;
		die('Error: '.$Auditoria_Proceso->error());
	}
	if($Auditoria_Proceso->Obtener_Nro_Registro()){
		$nro_registro = $Auditoria_Proceso->nro_registro();
		$PHPJasperXML->arrayParameter=array("codigo_ano_academico"=>"'$codigo_ano_academico'"
		,"cedula_estudiante"=>"'$cedula_estudiante'"
		,"nro_registro"=>"'$nro_registro");
	}
	else
		die('Error: '.$Auditoria_Proceso->error());
}
$PHPJasperXML->transferDBtoArray($server,$user,$pass,$db,'mysql',false);

$PHPJasperXML->outpage("I");    //page output method I:standard output  D:Download file
?>