<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_configuracion']))
  $id=trim($_POST['codigo_configuracion']);

if(isset($_POST['descripcion']))
  $descripcion=ucfirst(trim($_POST['descripcion']));

if(isset($_POST['longitud_minclave']))
  $longitud_minclave=trim($_POST['longitud_minclave']);

if(isset($_POST['longitud_maxclave']))
  $longitud_maxclave=trim($_POST['longitud_maxclave']);

if(isset($_POST['cantidad_letrasmayusculas']))
  $cantidad_letrasmayusculas=trim($_POST['cantidad_letrasmayusculas']);

if(isset($_POST['cantidad_letrasminusculas']))
  $cantidad_letrasminusculas=trim($_POST['cantidad_letrasminusculas']);

if(isset($_POST['cantidad_caracteresespeciales']))
  $cantidad_caracteresespeciales=trim($_POST['cantidad_caracteresespeciales']);

if(isset($_POST['cantidad_numeros']))
  $cantidad_numeros=trim($_POST['cantidad_numeros']);

if(isset($_POST['dias_vigenciaclave']))
  $dias_vigenciaclave=trim($_POST['dias_vigenciaclave']);

if(isset($_POST['numero_ultimasclaves']))
  $numero_ultimasclaves=trim($_POST['numero_ultimasclaves']);

if(isset($_POST['dias_aviso']))
  $dias_aviso=trim($_POST['dias_aviso']);

if(isset($_POST['intentos_fallidos']))
  $intentos_fallidos=trim($_POST['intentos_fallidos']);

if(isset($_POST['numero_preguntas']))
  $numero_preguntas=trim($_POST['numero_preguntas']);

if(isset($_POST['numero_preguntasaresponder']))
  $numero_preguntasaresponder=trim($_POST['numero_preguntasaresponder']);

if(isset($_POST['dias_inactividad']))
  $dias_inactividad=trim($_POST['dias_inactividad']);

if(isset($_POST['maxsesion']))
  $maxsesion=trim($_POST['maxsesion']);


include_once("../clases/class_configuracion.php");
$configuracion=new Configuracion();
if($operacion=='Registrar'){
  $configuracion->codigo_configuracion($id);
  $configuracion->descripcion($descripcion);
  $configuracion->longitud_minclave($longitud_minclave);
  $configuracion->longitud_maxclave($longitud_maxclave);
  $configuracion->cantidad_letrasmayusculas($cantidad_letrasmayusculas);
  $configuracion->cantidad_letrasminusculas($cantidad_letrasminusculas);
  $configuracion->cantidad_caracteresespeciales($cantidad_caracteresespeciales);
  $configuracion->cantidad_numeros($cantidad_numeros);
  $configuracion->dias_vigenciaclave($dias_vigenciaclave);
  $configuracion->numero_ultimasclaves($numero_ultimasclaves);
  $configuracion->dias_aviso($dias_aviso);
  $configuracion->intentos_fallidos($intentos_fallidos);
  $configuracion->numero_preguntas($numero_preguntas);
  $configuracion->numero_preguntasaresponder($numero_preguntasaresponder);
  $configuracion->dias_inactividad($dias_inactividad);
  $configuracion->maxsesion($maxsesion);
  if(!$configuracion->Comprobar()){
    if($configuracion->Registrar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($configuracion->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($configuracion->Activar())					  
        $confirmacion=1;
    }
  }
if($confirmacion==1){
  $_SESSION['datos']['mensaje']="La configuración del perfil ha sido registrado con éxito !";
  header("Location: ../vistas/?configuracion");
 }else{
  $_SESSION['datos']['mensaje']="Se presentó un error al registrar La configuración del perfil.<br><b>Error: ".utf8_encode($configuracion->error())."</b>";
  header("Location: ../vistas/?configuracion");
}
}

if($operacion=='Modificar'){
  $configuracion->codigo_configuracion($id);
  $configuracion->descripcion($descripcion);
  $configuracion->longitud_minclave($longitud_minclave);
  $configuracion->longitud_maxclave($longitud_maxclave);
  $configuracion->cantidad_letrasmayusculas($cantidad_letrasmayusculas);
  $configuracion->cantidad_letrasminusculas($cantidad_letrasminusculas);
  $configuracion->cantidad_caracteresespeciales($cantidad_caracteresespeciales);
  $configuracion->cantidad_numeros($cantidad_numeros);
  $configuracion->dias_vigenciaclave($dias_vigenciaclave);
  $configuracion->numero_ultimasclaves($numero_ultimasclaves);
  $configuracion->dias_aviso($dias_aviso);
  $configuracion->intentos_fallidos($intentos_fallidos);
  $configuracion->numero_preguntas($numero_preguntas);
  $configuracion->numero_preguntasaresponder($numero_preguntasaresponder);
  $configuracion->dias_inactividad($dias_inactividad);
  $configuracion->maxsesion($maxsesion);
  if($configuracion->Actualizar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La configuración del perfil ha sido modificado con éxito !";
    header("Location: ../vistas/?configuracion");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar La configuración del perfil.<br><b>Error: ".utf8_encode($configuracion->error())."</b>";
    header("Location: ../vistas/?configuracion");
  }
}

if($operacion=='Desactivar'){
  $configuracion->codigo_configuracion($id);
  $configuracion->descripcion($descripcion);
  if($configuracion->Consultar()){
    if($configuracion->Desactivar())
	   $confirmacion=1;
	else
	   $confirmacion=-1;
  }else{
	   $confirmacion=0;
  }
   if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La configuración del perfil ha sido desactivado con éxito";
    header("Location: ../vistas/?configuracion");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar La configuración del perfil.<br><b>Error: ".utf8_encode($configuracion->error())."</b>";
    header("Location: ../vistas/?configuracion");
    }
}

