<?php
session_start();
if(isset($_POST['operacion']))
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['cod_rol']))
$id=ucfirst(trim($_POST['cod_rol']));

if(isset($_POST['nombre_rol']))
$nombre_rol=ucfirst(trim($_POST['nombre_rol']));

include_once("../clases/class_rol.php");
$rol=new Rol();
if($operacion=='Registrar'){
  $rol->codigo_rol($id);
  $rol->nombre_rol($nombre_rol);
  if(!$rol->Comprobar()){
    if($rol->Registrar())
    $confirmacion=1;
    else
    $confirmacion=-1;
  }else{
    if($rol->fecha_desactivacion()==null)
    $confirmacion=0;
    else{
    if($rol->Activar())					  
    $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']=utf8_decode("El rol ha sido registrado con éxito !");
    header("Location: ../vistas/?rol");
  }else{
    $_SESSION['datos']['mensaje']=utf8_decode("Se presentó un error al registrar el rol.");
    header("Location: ../vistas/?rol");
  }
}

if($operacion=='Modificar'){
  $rol->codigo_rol($id);
  $rol->nombre_rol($nombre_rol);
    if($rol->Actualizar())
    $confirmacion=1;
    else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']=utf8_decode("El rol ha sido modificado con éxito !");
    header("Location: ../vistas/?rol");
  }else{
    $_SESSION['datos']['mensaje']=utf8_decode("Problema al modificar el rol.");
    header("Location: ../vistas/?rol");
  }
}

if($operacion=='Desactivar'){
  $rol->codigo_rol($id);
  $rol->nombre_rol($nombre_rol);
  if($rol->Consultar()){
    if($rol->Desactivar())
    $confirmacion=1;
    else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']=utf8_decode("El rol ha sido desactivado con éxito");
    header("Location: ../vistas/?rol");
  }else{
    $_SESSION['datos']['mensaje']=utf8_decode("Problema al desactivar el rol.");
    header("Location: ../vistas/?rol");
  }
}


if($operacion=='Activar'){
  $rol->codigo_rol($id);
  $rol->nombre_rol($nombre_rol);
  if($rol->Consultar()){
    if($rol->Activar())
    $confirmacion=1;
    else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']=utf8_decode("El rol ha sido desactivado con éxito");
    header("Location: ../vistas/?rol");
  }else{
    $_SESSION['datos']['mensaje']=utf8_decode("Problema al desactivar el rol.");
    header("Location: ../vistas/?rol");
  }
}

if($operacion=='Consultar'){	
  $rol->codigo_rol($id);
  $rol->nombre_rol($nombre_rol);
  if($rol->Consultar()){
    $_SESSION['datos']['cod_rol']=$rol->codigo_rol();
    $_SESSION['datos']['nombre_rol']=$rol->nombre_rol();
    $_SESSION['datos']['estatus']=$rol->estatus_rol();
    header("Location: ../vistas/?rol");
  }else{
    $_SESSION['datos']['mensaje']=utf8_decode("No se han encontrado resultados para tu búsqueda(".$nombre_rol.")");
    header("Location: ../vistas/?rol");
  }
}
?>