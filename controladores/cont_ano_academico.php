<?php
session_start();
if(isset($_POST['operacion']))
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['cod_ano_academico']))
$id=ucfirst(trim($_POST['cod_ano_academico']));

if(isset($_POST['ano']))
$ano=ucfirst(trim($_POST['ano']));

if(isset($_POST['cod_carrera']))
$cod_carrera=ucfirst(trim($_POST['cod_carrera']));

include_once("../clases/class_ano_academico.php");
$ano_academico=new Ano_academico();
if($operacion=='Registrar'){
  $ano_academico->codigo_ano_academico($id);
  $ano_academico->ano($ano);
  $ano_academico->codigo_carrera($cod_carrera);
  if(!$ano_academico->Comprobar()){
    if($ano_academico->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($ano_academico->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($ano_academico->Activar())            
        $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El año académico ha sido registrado con éxito !";
    header("Location: ../vistas/?ano_academico");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar el año académico.";
    header("Location: ../vistas/?ano_academico");
  }
}

if($operacion=='Modificar'){
  $ano_academico->codigo_ano_academico($id);
  $ano_academico->ano($ano);
  $ano_academico->codigo_carrera($cod_carrera);
    if($ano_academico->Actualizar())
     $confirmacion=1;
    else
     $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El año académico ha sido modificado con éxito !";
    header("Location: ../vistas/?ano_academico");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar el año académico.";
    header("Location: ../vistas/?ano_academico");
  }
}

if($operacion=='Desactivar'){
  $ano_academico->codigo_ano_academico($id);
  $ano_academico->ano($ano);
  $ano_academico->codigo_carrera($cod_carrera);
  if($ano_academico->Consultar()){
    if($ano_academico->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El año académico ha sido desactivado con éxito";
    header("Location: ../vistas/?ano_academico");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el año académico.";
    header("Location: ../vistas/?ano_academico");
  }
}


if($operacion=='Activar'){
  $ano_academico->codigo_ano_academico($id);
  $ano_academico->ano($ano);
  $ano_academico->codigo_carrera($cod_carrera);
  if($ano_academico->Consultar()){
    if($ano_academico->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El año académico ha sido desactivado con éxito";
    header("Location: ../vistas/?ano_academico");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el año académico.";
    header("Location: ../vistas/?ano_academico");
  }
}

if($operacion=='Consultar'){ 
  $ano_academico->codigo_ano_academico($id);
  $ano_academico->ano($ano);
  $ano_academico->codigo_carrera($cod_carrera);
  if($ano_academico->Consultar()){
    $_SESSION['datos']['cod_ano_academico']=$ano_academico->codigo_ano_academico();
    $_SESSION['datos']['ano']=$ano_academico->ano();
    $_SESSION['datos']['cod_carrera']=$ano_academico->codigo_carrera();
    $_SESSION['datos']['estatus']=$ano_academico->estatus_ano_academico();
    header("Location: ../vistas/?ano_academico");
  }else{
    if(!empty($ano) && !empty($cod_carrera)){
      $mensaje="No se han encontrado resultados para tu búsqueda(Año Académico => ".$ano.", Código de Carrera => ".$cod_carrera.")";
    }else if (!empty($ano)) {
      $mensaje="No se han encontrado resultados para tu búsqueda(Año Académico => ".$ano.")";
    }else{
      $mensaje="No se han encontrado resultados para tu búsqueda(Código de Carrera => ".$cod_carrera.")";
    }
    $_SESSION['datos']['mensaje']=$mensaje;
    header("Location: ../vistas/?ano_academico");
  }
}    
?>