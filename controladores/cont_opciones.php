<?php
session_start();
if(isset($_POST['operacion']))
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_opcion']))
$id=ucfirst(trim($_POST['codigo_opcion']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));

if(isset($_POST['icono']))
$icono=trim($_POST['icono']);

if(isset($_POST['orden']))
$orden=ucfirst(trim($_POST['orden']));

include_once("../clases/class_opciones.php");
$opciones=new Opciones();
if($operacion=='Registrar'){
  $opciones->codigo_opcion($id);
  $opciones->descripcion($descripcion);
  $opciones->icono($icono);
  $opciones->orden($orden);
  if(!$opciones->Comprobar()){
    if($opciones->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($opciones->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($opciones->Activar())					  
        $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La opción ha sido registrada con éxito !";
    header("Location: ../vistas/?botones");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar la opción.<br><b>Error: ".utf8_encode($opciones->error())."</b>";
    header("Location: ../vistas/?botones");
  }
}

if($operacion=='Modificar'){
  $opciones->codigo_opcion($id);
  $opciones->descripcion($descripcion);
  $opciones->icono($icono);
  $opciones->orden($orden);
  if($opciones->Actualizar())
  $confirmacion=1;
  else
  $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La opción ha sido modificada con éxito !";
    header("Location: ../vistas/?botones");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar la opción.<br><b>Error: ".utf8_encode($opciones->error())."</b>";
    header("Location: ../vistas/?botones");
  }
}

if($operacion=='Desactivar'){
  $opciones->codigo_opcion($id);
  $opciones->descripcion($descripcion);
  if($opciones->Consultar()){
    if($opciones->Desactivar())
    $confirmacion=1;
    else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La opción ha sido desactivada con éxito";
    header("Location: ../vistas/?botones");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar la opción.<br><b>Error: ".utf8_encode($opciones->error())."</b>";
    header("Location: ../vistas/?botones");
  }
}

if($operacion=='Activar'){
  $opciones->codigo_opcion($id);
  $opciones->descripcion($descripcion);
  if($opciones->Consultar()){
    if($opciones->Activar())
    $confirmacion=1;
    else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La opción ha sido activada con éxito";
    header("Location: ../vistas/?botones");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al activar la opción.<br><b>Error: ".utf8_encode($opciones->error())."</b>";
    header("Location: ../vistas/?botones");
  }
}

if($operacion=='Consultar'){	
  $opciones->codigo_opcion($id);
  $opciones->descripcion($descripcion);
  if($opciones->Consultar()){
    $_SESSION['datos']['codigo_opcion']=$opciones->codigo_opcion();
    $_SESSION['datos']['descripcion']=$opciones->descripcion();
    $_SESSION['datos']['icono']=$opciones->icono();
    $_SESSION['datos']['estatus']=$opciones->estatus_opciones();
    $_SESSION['datos']['orden']=$opciones->orden();
    header("Location: ../vistas/?botones");
  }else{
    $error="";
    if($opciones->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($opciones->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    $_SESSION['datos']['mensaje']=$error;
    header("Location: ../vistas/?botones");
  }
}
?>