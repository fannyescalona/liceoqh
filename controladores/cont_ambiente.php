<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['cod_ambiente']))
$id=ucfirst(trim($_POST['cod_ambiente']));

if(isset($_POST['nombre_ambiente']))
$nombre_ambiente=ucfirst(trim($_POST['nombre_ambiente']));

if(isset($_POST['tipo_ambiente']))
$tipo_ambiente=ucfirst(trim($_POST['tipo_ambiente']));


include_once("../clases/class_ambiente.php");
$ambiente=new ambiente();
if($operacion=='Registrar'){
  $ambiente->codigo_ambiente($id);
  $ambiente->nombre_ambiente($nombre_ambiente);
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
    $_SESSION['datos']['mensaje']="El ambiente ha sido registrado con éxito !";
    header("Location: ../vistas/?ambiente");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar ambiente.";
    header("Location: ../vistas/?ambiente");
  }
}

if($operacion=='Modificar'){
  $ambiente->codigo_ambiente($id);
  $ambiente->nombre_ambiente($nombre_ambiente);
  $ambiente->tipo_ambiente($tipo_ambiente);
  if($ambiente->Actualizar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El ambiente ha sido modificado con éxito !";
    header("Location: ../vistas/?ambiente");
  }else{
    $_SESSION['datos']['mensaje']="Ocurrió un Problema al modificar el ambiente.";
    header("Location: ../vistas/?ambiente");
  }
}

if($operacion=='Desactivar'){
  $ambiente->codigo_ambiente($id);
  $ambiente->nombre_ambiente($nombre_ambiente);
  if($ambiente->Consultar()){
    if($ambiente->Desactivar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El ambiente ha sido desactivado con éxito";
    header("Location: ../vistas/?ambiente");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el ambiente.";
    header("Location: ../vistas/?ambiente");
  }
}

if($operacion=='Activar'){
  $ambiente->codigo_ambiente($id);
  $ambiente->nombre_ambiente($nombre_ambiente);
  if($ambiente->Consultar()){
    if($ambiente->Activar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El ambiente ha sido desactivado con éxito";
    header("Location: ../vistas/?ambiente");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el ambiente.";
    header("Location: ../vistas/?ambiente");
  }
}

if($operacion=='Consultar'){	
  $ambiente->codigo_ambiente($id);
  $ambiente->nombre_ambiente($nombre_ambiente);
  if($ambiente->Consultar()){
    $_SESSION['datos']['cod_ambiente']=$ambiente->codigo_ambiente();
    $_SESSION['datos']['nombre_ambiente']=$ambiente->nombre_ambiente();
    $_SESSION['datos']['tipo_ambiente']=$ambiente->tipo_ambiente();
    $_SESSION['datos']['estatus']=$ambiente->estatus_ambiente();
    header("Location: ../vistas/?ambiente");
  }else{
    $_SESSION['datos']['mensaje']="No se han encontrado resultados para tu búsqueda(".$nombre_ambiente.")";
    header("Location: ../vistas/?ambiente");
  }
}		  
?>