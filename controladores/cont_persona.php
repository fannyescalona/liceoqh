<?php
//Verificar Inicio de Session.
session_start();

//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['cedula']))
$cedula=ucfirst(trim($_POST['cedula']));

if(isset($_POST['nombres']))
$nombres=ucfirst(trim($_POST['nombres']));

if(isset($_POST['apellidos']))
$apellidos=ucfirst(trim($_POST['apellidos']));

if(isset($_POST['genero']))
$genero=ucfirst(trim($_POST['genero']));

if(isset($_POST['fecha_nacimiento']))
$fecha_nacimiento=(trim($_POST['fecha_nacimiento']));

if(isset($_POST['lugar_nacimiento']))
$lugar_nacimiento=ucfirst(trim($_POST['lugar_nacimiento']));

if(isset($_POST['direccion']))
$direccion=ucfirst(trim($_POST['direccion']));

if(isset($_POST['telefono_habitacion']))
$telefono_habitacion=ucfirst(trim($_POST['telefono_habitacion']));

if(isset($_POST['telefono_movil']))
$telefono_movil=ucfirst(trim($_POST['telefono_movil']));

if(isset($_POST['email']))
$email=ucfirst(trim($_POST['email']));

if(isset($_POST['esrepresentante']))
$esrepresentante=ucfirst(trim($_POST['esrepresentante']));

if(isset($_POST['espersonalinstitucion']))
$espersonalinstitucion=ucfirst(trim($_POST['espersonalinstitucion']));

if(isset($_POST['fecha_ingreso']))
$fecha_ingreso=ucfirst(trim($_POST['fecha_ingreso']));

if(isset($_POST['codigo_cargo']))
$codigo_cargo=ucfirst(trim($_POST['codigo_cargo']));

if(isset($_POST['codigo_dependencia']))
$codigo_dependencia=ucfirst(trim($_POST['codigo_dependencia']));

if(isset($_POST['condicion_cargo']))
$condicion_cargo=ucfirst(trim($_POST['condicion_cargo']));

if(isset($_POST['nivel_academico']))
$nivel_academico=ucfirst(trim($_POST['nivel_academico']));

if(isset($_POST['carga_horaria']))
$carga_horaria=ucfirst(trim($_POST['carga_horaria']));

if(isset($_POST['codigo_plantel']))
$codigo_plantel=ucfirst(trim($_POST['codigo_plantel']));

//Variable para el Combo Dependiente.
if(isset($_POST['filtro']))
$filtro=trim($_POST['filtro']);

include_once("../clases/class_persona.php");
$persona=new Persona();
if($operacion=='Registrar'){ 
  $persona->cedula($cedula);
  $persona->nombres($nombres);
  $persona->apellidos($apellidos);
  $persona->genero($genero);
  $persona->fecha_nacimiento($fecha_nacimiento);
  $persona->lugar_nacimiento($lugar_nacimiento);
  $persona->direccion($direccion);
  $persona->telefono_habitacion($telefono_habitacion);
  $persona->telefono_movil($telefono_movil);
  $persona->email($email);
  $persona->esestudiante("N");
  $persona->esrepresentante($esrepresentante);
  $persona->espersonalinstitucion($espersonalinstitucion);
  $persona->codigo_cargo($codigo_cargo);
  $persona->fecha_ingreso($fecha_ingreso);
  $persona->codigo_dependencia($codigo_dependencia);
  $persona->condicion_cargo($codigo_dependencia);
  $persona->nivel_academico($nivel_academico);
  $persona->carga_horaria($carga_horaria);
  $persona->codigo_plantel($codigo_plantel);
  if(!$persona->Comprobar()){
    if($persona->Registrar())
       $confirmacion=1;
    else
       $confirmacion=-1;
  }else{
    if($persona->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($persona->Activar())            
         $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La persona ha sido registrada con éxito !";
    header("Location: ../vistas/?persona");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar la persona.";
    header("Location: ../vistas/?persona");
  }
}

if($operacion=='Modificar'){
  $persona->cedula($cedula);
  $persona->nombres($nombres);
  $persona->apellidos($apellidos);
  $persona->genero($genero);
  $persona->fecha_nacimiento($fecha_nacimiento);
  $persona->lugar_nacimiento($lugar_nacimiento);
  $persona->direccion($direccion);
  $persona->telefono_habitacion($telefono_habitacion);
  $persona->telefono_movil($telefono_movil);
  $persona->email($email);
  $persona->esestudiante("N");
  $persona->esrepresentante($esrepresentante);
  $persona->espersonalinstitucion($espersonalinstitucion);
  $persona->codigo_cargo($codigo_cargo);
  $persona->fecha_ingreso($fecha_ingreso);
  $persona->codigo_dependencia($codigo_dependencia);
  $persona->condicion_cargo($codigo_dependencia);
  $persona->nivel_academico($nivel_academico);
  $persona->carga_horaria($carga_horaria);
  $persona->codigo_plantel($codigo_plantel);
    if($persona->Actualizar())
     $confirmacion=1;
    else
     $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La persona ha sido modificada con éxito !";
    header("Location: ../vistas/?persona");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar la persona.";
    header("Location: ../vistas/?persona");
  }
}

