<?php
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
$PHPJasperXML->arrayParameter=array("codigo_ano_academico"=>"'$codigo_ano_academico'"
	,"cedula_docente"=>$cedula_docente!=null ? "'".$cedula_docente."'" : "null"
	,"seccion"=>$seccion!=null ? "'".$seccion."'" : "null");
$PHPJasperXML->xml_dismantle($xml);

$PHPJasperXML->transferDBtoArray($server,$user,$pass,$db);
$PHPJasperXML->outpage("I");    //page output method I:standard output  D:Download file
?>