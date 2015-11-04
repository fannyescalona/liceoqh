<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['cod_ciudad']))
$id=ucfirst(trim($_POST['cod_ciudad']));

if(isset($_POST['nombre_ciudad']))
$nombre_ciudad=ucfirst(trim($_POST['nombre_ciudad']));

if(isset($_POST['cod_estado']))
$cod_estado=ucfirst(trim($_POST['cod_estado']));


include_once("../clases/class_ciudad.php");
$ciudad=new Ciudad();
if($operacion=='Registrar'){
  $ciudad->codigo_ciudad($id);
  $ciudad->nombre_ciudad($nombre_ciudad);
  $ciudad->codigo_estado($cod_estado);
  if(!$ciudad->Comprobar()){
    if($ciudad->Registrar())
       $confirmacion=1;
    else
       $confirmacion=-1;
  }else{
    if($ciudad->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($ciudad->Activar())            
         $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La ciudad ha sido registrada con éxito !";
    header("Location: ../vistas/?ciudad");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar ciudad.";
    header("Location: ../vistas/?ciudad");
  }
}

if($operacion=='Modificar'){
  $ciudad->codigo_ciudad($id);
  $ciudad->nombre_ciudad($nombre_ciudad);
  $ciudad->codigo_estado($cod_estado);
    if($ciudad->Actualizar())
     $confirmacion=1;
    else
     $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La ciudad ha sido modificada con éxito !";
    header("Location: ../vistas/?ciudad");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar la ciudad.";
    header("Location: ../vistas/?ciudad");
  }
}

if($operacion=='Desactivar'){
  $ciudad->codigo_ciudad($id);
  $ciudad->nombre_ciudad($nombre_ciudad);
  $ciudad->codigo_estado($cod_estado);
  if($ciudad->Consultar()){
    if($ciudad->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La ciudad ha sido desactivada con éxito";
    header("Location: ../vistas/?ciudad");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar la ciudad.";
    header("Location: ../vistas/?ciudad");
  }
}


if($operacion=='Activar'){
  $ciudad->codigo_ciudad($id);
  $ciudad->nombre_ciudad($nombre_ciudad);
  $ciudad->codigo_estado($cod_estado);
  if($ciudad->Consultar()){
    if($ciudad->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La ciudad ha sido desactivada con éxito";
    header("Location: ../vistas/?ciudad");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar la ciudad.";
    header("Location: ../vistas/?ciudad");
  }
}

if($operacion=='Consultar'){ 
  $ciudad->codigo_ciudad($id);
  $ciudad->nombre_ciudad($nombre_ciudad);
  if($ciudad->Consultar()){
    $_SESSION['datos']['cod_ciudad']=$ciudad->codigo_ciudad();
    $_SESSION['datos']['nombre_ciudad']=$ciudad->nombre_ciudad();
    $_SESSION['datos']['cod_estado']=$ciudad->codigo_estado();
    $_SESSION['datos']['estatus']=$ciudad->estatus_ciudad();
    header("Location: ../vistas/?ciudad");
  }else{
    $_SESSION['datos']['mensaje']=utf8_encode("No se han encontrado resultados para tu búsqueda(".$nombre_ciudad.")");
    header("Location: ../vistas/?ciudad");
  }
}    
?>