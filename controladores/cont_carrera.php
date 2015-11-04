<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
$operacion=ucfirst(trim($_POST['operacion']));
//Asignar valor a variable
if(isset($_POST['cod_carrera']))
$id=ucfirst(trim($_POST['cod_carrera']));
if(isset($_POST['nombre_carrera']))
$nombre_carrera=ucfirst(trim($_POST['nombre_carrera']));
if(isset($_POST['rif']))
$rif=ucfirst(trim($_POST['rif']));

include_once("../clases/class_carrera.php");
$carrera=new Carrera();
if($operacion=='Registrar'){
  $carrera->codigo_carrera($id);
  $carrera->nombre_carrera($nombre_carrera);
  $carrera->rif($rif);
  if(!$carrera->Comprobar()){
    if($carrera->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($carrera->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
        if($carrera->Activar())            
        $confirmacion=1;
        }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']=utf8_decode("La carrera ha sido registrada con éxito !");
    header("Location: ../vistas/?carrera");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar la carrera.";
    header("Location: ../vistas/?carrera");
  }
}

if($operacion=='Modificar'){
  $carrera->codigo_carrera($id);
  $carrera->nombre_carrera($nombre_carrera);
  $carrera->rif($rif);
    if($carrera->Actualizar())
     $confirmacion=1;
    else
     $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']=utf8_decode("La carrera ha sido modificada con éxito !");
    header("Location: ../vistas/?carrera");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar la carrera.";
    header("Location: ../vistas/?carrera");
  }
}

if($operacion=='Desactivar'){
  $carrera->codigo_carrera($id);
  $carrera->nombre_carrera($nombre_carrera);
  $carrera->rif($rif);
  if($carrera->Consultar()){
    if($carrera->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']=utf8_decode("La carrera ha sido desactivada con éxito");
    header("Location: ../vistas/?carrera");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar la carrera.";
    header("Location: ../vistas/?carrera");
  }
}


if($operacion=='Activar'){
  $carrera->codigo_carrera($id);
  $carrera->nombre_carrera($nombre_carrera);
  $carrera->rif($rif);
  if($carrera->Consultar()){
    if($carrera->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']=utf8_decode("La carrera ha sido desactivada con éxito");
    header("Location: ../vistas/?carrera");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar la carrera.";
    header("Location: ../vistas/?carrera");
  }
}

if($operacion=='Consultar'){ 
  $carrera->codigo_carrera($id);
  $carrera->nombre_carrera($nombre_carrera);
  if($carrera->Consultar()){
    $_SESSION['datos']['cod_carrera']=$carrera->codigo_carrera();
    $_SESSION['datos']['nombre_carrera']=$carrera->nombre_carrera();
    $_SESSION['datos']['estatus']=$carrera->estatus_carrera();
    $_SESSION['datos']['rif']=$carrera->rif();
    header("Location: ../vistas/?carrera");
  }else{
    $_SESSION['datos']['mensaje']=utf8_decode("No se han encontrado resultados para tu búsqueda(".$nombre_carrera.")");
    header("Location: ../vistas/?carrera");
  }
}    
?>