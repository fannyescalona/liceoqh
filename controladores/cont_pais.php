<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_pais']))
$id=ucfirst(trim($_POST['codigo_pais']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));


include_once("../clases/class_pais.php");
$pais=new Pais();
if($operacion=='Registrar'){
  $pais->codigo_pais($id);
  $pais->descripcion($descripcion);
  if(!$pais->Comprobar()){
    if($pais->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($pais->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($pais->Activar())					  
        $confirmacion=1;
    }
  }
if($confirmacion==1){
  $_SESSION['datos']['mensaje']="El país ha sido registrado con éxito !";
  header("Location: ../vistas/?pais");
 }else{
  $_SESSION['datos']['mensaje']="Se presentó un error al registrar el país.<br><b>Error: ".utf8_encode($pais->error())."</b>";
  header("Location: ../vistas/?pais");
}
}

if($operacion=='Modificar'){
  $pais->codigo_pais($id);
  $pais->descripcion($descripcion);
  if($pais->Actualizar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El país ha sido modificado con éxito !";
    header("Location: ../vistas/?pais");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar el país.<br><b>Error: ".utf8_encode($pais->error())."</b>";
    header("Location: ../vistas/?pais");
  }
}

if($operacion=='Desactivar'){
  $pais->codigo_pais($id);
  $pais->descripcion($descripcion);
  if($pais->Consultar()){
    if($pais->Desactivar())
	   $confirmacion=1;
	else
	   $confirmacion=-1;
  }else{
	   $confirmacion=0;
  }
   if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El país ha sido desactivado con éxito";
    header("Location: ../vistas/?pais");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el país.<br><b>Error: ".utf8_encode($pais->error())."</b>";
    header("Location: ../vistas/?pais");
    }
}

if($operacion=='Activar'){
  $pais->codigo_pais($id);
  $pais->descripcion($descripcion);
  if($pais->Consultar()){
    if($pais->Activar())
     $confirmacion=1;
  else
     $confirmacion=-1;
  }else{
     $confirmacion=0;
  }
   if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El país ha sido desactivado con éxito";
    header("Location: ../vistas/?pais");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar el país.<br><b>Error: ".utf8_encode($pais->error())."</b>";
    header("Location: ../vistas/?pais");
    }
}

if($operacion=='Consultar'){	
  $pais->codigo_pais($id);
  $pais->descripcion($descripcion);
   if($pais->Consultar()){
    $_SESSION['datos']['codigo_pais']=$pais->codigo_pais();
    $_SESSION['datos']['descripcion']=$pais->descripcion();
    $_SESSION['datos']['estatus']=$pais->estatus_pais();
    header("Location: ../vistas/?pais");
  }else{
    $error="";
    if($pais->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($pais->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    $_SESSION['datos']['mensaje']=$error;
   header("Location: ../vistas/?pais");
  }
}		  
?>