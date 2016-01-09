<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include_once('../librerias/phpjasperxml/class/tcpdf/tcpdf.php');
include_once("../librerias/phpjasperxml/class/PHPJasperXML.inc.php");
include_once ('../librerias/phpjasperxml/setting.php');

$xml =  simplexml_load_file("listado_docentes.jrxml");

$codigo_materia = $_GET['codigo_materia'];

$PHPJasperXML = new PHPJasperXML();
//$PHPJasperXML->debugsql=true;
if($codigo_materia!="null")
	$PHPJasperXML->arrayParameter=array("codigo_materia"=>"'$codigo_materia'");
else
	$PHPJasperXML->arrayParameter=array("codigo_materia"=>"null");
$PHPJasperXML->xml_dismantle($xml);

$PHPJasperXML->transferDBtoArray($server,$user,$pass,$db);
$PHPJasperXML->outpage("I");    //page output method I:standard output  D:Download file
?>
