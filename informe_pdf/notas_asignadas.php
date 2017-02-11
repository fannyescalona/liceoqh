<?php
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
$PHPJasperXML->arrayParameter=array("codigo_ano_academico"=>"'$codigo_ano_academico'"
	,"codigo_lapso"=>"'$codigo_lapso'"
	,"cedula_docente"=>"'$cedula_docente'"
	,"seccion"=>"'$seccion'"
	,"cedula_estudiante"=> $cedula_estudiante != '0' ? "'$cedula_estudiante'" : "null"
	,"codigo_materia"=> $codigo_materia != '0' ? "'$codigo_materia'" : "null");
$PHPJasperXML->xml_dismantle($xml);

$PHPJasperXML->transferDBtoArray($server,$user,$pass,$db);
$PHPJasperXML->outpage("I");    //page output method I:standard output  D:Download file
?>