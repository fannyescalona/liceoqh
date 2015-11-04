<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['seccion']))
$nro_seccion=ucfirst(trim($_POST['seccion']));

if(isset($_POST['nombre_seccion']))
$nombre_seccion=ucfirst(trim($_POST['nombre_seccion']));

if(isset($_POST['oldseccion']))
$oldseccion=trim($_POST['oldseccion']);

if(isset($_POST['capacidad_min']))
$capacidad_min=ucfirst(trim($_POST['capacidad_min']));

if(isset($_POST['capacidad_max']))
$capacidad_max=ucfirst(trim($_POST['capacidad_max']));

if(isset($_POST['turno']))
$turno=ucfirst(trim($_POST['turno']));

if(isset($_POST['cod_periodo']))
$cod_periodo=ucfirst(trim($_POST['cod_periodo']));

if(isset($_POST['cod_semestre']))
$cod_semestre=ucfirst(trim($_POST['cod_semestre']));

include_once("../clases/class_seccion.php");
$seccion=new Seccion();
if($operacion=='Registrar'){
  $seccion->seccion($nro_seccion);
  $seccion->nombre_seccion($nombre_seccion);
  $seccion->capacidad_min($capacidad_min);
  $seccion->capacidad_max($capacidad_max);
  $seccion->turno($turno);
  $seccion->codigo_periodo($cod_periodo);
  $seccion->codigo_semestre($cod_semestre);
  if(!$seccion->Comprobar()){
    if($seccion->Registrar())
      $confirmacion=1;
      if(isset($_POST['materias'])){
        foreach ($_POST['materias'] as $key => $value) {
          $seccion->codigo_materia($value);
          $seccion->InsertarMaterias();
        }
      }
    else
      $confirmacion=-1;
  }else{
    if($seccion->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($seccion->Activar())            
        $confirmacion=1;
    }
  }

  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La sección ha sido registrada con éxito !";
    header("Location: ../vistas/?seccion");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar la sección.";
    header("Location: ../vistas/?seccion");
  }
}

if($operacion=='Modificar'){
  $seccion->seccion($nro_seccion);
  $seccion->nombre_seccion($nombre_seccion);
  $seccion->capacidad_min($capacidad_min);
  $seccion->capacidad_max($capacidad_max);
  $seccion->turno($turno);
  $seccion->codigo_periodo($cod_periodo);
  $seccion->codigo_semestre($cod_semestre);
    if($seccion->Actualizar($oldseccion))
      $confirmacion=1;
      $seccion->EliminarMaterias();
      if(isset($_POST['materias'])){
        foreach ($_POST['materias'] as $key => $value) {
          $seccion->codigo_materia($value);
          $seccion->InsertarMaterias();
        }
      }
    else
      $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La sección ha sido modificada con éxito !";
    header("Location: ../vistas/?seccion");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar la sección.";
    header("Location: ../vistas/?seccion");
  }
}

if($operacion=='Desactivar'){
  $seccion->seccion($nro_seccion);
  $seccion->nombre_seccion($nombre_seccion);
  $seccion->capacidad_min($capacidad_min);
  $seccion->capacidad_max($capacidad_max);
  $seccion->turno($turno);
  $seccion->codigo_periodo($cod_periodo);
  $seccion->codigo_semestre($cod_semestre);
  if($seccion->Consultar()){
    if($seccion->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La sección ha sido desactivada con éxito";
    header("Location: ../vistas/?seccion");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar la sección.";
    header("Location: ../vistas/?seccion");
  }
}

if($operacion=='Activar'){
  $seccion->seccion($nro_seccion);
  $seccion->nombre_seccion($nombre_seccion);
  $seccion->capacidad_min($capacidad_min);
  $seccion->capacidad_max($capacidad_max);
  $seccion->turno($turno);
  $seccion->codigo_periodo($cod_periodo);
  $seccion->codigo_semestre($cod_semestre);
  if($seccion->Consultar()){
    if($seccion->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La sección ha sido desactivada con éxito";
    header("Location: ../vistas/?seccion");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar la sección.";
    header("Location: ../vistas/?seccion");
  }
}

if($operacion=='Consultar'){ 
  $seccion->seccion($nro_seccion);
  $seccion->nombre_seccion($nombre_seccion);
  if($seccion->Consultar()){
    $_SESSION['datos']['seccion']=$seccion->seccion();
    $_SESSION['datos']['nombre_seccion']=$seccion->nombre_seccion();
    $_SESSION['datos']['capacidad_min']=$seccion->capacidad_min();
    $_SESSION['datos']['capacidad_max']=$seccion->capacidad_max();
    $_SESSION['datos']['turno']=$seccion->turno();
    $_SESSION['datos']['cod_periodo']=$seccion->codigo_periodo();
    $_SESSION['datos']['cod_semestre']=$seccion->codigo_semestre();
    $_SESSION['datos']['estatus']=$seccion->estatus_seccion();
    header("Location: ../vistas/?seccion");
  }else{
    $_SESSION['datos']['mensaje']="No se han encontrado resultados para tu búsqueda(".$nro_seccion.")";
    header("Location: ../vistas/?seccion");
  }
}    
?>