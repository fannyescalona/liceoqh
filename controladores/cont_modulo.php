<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_modulo']))
$id=ucfirst(trim($_POST['codigo_modulo']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));

if(isset($_POST['icono']))
$icono=trim($_POST['icono']);

if(isset($_POST['orden']))
$orden=trim($_POST['orden']);

include_once("../clases/class_modulo.php");
$modulo=new modulo();
if($operacion=='Registrar'){
  $modulo->codigo_modulo($id);
  $modulo->descripcion($descripcion);
  $modulo->icono($icono);
  $modulo->orden($orden);
  if(!$modulo->Comprobar()){
    if($modulo->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($modulo->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($modulo->Activar())					  
        $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El módulo ha sido registrado con éxito !";
    header("Location: ../vistas/?modulo");
  }else {
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar el módulo.";
    header("Location: ../vistas/?modulo");
  }
}

if($operacion=='Modificar'){
  $modulo->codigo_modulo($id);
  $modulo->descripcion($descripcion);
  $modulo->icono($icono);
  $modulo->orden($orden);
  if($modulo->Actualizar())
   $confirmacion=1;
  else
   $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El módulo ha sido modificado con éxito !";
    header("Location: ../vistas/?modulo");
  }else{
    $_SESSION['datos']['mensaje']="Error al modificar el módulo.";
    header("Location: ../vistas/?modulo");
  }
}

if($operacion=='Desactivar'){
  $modulo->codigo_modulo($id);
  $modulo->descripcion($descripcion);
  if($modulo->Consultar()){
    if($modulo->Desactivar())
     $confirmacion=1;
    else
     $confirmacion=-1;
  }else{
     $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El módulo ha sido desactivado con éxito !";
    header("Location: ../vistas/?modulo");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el módulo.";
    header("Location: ../vistas/?modulo");
  }
}


if($operacion=='Activar'){
  $modulo->codigo_modulo($id);
  $modulo->descripcion($descripcion);
  if($modulo->Consultar()){
    if($modulo->Activar())
     $confirmacion=1;
    else
     $confirmacion=-1;
  }else{
     $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El módulo ha sido desactivado con éxito !";
    header("Location: ../vistas/?modulo");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el módulo.";
    header("Location: ../vistas/?modulo");
  }
}

if($operacion=='Consultar'){	
  $modulo->codigo_modulo($id);
  $modulo->descripcion($descripcion);
  $modulo->icono($icono);
  $modulo->orden($orden);
  if($modulo->Consultar()){
    $_SESSION['datos']['codigo_modulo']=$modulo->codigo_modulo();
    $_SESSION['datos']['descripcion']=$modulo->descripcion();
    $_SESSION['datos']['icono']=$modulo->icono();
    $_SESSION['datos']['orden']=$modulo->orden();
    $_SESSION['datos']['estatus']=$modulo->estatus();
    header("Location: ../vistas/?modulo");
  }else{
    $_SESSION['datos']['mensaje']="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    header("Location: ../vistas/?modulo");
  }                              
}		  
?>