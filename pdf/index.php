<!DOCTYPE html>
<html>
<head>
<title>Reporte</title>
<link rel="stylesheet" href="../librerias/sweetalert/css/sweetalert.css"/>
<script type="text/javascript" src="../librerias/sweetalert/js/sweetalert.min.js"></script>
</head>
<body>
<?php
    session_start();
    require_once("../librerias/fpdf/fpdf.php");
    $servicio=$_GET['serv'];
	include_once("pdf_".$servicio.'.php');
  ?>
</body>
</html>