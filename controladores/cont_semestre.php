<?php
session_start();
if(isset($_POST['operacion']))
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['cod_semestre']))
$id=ucfirst(trim($_POST['cod_semestre']));

if(isset($_POST['semestre']))
$nro_semestre=ucfirst(trim($_POST['semestre']));

if(isset($_POST['cod_ano_academico']))
$cod_ano_academico=ucfirst(trim($_POST['cod_ano_academico']));


include_once("../clases/class_semestre.php");
$semestre=new Semestre();
if($operacion=='Registrar'){
  $semestre->cod_semestre($id);
  $semestre->semestre($nro_semestre);
  $semestre->cod_ano_academico($cod_ano_academico);
  if(!$semestre->Comprobar()){
    if($semestre->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($semestre->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($semestre->Activar())            
        $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El semestre ha sido registrado con éxito !";
    header("Location: ../vistas/?semestre");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar el semestre.";
    header("Location: ../vistas/?semestre");
  }
}

if($operacion=='Modificar'){
  $semestre->cod_semestre($id);
  $semestre->semestre($nro_semestre);
  $semestre->cod_ano_academico($cod_ano_academico);
  if($semestre->Actualizar())
   $confirmacion=1;
  else
   $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El semestre ha sido modificado con éxito !";
    header("Location: ../vistas/?semestre");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar el semestre.";
    header("Location: ../vistas/?semestre");
  }
}

if($operacion=='Desactivar'){
  $semestre->cod_semestre($id);
  $semestre->semestre($nro_semestre);
  $semestre->cod_ano_academico($cod_ano_academico);
  if($semestre->Consultar()){
    if($semestre->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El semestre ha sido desactivado con éxito";
    header("Location: ../vistas/?semestre");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el semestre.";
    header("Location: ../vistas/?semestre");
  }
}

if($operacion=='Activar'){
  $semestre->cod_semestre($id);
  $semestre->semestre($nro_semestre);
  $semestre->cod_ano_academico($cod_ano_academico);
  if($semestre->Consultar()){
    if($semestre->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El semestre ha sido desactivado con éxito";
    header("Location: ../vistas/?semestre");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el semestre.";
    header("Location: ../vistas/?semestre");
  }
}

if($operacion=='Consultar'){ 
  $semestre->cod_semestre($id);
  $semestre->semestre($nro_semestre);
  if($semestre->Consultar()){
    $_SESSION['datos']['cod_semestre']=$semestre->cod_semestre();
    $_SESSION['datos']['semestre']=$semestre->semestre();
    $_SESSION['datos']['cod_ano_academico']=$semestre->cod_ano_academico();
    $_SESSION['datos']['estatus']=$semestre->estatus_semestre();
    header("Location: ../vistas/?semestre");
  }else{
    $_SESSION['datos']['mensaje']="No se han encontrado resultados para tu búsqueda(".$nro_semestre.")";
    header("Location: ../vistas/?semestre");
  }
}    
?>