if($operacion=='Activar'){
  $configuracion->codigo_configuracion($id);
  $configuracion->descripcion($descripcion);
  if($configuracion->Consultar()){
    if($configuracion->Activar())
     $confirmacion=1;
  else
     $confirmacion=-1;
  }else{
     $confirmacion=0;
  }
   if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La configuración del perfil ha sido desactivado con éxito";
    header("Location: ../vistas/?configuracion");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar La configuración del perfil.<br><b>Error: ".utf8_encode($configuracion->error())."</b>";
    header("Location: ../vistas/?configuracion");
    }
}

if($operacion=='Consultar'){	
  $configuracion->codigo_configuracion($id);
  $configuracion->descripcion($descripcion);
   if($configuracion->Consultar()){
    $_SESSION['datos']['codigo_configuracion']=$configuracion->codigo_configuracion();
    $_SESSION['datos']['descripcion']=$configuracion->descripcion();
    $_SESSION['datos']['longitud_minclave']=$configuracion->longitud_minclave();
    $_SESSION['datos']['longitud_maxclave']=$configuracion->longitud_maxclave();
    $_SESSION['datos']['cantidad_letrasmayusculas']=$configuracion->cantidad_letrasmayusculas();
    $_SESSION['datos']['cantidad_letrasminusculas']=$configuracion->cantidad_letrasminusculas();
    $_SESSION['datos']['cantidad_numeros']=$configuracion->cantidad_numeros();
    $_SESSION['datos']['cantidad_caracteresespeciales']=$configuracion->cantidad_caracteresespeciales();
    $_SESSION['datos']['dias_vigenciaclave']=$configuracion->dias_vigenciaclave();
    $_SESSION['datos']['dias_aviso']=$configuracion->dias_aviso();
    $_SESSION['datos']['numero_ultimasclaves']=$configuracion->numero_ultimasclaves();
    $_SESSION['datos']['intentos_fallidos']=$configuracion->intentos_fallidos();
    $_SESSION['datos']['numero_preguntas']=$configuracion->numero_preguntas();
    $_SESSION['datos']['numero_preguntasaresponder']=$configuracion->numero_preguntasaresponder();
    $_SESSION['datos']['dias_inactividad']=$configuracion->dias_inactividad();
    $_SESSION['datos']['maxsesion']=$configuracion->maxsesion();
    $_SESSION['datos']['estatus']=$configuracion->estatus_configuracion();
    header("Location: ../vistas/?configuracion");
  }else{
    $error="";
    if($configuracion->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($configuracion->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$descripcion.")";
    $_SESSION['datos']['mensaje']=$error;
   header("Location: ../vistas/?configuracion");
  }
}		  
?>