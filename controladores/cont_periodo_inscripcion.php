<?php
session_start();
if(isset($_POST['operacion']))
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['cod_inscripcion']))
$id=ucfirst(trim($_POST['cod_inscripcion']));

if(isset($_POST['cod_periodo']))
$cod_periodo=ucfirst(trim($_POST['cod_periodo']));

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

if(isset($_POST['fecha_cierre'])){
  if(!empty($_POST['fecha_cierre'])){
    //el formato va acorde a la fecha como string
    $objetoFecha = DateTime::createFromFormat("d/m/Y", $_POST['fecha_cierre'] );
   
    //el formato ahora es acorde a lo que ocupamos, segun mysql
    $fecha_cierre = $objetoFecha->format("Y-m-d");
  } 
}

include_once("../clases/class_periodo_inscripcion.php");
$inscripcion=new Inscripcion();
if($operacion=='Registrar'){
  $inscripcion->codigo_inscripcion($id);
  $inscripcion->codigo_periodo($cod_periodo);
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
    $_SESSION['datos']['mensaje']="El período de inscripción ha sido registrado con éxito !";
    header("Location: ../vistas/?periodo_inscripcion");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar el período de inscripción.";
    header("Location: ../vistas/?periodo_inscripcion");
  }
}

if($operacion=='Modificar'){
  $inscripcion->codigo_inscripcion($id);
  $inscripcion->codigo_periodo($cod_periodo);
  $inscripcion->descripcion($descripcion);
  $inscripcion->fecha_inicio($fecha_inicio);
  $inscripcion->fecha_fin($fecha_fin);
  $inscripcion->fecha_cierre($fecha_cierre);
  if($inscripcion->Actualizar())
   $confirmacion=1;
  else
   $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El período de inscripción ha sido modificado con éxito !";
    header("Location: ../vistas/?periodo_inscripcion");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar el período de inscripción.";
    header("Location: ../vistas/?periodo_inscripcion");
  }
}

if($operacion=='Desactivar'){
  $inscripcion->codigo_inscripcion($id);
  $inscripcion->codigo_periodo($cod_periodo);
  $inscripcion->descripcion($descripcion);
  $inscripcion->fecha_inicio($fecha_inicio);
  $inscripcion->fecha_fin($fecha_fin);
  $inscripcion->fecha_cierre($fecha_cierre);
  if($inscripcion->Consultar()){
    if($inscripcion->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El período de inscripción ha sido desactivado con éxito";
    header("Location: ../vistas/?periodo_inscripcion");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el período de inscripción.";
    header("Location: ../vistas/?periodo_inscripcion");
  }
}

if($operacion=='Activar'){
  $inscripcion->codigo_inscripcion($id);
  $inscripcion->codigo_periodo($cod_periodo);
  $inscripcion->descripcion($descripcion);
  $inscripcion->fecha_inicio($fecha_inicio);
  $inscripcion->fecha_fin($fecha_fin);
  $inscripcion->fecha_cierre($fecha_cierre);
  if($inscripcion->Consultar()){
    if($inscripcion->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El período de inscripción ha sido activado con éxito";
    header("Location: ../vistas/?periodo_inscripcion");
  }else{
    $_SESSION['datos']['mensaje']="Problema al activar el período de inscripción.";
    header("Location: ../vistas/?periodo_inscripcion");
  }
}

if($operacion=='Consultar'){ 
  $inscripcion->codigo_inscripcion($id);
  $inscripcion->descripcion($descripcion);
  if($inscripcion->Consultar()){
    $_SESSION['datos']['cod_inscripcion']=$inscripcion->codigo_inscripcion();
    $_SESSION['datos']['descripcion']=$inscripcion->descripcion();
    $_SESSION['datos']['fecha_inicio']=$inscripcion->fecha_inicio();
    $_SESSION['datos']['fecha_fin']=$inscripcion->fecha_fin();
    $_SESSION['datos']['fecha_cierre']=$inscripcion->fecha_cierre();
    $_SESSION['datos']['estatus']=$inscripcion->estatus_inscripcion();
    header("Location: ../vistas/?periodo_inscripcion");
  }else{
    $_SESSION['datos']['mensaje']="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    header("Location: ../vistas/?periodo_inscripcion");
  }
}    
?>