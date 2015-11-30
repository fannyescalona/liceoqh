<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
  //Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_parroquia']))
$id=ucfirst(trim($_POST['codigo_parroquia']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));

if(isset($_POST['codigo_municipio']))
$codigo_municipio=ucfirst(trim($_POST['codigo_municipio']));

include_once("../clases/class_parroquia.php");
$parroquia=new Parroquia();
if($operacion=='Registrar'){
  $parroquia->codigo_parroquia($id);
  $parroquia->descripcion($descripcion);
  $parroquia->codigo_municipio($codigo_municipio);
  if(!$parroquia->Comprobar()){
    if($parroquia->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($parroquia->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($parroquia->Activar())            
        $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La parroquia ha sido registrada con éxito !";
    header("Location: ../vistas/?parroquia");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar la parroquia.<br><b>Error: ".utf8_encode($parroquia->error())."</b>";
    header("Location: ../vistas/?parroquia");
  }
}

if($operacion=='Modificar'){
  $parroquia->codigo_parroquia($id);
  $parroquia->descripcion($descripcion);
  $parroquia->codigo_municipio($codigo_municipio);
    if($parroquia->Actualizar())
     $confirmacion=1;
    else
     $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La parroquia ha sido modificada con éxito !";
    header("Location: ../vistas/?parroquia");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar la parroquia.<br><b>Error: ".utf8_encode($parroquia->error())."</b>";
    header("Location: ../vistas/?parroquia");
  }
}

if($operacion=='Desactivar'){
  $parroquia->codigo_parroquia($id);
  $parroquia->descripcion($descripcion);
  $parroquia->codigo_municipio($codigo_municipio);
  if($parroquia->Consultar()){
    if($parroquia->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La parroquia ha sido desactivada con éxito";
    header("Location: ../vistas/?parroquia");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar la parroquia.<br><b>Error: ".utf8_encode($parroquia->error())."</b>";
    header("Location: ../vistas/?parroquia");
  }
}

if($operacion=='Activar'){
  $parroquia->codigo_parroquia($id);
  $parroquia->descripcion($descripcion);
  $parroquia->codigo_municipio($codigo_municipio);
  if($parroquia->Consultar()){
    if($parroquia->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La parroquia ha sido desactivada con éxito";
    header("Location: ../vistas/?parroquia");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar la parroquia.<br><b>Error: ".utf8_encode($parroquia->error())."</b>";
    header("Location: ../vistas/?parroquia");
  }
}

if($operacion=='Consultar'){ 
  $parroquia->codigo_parroquia($id);
  $parroquia->descripcion($descripcion);
  if($parroquia->Consultar()){
    $_SESSION['datos']['codigo_parroquia']=$parroquia->codigo_parroquia();
    $_SESSION['datos']['descripcion']=$parroquia->descripcion();
    $_SESSION['datos']['codigo_municipio']=$parroquia->codigo_municipio();
    $_SESSION['datos']['estatus']=$parroquia->estatus_parroquia();
    header("Location: ../vistas/?parroquia");
  }else{
    $error="";
    if($parroquia->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($parroquia->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    $_SESSION['datos']['mensaje']=$error;
    header("Location: ../vistas/?parroquia");
  }
}    
?>