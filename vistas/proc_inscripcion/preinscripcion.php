<?php
session_start();
$pag_actual = $_GET['pa'];
if(isset($_SESSION['datos'])){
	@$estatus=$_SESSION['datos']['estatus'];
}
else{            
	@$estatus=null;
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>:..Universidad Deportiva del Sur</title>
	<link rel="stylesheet" href="../../css/jquery-ui.css" />
	<link rel="stylesheet" href="../../css/normalize.css" />
	<link rel="stylesheet" href="../../css/bootstrap.css" />
	<link rel="stylesheet" href="../../css/style.css" />
	<link rel="stylesheet" href="../../css/css_04.css" />
  <link rel="stylesheet" href="../../librerias/noty/buttons.css"/>
	<!-- load jQuery -->
        <script src="../../js/jquery.js"></script>
        <script src="../../js/jquery-ui.js"></script>
        <script src="../../js/jquery.ui.datepicker-es.js"></script>
        <script src="../../js/jquery-ui-timepicker.js"></script>
	<!-- load BootStrap -->
        <script src="../../js/bootstrap.min.js"></script>
   <!-- load Noty-->
        <script src="../../librerias/noty/jquery.noty.packaged.min.js"></script>
	<!-- load Main File -->
        <script src="../../js/main.js"></script>
        <script src="uds_preinscripcion.js"></script>
</head>
<body>
	<header>
		<div id="sidebar">  
			<a href='../../udesur.php'><img id='logo' src='../../images/udsihlogo.png'></a>
		</div>
	</header>
	<div id="mainBody">
	  <h1>Pre-Inscr&iacute;bete</h1>
	  <div id="breadcrumb">
	      <a class="tip-bottom" title="" href="../../udesur.php" data-original-title="Principal"><i class="icon-home"></i><strong>Home</strong></a>
	      <a class="current" href="preinscripcion.php?pa=l" id="titulo-menu">Pre-Inscr&iacute;bete</a>
	  </div>
	  <div class="container-fluid">
	    <div class="row-fluid">
	      <div class="span12 center">
	        <br />
	        <div align="center">
	        		<?php
	        		  require_once("../../clases/class_bd.php");
	                  $mysql=new Conexion();
	                  $sql = "SELECT CONCAT('PERIODO ',p.descripcion) descripcion, date_format(p.fecha_inicio,'%d/%m/%Y') fecha_inicio,
	                  date_format(p.fecha_fin,'%d/%m/%Y') fecha_fin, DATEDIFF(p.fecha_fin,NOW()) diferencia 
					  FROM tinscripcion i
					  INNER JOIN tperiodo p ON i.cod_periodo = p.cod_periodo
					  AND p.esinscripcion =  'Y'
					  WHERE i.fecha_desactivacion IS NULL";
	                  $query = $mysql->Ejecutar($sql);
	                  while ($row = $mysql->Respuesta($query)){
	                  	$diferencia= $row['diferencia'];
	                    $mensaje="<span style='font-weight: bold;'> \"".$row['descripcion']."  FECHA DE INICIO: </span>".$row['fecha_inicio']." <span style='font-weight: bold;'>FECHA DE CULMINACION: </span>".$row['fecha_fin']."<span style='font-weight: bold;'> \"</span><br /><br />";
	                  }
	        	if($diferencia<0){
	        		echo "La sección a la cual intenta acceder no se encuentra disponible temporalmente";
	        	}else{
	        		echo $mensaje;
	        		if($pag_actual=='r'){
					?>
	        	<div class="well">
				  <ul class="nav nav-tabs">
				    <li class="active"><a href="#datospersonales" data-toggle="tab" id="tab-datospersonales">Datos Personales</a></li>
				    <li><a href="#direccionhabitacion" data-toggle="tab" id="tab-direccionhabitacion">Dirección de Habitación</a></li>
				    <li><a href="#datosplantel" data-toggle="tab" id="tab-datosplantel">Datos de Educación Media Diversificada</a></li>
				    <li><a href="#modalidadingreso" data-toggle="tab" id="tab-modalidadingreso">Modalidad de Ingreso</a></li>
				  </ul>
				  <div id="myTabContent" class="tab-content">
				    <div class="tab-pane active in" id="datospersonales">
						<?php
				          include_once('serv_datospersonales.php');
				        ?>
				    </div>
				    <div class="tab-pane" id="direccionhabitacion">
				    	<?php
				          include_once('serv_direccionhabitacion.php');
				        ?>
				    </div>
				    <div class="tab-pane" id="datosplantel">
				    	<?php
				          include_once('serv_datosplantel.php');
				        ?>
				    </div>
				    <div class="tab-pane" id="modalidadingreso">
				    	<?php
				          include_once('serv_modalidadingreso.php');
				        ?>
				    </div>
				  </div>
				</div>
				<?php
				}
				else if($pag_actual=="l"){
				?>
				<form id="form1" name="form1" method="POST" action="cont_preinscripcion.php">
					<table width="80%" border="0">
						<tr>
							<td><div align="right"><strong>C&eacute;dula:</strong></div></td>
				            <td>
				              <label>
				                <input required name="consultar_cedula" type="text" id="consultar_cedula" onKeyPress="return isNumberKey(event)" maxlength=12 title="Ingrese la c&eacute;dula del estudiante" required/>
				              </label>
				            </td>
						</tr>
					</table>
			      <p>
			        <input type="hidden" name="operacion" value="" id="operacion" />
			        <input name="cmdConsultar" type="button" class="btn btn-large" id="cmdConsultar" value="Consultar Estado" />
			        <input name="cmdIr" type="button" id="cmdIr" class="btn btn-large" value="Pre-Inscribirse" />
			      </p>
				</form>
				<?php
					if(!empty($estatus)){
						if($estatus!="Inscrito" && $estatus!="Preinscrito"){
							echo "<div><strong>El estatus de su solicitud se encuentra <i>'".$estatus."'</i></strong></div>";
						}
						else if($estatus=="Preinscrito"){
							echo "<input type='hidden' name='cedula' id='cedula' value='".$_SESSION['datos']['cedula_estudiante']."' />";
							echo "<div><strong>El estatus de su solicitud se encuentra <i>'".$estatus."'</i> por favor imprima su comprobante</strong></div>";
							echo "<br /><br />
							<label>
								<input name='cmdImprimirPreInscripcion' id='cmdImprimirPreInscripcion' type='button' class='btn btn-large' value='Imprimir Comprobante' />
							</label>
							";
						}
						else{
							echo "<input type='hidden' name='cedula' id='cedula' value='".$_SESSION['datos']['cedula_estudiante']."' />";
							echo "<div><strong>El estatus de su solicitud se encuentra <i>'".$estatus."'</i> por favor imprima su comprobante</strong></div>";
							echo "<br /><br />
							<label>
								<input name='cmdImprimir' id='cmdImprimir' type='button' class='btn btn-large' value='Imprimir Comprobante' />
							</label>
							";
						}
					}
				}
				?>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
</body>
</html>
<?php
if(isset($_SESSION['datos']['mensaje'])){
    echo "<script>alert('".$_SESSION['datos']['mensaje']."')</script>";	
	}
if(isset($_SESSION['datos']))
	unset($_SESSION['datos']);
}
?>