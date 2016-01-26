<?php
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
$PHPJasperXML->arrayParameter=array("codigo_ano_academico"=>"'$codigo_ano_academico'"
	,"cedula_estudiante"=>"'$cedula_estudiante'");
$PHPJasperXML->xml_dismantle($xml);

$PHPJasperXML->transferDBtoArray($server,$user,$pass,$db);
$PHPJasperXML->outpage("I");    //page output method I:standard output  D:Download file
?>