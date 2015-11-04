<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
  //Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['cod_parroquia']))
$id=ucfirst(trim($_POST['cod_parroquia']));

if(isset($_POST['nombre_parroquia']))
$nombre_parroquia=ucfirst(trim($_POST['nombre_parroquia']));

if(isset($_POST['cod_municipio']))
$cod_municipio=ucfirst(trim($_POST['cod_municipio']));


include_once("../clases/class_parroquia.php");
$parroquia=new Parroquia();
if($operacion=='Registrar'){
  $parroquia->codigo_parroquia($id);
  $parroquia->nombre_parroquia($nombre_parroquia);
  $parroquia->codigo_municipio($cod_municipio);
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
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar la parroquia.";
    header("Location: ../vistas/?parroquia");
  }
}

if($operacion=='Modificar'){
  $parroquia->codigo_parroquia($id);
  $parroquia->nombre_parroquia($nombre_parroquia);
  $parroquia->codigo_municipio($cod_municipio);
    if($parroquia->Actualizar())
     $confirmacion=1;
    else
     $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La parroquia ha sido modificada con éxito !";
    header("Location: ../vistas/?parroquia");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar la parroquia.";
    header("Location: ../vistas/?parroquia");
  }
}

if($operacion=='Desactivar'){
  $parroquia->codigo_parroquia($id);
  $parroquia->nombre_parroquia($nombre_parroquia);
  $parroquia->codigo_municipio($cod_municipio);
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
    $_SESSION['datos']['mensaje']="Problema al desactivar la parroquia.";
    header("Location: ../vistas/?parroquia");
  }
}

if($operacion=='Activar'){
  $parroquia->codigo_parroquia($id);
  $parroquia->nombre_parroquia($nombre_parroquia);
  $parroquia->codigo_municipio($cod_municipio);
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
    $_SESSION['datos']['mensaje']="Problema al desactivar la parroquia.";
    header("Location: ../vistas/?parroquia");
  }
}

if($operacion=='Consultar'){ 
  $parroquia->codigo_parroquia($id);
  $parroquia->nombre_parroquia($nombre_parroquia);
  if($parroquia->Consultar()){
    $_SESSION['datos']['cod_parroquia']=$parroquia->codigo_parroquia();
    $_SESSION['datos']['nombre_parroquia']=$parroquia->nombre_parroquia();
    $_SESSION['datos']['cod_municipio']=$parroquia->codigo_municipio();
    $_SESSION['datos']['estatus']=$parroquia->estatus_parroquia();
    header("Location: ../vistas/?parroquia");
  }else{
    $_SESSION['datos']['mensaje']=utf8_encode("No se han encontrado resultados para tu búsqueda(".$nombre_parroquia.")");
    header("Location: ../vistas/?parroquia");
  }
}    
?>