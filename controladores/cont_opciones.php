<?php
session_start();
if(isset($_POST['operacion']))
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['cod_opciones']))
$id=ucfirst(trim($_POST['cod_opciones']));

if(isset($_POST['nombre_opciones']))
$nombre_opciones=ucfirst(trim($_POST['nombre_opciones']));

if(isset($_POST['orden_opciones']))
$orden_opciones=ucfirst(trim($_POST['orden_opciones']));

include_once("../clases/class_opciones.php");
$opciones=new Opciones();
if($operacion=='Registrar'){
  $opciones->codigo_opciones($id);
  $opciones->nombre_opciones($nombre_opciones);
  $opciones->orden_opciones($orden_opciones);
  if(!$opciones->Comprobar()){
    if($opciones->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($opciones->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($opciones->Activar())					  
        $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La opción ha sido registrada con éxito !";
    header("Location: ../vistas/?opciones");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar la opción.";
    header("Location: ../vistas/?opciones");
  }
}

if($operacion=='Modificar'){
  $opciones->codigo_opciones($id);
  $opciones->nombre_opciones($nombre_opciones);
  $opciones->orden_opciones($orden_opciones);
  if($opciones->Actualizar())
  $confirmacion=1;
  else
  $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La opción ha sido modificada con éxito !";
    header("Location: ../vistas/?opciones");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar la opción.";
    header("Location: ../vistas/?opciones");
  }
}

if($operacion=='Desactivar'){
  $opciones->codigo_opciones($id);
  $opciones->nombre_opciones($nombre_opciones);
  if($opciones->Consultar()){
    if($opciones->Desactivar())
    $confirmacion=1;
    else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La opción ha sido desactivada con éxito";
    header("Location: ../vistas/?opciones");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar la opción.";
    header("Location: ../vistas/?opciones");
  }
}

if($operacion=='Activar'){
  $opciones->codigo_opciones($id);
  $opciones->nombre_opciones($nombre_opciones);
  if($opciones->Consultar()){
    if($opciones->Activar())
    $confirmacion=1;
    else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La opción ha sido activada con éxito";
    header("Location: ../vistas/?opciones");
  }else{
    $_SESSION['datos']['mensaje']="Problema al activar la opción.";
    header("Location: ../vistas/?opciones");
  }
}

if($operacion=='Consultar'){	
  $opciones->codigo_opciones($id);
  $opciones->nombre_opciones($nombre_opciones);
  if($opciones->Consultar()){
    $_SESSION['datos']['cod_opciones']=$opciones->codigo_opciones();
    $_SESSION['datos']['nombre_opciones']=$opciones->nombre_opciones();
    $_SESSION['datos']['estatus']=$opciones->estatus_opciones();
    $_SESSION['datos']['orden']=$opciones->orden_opciones();
    header("Location: ../vistas/?opciones");
  }else{
    $_SESSION['datos']['mensaje']="No se han encontrado resultados para tu búsqueda(".$nombre_opciones.")";
    header("Location: ../vistas/?opciones");
  }
}
?>