<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_servicio']))
$id=ucfirst(trim($_POST['codigo_servicio']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));

if(isset($_POST['url']))
$url=ucfirst(trim($_POST['url']));

if(isset($_POST['orden']))
$orden=ucfirst(trim($_POST['orden']));

if(isset($_POST['codigo_modulo']))
$codigo_modulo=ucfirst(trim($_POST['codigo_modulo']));

include_once("../clases/class_servicio.php");
$servicios=new Servicios();
if($operacion=='Registrar'){
  $servicios->codigo_servicio($id);
  $servicios->descripcion($descripcion);
  $servicios->url($url);
  $servicios->orden($orden);
  $servicios->codigo_modulo($codigo_modulo);
  if(!$servicios->Comprobar()){
    if($servicios->Registrar())
       $confirmacion=1;
    else
       $confirmacion=-1;
  }else{
    if($servicios->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($servicios->Activar())            
         $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El servicio ha sido registrado con éxito !";
    header("Location: ../vistas/?servicio");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar el servicio.<br><b>Error: ".utf8_encode($servicios->error())."</b>";
    header("Location: ../vistas/?servicio");
  }
}

if($operacion=='Modificar'){
  $servicios->codigo_servicio($id);
  $servicios->descripcion($descripcion);
  $servicios->url($url);
  $servicios->orden($orden);
  $servicios->codigo_modulo($codigo_modulo);
  if($servicios->Actualizar())
   $confirmacion=1;
  else
   $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El servicio ha sido modificado con éxito !";
    header("Location: ../vistas/?servicio");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar el servicio.<br><b>Error: ".utf8_encode($servicios->error())."</b>";
    header("Location: ../vistas/?servicio");
  }
}

if($operacion=='Desactivar'){
  $servicios->codigo_servicio($id);
  $servicios->descripcion($descripcion);
  if($servicios->Consultar()){
    if($servicios->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El servicio ha sido desactivado con éxito";
    header("Location: ../vistas/?servicio");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el servicio.<br><b>Error: ".utf8_encode($servicios->error())."</b>";
    header("Location: ../vistas/?servicio");
  }
}

if($operacion=='Activar'){
  $servicios->codigo_servicio($id);
  $servicios->descripcion($descripcion);
  if($servicios->Consultar()){
    if($servicios->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El servicio ha sido desactivado con éxito";
    header("Location: ../vistas/?servicio");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el servicio.";
    header("Location: ../vistas/?servicio");
  }
}

if($operacion=='Consultar'){ 
  $servicios->codigo_servicio($id);
  $servicios->descripcion($descripcion);
  if($servicios->Consultar()){
    $_SESSION['datos']['codigo_servicio']=$servicios->codigo_servicio();
    $_SESSION['datos']['descripcion']=$servicios->descripcion();
    $_SESSION['datos']['url']=$servicios->url();
    $_SESSION['datos']['orden']=$servicios->orden();
    $_SESSION['datos']['codigo_modulo']=$servicios->codigo_modulo();
    $_SESSION['datos']['estatus']=$servicios->estatus();
    header("Location: ../vistas/?servicio");
  }else{
    $error="";
    if($servicios->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($servicios->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    $_SESSION['datos']['mensaje']=$error;
    header("Location: ../vistas/?servicio");
  }
}    
?>