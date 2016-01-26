<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
include_once('../librerias/phpjasperxml/class/tcpdf/tcpdf.php');
include_once("../librerias/phpjasperxml/class/PHPJasperXML.inc.php");
include_once ('../librerias/phpjasperxml/setting.php');

$xml =  simplexml_load_file("historial_del_personal.jrxml");

$cedula = $_GET['cedula'];

$PHPJasperXML = new PHPJasperXML();
//$PHPJasperXML->debugsql=true;
$PHPJasperXML->arrayParameter=array("cedula"=>"'$cedula'");
$PHPJasperXML->xml_dismantle($xml);

$PHPJasperXML->transferDBtoArray($server,$user,$pass,$db);
$PHPJasperXML->outpage("I");    //page output method I:standard output  D:Download file


?>
