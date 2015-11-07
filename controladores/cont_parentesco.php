<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_parentesco']))
$codigo_parentesco=ucfirst(trim($_POST['codigo_parentesco']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));


include_once("../clases/class_parentesco.php");
$parentesco=new parentesco();
if($operacion=='Registrar'){
  $parentesco->codigo_parentesco($codigo_parentesco);
  $parentesco->descripcion($descripcion);
  if(!$parentesco->Comprobar()){
    if($parentesco->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($parentesco->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($parentesco->Activar())					  
        $confirmacion=1;
    }
  }
if($confirmacion==1){
  $_SESSION['datos']['mensaje']="El parentesco ha sido registrado con éxito !";
  header("Location: ../vistas/?parentesco");
 }else{
  $_SESSION['datos']['mensaje']="Se presentó un error al registrar el parentesco.";
  header("Location: ../vistas/?parentesco");
}
}

if($operacion=='Modificar'){
  $parentesco->codigo_parentesco($codigo_parentesco);
  $parentesco->descripcion($descripcion);
  if($parentesco->Actualizar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El parentesco ha sido modificado con éxito !";
    header("Location: ../vistas/?parentesco");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar el parentesco.";
    header("Location: ../vistas/?parentesco");
  }
}

if($operacion=='Desactivar'){
  $parentesco->codigo_parentesco($codigo_parentesco);
  $parentesco->descripcion($descripcion);
  if($parentesco->Consultar()){
    if($parentesco->Desactivar())
	   $confirmacion=1;
	else
	   $confirmacion=-1;
  }else{
	   $confirmacion=0;
  }
   if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El parentesco ha sido desactivado con éxito";
    header("Location: ../vistas/?parentesco");
   }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el parentesco.";
    header("Location: ../vistas/?parentesco");
    }
}

if($operacion=='Activar'){
  $parentesco->codigo_parentesco($codigo_parentesco);
  $parentesco->descripcion($descripcion);
  if($parentesco->Consultar()){
    if($parentesco->Activar())
     $confirmacion=1;
  else
     $confirmacion=-1;
  }else{
     $confirmacion=0;
  }
   if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El parentesco ha sido desactivado con éxito";
    header("Location: ../vistas/?parentesco");
   }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el parentesco.";
    header("Location: ../vistas/?parentesco");
    }
}

if($operacion=='Consultar'){	
  $parentesco->codigo_parentesco($codigo_parentesco);
  $parentesco->descripcion($descripcion);
   if($parentesco->Consultar()){
    $_SESSION['datos']['codigo_parentesco']=$parentesco->codigo_parentesco();
    $_SESSION['datos']['descripcion']=$parentesco->descripcion();
    $_SESSION['datos']['estatus']=$parentesco->estatus_parentesco();
    header("Location: ../vistas/?parentesco");
  }else{
   $_SESSION['datos']['mensaje']="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
   header("Location: ../vistas/?parentesco");
  }
}		  
?>