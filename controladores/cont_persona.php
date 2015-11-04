<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['rol']))
$rol=ucfirst(trim($_POST['rol']));

if(isset($_POST['nacionalidad']))
$nacionalidad=ucfirst(trim($_POST['nacionalidad']));

if(isset($_POST['cedula_persona']))
$cedula_persona=ucfirst(trim($_POST['cedula_persona']));

if(isset($_POST['nombre_persona']))
$nombre_persona=ucfirst(trim($_POST['nombre_persona']));

if(isset($_POST['apellido_persona']))
$apellido_persona=ucfirst(trim($_POST['apellido_persona']));

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

include_once("../clases/class_persona.php");
$persona=new Persona();
if($operacion=='Registrar'){
  $persona->rol($rol);
  $persona->nacionalidad($nacionalidad);
  $persona->cedula_persona($cedula_persona);
  $persona->nombre_persona($nombre_persona);
  $persona->apellido_persona($apellido_persona);
  $persona->sexo($sexo);
  $persona->fecha_nacimiento($fecha_nacimiento);
  $persona->edocivil($edocivil);
  $persona->tlf_fijo($tlf_fijo);
  $persona->tlf_movil($tlf_movil);
  $persona->email($email);
  $persona->cod_parroquia($cod_parroquia);
  $persona->direccion($direccion);
  $persona->titulo($titulo);
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
  $persona->rol($rol);
  $persona->nacionalidad($nacionalidad);
  $persona->cedula_persona($cedula_persona);
  $persona->nombre_persona($nombre_persona);
  $persona->apellido_persona($apellido_persona);
  $persona->sexo($sexo);
  $persona->fecha_nacimiento($fecha_nacimiento);
  $persona->edocivil($edocivil);
  $persona->tlf_fijo($tlf_fijo);
  $persona->tlf_movil($tlf_movil);
  $persona->email($email);
  $persona->cod_parroquia($cod_parroquia);
  $persona->direccion($direccion);
  $persona->titulo($titulo);
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
  $persona->cedula_persona($cedula_persona);
  $persona->nombre_persona($nombre_persona);
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
  $persona->cedula_persona($cedula_persona);
  $persona->nombre_persona($nombre_persona);
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
  $persona->cedula_persona($cedula_persona);
  $persona->nombre_persona($nombre_persona);
  if($persona->Consultar()){
    $_SESSION['datos']['rol']=$persona->rol();
    $_SESSION['datos']['nacionalidad']=$persona->nacionalidad();
    $_SESSION['datos']['cedula_persona']=$persona->cedula_persona();
    $_SESSION['datos']['nombre_persona']=$persona->nombre_persona();
    $_SESSION['datos']['apellido_persona']=$persona->apellido_persona();
    $_SESSION['datos']['sexo']=$persona->sexo();
    $_SESSION['datos']['fecha_nacimiento']=$persona->fecha_nacimiento();
    $_SESSION['datos']['edocivil']=$persona->edocivil();
    $_SESSION['datos']['tlf_fijo']=$persona->tlf_fijo();
    $_SESSION['datos']['tlf_movil']=$persona->tlf_movil();
    $_SESSION['datos']['email']=$persona->email();
    $_SESSION['datos']['cod_parroquia']=$persona->cod_parroquia();
    $_SESSION['datos']['direccion']=$persona->direccion();
    $_SESSION['datos']['titulo']=$persona->titulo();
    $_SESSION['datos']['estatus']=$persona->estatus_persona();
    header("Location: ../vistas/?persona");
  }else{
    $_SESSION['datos']['mensaje']=utf8_encode("No se han encontrado resultados para tu búsqueda(".$cedula_persona.")");
    header("Location: ../vistas/?persona");
  }
}

if($operacion=='Combo'){
  echo $persona->BuscarParroquias($filtro);
  unset($persona);
}    
?>