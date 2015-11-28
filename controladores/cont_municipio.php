<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
  //Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_municipio']))
$id=ucfirst(trim($_POST['codigo_municipio']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));

if(isset($_POST['codigo_estado']))
$codigo_estado=ucfirst(trim($_POST['codigo_estado']));


include_once("../clases/class_municipio.php");
$municipio=new Municipio();
if($operacion=='Registrar'){
  $municipio->codigo_municipio($id);
  $municipio->descripcion($descripcion);
  $municipio->codigo_estado($codigo_estado);
    if(!$municipio->Comprobar()){
    if($municipio->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($municipio->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($municipio->Activar())            
        $confirmacion=1;
    }
}
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El municipio ha sido registrado con éxito !";
    header("Location: ../vistas/?municipio");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar el municipio.<br><b>Error: ".utf8_encode($municipio->error())."</b>";
    header("Location: ../vistas/?municipio");
  }
}

if($operacion=='Modificar'){
  $municipio->codigo_municipio($id);
  $municipio->descripcion($descripcion);
  $municipio->codigo_estado($codigo_estado);
    if($municipio->Actualizar())
     $confirmacion=1;
    else
     $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El municipio ha sido modificado con éxito !";
    header("Location: ../vistas/?municipio");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar el municipio.<br><b>Error: ".utf8_encode($municipio->error())."</b>";
    header("Location: ../vistas/?municipio");
  }
}

if($operacion=='Desactivar'){
  $municipio->codigo_municipio($id);
  $municipio->descripcion($descripcion);
  $municipio->codigo_estado($codigo_estado);
  if($municipio->Consultar()){
    if($municipio->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El municipio ha sido desactivado con éxito";
    header("Location: ../vistas/?municipio");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el municipio.<br><b>Error: ".utf8_encode($municipio->error())."</b>";
    header("Location: ../vistas/?municipio");
  }
}


if($operacion=='Activar'){
  $municipio->codigo_municipio($id);
  $municipio->descripcion($descripcion);
  $municipio->codigo_estado($codigo_estado);
  if($municipio->Consultar()){
    if($municipio->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El municipio ha sido desactivado con éxito";
    header("Location: ../vistas/?municipio");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el municipio.<br><b>Error: ".utf8_encode($municipio->error())."</b>";
    header("Location: ../vistas/?municipio");
  }
}

if($operacion=='Consultar'){ 
  $municipio->codigo_municipio($id);
  $municipio->descripcion($descripcion);
  $municipio->codigo_estado($codigo_estado);
  if($municipio->Consultar()){
    $_SESSION['datos']['codigo_municipio']=$municipio->codigo_municipio();
    $_SESSION['datos']['descripcion']=$municipio->descripcion();
    $_SESSION['datos']['codigo_estado']=$municipio->codigo_estado();
    $_SESSION['datos']['estatus']=$municipio->estatus_municipio();
    header("Location: ../vistas/?municipio");
  }else{
    $error="";
    if($municipio->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($municipio->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$codigo_municipio.")";
    $_SESSION['datos']['mensaje']=$error;
    header("Location: ../vistas/?municipio");
  }
}    
?>