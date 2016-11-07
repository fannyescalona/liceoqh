<?php
session_start();
if(isset($_POST['operacion']))
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_materia']))
$codigo_materia=trim($_POST['codigo_materia']);

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));

if(isset($_POST['unidad_curricular']))
$unidad_curricular=trim($_POST['unidad_curricular']);

if(isset($_POST['hora_academica']))
$hora_academica=trim($_POST['hora_academica']);

if(isset($_POST['materia_compuesta']))
$materia_compuesta=ucfirst(trim($_POST['materia_compuesta']));

if(isset($_POST['grado_escolar']))
$grado_escolar=ucfirst(trim($_POST['grado_escolar']));

if(isset($_POST['codigo_materia_padre']))
$codigo_materia_padre = $_POST['materia_compuesta'] == "Y" ? trim($_POST['codigo_materia_padre']) : "";

include_once("../clases/class_materia.php");
$materia=new Materia();
if($operacion=='Registrar'){
  $materia->codigo_materia($codigo_materia);
  $materia->descripcion($descripcion);
  $materia->unidad_curricular($unidad_curricular);
  $materia->hora_academica($hora_academica);
  $materia->materia_compuesta($materia_compuesta);
  $materia->grado_escolar($grado_escolar);
  $materia->codigo_materia_padre($codigo_materia_padre);
  if(!$materia->Comprobar()){
    if($materia->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($materia->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($materia->Activar())					  
        $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La materia ha sido registrada con éxito !";
    header("Location: ../vistas/?materia");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar la materia.<br><b>Error: ".utf8_encode($materia->error())."</b>";
    header("Location: ../vistas/?materia");
  }
}

if($operacion=='Modificar'){
  $materia->codigo_materia($codigo_materia);
  $materia->descripcion($descripcion);
  $materia->unidad_curricular($unidad_curricular);
  $materia->hora_academica($hora_academica);
  $materia->materia_compuesta($materia_compuesta);
  $materia->grado_escolar($grado_escolar);
  $materia->codigo_materia_padre($codigo_materia_padre);
  if($materia->Actualizar($_POST['oldcodigo_materia']))
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La materia ha sido modificada con éxito !";
    header("Location: ../vistas/?materia");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar la materia.<br><b>Error: ".utf8_encode($materia->error())."</b>";
    header("Location: ../vistas/?materia");
  }
}

if($operacion=='Desactivar'){
  $materia->codigo_materia($codigo_materia);
  $materia->descripcion($descripcion);
  if($materia->Consultar()){
    if($materia->Desactivar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La materia ha sido desactivada con éxito";
    header("Location: ../vistas/?materia");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar la materia.<br><b>Error: ".utf8_encode($materia->error())."</b>";
    header("Location: ../vistas/?materia");
  }
}


if($operacion=='Activar'){
  $materia->codigo_materia($codigo_materia);
  $materia->descripcion($descripcion);
  if($materia->Consultar()){
    if($materia->Activar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La materia ha sido desactivada con éxito";
    header("Location: ../vistas/?materia");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar la materia.<br><b>Error: ".utf8_encode($materia->error())."</b>";
    header("Location: ../vistas/?materia");
  }
}

if($operacion=='Consultar'){	
  $materia->codigo_materia($codigo_materia);
  if($materia->Consultar()){
    $_SESSION['datos']['codigo_materia']=$materia->codigo_materia();
    $_SESSION['datos']['descripcion']=$materia->descripcion();
    $_SESSION['datos']['unidad_curricular']=$materia->unidad_curricular();
    $_SESSION['datos']['hora_academica']=$materia->hora_academica();
    $_SESSION['datos']['materia_compuesta']=$materia->materia_compuesta();
    $_SESSION['datos']['grado_escolar']=$materia->grado_escolar();
    $_SESSION['datos']['codigo_materia_padre']=$materia->codigo_materia_padre();
    $_SESSION['datos']['estatus']=$materia->estatus_materia();
    header("Location: ../vistas/?materia");
  }else{
    $error="";
    if($materia->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($materia->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$codigo_materia.")";
    $_SESSION['datos']['mensaje']=$error;
    header("Location: ../vistas/?materia");
  }
}

if($operacion=="ComboMateria"){
  echo $materia->ComboMateria($_POST['seccion'],$_POST['cedula_docente']);
  unset($materia);
} 
?>