<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['seccion']))
$id=ucfirst(trim($_POST['seccion']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));

if(isset($_POST['turno']))
$turno=ucfirst(trim($_POST['turno']));

if(isset($_POST['capacidad_min']))
$capacidad_min=ucfirst(trim($_POST['capacidad_min']));

if(isset($_POST['capacidad_max']))
$capacidad_max=ucfirst(trim($_POST['capacidad_max']));

include_once("../clases/class_seccion.php");
$seccion=new Seccion();
if($operacion=='Registrar'){
  $seccion->seccion($id);
  $seccion->descripcion($descripcion);
  $seccion->turno($turno);
  $seccion->capacidad_min($capacidad_min);
  $seccion->capacidad_max($capacidad_max);
  if(!$seccion->Comprobar()){
    if($seccion->Registrar()){
      if(isset($_POST['materias']) && isset($_POST['docentes'])){
        $seccion->EliminarMateriasDocentes();
        $seccion->InsertarMateriasDocentes($_POST['materias'],$_POST['docentes']);
        $confirmacion=1;
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
    $_SESSION['datos']['mensaje']="La sección ha sido registrado con éxito !";
    header("Location: ../vistas/?seccion");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar la sección.";
    header("Location: ../vistas/?seccion");
  }
}

if($operacion=='Modificar'){
  $seccion->seccion($id);
  $seccion->descripcion($descripcion);
  $seccion->turno($turno);
  $seccion->capacidad_min($capacidad_min);
  $seccion->capacidad_max($capacidad_max);
  if($seccion->Actualizar()){
    if(isset($_POST['materias']) && isset($_POST['docentes'])){
      $seccion->EliminarMateriasDocentes();
      $seccion->InsertarMateriasDocentes($_POST['materias'],$_POST['docentes']);
      $confirmacion=1;
    }
  }
  else
   $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La sección ha sido modificado con éxito !";
    header("Location: ../vistas/?seccion");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar la sección.";
    header("Location: ../vistas/?seccion");
  }
}

if($operacion=='Desactivar'){
  $seccion->seccion($id);
  $seccion->descripcion($descripcion);
  if($seccion->Consultar()){
    if($seccion->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La sección ha sido desactivado con éxito";
    header("Location: ../vistas/?seccion");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar la sección.";
    header("Location: ../vistas/?seccion");
  }
}

if($operacion=='Activar'){
  $seccion->seccion($id);
  $seccion->descripcion($descripcion);
  if($seccion->Consultar()){
    if($seccion->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La sección ha sido desactivado con éxito";
    header("Location: ../vistas/?seccion");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar la sección.";
    header("Location: ../vistas/?seccion");
  }
}

if($operacion=='Consultar'){ 
  $seccion->seccion($id);
  $seccion->descripcion($descripcion);
  if($seccion->Consultar()){
    $_SESSION['datos']['seccion']=$seccion->seccion();
    $_SESSION['datos']['descripcion']=$seccion->descripcion();
    $_SESSION['datos']['turno']=$seccion->turno();
    $_SESSION['datos']['capacidad_min']=$seccion->capacidad_min();
    $_SESSION['datos']['capacidad_max']=$seccion->capacidad_max();
    $_SESSION['datos']['estatus']=$seccion->estatus();
    header("Location: ../vistas/?seccion");
  }else{
    $_SESSION['datos']['mensaje']=utf8_encode("No se han encontrado resultados para tu búsqueda(".$descripcion.")");
    header("Location: ../vistas/?seccion");
  }
}

if($operacion=='Asignar_Notas'){
  $con=0;
  if(isset($_POST['msd']) && isset($_POST['estudiante']) && isset($_POST['lapso']) && isset($_POST['notas'])){
    for($i=0;$i<count($_POST['msd']);$i++){
      $seccion->Eliminar_Notas($_POST['msd'][$i],$_POST['estudiante'][$i],$_POST['lapso'][$i]);
      if($seccion->Asignar_Notas($_POST['msd'][$i],$_POST['estudiante'][$i],$_POST['lapso'][$i],$_POST['notas'][$i]))
        $con++;
    }
    $rest=count($_POST['msd'])-$con;
  }
  $_SESSION['datos']['mensaje']="Cantidad de Estudiantes Seleccionados: ".count($_POST['msd']).", Cantidad Calificados: ".$con.", Cantidad Restantes: ".$rest;
  header("Location: ../vistas/?asignar_notas");
}
?>