if($operacion=='Desactivar'){
  $persona->cedula($cedula);
  $persona->nombres($nombres);
  if($persona->Consultar()){
    if($persona->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La persona ha sido desactivada con éxito";
    header("Location: ../vistas/?persona");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar la persona.";
    header("Location: ../vistas/?persona");
  }
}


if($operacion=='Activar'){
  $persona->cedula($cedula);
  $persona->nombres($nombres);
  if($persona->Consultar()){
    if($persona->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La persona ha sido activada con éxito";
    header("Location: ../vistas/?persona");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar la persona.";
    header("Location: ../vistas/?persona");
  }
}

if($operacion=='Consultar'){ 
  $persona->cedula($cedula);
  $persona->nombres($nombres);
  if($persona->Consultar()){
    $_SESSION['datos']['cedula']=$persona->cedula();
    $_SESSION['datos']['nombres']=$persona->nombres();
    $_SESSION['datos']['apellidos']=$persona->apellidos();
    $_SESSION['datos']['genero']=$persona->genero();
    $_SESSION['datos']['fecha_nacimiento']=$persona->fecha_nacimiento();
    $_SESSION['datos']['lugar_nacimiento']=$persona->lugar_nacimiento();
    $_SESSION['datos']['direccion']=$persona->direccion();
    $_SESSION['datos']['telefono_habitacion']=$persona->telefono_habitacion();
    $_SESSION['datos']['telefono_movil']=$persona->telefono_movil();
    $_SESSION['datos']['email']=$persona->email();
    $_SESSION['datos']['esrepresentante']=$persona->esrepresentante();
    $_SESSION['datos']['espersonalinstitucion']=$persona->espersonalinstitucion();
    $_SESSION['datos']['codigo_cargo']=$persona->codigo_cargo();
    $_SESSION['datos']['fecha_ingreso']=$persona->fecha_ingreso();
    $_SESSION['datos']['codigo_dependencia']=$persona->codigo_dependencia();
    $_SESSION['datos']['condicion_cargo']=$persona->condicion_cargo();
    $_SESSION['datos']['nivel_academico']=$persona->nivel_academico();
    $_SESSION['datos']['carga_horaria']=$persona->carga_horaria();
    $_SESSION['datos']['codigo_plantel']=$persona->codigo_plantel();
    $_SESSION['datos']['estatus']=$persona->estatus_persona();
    header("Location: ../vistas/?persona");
  }else{
    $_SESSION['datos']['mensaje']=utf8_encode("No se han encontrado resultados para tu búsqueda(".$cedula.")");
    header("Location: ../vistas/?persona");
  }
}

if($operacion=='Combo'){
  echo $persona->BuscarParroquias($filtro);
  unset($persona);
}    
?>