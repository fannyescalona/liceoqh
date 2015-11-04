<?php
session_start();
if(isset($_POST['operacion']))
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['cod_materia']))
$id=ucfirst(trim($_POST['cod_materia']));

if(isset($_POST['nombre_materia']))
$nombre_materia=ucfirst(trim($_POST['nombre_materia']));

if(isset($_POST['unidad_curricular']))
$unidad_curricular=ucfirst(trim($_POST['unidad_curricular']));

if(isset($_POST['tipo_materia']))
$tipo_materia=ucfirst(trim($_POST['tipo_materia']));

include_once("../clases/class_materia.php");
$materia=new materia();
if($operacion=='Registrar'){
  $materia->codigo_materia($id);
  $materia->nombre_materia($nombre_materia);
  $materia->unidad_curricular($unidad_curricular);
  $materia->tipo_materia($tipo_materia);
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
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar la materia.";
    header("Location: ../vistas/?materia");
  }
}

if($operacion=='Modificar'){
  $materia->codigo_materia($id);
  $materia->nombre_materia($nombre_materia);
  $materia->unidad_curricular($unidad_curricular);
  $materia->tipo_materia($tipo_materia);
  if($materia->Actualizar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La materia ha sido modificada con éxito !";
    header("Location: ../vistas/?materia");
  }else{
    $_SESSION['datos']['mensaje']="Error al modificar la materia.";
    header("Location: ../vistas/?materia");
  }
}

if($operacion=='Desactivar'){
  $materia->codigo_materia($id);
  $materia->nombre_materia($nombre_materia);
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
    $_SESSION['datos']['mensaje']="Problema al desactivar la materia.";
    header("Location: ../vistas/?materia");
  }
}


if($operacion=='Activar'){
  $materia->codigo_materia($id);
  $materia->nombre_materia($nombre_materia);
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
    $_SESSION['datos']['mensaje']="Problema al desactivar la materia.";
    header("Location: ../vistas/?materia");
  }
}

if($operacion=='Consultar'){	
  $materia->codigo_materia($id);
  $materia->nombre_materia($nombre_materia);
  $materia->unidad_curricular($unidad_curricular);
  if($materia->Consultar()){
    $_SESSION['datos']['cod_materia']=$materia->codigo_materia();
    $_SESSION['datos']['nombre_materia']=$materia->nombre_materia();
    $_SESSION['datos']['unidad_curricular']=$materia->unidad_curricular();
    $_SESSION['datos']['tipo_materia']=$materia->tipo_materia();
    $_SESSION['datos']['estatus']=$materia->estatus_materia();
    header("Location: ../vistas/?materia");
  }else{
    $_SESSION['datos']['mensaje']="No se han encontrado resultados para tu búsqueda(".$nombre_materia.")";
    header("Location: ../vistas/?materia");
  }
}		  
?>