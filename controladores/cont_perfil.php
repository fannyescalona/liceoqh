<?php
session_start();
if(isset($_POST['operacion']))
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_perfil']))
$id=ucfirst(trim($_POST['codigo_perfil']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));

if(isset($_POST['codigo_configuracion']))
$codigo_configuracion=ucfirst(trim($_POST['codigo_configuracion']));

include_once("../clases/class_perfil.php");
$perfil=new Perfil();
if($operacion=='Registrar'){
  $perfil->codigo_perfil($id);
  $perfil->descripcion($descripcion);
  $perfil->codigo_configuracion($codigo_configuracion);
  if(!$perfil->Comprobar()){
    if($perfil->Registrar()){
      $confirmacion=1;			                   			                   
      if(isset($_POST['modulos']) && isset($_POST['servicios']) && isset($_POST['opciones'])){
        $perfil->ELIMINAR_OPCION_SERVICIO_PERFIL();
        $perfil->INSERTAR_OPCION_SERVICIO_PERFIL($_POST['modulos'],$_POST['servicios'],$_POST['opciones']);
      }
    }else
      $confirmacion=-1;
  }else{
    if($perfil->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($perfil->Activar())					  
        $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El perfil ha sido registrado con éxito !";
    header("Location: ../vistas/?perfiles");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar el perfil.<br><b>Error: ".utf8_encode($perfil->error())."</b>";
    header("Location: ../vistas/?perfiles");
  }
}

if($operacion=='Modificar'){
  $perfil->codigo_perfil($id);
  $perfil->descripcion($descripcion);
  $perfil->codigo_configuracion($codigo_configuracion);
  //if(!$perfil->Consultar()){
  if($perfil->Actualizar()){
    $confirmacion=1;
    if(isset($_POST['modulos']) && isset($_POST['servicios']) && isset($_POST['opciones'])){
      $perfil->ELIMINAR_OPCION_SERVICIO_PERFIL();
      $perfil->INSERTAR_OPCION_SERVICIO_PERFIL($_POST['modulos'],$_POST['servicios'],$_POST['opciones']);
    }
  }
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El perfil ha sido modificado con éxito !";
    header("Location: ../vistas/?perfiles");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar el perfil.<br><b>Error: ".utf8_encode($perfil->error())."</b>";
    header("Location: ../vistas/?perfiles");
  }
}

if($operacion=='Desactivar'){
  $perfil->codigo_perfil($id);
  $perfil->descripcion($descripcion);
  if($perfil->Consultar()){
    if($perfil->Desactivar())
    $confirmacion=1;
    else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El perfil ha sido desactivado con éxito";
    header("Location: ../vistas/?perfiles");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el perfil.<br><b>Error: ".utf8_encode($perfil->error())."</b>";
    header("Location: ../vistas/?perfiles");
  }
}
		
if($operacion=='Activar'){
  $perfil->codigo_perfil($id);
  $perfil->descripcion($descripcion);
  if($perfil->Consultar()){
    if($perfil->Activar())
    $confirmacion=1;
    else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El perfil ha sido desactivado con éxito";
    header("Location: ../vistas/?perfiles");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el perfil.<br><b>Error: ".utf8_encode($perfil->error())."</b>";
    header("Location: ../vistas/?perfiles");
  }
}		
		
if($operacion=='Consultar'){	
  $perfil->codigo_perfil($id);
  $perfil->descripcion($descripcion);
  if($perfil->Consultar()){
    $_SESSION['datos']['codigo_perfil']=$perfil->codigo_perfil();
    $_SESSION['datos']['descripcion']=$perfil->descripcion();
    $_SESSION['datos']['codigo_configuracion']=$perfil->codigo_configuracion();
    $_SESSION['datos']['estatus']=$perfil->estatus_perfil();
    header("Location: ../vistas/?perfiles");
  }else{
    $error="";
    if($perfil->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($perfil->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    $_SESSION['datos']['mensaje']=$error;
    header("Location: ../vistas/?perfiles");
  }
}		  
?>