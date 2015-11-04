<?php
session_start();
if(isset($_POST['operacion']))
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_perfil']))
$id=ucfirst(trim($_POST['codigo_perfil']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));


include_once("../clases/class_perfil.php");
$perfil=new Perfil();
if($operacion=='Registrar'){
  $perfil->codigo_perfil($id);
  $perfil->descripcion($descripcion);
  if(!$perfil->Comprobar()){
    if($perfil->Registrar()){
      $confirmacion=1;			                   			                   
      $perfil->ELIMINAR_OPCION_SERVICIO_PERFIL();
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
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar el perfil.";
    header("Location: ../vistas/?perfiles");
  }
}

if($operacion=='Modificar'){
  $perfil->codigo_perfil($id);
  $perfil->descripcion($descripcion);
  //if(!$perfil->Consultar()){
  if($perfil->Actualizar()){
    $confirmacion=1;
    $perfil->ELIMINAR_OPCION_SERVICIO_PERFIL();
    if(isset($_POST['modulos'])){
      foreach($_POST['modulos'] as $indiceM => $valorM){
        if(isset($_POST['servicios'])){ 				   	 	
          foreach($_POST['servicios'] as $indiceS => $valorS){
            $perfil->codigo_servicio($valorS);  
            $perfil->INSERTAR_SERVICIO_PERFIL();           	       	
            if(isset($_POST['opciones'])){ 				   	 			   	 	
              foreach($_POST['opciones'][$valorS] as $indiceO => $valorO){
                $perfil->codigo_opcion($valorO);            	       		   	 	
                $perfil->INSERTAR_OPCION_SERVICIO_PERFIL();
              }				   	 				   	 	        
            }			   	 				   	 				   	 			   	 	           
          }
        }
      }			   
    }
  }
  else
    $confirmacion=-1;
  /*  }else{
  $confirmacion=0;
  }*/
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El perfil ha sido modificado con éxito !";
    header("Location: ../vistas/?perfiles");
  }else{
    $_SESSION['datos']['mensaje']="Problema al modificar el perfil.";
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
    $_SESSION['datos']['mensaje']="Problema al desactivar el perfil.";
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
    $_SESSION['datos']['mensaje']="Problema al desactivar el perfil.";
    header("Location: ../vistas/?perfiles");
  }
}		
		
if($operacion=='Consultar'){	
  $perfil->codigo_perfil($id);
  $perfil->descripcion($descripcion);
  if($perfil->Consultar()){
    $_SESSION['datos']['codigo_perfil']=$perfil->codigo_perfil();
    $_SESSION['datos']['descripcion']=$perfil->descripcion();
    $_SESSION['datos']['estatus']=$perfil->estatus_perfil();
    header("Location: ../vistas/?perfiles");
  }else{
    $_SESSION['datos']['mensaje']="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    header("Location: ../vistas/?perfiles");
  }
}		  
?>