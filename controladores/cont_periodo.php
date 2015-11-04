<?php
session_start();
if(isset($_POST['operacion']))
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['cod_periodo']))
$id=ucfirst(trim($_POST['cod_periodo']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));

if(isset($_POST['fecha_inicio'])){
  if(!empty($_POST['fecha_inicio'])){
    //el formato va acorde a la fecha como string
    $objetoFecha = DateTime::createFromFormat("d/m/Y", $_POST['fecha_inicio'] );
     
    //el formato ahora es acorde a lo que ocupamos, segun mysql
    $fecha_inicio = $objetoFecha->format("Y-m-d");
  } 
}

if(isset($_POST['fecha_fin'])){
  if(!empty($_POST['fecha_fin'])){
    //el formato va acorde a la fecha como string
    $objetoFecha = DateTime::createFromFormat("d/m/Y", $_POST['fecha_fin'] );
   
    //el formato ahora es acorde a lo que ocupamos, segun mysql
    $fecha_fin = $objetoFecha->format("Y-m-d");
  } 
}

include_once("../clases/class_periodo.php");
$periodo=new Periodo();
if($operacion=='Registrar'){
  $periodo->codigo_periodo($id);
  $periodo->descripcion($descripcion);
  $periodo->fecha_inicio($fecha_inicio);
  $periodo->fecha_fin($fecha_fin);
  if(!$periodo->Comprobar()){
    if($periodo->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($periodo->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($periodo->Activar())            
        $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El período ha sido registrado con éxito !";
    header("Location: ../vistas/?periodo");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar el período.";
    header("Location: ../vistas/?periodo");
  }
}

if($operacion=='Modificar'){
  $periodo->codigo_periodo($id);
  $periodo->descripcion($descripcion);
  $periodo->fecha_inicio($fecha_inicio);
  $periodo->fecha_fin($fecha_fin);
  if($periodo->Actualizar())
   $confirmacion=1;
  else
   $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El período ha sido modificado con éxito !";
    header("Location: ../vistas/?periodo");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar el período.";
    header("Location: ../vistas/?periodo");
  }
}

if($operacion=='Desactivar'){
  $periodo->codigo_periodo($id);
  $periodo->descripcion($descripcion);
  $periodo->fecha_inicio($fecha_inicio);
  $periodo->fecha_fin($fecha_fin);
  if($periodo->Consultar()){
    if($periodo->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El período ha sido desactivado con éxito";
    header("Location: ../vistas/?periodo");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el período.";
    header("Location: ../vistas/?periodo");
  }
}

if($operacion=='Activar'){
  $periodo->codigo_periodo($id);
  $periodo->descripcion($descripcion);
  $periodo->fecha_inicio($fecha_inicio);
  $periodo->fecha_fin($fecha_fin);
  if($periodo->Consultar()){
    if($periodo->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El período ha sido desactivado con éxito";
    header("Location: ../vistas/?periodo");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el período.";
    header("Location: ../vistas/?periodo");
  }
}

if($operacion=='Consultar'){ 
  $periodo->codigo_periodo($id);
  $periodo->descripcion($descripcion);
  if($periodo->Consultar()){
    $_SESSION['datos']['cod_periodo']=$periodo->codigo_periodo();
    $_SESSION['datos']['descripcion']=$periodo->descripcion();
    $_SESSION['datos']['fecha_inicio']=$periodo->fecha_inicio();
    $_SESSION['datos']['fecha_fin']=$periodo->fecha_fin();
    $_SESSION['datos']['estatus']=$periodo->estatus_periodo();
    header("Location: ../vistas/?periodo");
  }else{
    $_SESSION['datos']['mensaje']="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    header("Location: ../vistas/?periodo");
  }
}    
?>