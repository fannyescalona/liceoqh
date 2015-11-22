<?php
//Verificar Inicio de Session.
session_start();

//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['cedula_docente'])){
  $ceduladocente=explode("_",trim($_POST['cedula_docente']));
  $cedula_docente=$ceduladocente[0];
}

if(isset($_POST['seccion'])){
  $secciones=explode("_",trim($_POST['seccion']));
  $seccion=$secciones[0];
}

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

if(isset($_POST['lugar_nacimiento'])){
  $lugarnacimiento=explode("_",trim($_POST['lugar_nacimiento']));
  $lugar_nacimiento=$lugarnacimiento[0];
}

if(isset($_POST['direccion']))
$direccion=ucfirst(trim($_POST['direccion']));

if(isset($_POST['telefono_habitacion']))
$telefono_habitacion=ucfirst(trim($_POST['telefono_habitacion']));

if(isset($_POST['telefono_movil']))
$telefono_movil=ucfirst(trim($_POST['telefono_movil']));

if(isset($_POST['email']))
$email=ucfirst(trim($_POST['email']));

if(isset($_POST['plantel_procedencia']))
$plantel_procedencia=ucfirst(trim($_POST['plantel_procedencia']));

if(isset($_POST['peso']))
$peso=ucfirst(trim($_POST['peso']));

if(isset($_POST['talla']))
$talla=ucfirst(trim($_POST['talla']));

if(isset($_POST['cedula_representante'])){
  $cedularepresentante=explode("_",trim($_POST['cedula_representante']));
  $cedula_representante=$cedularepresentante[0];
}

if(isset($_POST['codigo_parentesco'])){
  $codigoparentesco=explode("_",trim($_POST['codigo_parentesco']));
  $codigo_parentesco=$codigoparentesco[0];
}

include_once("../clases/class_persona.php");
include_once("../clases/class_procesoinscripcion.php");
$persona=new Persona();
$inscripcion=new Inscripcion();

if($operacion=='Registrar'){
  $inscripcion->cedula_docente($cedula_docente);
  $inscripcion->seccion($seccion);
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
  $inscripcion->plantel_procedencia($plantel_procedencia);
  $inscripcion->peso($peso);
  $inscripcion->talla($talla);
  $inscripcion->cedula_representante($cedula_representante);
  $inscripcion->codigo_parentesco($codigo_parentesco);
  $inscripcion->cedula_estudiante($cedula);
  $persona->esestudiante("Y");
  $confirmacion=false;
  $inscripcion->Transaccion('iniciando');
  if(!$persona->Comprobar()){
    if($persona->Registrar()){
      if($inscripcion->RegistrarInscripcionManual())
        $confirmacion=1;
      else
        $confirmacion=-1;
    }
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
    $inscripcion->Transaccion('finalizado');
    $_SESSION['datos']['mensaje']="El estudiante ha sido registrado con éxito !";
    header("Location: ../vistas/?estudiante");
   }else{
    $inscripcion->Transaccion('cancelado');
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar el estudiante.";
    header("Location: ../vistas/?estudiante");
  }
}

if($operacion=='Modificar'){
  $inscripcion->cedula_docente($cedula_docente);
  $inscripcion->seccion($seccion);
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
  $inscripcion->plantel_procedencia($plantel_procedencia);
  $inscripcion->peso($peso);
  $inscripcion->talla($talla);
  $inscripcion->cedula_representante($cedula_representante);
  $inscripcion->codigo_parentesco($codigo_parentesco);
  $inscripcion->cedula_estudiante($cedula);
  $persona->esestudiante("Y");
  $confirmacion=false;
  $inscripcion->Transaccion('iniciando');
  if($persona->Actualizar()){
    if($inscripcion->ActualizarInscripcionManual())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $inscripcion->Transaccion('finalizado');
    $_SESSION['datos']['mensaje']="El estudiante ha sido modificado con éxito !";
    header("Location: ../vistas/?estudiante");
  }else{
    $inscripcion->Transaccion('cancelado');
    $_SESSION['datos']['mensaje']="Problema al modificar el estudiante.";
    header("Location: ../vistas/?estudiante");
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
    $_SESSION['datos']['mensaje']="El estudiante ha sido desactivado con éxito";
    header("Location: ../vistas/?estudiante");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el estudiante.";
    header("Location: ../vistas/?estudiante");
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
    $_SESSION['datos']['mensaje']="El estudiante ha sido activado con éxito";
    header("Location: ../vistas/?estudiante");
  }else{
    $_SESSION['datos']['mensaje']="Problema al desactivar el estudiante.";
    header("Location: ../vistas/?estudiante");
  }
}

if($operacion=='Consultar'){ 
  $persona->cedula($cedula);
  if($persona->ConsultarEstudiante()){
    $_SESSION['datos']['cedula_docente']=$persona->cedula_docente();
    $_SESSION['datos']['seccion']=$persona->seccion();
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
    $_SESSION['datos']['plantel_procedencia']=$persona->plantel_procedencia();
    $_SESSION['datos']['peso']=$persona->peso();
    $_SESSION['datos']['talla']=$persona->talla();
    $_SESSION['datos']['cedula_representante']=$persona->cedula_representante();
    $_SESSION['datos']['codigo_parentesco']=$persona->codigo_parentesco();
    $_SESSION['datos']['esestudiante']=$persona->esestudiante("Y");
    $_SESSION['datos']['estatus']=$persona->estatus();
    header("Location: ../vistas/?estudiante");
  }else{
    $_SESSION['datos']['mensaje']="No se han encontrado resultados para tu búsqueda(".$cedula.")";
    header("Location: ../vistas/?estudiante");
  }
}
?>