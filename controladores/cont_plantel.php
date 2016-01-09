<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_plantel']))
$id=ucfirst(trim($_POST['codigo_plantel']));

if(isset($_POST['nombre']))
$nombre=ucfirst(trim($_POST['nombre']));

if(isset($_POST['direccion']))
$direccion=ucfirst(trim($_POST['direccion']));

if(isset($_POST['telefono_habitacion']))
$telefono_habitacion=ucfirst(trim($_POST['telefono_habitacion']));

if(isset($_POST['localidad']))
$localidad=ucfirst(trim($_POST['localidad']));

if(isset($_POST['codigo_municipio'])){
  $municipio=explode("_",trim($_POST['codigo_municipio']));
  $codigo_municipio=$municipio[0];
}

if(isset($_POST['email']))
$email=trim($_POST['email']);

include_once("../clases/class_plantel.php");
$plantel=new plantel();
if($operacion=='Registrar'){
  $plantel->codigo_plantel($id);
  $plantel->nombre($nombre);
  $plantel->direccion($direccion);
  $plantel->telefono_habitacion($telefono_habitacion);
  $plantel->localidad($localidad);
  $plantel->codigo_municipio($codigo_municipio);
  $plantel->email($email);
  if(!$plantel->Comprobar()){
    if($plantel->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($plantel->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($plantel->Activar())					  
        $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El plantel ha sido registrado con éxito !";
    header("Location: ../vistas/?plantel");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar plantel.<br><b>Error: ".utf8_encode($plantel->error())."</b>";
    header("Location: ../vistas/?plantel");
  }
}

if($operacion=='Modificar'){
  $plantel->codigo_plantel($id);
  $plantel->nombre($nombre);
  $plantel->direccion($direccion);
  $plantel->telefono_habitacion($telefono_habitacion);
  $plantel->localidad($localidad);
  $plantel->codigo_municipio($codigo_municipio);
  $plantel->email($email);
  if($plantel->Actualizar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El plantel ha sido modificado con éxito !";
    header("Location: ../vistas/?plantel");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar el plantel.<br><b>Error: ".utf8_encode($plantel->error())."</b>";
    header("Location: ../vistas/?plantel");
  }
}

if($operacion=='Desactivar'){
  $plantel->codigo_plantel($id);
  $plantel->nombre($nombre);
  if($plantel->Consultar()){
    if($plantel->Desactivar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El plantel ha sido desactivado con éxito";
    header("Location: ../vistas/?plantel");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el plantel.<br><b>Error: ".utf8_encode($plantel->error())."</b>";
    header("Location: ../vistas/?plantel");
  }
}

if($operacion=='Activar'){
  $plantel->codigo_plantel($id);
  $plantel->nombre($nombre);
  if($plantel->Consultar()){
    if($plantel->Activar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El plantel ha sido desactivado con éxito";
    header("Location: ../vistas/?plantel");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el plantel.<br><b>Error: ".utf8_encode($plantel->error())."</b>";
    header("Location: ../vistas/?plantel");
  }
}

if($operacion=='Consultar'){	
  $plantel->codigo_plantel($id);
  $plantel->nombre($nombre);
  if($plantel->Consultar()){
    $_SESSION['datos']['codigo_plantel']=$plantel->codigo_plantel();
    $_SESSION['datos']['nombre']=$plantel->nombre();
    $_SESSION['datos']['direccion']=$plantel->direccion();
    $_SESSION['datos']['telefono_habitacion']=$plantel->telefono_habitacion();
    $_SESSION['datos']['localidad']=$plantel->localidad();
    $_SESSION['datos']['codigo_municipio']=$plantel->codigo_municipio();
    $_SESSION['datos']['email']=$plantel->email();
    $_SESSION['datos']['estatus']=$plantel->estatus_plantel();
    header("Location: ../vistas/?plantel");
  }else{
    $error="";
    if($plantel->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($plantel->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$nombre.")";
    $_SESSION['datos']['mensaje']=$error;
    header("Location: ../vistas/?plantel");
  }
}		  
?>