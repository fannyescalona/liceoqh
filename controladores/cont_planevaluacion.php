<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_plan_evaluacion']))
$id=ucfirst(trim($_POST['codigo_plan_evaluacion']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));


include_once("../clases/class_planevaluacion.php");
$planevaluacion=new planevaluacion();
if($operacion=='Registrar'){
  $planevaluacion->codigo_plan_evaluacion($id);
  $planevaluacion->descripcion($descripcion);
  if(!$planevaluacion->Comprobar()){
    if($planevaluacion->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($planevaluacion->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($planevaluacion->Activar())					  
        $confirmacion=1;
    }
  }
if($confirmacion==1){
  $_SESSION['datos']['mensaje']="El país ha sido registrado con éxito !";
  header("Location: ../vistas/?planevaluacion");
 }else{
  $_SESSION['datos']['mensaje']="Se presentó un error al registrar el país.<br><b>Error: ".utf8_encode($planevaluacion->error())."</b>";
  header("Location: ../vistas/?planevaluacion");
}
}

if($operacion=='Modificar'){
  $planevaluacion->codigo_plan_evaluacion($id);
  $planevaluacion->descripcion($descripcion);
  if($planevaluacion->Actualizar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El país ha sido modificado con éxito !";
    header("Location: ../vistas/?planevaluacion");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar el país.<br><b>Error: ".utf8_encode($planevaluacion->error())."</b>";
    header("Location: ../vistas/?planevaluacion");
  }
}

if($operacion=='Desactivar'){
  $planevaluacion->codigo_plan_evaluacion($id);
  $planevaluacion->descripcion($descripcion);
  if($planevaluacion->Consultar()){
    if($planevaluacion->Desactivar())
	   $confirmacion=1;
	else
	   $confirmacion=-1;
  }else{
	   $confirmacion=0;
  }
   if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El país ha sido desactivado con éxito";
    header("Location: ../vistas/?planevaluacion");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el país.<br><b>Error: ".utf8_encode($planevaluacion->error())."</b>";
    header("Location: ../vistas/?planevaluacion");
    }
}

if($operacion=='Activar'){
  $planevaluacion->codigo_plan_evaluacion($id);
  $planevaluacion->descripcion($descripcion);
  if($planevaluacion->Consultar()){
    if($planevaluacion->Activar())
     $confirmacion=1;
  else
     $confirmacion=-1;
  }else{
     $confirmacion=0;
  }
   if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El país ha sido desactivado con éxito";
    header("Location: ../vistas/?planevaluacion");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el país.<br><b>Error: ".utf8_encode($planevaluacion->error())."</b>";
    header("Location: ../vistas/?planevaluacion");
    }
}

if($operacion=='Consultar'){	
  $planevaluacion->codigo_plan_evaluacion($id);
  $planevaluacion->descripcion($descripcion);
   if($planevaluacion->Consultar()){
    $_SESSION['datos']['codigo_plan_evaluacion']=$planevaluacion->codigo_plan_evaluacion();
    $_SESSION['datos']['descripcion']=$planevaluacion->descripcion();
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
  echo $planevaluacion->BuscarMSD($_POST['seccion'],$_POST['cedula_docente']);
  unset($planevaluacion);
} 
?>