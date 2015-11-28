<?php
session_start();
if(isset($_POST['operacion']))
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_cargo']))
$codigo_cargo=ucfirst(trim($_POST['codigo_cargo']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));

include_once("../clases/class_cargo.php");
$cargo=new cargo();
if($operacion=='Registrar'){
  $cargo->codigo_cargo($codigo_cargo);
  $cargo->descripcion($descripcion);
  if(!$cargo->Comprobar()){
    if($cargo->Registrar())
    $confirmacion=1;
    else
    $confirmacion=-1;
  }else{
    if($cargo->fecha_desactivacion()==null)
    $confirmacion=0;
    else{
    if($cargo->Activar())					  
    $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El cargo ha sido registrado con éxito !";
    header("Location: ../vistas/?cargo");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar el cargo.<br><b>Error: ".utf8_encode($cargo->error())."</b>";
    header("Location: ../vistas/?cargo");
  }
}

if($operacion=='Modificar'){
  $cargo->codigo_cargo($codigo_cargo);
  $cargo->descripcion($descripcion);
    if($cargo->Actualizar())
    $confirmacion=1;
    else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El cargo ha sido modificado con éxito !";
    header("Location: ../vistas/?cargo");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar el cargo.<br><b>Error: ".utf8_encode($cargo->error())."</b>";
    header("Location: ../vistas/?cargo");
  }
}

if($operacion=='Desactivar'){
  $cargo->codigo_cargo($codigo_cargo);
  $cargo->descripcion($descripcion);
  if($cargo->Consultar()){
    if($cargo->Desactivar())
    $confirmacion=1;
    else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El cargo ha sido desactivado con éxito";
    header("Location: ../vistas/?cargo");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el cargo.<br><b>Error: ".utf8_encode($cargo->error())."</b>";
    header("Location: ../vistas/?cargo");
  }
}


if($operacion=='Activar'){
  $cargo->codigo_cargo($codigo_cargo);
  $cargo->descripcion($descripcion);
  if($cargo->Consultar()){
    if($cargo->Activar())
    $confirmacion=1;
    else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El cargo ha sido desactivado con éxito";
    header("Location: ../vistas/?cargo");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el cargo.<br><b>Error: ".utf8_encode($cargo->error())."</b>";
    header("Location: ../vistas/?cargo");
  }
}

if($operacion=='Consultar'){	
  $cargo->codigo_cargo($codigo_cargo);
  $cargo->descripcion($descripcion);
  if($cargo->Consultar()){
    $_SESSION['datos']['codigo_cargo']=$cargo->codigo_cargo();
    $_SESSION['datos']['descripcion']=$cargo->descripcion();
    $_SESSION['datos']['estatus']=$cargo->estatus_cargo();
    header("Location: ../vistas/?cargo");
  }else{
    $error="";
    if($cargo->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($cargo->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    $_SESSION['datos']['mensaje']=$error;
    header("Location: ../vistas/?cargo");
  }
}
?>