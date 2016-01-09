<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include_once('../librerias/phpjasperxml/class/tcpdf/tcpdf.php');
include_once("../librerias/phpjasperxml/class/PHPJasperXML.inc.php");
include_once ('../librerias/phpjasperxml/setting.php');

$xml =  simplexml_load_file("listado_estudiantes.jrxml");

$grado_escolar = $_GET['grado_escolar'];
$seccion = $_GET['seccion'];

$PHPJasperXML = new PHPJasperXML();
//$PHPJasperXML->debugsql=true;
if($grado_escolar!="null")
	$PHPJasperXML->arrayParameter=array("grado_escolar"=>"'$grado_escolar'","seccion"=>"null");
else
	$PHPJasperXML->arrayParameter=array("grado_escolar"=>"null","seccion"=>"'$seccion'");
$PHPJasperXML->xml_dismantle($xml);

$PHPJasperXML->transferDBtoArray($server,$user,$pass,$db);
$PHPJasperXML->outpage("I");    //page output method I:standard output  D:Download file
?>
