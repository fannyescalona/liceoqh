<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_ambiente']))
$id=trim($_POST['codigo_ambiente']);

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));

if(isset($_POST['tipo_ambiente']))
$tipo_ambiente=trim($_POST['tipo_ambiente']);

include_once("../clases/class_ambiente.php");
$ambiente=new Ambiente();
if($operacion=='Registrar'){
  $ambiente->codigo_ambiente($id);
  $ambiente->descripcion($descripcion);
  $ambiente->tipo_ambiente($tipo_ambiente);
  if(!$ambiente->Comprobar()){
    if($ambiente->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($ambiente->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($ambiente->Activar())					  
        $confirmacion=1;
    }
  }
if($confirmacion==1){
  $_SESSION['datos']['mensaje']="El ambiente de clases ha sido registrado con éxito !";
  header("Location: ../vistas/?ambiente");
 }else{
  $_SESSION['datos']['mensaje']="Se presentó un error al registrar el ambiente de clases.<br><b>Error: ".utf8_encode($ambiente->error())."</b>";
  header("Location: ../vistas/?ambiente");
}
}

if($operacion=='Modificar'){
  $ambiente->codigo_ambiente($id);
  $ambiente->descripcion($descripcion);
  $ambiente->tipo_ambiente($tipo_ambiente);
  if($ambiente->Actualizar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El ambiente de clases ha sido modificado con éxito !";
    header("Location: ../vistas/?ambiente");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar el ambiente de clases.<br><b>Error: ".utf8_encode($ambiente->error())."</b>";
    header("Location: ../vistas/?ambiente");
  }
}

if($operacion=='Desactivar'){
  $ambiente->codigo_ambiente($id);
  $ambiente->descripcion($descripcion);
  if($ambiente->Consultar()){
    if($ambiente->Desactivar())
	   $confirmacion=1;
	else
	   $confirmacion=-1;
  }else{
	   $confirmacion=0;
  }
   if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El ambiente de clases ha sido desactivado con éxito";
    header("Location: ../vistas/?ambiente");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el ambiente de clases.<br><b>Error: ".utf8_encode($ambiente->error())."</b>";
    header("Location: ../vistas/?ambiente");
    }
}

if($operacion=='Activar'){
  $ambiente->codigo_ambiente($id);
  $ambiente->descripcion($descripcion);
  if($ambiente->Consultar()){
    if($ambiente->Activar())
     $confirmacion=1;
  else
     $confirmacion=-1;
  }else{
     $confirmacion=0;
  }
   if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El ambiente de clases ha sido desactivado con éxito";
    header("Location: ../vistas/?ambiente");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el ambiente de clases.<br><b>Error: ".utf8_encode($ambiente->error())."</b>";
    header("Location: ../vistas/?ambiente");
    }
}

if($operacion=='Consultar'){	
  $ambiente->codigo_ambiente($id);
  $ambiente->descripcion($descripcion);
   if($ambiente->Consultar()){
    $_SESSION['datos']['codigo_ambiente']=$ambiente->codigo_ambiente();
    $_SESSION['datos']['descripcion']=$ambiente->descripcion();
    $_SESSION['datos']['tipo_ambiente']=$ambiente->tipo_ambiente();
    $_SESSION['datos']['estatus']=$ambiente->estatus_ambiente();
    header("Location: ../vistas/?ambiente");
  }else{
    $error="";
    if($ambiente->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($ambiente->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    $_SESSION['datos']['mensaje']=$error;
   header("Location: ../vistas/?ambiente");
  }
}		  
?>