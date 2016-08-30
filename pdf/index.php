<?php
    session_start();
    require_once("../librerias/fpdf/fpdf.php");
    $servicio=$_GET['serv'];
	include_once("pdf_".$servicio.'.php');
?>