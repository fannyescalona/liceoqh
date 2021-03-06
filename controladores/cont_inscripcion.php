<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_inscripcion']))
$codigo_inscripcion=ucfirst(trim($_POST['codigo_inscripcion']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));

if(isset($_POST['fecha_inicio']))
$fecha_inicio=ucfirst(trim($_POST['fecha_inicio']));

if(isset($_POST['fecha_fin']))
$fecha_fin=ucfirst(trim($_POST['fecha_fin']));

if(isset($_POST['fecha_cierre']))
$fecha_cierre=ucfirst(trim($_POST['fecha_cierre']));

include_once("../clases/class_inscripcion.php");
$inscripcion=new inscripcion();
if($operacion=='Registrar'){
  $inscripcion->codigo_inscripcion($codigo_inscripcion);
  $inscripcion->descripcion($descripcion);
  $inscripcion->fecha_inicio($fecha_inicio);
  $inscripcion->fecha_fin($fecha_fin);
  $inscripcion->fecha_cierre($fecha_cierre);
  if(!$inscripcion->Comprobar()){
    if($inscripcion->Registrar())
       $confirmacion=1;
    else
       $confirmacion=-1;
  }else{
    if($inscripcion->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($inscripcion->Activar())            
         $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El Período de Inscripción ha sido registrado con éxito !";
    header("Location: ../vistas/?inscripcion");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar El Período de Inscripción.<br><b>Error: ".utf8_encode($inscripcion->error())."</b>";
    header("Location: ../vistas/?inscripcion");
  }
}

if($operacion=='Modificar'){
  $inscripcion->codigo_inscripcion($codigo_inscripcion);
  $inscripcion->descripcion($descripcion);
  $inscripcion->fecha_inicio($fecha_inicio);
  $inscripcion->fecha_fin($fecha_fin);
  $inscripcion->fecha_cierre($fecha_cierre);
  if($inscripcion->Actualizar())
   $confirmacion=1;
  else
   $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El Período de Inscripción ha sido modificado con éxito !";
    header("Location: ../vistas/?inscripcion");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar El Período de Inscripción.<br><b>Error: ".utf8_encode($inscripcion->error())."</b>";
    header("Location: ../vistas/?inscripcion");
  }
}

if($operacion=='Desactivar'){
  $inscripcion->codigo_inscripcion($codigo_inscripcion);
  if($inscripcion->Consultar()){
    if($inscripcion->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El Período de Inscripción ha sido desactivado con éxito";
    header("Location: ../vistas/?inscripcion");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar El Período de Inscripción.<br><b>Error: ".utf8_encode($inscripcion->error())."</b>";
    header("Location: ../vistas/?inscripcion");
  }
}

if($operacion=='Activar'){
  $inscripcion->codigo_inscripcion($codigo_inscripcion);
  if($inscripcion->Consultar()){
    if($inscripcion->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El Período de Inscripción ha sido desactivado con éxito";
    header("Location: ../vistas/?inscripcion");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar El Período de Inscripción.<br><b>Error: ".utf8_encode($inscripcion->error())."</b>";
    header("Location: ../vistas/?inscripcion");
  }
}

if($operacion=='Consultar'){ 
  $inscripcion->codigo_inscripcion($codigo_inscripcion);
  $inscripcion->descripcion($descripcion);
  if($inscripcion->Consultar()){
    $_SESSION['datos']['codigo_inscripcion']=$inscripcion->codigo_inscripcion();
    $_SESSION['datos']['descripcion']=$inscripcion->descripcion();
    $_SESSION['datos']['fecha_inicio']=$inscripcion->fecha_inicio();
    $_SESSION['datos']['fecha_fin']=$inscripcion->fecha_fin();
    $_SESSION['datos']['fecha_cierre']=$inscripcion->fecha_cierre();
    $_SESSION['datos']['estatus']=$inscripcion->estatus();
    header("Location: ../vistas/?inscripcion");
  }else{
    $error="";
    if($inscripcion->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($inscripcion->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    $_SESSION['datos']['mensaje']=$error;
    header("Location: ../vistas/?inscripcion");
  }
}    
?>