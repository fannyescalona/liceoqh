<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['codigo_configuracion_negocio']))
$id=ucfirst(trim($_POST['codigo_configuracion_negocio']));

if(isset($_POST['codigo_plantel']))
$codigo_plantel=ucfirst(trim($_POST['codigo_plantel']));

if(isset($_POST['inscripcion_abierta']))
$inscripcion_abierta=ucfirst(trim($_POST['inscripcion_abierta']));

if(isset($_POST['carga_nota_abierta']))
$carga_nota_abierta=ucfirst(trim($_POST['carga_nota_abierta']));

if(isset($_POST['nota_minima']))
$nota_minima=trim($_POST['nota_minima']);

if(isset($_POST['nota_maxima']))
$nota_maxima=trim($_POST['nota_maxima']);

if(isset($_POST['edad_maxima_primer_anio']))
$edad_maxima_primer_anio=trim($_POST['edad_maxima_primer_anio']);

if(isset($_POST['nota_aprobacion']))
$nota_aprobacion=trim($_POST['nota_aprobacion']);

include_once("../clases/class_configuracion_negocio.php");
$configuracion_negocio=new Configuracion_Negocio();
if($operacion=='Registrar'){
  $configuracion_negocio->codigo_configuracion_negocio($id);
  $configuracion_negocio->codigo_plantel($codigo_plantel);
  $configuracion_negocio->inscripcion_abierta($inscripcion_abierta);
  $configuracion_negocio->carga_nota_abierta($carga_nota_abierta);
  $configuracion_negocio->nota_minima($nota_minima);
  $configuracion_negocio->nota_maxima($nota_maxima);
  $configuracion_negocio->edad_maxima_primer_anio($edad_maxima_primer_anio);
  $configuracion_negocio->nota_aprobacion($nota_aprobacion);
  if($configuracion_negocio->Registrar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La configuración del negocio ha sido registrado con éxito !";
    header("Location: ../vistas/?configuracion_negocio");
   }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar La configuración del negocio.<br><b>Error: ".utf8_encode($configuracion_negocio->error())."</b>";
    header("Location: ../vistas/?configuracion_negocio");
  }
}

if($operacion=='Modificar'){
  $configuracion_negocio->codigo_configuracion_negocio($id);
  $configuracion_negocio->codigo_plantel($codigo_plantel);
  $configuracion_negocio->inscripcion_abierta($inscripcion_abierta);
  $configuracion_negocio->carga_nota_abierta($carga_nota_abierta);
  $configuracion_negocio->nota_minima($nota_minima);
  $configuracion_negocio->nota_maxima($nota_maxima);
  $configuracion_negocio->edad_maxima_primer_anio($edad_maxima_primer_anio);
  $configuracion_negocio->nota_aprobacion($nota_aprobacion);
  if($configuracion_negocio->Actualizar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La configuración del negocio ha sido modificado con éxito !";
    header("Location: ../vistas/?configuracion_negocio");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar La configuración del negocio.<br><b>Error: ".utf8_encode($configuracion_negocio->error())."</b>";
    header("Location: ../vistas/?configuracion_negocio");
  }
}		  
?>