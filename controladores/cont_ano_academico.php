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
$ano_academico=new Ano_Academico();
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
  $_SESSION['datos']['mensaje']="Se presentó un error al registrar el Año Académico.<br><b>Error: ".utf8_encode($ano_academico->error())."</b>";
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
    $_SESSION['datos']['mensaje']="Problema al modificar el Año Académico.<br><b>Error: ".utf8_encode($ano_academico->error())."</b>";
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
    $_SESSION['datos']['mensaje']="Problema al desactivar el Año Académico.<br><b>Error: ".utf8_encode($ano_academico->error())."</b>";
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
    $_SESSION['datos']['mensaje']="Problema al desactivar el Año Académico.<br><b>Error: ".utf8_encode($ano_academico->error())."</b>";
    header("Location: ../vistas/?ano_academico");
    }
}

if($operacion=='Consultar'){  
  $ano_academico->codigo_ano_academico($id);
  $ano_academico->descripcion($descripcion);
   if($ano_academico->Consultar()){
    $_SESSION['datos']['codigo_ano_academico']=$ano_academico->codigo_ano_academico();
    $_SESSION['datos']['descripcion']=$ano_academico->descripcion();
    $_SESSION['datos']['estatus']=$ano_academico->estatus();
    header("Location: ../vistas/?ano_academico");
  }else{
    $error="";
    if($ano_academico->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($ano_academico->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    $_SESSION['datos']['mensaje']=$error;
   header("Location: ../vistas/?ano_academico");
  }
}

if($operacion=='CerrarAñoEscolar'){
  $confirmacion=false;
  $ano_academico->Transaccion('iniciando');
  //$ano_academico->codigo_ano_academico($id);
  if($ano_academico->Cerrar($id))
    if($ano_academico->NuevoAA($id))
      if($ano_academico->ActualizarInscripciones($id))
        $confirmacion=1;
      else
        $confirmacion=-1;
    else
      $confirmacion=-1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $ano_academico->Transaccion('finalizado');
    $_SESSION['datos']['mensaje']="El Año Académico ha sido cerrado con éxito";
    header("Location: ../vistas/?cerrar_anoacademico");
  }else{
    $ano_academico->Transaccion('cancelado');
    $_SESSION['datos']['mensaje']="Problema al cerrar el Año Académico.<br><b>Error: ".utf8_encode($ano_academico->error())."</b>";
    header("Location: ../vistas/?cerrar_anoacademico");
  }
}

if($operacion=='BuscarFechas'){
  echo $ano_academico->BuscarFechas($_POST['codigo_ano_academico']);
  unset($ano_academico);
}   
?>