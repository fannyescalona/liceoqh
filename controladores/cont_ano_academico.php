<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_ano_academico']))
$id=ucfirst(trim($_POST['codigo_ano_academico']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));


include_once("../clases/class_ano_academico.php");
$ano_academico=new ano_academico();
if($operacion=='Registrar'){
  $ano_academico->codigo_ano_academico($id);
  $ano_academico->descripcion($descripcion);
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
  $_SESSION['datos']['mensaje']="El Año Académico ha sido registrado con éxito !";
  header("Location: ../vistas/?ano_academico");
 }else{
  $_SESSION['datos']['mensaje']="Se presentó un error al registrar el Año Académico.";
  header("Location: ../vistas/?ano_academico");
}
}

if($operacion=='Modificar'){
  $ano_academico->codigo_ano_academico($id);
  $ano_academico->descripcion($descripcion);
  if($ano_academico->Actualizar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El Año Académico ha sido modificado con éxito !";
    header("Location: ../vistas/?ano_academico");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar el Año Académico.";
    header("Location: ../vistas/?ano_academico");
  }
}

if($operacion=='Desactivar'){
  $ano_academico->codigo_ano_academico($id);
  $ano_academico->descripcion($descripcion);
  if($ano_academico->Consultar()){
    if($ano_academico->Desactivar())
     $confirmacion=1;
  else
     $confirmacion=-1;
  }else{
     $confirmacion=0;
  }
   if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El Año Académico ha sido desactivado con éxito";
    header("Location: ../vistas/?ano_academico");
   }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el Año Académico.";
    header("Location: ../vistas/?ano_academico");
    }
}

if($operacion=='Activar'){
  $ano_academico->codigo_ano_academico($id);
  $ano_academico->descripcion($descripcion);
  if($ano_academico->Consultar()){
    if($ano_academico->Activar())
     $confirmacion=1;
  else
     $confirmacion=-1;
  }else{
     $confirmacion=0;
  }
   if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El Año Académico ha sido desactivado con éxito";
    header("Location: ../vistas/?ano_academico");
   }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el Año Académico.";
    header("Location: ../vistas/?ano_academico");
    }
}

if($operacion=='Consultar'){  
  $ano_academico->codigo_ano_academico($id);
  $ano_academico->descripcion($descripcion);
   if($ano_academico->Consultar()){
    $_SESSION['datos']['codigo_ano_academico']=$ano_academico->codigo_ano_academico();
    $_SESSION['datos']['descripcion']=$ano_academico->descripcion();
    $_SESSION['datos']['estatus']=$ano_academico->estatus_ano_academico();
    header("Location: ../vistas/?ano_academico");
  }else{
   $_SESSION['datos']['mensaje']="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
   header("Location: ../vistas/?ano_academico");
  }
}     
?>