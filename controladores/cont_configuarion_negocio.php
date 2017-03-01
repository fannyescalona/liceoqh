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

if(isset($_POST['hora_minima_docente']))
$hora_minima_docente=trim($_POST['hora_minima_docente']);

if(isset($_POST['hora_maxima_docente']))
$hora_maxima_docente=trim($_POST['hora_maxima_docente']);

if(isset($_POST['hora_minima_materia']))
$hora_minima_materia=trim($_POST['hora_minima_materia']);

if(isset($_POST['hora_maxima_materia']))
$hora_maxima_materia=trim($_POST['hora_maxima_materia']);

if(isset($_POST['datos_padre_obligatorio']))
$datos_padre_obligatorio=trim($_POST['datos_padre_obligatorio']);

if(isset($_POST['datos_madre_obligatorio']))
$datos_madre_obligatorio=trim($_POST['datos_madre_obligatorio']);

if(isset($_POST['cantidad_materia_reprobada']))
$cantidad_materia_reprobada=trim($_POST['cantidad_materia_reprobada']);

if(isset($_POST['cantidad_materia_maxima']))
$cantidad_materia_maxima=trim($_POST['cantidad_materia_maxima']);

$name  = 'cintillo_reportes';
$ext  = '.'.pathinfo($_FILES['archivo_reporte']['name'], PATHINFO_EXTENSION);
$type  = $_FILES['archivo_reporte']['type'];
$size  = $_FILES['archivo_reporte']['size'];
$tmp   = $_FILES['archivo_reporte']['tmp_name'];
$error = $_FILES['archivo_reporte']['error'];
$savepath = '/var/www/html/liceoqh/images/';
$urlpath = 'http://localhost/liceoqh/images/';
$filelocation = $savepath.$name.$ext;
$urlfile = $urlpath.$name.$ext;
// This won't upload if there was an error or if the file exists, hence the check
if (!file_exists($filelocation) && $error == 0) {
    // echo "The file $filename exists";
    // This will overwrite even if the file exists
    move_uploaded_file($tmp, $filelocation);
    $url_imagen_reporte = $urlpath;
}
else{
  $url_imagen_reporte = 'http://localhost/liceoqh/images/cintillo_reportes.jpg';
}


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
  $configuracion_negocio->hora_minima_docente($hora_minima_docente);
  $configuracion_negocio->hora_maxima_docente($hora_maxima_docente);
  $configuracion_negocio->hora_minima_materia($hora_minima_materia);
  $configuracion_negocio->hora_maxima_materia($hora_maxima_materia);
  $configuracion_negocio->datos_padre_obligatorio($datos_padre_obligatorio);
  $configuracion_negocio->datos_madre_obligatorio($datos_madre_obligatorio);
  $configuracion_negocio->cantidad_materia_reprobada($cantidad_materia_reprobada);
  $configuracion_negocio->cantidad_materia_maxima($cantidad_materia_maxima);
  $configuracion_negocio->url_imagen_reporte($url_imagen_reporte);
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
  $configuracion_negocio->hora_minima_docente($hora_minima_docente);
  $configuracion_negocio->hora_maxima_docente($hora_maxima_docente);
  $configuracion_negocio->hora_minima_materia($hora_minima_materia);
  $configuracion_negocio->hora_maxima_materia($hora_maxima_materia);
  $configuracion_negocio->datos_padre_obligatorio($datos_padre_obligatorio);
  $configuracion_negocio->datos_madre_obligatorio($datos_madre_obligatorio);
  $configuracion_negocio->cantidad_materia_reprobada($cantidad_materia_reprobada);
  $configuracion_negocio->cantidad_materia_maxima($cantidad_materia_maxima);
  $configuracion_negocio->url_imagen_reporte($url_imagen_reporte);
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