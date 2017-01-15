<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_lapso']))
$codigo_lapso=ucfirst(trim($_POST['codigo_lapso']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));

if(isset($_POST['fecha_inicio']))
$fecha_inicio=trim($_POST['fecha_inicio']);

if(isset($_POST['fecha_fin']))
$fecha_fin=trim($_POST['fecha_fin']);

if(isset($_POST['codigo_ano_academico']))
$codigo_ano_academico=ucfirst(trim($_POST['codigo_ano_academico']));

include_once("../clases/class_lapso.php");
$lapsos=new lapsos();
if($operacion=='Registrar'){
  $lapsos->codigo_lapso($codigo_lapso);
  $lapsos->descripcion($descripcion);
  $lapsos->fecha_inicio($fecha_inicio);
  $lapsos->fecha_fin($fecha_fin);
  $lapsos->codigo_ano_academico($codigo_ano_academico);
  if(!$lapsos->Comprobar()){
    if($lapsos->Registrar())
       $confirmacion=1;
    else
       $confirmacion=-1;
  }else{
    if($lapsos->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($lapsos->Activar())            
         $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El Lapso ha sido registrado con éxito !";
    header("Location: ../vistas/?lapso");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar el Lapso.<br><b>Error: ".utf8_encode($lapsos->error())."</b>";
    header("Location: ../vistas/?lapso");
  }
}

if($operacion=='Modificar'){
  $lapsos->codigo_lapso($codigo_lapso);
  $lapsos->descripcion($descripcion);
  $lapsos->fecha_inicio($fecha_inicio);
  $lapsos->fecha_fin($fecha_fin);
  $lapsos->codigo_ano_academico($codigo_ano_academico);
  if($lapsos->Actualizar())
   $confirmacion=1;
  else
   $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El Lapso ha sido modificado con éxito !";
    header("Location: ../vistas/?lapso");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar el Lapso.<br><b>Error: ".utf8_encode($lapsos->error())."</b>";
    header("Location: ../vistas/?lapso");
  }
}

if($operacion=='Desactivar'){
  $lapsos->codigo_lapso($codigo_lapso);
  $lapsos->descripcion($descripcion);
  $lapsos->codigo_ano_academico($codigo_ano_academico);
  if($lapsos->Consultar()){
    if($lapsos->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El Lapso ha sido desactivado con éxito";
    header("Location: ../vistas/?lapso");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el Lapso.<br><b>Error: ".utf8_encode($lapsos->error())."</b>";
    header("Location: ../vistas/?lapso");
  }
}

if($operacion=='Activar'){
  $lapsos->codigo_lapso($codigo_lapso);
  $lapsos->descripcion($descripcion);
  $lapsos->codigo_ano_academico($codigo_ano_academico);
  if($lapsos->Consultar()){
    if($lapsos->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El Lapso ha sido desactivado con éxito";
    header("Location: ../vistas/?lapso");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el Lapso.<br><b>Error: ".utf8_encode($lapsos->error())."</b>";
    header("Location: ../vistas/?lapso");
  }
}

if($operacion=='Consultar'){ 
  $lapsos->codigo_lapso($codigo_lapso);
  $lapsos->descripcion($descripcion);
  $lapsos->codigo_ano_academico($codigo_ano_academico);
  if($lapsos->Consultar()){
    $_SESSION['datos']['codigo_lapso']=$lapsos->codigo_lapso();
    $_SESSION['datos']['descripcion']=$lapsos->descripcion();
    $_SESSION['datos']['fecha_inicio']=$lapsos->fecha_inicio();
    $_SESSION['datos']['fecha_fin']=$lapsos->fecha_fin();
    $_SESSION['datos']['codigo_ano_academico']=$lapsos->codigo_ano_academico();
    $_SESSION['datos']['estatus']=$lapsos->estatus();
    header("Location: ../vistas/?lapso");
  }else{
    $error="";
    if($lapsos->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($lapsos->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    $_SESSION['datos']['mensaje']=$error;
    header("Location: ../vistas/?lapso");
  }
}

if($operacion=="ComboLapso"){
  echo $lapsos->ComboLapso($_POST['codigo_ano_academico']);
  unset($lapsos);
} 
?>