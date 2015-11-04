<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['nacionalidad']))
$nacionalidad=ucfirst(trim($_POST['nacionalidad']));

if(isset($_POST['cedula_estudiante']))
$cedula_estudiante=ucfirst(trim($_POST['cedula_estudiante']));

if(isset($_POST['nombre_estudiante']))
$nombre_estudiante=ucfirst(trim($_POST['nombre_estudiante']));

if(isset($_POST['apellido_estudiante']))
$apellido_estudiante=ucfirst(trim($_POST['apellido_estudiante']));

if(isset($_POST['sexo']))
$sexo=ucfirst(trim($_POST['sexo']));

if(isset($_POST['fecha_nacimiento'])){
  if(!empty($_POST['fecha_nacimiento'])){
    //el formato va acorde a la fecha como string
    $objetoFecha = DateTime::createFromFormat("d/m/Y", $_POST['fecha_nacimiento'] );
     
    //el formato ahora es acorde a lo que ocupamos, segun mysql
    $fecha_nacimiento = $objetoFecha->format("Y-m-d");
  } 
}

if(isset($_POST['edocivil']))
$edocivil=ucfirst(trim($_POST['edocivil']));

if(isset($_POST['tlf_fijo']))
$tlf_fijo=ucfirst(trim($_POST['tlf_fijo']));

if(isset($_POST['tlf_movil']))
$tlf_movil=ucfirst(trim($_POST['tlf_movil']));

if(isset($_POST['email']))
$email=ucfirst(trim($_POST['email']));

if(isset($_POST['cod_parroquia']))
$cod_parroquia=ucfirst(trim($_POST['cod_parroquia']));

if(isset($_POST['direccion']))
$direccion=ucfirst(trim($_POST['direccion']));

if(isset($_POST['titulo']))
$titulo=ucfirst(trim($_POST['titulo']));

//Variable para el Combo Dependiente.
if(isset($_POST['filtro']))
$filtro=trim($_POST['filtro']);

include_once("../clases/class_estudiante.php");
$estudiante=new Estudiante();
if($operacion=='Registrar'){
  $estudiante->nacionalidad($nacionalidad);
  $estudiante->cedula_estudiante($cedula_estudiante);
  $estudiante->nombre_estudiante($nombre_estudiante);
  $estudiante->apellido_estudiante($apellido_estudiante);
  $estudiante->sexo($sexo);
  $estudiante->fecha_nacimiento($fecha_nacimiento);
  $estudiante->edocivil($edocivil);
  $estudiante->tlf_fijo($tlf_fijo);
  $estudiante->tlf_movil($tlf_movil);
  $estudiante->email($email);
  $estudiante->cod_parroquia($cod_parroquia);
  $estudiante->direccion($direccion);
  $estudiante->titulo($titulo);
  if(!$estudiante->Comprobar()){
    if($estudiante->Registrar())
       $confirmacion=1;
    else
       $confirmacion=-1;
  }else{
    if($estudiante->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($estudiante->Activar())            
         $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El estudiante ha sido registrado con éxito !";
    header("Location: ../vistas/?estudiante");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar al estudiante.";
    header("Location: ../vistas/?estudiante");
  }
}

if($operacion=='Modificar'){
  $estudiante->nacionalidad($nacionalidad);
  $estudiante->cedula_estudiante($cedula_estudiante);
  $estudiante->nombre_estudiante($nombre_estudiante);
  $estudiante->apellido_estudiante($apellido_estudiante);
  $estudiante->sexo($sexo);
  $estudiante->fecha_nacimiento($fecha_nacimiento);
  $estudiante->edocivil($edocivil);
  $estudiante->tlf_fijo($tlf_fijo);
  $estudiante->tlf_movil($tlf_movil);
  $estudiante->email($email);
  $estudiante->cod_parroquia($cod_parroquia);
  $estudiante->direccion($direccion);
  $estudiante->titulo($titulo);
    if($estudiante->Actualizar())
     $confirmacion=1;
    else
     $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El estudiante ha sido modificado con éxito !";
    header("Location: ../vistas/?estudiante");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar al estudiante.";
    header("Location: ../vistas/?estudiante");
  }
}

if($operacion=='Desactivar'){
  $estudiante->cedula_estudiante($cedula_estudiante);
  $estudiante->nombre_estudiante($nombre_estudiante);
  if($estudiante->Consultar()){
    if($estudiante->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El estudiante ha sido desactivado con éxito";
    header("Location: ../vistas/?estudiante");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar al estudiante.";
    header("Location: ../vistas/?estudiante");
  }
}


if($operacion=='Activar'){
  $estudiante->cedula_estudiante($cedula_estudiante);
  $estudiante->nombre_estudiante($nombre_estudiante);
  if($estudiante->Consultar()){
    if($estudiante->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El estudiante ha sido activado con éxito";
    header("Location: ../vistas/?estudiante");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar al estudiante.";
    header("Location: ../vistas/?estudiante");
  }
}

if($operacion=='Consultar'){ 
  $estudiante->cedula_estudiante($cedula_estudiante);
  $estudiante->nombre_estudiante($nombre_estudiante);
  if($estudiante->Consultar()){
    $_SESSION['datos']['nacionalidad']=$estudiante->nacionalidad();
    $_SESSION['datos']['cedula_estudiante']=$estudiante->cedula_estudiante();
    $_SESSION['datos']['nombre_estudiante']=$estudiante->nombre_estudiante();
    $_SESSION['datos']['apellido_estudiante']=$estudiante->apellido_estudiante();
    $_SESSION['datos']['sexo']=$estudiante->sexo();
    $_SESSION['datos']['fecha_nacimiento']=$estudiante->fecha_nacimiento();
    $_SESSION['datos']['edocivil']=$estudiante->edocivil();
    $_SESSION['datos']['tlf_fijo']=$estudiante->tlf_fijo();
    $_SESSION['datos']['tlf_movil']=$estudiante->tlf_movil();
    $_SESSION['datos']['email']=$estudiante->email();
    $_SESSION['datos']['cod_parroquia']=$estudiante->cod_parroquia();
    $_SESSION['datos']['direccion']=$estudiante->direccion();
    $_SESSION['datos']['titulo']=$estudiante->titulo();
    $_SESSION['datos']['estatus']=$estudiante->estatus_estudiante();
    header("Location: ../vistas/?estudiante");
  }else{
    $_SESSION['datos']['mensaje']="No se han encontrado resultados para tu búsqueda(".$cedula_estudiante.")";
    header("Location: ../vistas/?estudiante");
  }
}

if($operacion=='Combo'){
  echo $estudiante->BuscarParroquias($filtro);
  unset($estudiante);
}    
?>