<?php
session_start();
if(isset($_POST['operacion']))
	$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['cedula']))
	$cedula=trim($_POST['cedula']);

include_once("../clases/class_preinscripcion.php");
$preinscripcion = new PreInscripcion();
$confirmacion=0;
if($operacion=='PorPrueba'){
	if(isset($_POST['preinscritos'])){               
	  foreach($_POST['preinscritos'] as $indice => $valor){
	    $preinscripcion->cod_preinscripcion($valor);
	    if($preinscripcion->Actualizar())
	    	$confirmacion++;
	    else
	    	$confirmacion=0;
	  }                                                        
	}
	if($confirmacion!=0){
		$_SESSION['datos']['mensaje']="El estatus de los estudiantes han sido cambiado a 'Por Pruebas' exitosamente!";
		header("Location: ../vistas/?actualizar_pre_inscripcion");
	}else{
		$_SESSION['datos']['mensaje']="Problema al completar la inscripción de los estudiantes preinscritos.";
		header("Location: ../vistas/?actualizar_pre_inscripcion");
	}
}

if($operacion=='Seleccionado'){
	if(isset($_POST['preinscritos'])){               
	  foreach($_POST['preinscritos'] as $indice => $valor){
	    $preinscripcion->cod_preinscripcion($valor);
	    if($preinscripcion->Seleccionar())
	    	$confirmacion++;
	    else
	    	$confirmacion=0;
	  }                                                        
	}
	if($confirmacion!=0){
		$_SESSION['datos']['mensaje']="El estatus de los estudiantes han sido cambiado a 'Seleccionado' exitosamente!";
		header("Location: ../vistas/?seleccionar_pre_inscripcion");
	}else{
		$_SESSION['datos']['mensaje']="Problema al completar la inscripción de los estudiantes preinscritos.";
		header("Location: ../vistas/?seleccionar_pre_inscripcion");
	}
}

if($operacion=='Inscribir'){
	if(isset($_POST['preinscritos'])){               
	  foreach($_POST['preinscritos'] as $indice => $valor){
	    $preinscripcion->cod_preinscripcion($valor);
	    if(isset($_POST['secciones'])){
		    foreach ($_POST['secciones'][$valor] as $key => $value) {
		    	$preinscripcion->seccion($value);
		    	if($preinscripcion->Inscribir())
			    	$confirmacion++;
			    else
			    	$confirmacion=0;
		    }
	    }
	  }                                                        
	}
	if($confirmacion!=0){
		$_SESSION['datos']['mensaje']="Los estudiantes han sido inscritos exitosamente!";
		header("Location: ../vistas/?inscribir_pre_inscripcion");
	}else{
		$_SESSION['datos']['mensaje']="Problema al completar la inscripción de los estudiantes preinscritos.";
		header("Location: ../vistas/?inscribir_pre_inscripcion");
	}
}

if($operacion=='BuscarInfo'){
	echo $preinscripcion->BuscarInfo($cedula);
	unset($preinscripcion);
}
?>