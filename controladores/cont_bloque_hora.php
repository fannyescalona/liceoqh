<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_bloque_hora']))
$id=trim($_POST['codigo_bloque_hora']);

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));

if(isset($_POST['hora_inicio']))
$hora_inicio=trim($_POST['hora_inicio']);

if(isset($_POST['hora_fin']))
$hora_fin=trim($_POST['hora_fin']);

if(isset($_POST['hora_academica']))
$hora_academica=trim($_POST['hora_academica']);

if(isset($_POST['turno']))
$turno=ucfirst(trim($_POST['turno']));

if(isset($_POST['receso']))
$receso=ucfirst(trim($_POST['receso']));

include_once("../clases/class_bloque_hora.php");
$bloque_hora=new Bloque_Hora();
if($operacion=='Registrar'){
  $bloque_hora->codigo_bloque_hora($id);
  $bloque_hora->descripcion($descripcion);
  $bloque_hora->hora_inicio($hora_inicio);
  $bloque_hora->hora_fin($hora_fin);
  $bloque_hora->hora_academica($hora_academica);
  $bloque_hora->turno($turno);
  $bloque_hora->receso($receso);
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
  $_SESSION['datos']['mensaje']="El bloque de hora ha sido registrado con éxito !";
  header("Location: ../vistas/?bloque_hora");
 }else{
  $_SESSION['datos']['mensaje']="Se presentó un error al registrar el bloque de hora.<br><b>Error: ".utf8_encode($bloque_hora->error())."</b>";
  header("Location: ../vistas/?bloque_hora");
}
}

if($operacion=='Modificar'){
  $bloque_hora->codigo_bloque_hora($id);
  $bloque_hora->descripcion($descripcion);
  $bloque_hora->hora_inicio($hora_inicio);
  $bloque_hora->hora_fin($hora_fin);
  $bloque_hora->hora_academica($hora_academica);
  $bloque_hora->turno($turno);
  $bloque_hora->receso($receso);
  if($bloque_hora->Actualizar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El bloque de hora ha sido modificado con éxito !";
    header("Location: ../vistas/?bloque_hora");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar el bloque de hora.<br><b>Error: ".utf8_encode($bloque_hora->error())."</b>";
    header("Location: ../vistas/?bloque_hora");
  }
}

if($operacion=='Desactivar'){
  $bloque_hora->codigo_bloque_hora($id);
  $bloque_hora->descripcion($descripcion);
  if($bloque_hora->Consultar()){
    if($bloque_hora->Desactivar())
	   $confirmacion=1;
	else
	   $confirmacion=-1;
  }else{
	   $confirmacion=0;
  }
   if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El bloque de hora ha sido desactivado con éxito";
    header("Location: ../vistas/?bloque_hora");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el bloque de hora.<br><b>Error: ".utf8_encode($bloque_hora->error())."</b>";
    header("Location: ../vistas/?bloque_hora");
    }
}

if($operacion=='Activar'){
  $bloque_hora->codigo_bloque_hora($id);
  $bloque_hora->descripcion($descripcion);
  if($bloque_hora->Consultar()){
    if($bloque_hora->Activar())
     $confirmacion=1;
  else
     $confirmacion=-1;
  }else{
     $confirmacion=0;
  }
   if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El bloque de hora ha sido desactivado con éxito";
    header("Location: ../vistas/?bloque_hora");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el bloque de hora.<br><b>Error: ".utf8_encode($bloque_hora->error())."</b>";
    header("Location: ../vistas/?bloque_hora");
    }
}

if($operacion=='Consultar'){	
  $bloque_hora->codigo_bloque_hora($id);
  $bloque_hora->descripcion($descripcion);
  $bloque_hora->hora_inicio($hora_inicio);
  $bloque_hora->hora_fin($hora_fin);
  if($bloque_hora->Consultar()){
    $_SESSION['datos']['codigo_bloque_hora']=$bloque_hora->codigo_bloque_hora();
    $_SESSION['datos']['descripcion']=$bloque_hora->descripcion();
    $_SESSION['datos']['hora_inicio']=$bloque_hora->hora_inicio();
    $_SESSION['datos']['hora_fin']=$bloque_hora->hora_fin();
    $_SESSION['datos']['hora_academica']=$bloque_hora->hora_academica();
    $_SESSION['datos']['turno']=$bloque_hora->turno();
    $_SESSION['datos']['receso']=$bloque_hora->receso();
    $_SESSION['datos']['estatus']=$bloque_hora->estatus_bloque_hora();
    header("Location: ../vistas/?bloque_hora");
  }else{
    $error="";
    if($bloque_hora->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($bloque_hora->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    $_SESSION['datos']['mensaje']=$error;
   header("Location: ../vistas/?bloque_hora");
  }
}		  
?>