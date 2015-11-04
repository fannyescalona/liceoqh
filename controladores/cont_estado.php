<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_estado']))
$id=ucfirst(trim($_POST['codigo_estado']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));

if(isset($_POST['codigo_pais']))
$codigo_pais=ucfirst(trim($_POST['codigo_pais']));


include_once("../clases/class_estado.php");
$estado=new Estado();
if($operacion=='Registrar'){
  $estado->codigo_estado($id);
  $estado->descripcion($descripcion);
  $estado->codigo_pais($codigo_pais);
  if(!$estado->Comprobar()){
    if($estado->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($estado->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($estado->Activar())            
        $confirmacion=1;
    }
  }

  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El estado ha sido registrado con éxito !";
    header("Location: ../vistas/?estado");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar el estado.";
    header("Location: ../vistas/?estado");
  }
}

if($operacion=='Modificar'){
  $estado->codigo_estado($id);
  $estado->descripcion($descripcion);
  $estado->codigo_pais($codigo_pais);
    if($estado->Actualizar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El estado ha sido modificado con éxito !";
    header("Location: ../vistas/?estado");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar el estado.";
    header("Location: ../vistas/?estado");
  }
}

if($operacion=='Desactivar'){
  $estado->codigo_estado($id);
  $estado->descripcion($descripcion);
  $estado->codigo_pais($codigo_pais);
  if($estado->Consultar()){
    if($estado->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El estado ha sido desactivado con éxito";
    header("Location: ../vistas/?estado");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el estado.";
    header("Location: ../vistas/?estado");
  }
}


if($operacion=='Activar'){
  $estado->codigo_estado($id);
  $estado->descripcion($descripcion);
  $estado->codigo_pais($codigo_pais);
  if($estado->Consultar()){
    if($estado->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El estado ha sido desactivado con éxito";
    header("Location: ../vistas/?estado");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el estado.";
    header("Location: ../vistas/?estado");
  }
}

if($operacion=='Consultar'){ 
  $estado->codigo_estado($id);
  $estado->descripcion($descripcion);
  if($estado->Consultar()){
    $_SESSION['datos']['codigo_estado']=$estado->codigo_estado();
    $_SESSION['datos']['descripcion']=$estado->descripcion();
    $_SESSION['datos']['codigo_pais']=$estado->codigo_pais();
    $_SESSION['datos']['estatus']=$estado->estatus_estado();
    header("Location: ../vistas/?estado");
  }else{
    $_SESSION['datos']['mensaje']=utf8_encode("No se han encontrado resultados para tu búsqueda(".$descripcion.")");
    header("Location: ../vistas/?estado");
  }
}    
?>