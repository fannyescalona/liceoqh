<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['cod_bloque_hora']))
$id=ucfirst(trim($_POST['cod_bloque_hora']));

if(isset($_POST['hora_inicio']))
$hora_inicio=ucfirst(trim($_POST['hora_inicio']));

if(isset($_POST['hora_fin']))
$hora_fin=ucfirst(trim($_POST['hora_fin']));

if($hora_fin<'12:00'){
	$turno = '0';
}else if($hora_fin<'18:30'){
	$turno = '1';
}else{
	$turno = '2';
}

include_once("../clases/class_bloque_hora.php");
$bloque_hora=new Bloque_Hora();
if($operacion=='Registrar'){
	$bloque_hora->bloque_hora($id);
	$bloque_hora->hora_inicio($hora_inicio);
	$bloque_hora->hora_fin($hora_fin);
	$bloque_hora->turno($turno);
	if(!$bloque_hora->Comprobar()){
		if($bloque_hora->Registrar())
		$confirmacion=1;
	else
		$confirmacion=-1;
	}else{
		if($bloque_hora->fecha_desactivacion()==null)
			$confirmacion=0;
		else{
		if($bloque_hora->Activar())					  
				$confirmacion=1;
	}
	}
	if($confirmacion==1){
		$_SESSION['datos']['mensaje']="El bloque de horas ha sido registrado con éxito !";
		header("Location: ../vistas/?bloque_hora");
	}else{
		$_SESSION['datos']['mensaje']="Se presentó un error al registrar bloque_hora.";
		header("Location: ../vistas/?bloque_hora");
	}
}

if($operacion=='Modificar'){
	$bloque_hora->bloque_hora($id);
	$bloque_hora->hora_inicio($hora_inicio);
	$bloque_hora->hora_fin($hora_fin);
	$bloque_hora->turno($turno);
		if($bloque_hora->Actualizar())
			$confirmacion=1;
		else
			$confirmacion=-1;
		if($confirmacion==1){
			$_SESSION['datos']['mensaje']="El bloque de horas ha sido modificado con éxito !";
			header("Location: ../vistas/?bloque_hora");
	}else{
			$_SESSION['datos']['mensaje']="Problema al modificar el bloque_hora.";
			header("Location: ../vistas/?bloque_hora");
	}
}
if($operacion=='Desactivar'){
	$bloque_hora->bloque_hora($id);
	$bloque_hora->hora_inicio($hora_inicio);
	$bloque_hora->hora_fin($hora_fin);
	$bloque_hora->turno($turno);
		if($bloque_hora->Consultar()){
		if($bloque_hora->Desactivar())
			$confirmacion=1;
		else
			$confirmacion=-1;
	}else{
			$confirmacion=0;
	}
	if($confirmacion==1){
		$_SESSION['datos']['mensaje']="El bloque de horas ha sido desactivado con éxito";
		header("Location: ../vistas/?bloque_hora");
	}else{
		$_SESSION['datos']['mensaje']="Problema al desactivar el bloque_hora.";
		header("Location: ../vistas/?bloque_hora");
	}
}
if($operacion=='Activar'){
	$bloque_hora->bloque_hora($id);
	$bloque_hora->hora_inicio($hora_inicio);
	$bloque_hora->hora_fin($hora_fin);
	$bloque_hora->turno($turno);
		if($bloque_hora->Consultar()){
		if($bloque_hora->Activar())
			$confirmacion=1;
		else
			$confirmacion=-1;
	}else{
			$confirmacion=0;
	}
	if($confirmacion==1){
		$_SESSION['datos']['mensaje']="El bloque de horas ha sido desactivado con éxito";
		header("Location: ../vistas/?bloque_hora");
	}else{
		$_SESSION['datos']['mensaje']="Problema al desactivar el bloque_hora.";
		header("Location: ../vistas/?bloque_hora");
	}
}
if($operacion=='Consultar'){	
	$bloque_hora->bloque_hora($id);
	$bloque_hora->hora_inicio($hora_inicio);
	$bloque_hora->hora_fin($hora_fin);
	if($bloque_hora->Consultar()){
		$_SESSION['datos']['cod_bloque_hora']=$bloque_hora->bloque_hora();
		$_SESSION['datos']['hora_inicio']=$bloque_hora->hora_inicio();
		$_SESSION['datos']['hora_fin']=$bloque_hora->hora_fin();
		$_SESSION['datos']['turno']=$bloque_hora->turno();
		$_SESSION['datos']['estatus']=$bloque_hora->estatus_bloque_hora();
		header("Location: ../vistas/?bloque_hora");
	}else{
		$_SESSION['datos']['mensaje']="No se han encontrado resultados para tu búsqueda(".$hora_inicio.")";
		header("Location: ../vistas/?bloque_hora");
	}
}		  
?>