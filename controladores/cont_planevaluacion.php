<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_msd']))
$codigo_msd=ucfirst(trim($_POST['codigo_msd']));

if(isset($_POST['codigo_lapso']))
$codigo_lapso=ucfirst(trim($_POST['codigo_lapso']));

include_once("../clases/class_planevaluacion.php");
$planevaluacion=new planevaluacion();
if($operacion=='Registrar'){
  $planevaluacion->codigo_msd($codigo_msd);
  $planevaluacion->codigo_lapso($codigo_lapso);
  $planevaluacion->Transaccion("iniciando");
  if(isset($_POST['descripciones']) && isset($_POST['porcentajes'])){
    if($planevaluacion->Registrar($_POST['descripciones'],$_POST['porcentajes']))
      $confirmacion=1;
    else
      $confirmacion=-1;
  }
  else
    $confirmacion=1;
if($confirmacion==1){
  $planevaluacion->Transaccion("finalizado");
  $_SESSION['datos']['mensaje']="El plan de evaluación ha sido registrado con éxito !";
  header("Location: ../vistas/?planevaluacion");
 }else{
  $planevaluacion->Transaccion("cancelado");
  $_SESSION['datos']['mensaje']="Se presentó un error al registrar el plan de evaluación.<br><b>Error: ".utf8_encode($planevaluacion->error())."</b>";
  header("Location: ../vistas/?planevaluacion");
}
}

if($operacion=='Modificar'){
  $planevaluacion->codigo_msd($codigo_msd);
  $planevaluacion->codigo_lapso($codigo_lapso);
  $planevaluacion->Transaccion("iniciando");
  if(isset($_POST['codigo_plan_evaluaciones']) && isset($_POST['descripciones']) && isset($_POST['porcentajes'])){
    if($planevaluacion->Actualizar($_POST['oldcodigo_plan_evaluacion'],count($_POST['codigo_plan_evaluaciones']),$_POST['codigo_plan_evaluaciones'],$_POST['descripciones'],$_POST['porcentajes']))
      $confirmacion=1;
    else
      $confirmacion=-1;
  }
  else
    $confirmacion=1;
  if($confirmacion==1){
    $planevaluacion->Transaccion("finalizado");
    $_SESSION['datos']['mensaje']="El plan de evaluación ha sido modificado con éxito !";
    header("Location: ../vistas/?planevaluacion");
  }else{
    $planevaluacion->Transaccion("cancelado");
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar el plan de evaluación.<br><b>Error: ".utf8_encode($planevaluacion->error())."</b>";
    header("Location: ../vistas/?planevaluacion");
  }
}

if($operacion=='Desactivar'){
  $planevaluacion->codigo_plan_evaluacion($id);
  $planevaluacion->codigo_msd($codigo_msd);
  $planevaluacion->codigo_lapso($codigo_lapso);
  if($planevaluacion->Consultar()){
    if($planevaluacion->Desactivar())
	   $confirmacion=1;
	else
	   $confirmacion=-1;
  }else{
	   $confirmacion=0;
  }
   if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El plan de evaluación ha sido desactivado con éxito";
    header("Location: ../vistas/?planevaluacion");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el plan de evaluación.<br><b>Error: ".utf8_encode($planevaluacion->error())."</b>";
    header("Location: ../vistas/?planevaluacion");
    }
}

if($operacion=='Activar'){
  $planevaluacion->codigo_plan_evaluacion($id);
  $planevaluacion->codigo_msd($codigo_msd);
  $planevaluacion->codigo_lapso($codigo_lapso);
  if($planevaluacion->Consultar()){
    if($planevaluacion->Activar())
     $confirmacion=1;
  else
     $confirmacion=-1;
  }else{
     $confirmacion=0;
  }
   if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El plan de evaluación ha sido desactivado con éxito";
    header("Location: ../vistas/?planevaluacion");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el plan de evaluación.<br><b>Error: ".utf8_encode($planevaluacion->error())."</b>";
    header("Location: ../vistas/?planevaluacion");
    }
}

if($operacion=='Consultar'){
  $planevaluacion->codigo_msd($codigo_msd);
  $planevaluacion->codigo_lapso($codigo_lapso);
   if($planevaluacion->Consultar()){
    $_SESSION['datos']['codigo_msd']=$planevaluacion->codigo_msd();
    $_SESSION['datos']['codigo_lapso']=$planevaluacion->codigo_lapso();
    $_SESSION['datos']['codigo_materia']=$planevaluacion->codigo_materia();
    $_SESSION['datos']['seccion']=$planevaluacion->seccion();
    $_SESSION['datos']['materia']=$planevaluacion->materia();
    $_SESSION['datos']['estatus']=$planevaluacion->estatus_planevaluacion();
    header("Location: ../vistas/?planevaluacion");
  }else{
    $error="";
    if($planevaluacion->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($planevaluacion->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    $_SESSION['datos']['mensaje']=$error;
   header("Location: ../vistas/?planevaluacion");
  }
} 

if($operacion=="BuscarMSD"){
  echo $planevaluacion->BuscarMSD($_POST['seccion'],$_POST['cedula_docente'],$_POST['codigo_materia']);
  unset($planevaluacion);
} 
?>