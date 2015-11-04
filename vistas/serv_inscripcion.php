<?php
	require_once("../clases/class_bd.php");
	$mysql=new Conexion();
	$sql = "SELECT CONCAT('PERIODO ',p.descripcion) descripcion, date_format(p.fecha_inicio,'%d/%m/%Y') fecha_inicio,date_format(i.fecha_cierre,'%d/%m/%Y') fecha_cierre 
	FROM tinscripcion i
	INNER JOIN tperiodo p ON i.cod_periodo = p.cod_periodo
	AND p.esinscripcion =  'Y'
	WHERE i.fecha_desactivacion IS NULL";
	$query = $mysql->Ejecutar($sql);
	while ($row = $mysql->Respuesta($query)){
		echo "<span style='font-weight: bold;'> \"".$row['descripcion']."  FECHA DE INICIO: </span>".$row['fecha_inicio']." <span style='font-weight: bold;'>FECHA DE CIERRE: </span>".$row['fecha_cierre']."<span style='font-weight: bold;'> \"</span><br /><br />";
	}
?>
<div class="well">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#datospersonales" data-toggle="tab" id="tab-datospersonales">Datos Personales</a></li>
		<li><a href="#direccionhabitacion" data-toggle="tab" id="tab-direccionhabitacion">Dirección de Habitación</a></li>
		<li><a href="#datosplantel" data-toggle="tab" id="tab-datosplantel">Datos de Educación Media Diversificada</a></li>
		<li><a href="#modalidadingreso" data-toggle="tab" id="tab-modalidadingreso">Modalidad de Ingreso</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
		<script src="../js/uds_inscripcion.js"></script>
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