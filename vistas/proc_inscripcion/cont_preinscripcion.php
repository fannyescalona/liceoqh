<?php
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=trim($_POST['operacion']);

//Consultar estatus
if(isset($_POST['consultar_cedula']))
$consultar_cedula=trim($_POST['consultar_cedula']);

//Campos Pestaña 1
if(isset($_POST['pais']))
$nacionalidad=trim($_POST['pais']);

if(isset($_POST['cedula_estudiante']))
$cedula_estudiante=trim($_POST['cedula_estudiante']);

if(isset($_POST['nombre_estudiante']))
$nombre_estudiante=trim($_POST['nombre_estudiante']);

if(isset($_POST['apellido_estudiante']))
$apellido_estudiante=trim($_POST['apellido_estudiante']);

if(isset($_POST['sexo']))
$sexo=trim($_POST['sexo']);

if(isset($_POST['edocivil']))
$edocivil=trim($_POST['edocivil']);

if(isset($_POST['parroquia']))
$parroquia=trim($_POST['parroquia']);

if(isset($_POST['pais_residencia']))
$pais_residencia=trim($_POST['pais_residencia']);

if(isset($_POST['aniosresidencia']))
$aniosresidencia=trim($_POST['aniosresidencia']);

if(isset($_POST['tlf_fijo']))
$tlf_fijo=trim($_POST['tlf_fijo']);

if(isset($_POST['tlf_movil']))
$tlf_movil=trim($_POST['tlf_movil']);

if(isset($_POST['email']))
$email=trim($_POST['email']);

if(isset($_POST['fecha'])){
  if(!empty($_POST['fecha'])){
    //el formato va acorde a la fecha como string
    $objetoFecha = DateTime::createFromFormat("d/m/Y", $_POST['fecha'] );
     
    //el formato ahora es acorde a lo que ocupamos, segun mysql
    $fecha_nacimiento = $objetoFecha->format("Y-m-d");
  } 
}

if(isset($_POST['trabaja']))
$trabaja=trim($_POST['trabaja']);

if(isset($_POST['dondetrabaja']))
$dondetrabaja=trim($_POST['dondetrabaja']);

if(isset($_POST['tlf_trabajo']))
$tlf_trabajo=trim($_POST['tlf_trabajo']);

if(isset($_POST['direcciontrabajo']))
$direcciontrabajo=trim($_POST['direcciontrabajo']);

if(isset($_POST['cargo']))
$cargo=trim($_POST['cargo']);

if(isset($_POST['antiguedad']))
$antiguedad=trim($_POST['antiguedad']);

if(isset($_POST['discapacidad_visual']))
$discapacidad_visual=trim($_POST['discapacidad_visual']);

if(isset($_POST['discapacidad_auditiva']))
$discapacidad_auditiva=trim($_POST['discapacidad_auditiva']);

if(isset($_POST['discapacidad_motora']))
$discapacidad_motora=trim($_POST['discapacidad_motora']);

if(isset($_POST['discapacidad_verbal']))
$discapacidad_verbal=trim($_POST['discapacidad_verbal']);

//Pestaña 2
if(isset($_POST['direccionresidencia']))
$direccionresidencia=trim($_POST['direccionresidencia']);

if(isset($_POST['parroquia_temp']))
$parroquia_temp=trim($_POST['parroquia_temp']);

if(isset($_POST['direccion_temp']))
$direccion_temp=trim($_POST['direccion_temp']);

if(isset($_POST['etnia']))
$etnia=trim($_POST['etnia']);

//Pestaña 3

if(isset($_POST['plantel_edu']))
$plantel_edu=trim($_POST['plantel_edu']);

if(isset($_POST['ciudad']))
$ciudad_plantel=trim($_POST['ciudad']);

if(isset($_POST['dependencia_plantel']))
$dependencia_plantel=trim($_POST['dependencia_plantel']);

if(isset($_POST['sistema_plantel']))
$sistema_plantel=trim($_POST['sistema_plantel']);

if(isset($_POST['anio_egreso']))
$anio_egreso=trim($_POST['anio_egreso']);

if(isset($_POST['rama_plantel']))
$rama_plantel=trim($_POST['rama_plantel']);

if(isset($_POST['prueba_act_acad']))
$prueba_act_acad=trim($_POST['prueba_act_acad']);

if(isset($_POST['anio_paa']))
$anio_paa=trim($_POST['anio_paa']);

if(isset($_POST['nro_rusnieu']))
$nro_rusnieu=trim($_POST['nro_rusnieu']);

if(isset($_POST['anio_rusnieu']))
$anio_rusnieu=trim($_POST['anio_rusnieu']);

//Pestaña 4 

if(isset($_POST['modalidad_ingreso']))
$modalidad_ingreso=trim($_POST['modalidad_ingreso']);

if(isset($_POST['modalidad_estudio']))
$modalidad_estudio=trim($_POST['modalidad_estudio']);

if(isset($_POST['esatleta']))
$esatleta=trim($_POST['esatleta']);

if(isset($_POST['tipo_atleta']))
$tipo_atleta=trim($_POST['tipo_atleta']);

if(isset($_POST['disciplina']))
$disciplina=trim($_POST['disciplina']);

if(isset($_POST['entrenador']))
$entrenador=trim($_POST['entrenador']);

if(isset($_POST['institucion']))
$institucion=trim($_POST['institucion']);

if(isset($_POST['posee_titulo']))
$posee_titulo=trim($_POST['posee_titulo']);

if(isset($_POST['rif_universidad']))
$rif_universidad=trim($_POST['rif_universidad']);

if(isset($_POST['titulo']))
$titulo=trim($_POST['titulo']);

if(isset($_POST['cod_carrera']))
$cod_carrera=trim($_POST['cod_carrera']);

if(isset($_POST['turno']))
$turno=trim($_POST['turno']);

//Variable para el Combo Dependiente.
if(isset($_POST['filtro']))
$filtro=trim($_POST['filtro']);

function comprobarCheckBox($value){
  if($value == "on")
    $chk = "Y";
  else
    $chk = "N";
  return $chk;
}

include_once("class_preinscripcion.php");
$preinscripcion=new Pre_Inscripcion();
if($operacion=='Paso1'){
  $preinscripcion->nacionalidad($nacionalidad);
  $preinscripcion->cedula_estudiante($cedula_estudiante);
  $preinscripcion->nombre_estudiante($nombre_estudiante);
  $preinscripcion->apellido_estudiante($apellido_estudiante);
  $preinscripcion->sexo($sexo);
  $preinscripcion->edocivil($edocivil);
  $preinscripcion->cod_parroquia($parroquia);
  $preinscripcion->pais_residencia($pais_residencia);
  $preinscripcion->aniosresidencia($aniosresidencia);
  $preinscripcion->tlf_fijo($tlf_fijo);
  $preinscripcion->tlf_movil($tlf_movil);
  $preinscripcion->email($email);
  $preinscripcion->fecha_nacimiento($fecha_nacimiento);
  $preinscripcion->trabaja($trabaja);
  $preinscripcion->dondetrabaja($dondetrabaja);
  $preinscripcion->tlf_trabajo($tlf_trabajo);
  $preinscripcion->direcciontrabajo($direcciontrabajo);
  $preinscripcion->cargo($cargo);
  $preinscripcion->antiguedad($antiguedad);
  $preinscripcion->discapacidad_visual(comprobarCheckBox($discapacidad_visual));
  $preinscripcion->discapacidad_auditiva(comprobarCheckBox($discapacidad_auditiva));
  $preinscripcion->discapacidad_motora(comprobarCheckBox($discapacidad_motora));
  $preinscripcion->discapacidad_verbal(comprobarCheckBox($discapacidad_verbal));
  if(!$preinscripcion->Comprobar()){
    if($preinscripcion->Registrar())
       $confirmacion=1;
    else
       $confirmacion=-1;
  }
  else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['pais_residencia']=$preinscripcion->pais_residencia();
    $_SESSION['datos']['cedula_estudiante']=$preinscripcion->cedula_estudiante();
    $_SESSION['datos']['mensaje']="Los datos personales han sido cargados con exito! por favor complete los datos del siguiente formulario.";
    header("Location: ./preinscripcion.php?pa=r#datospersonales");
  }else{
    $_SESSION['datos']['mensaje']="Ya se encuentra pre-inscrito!";
    header("Location: ./preinscripcion.php?pa=r#datospersonales");
  }
}

if($operacion=="Paso2"){
  $preinscripcion->cedula_estudiante($cedula_estudiante);
  $preinscripcion->cod_parroquia($parroquia);
  $preinscripcion->direccionresidencia($direccionresidencia);
  $preinscripcion->cod_parroquia_temp($parroquia_temp);
  $preinscripcion->direccion_temp($direccion_temp);
  $preinscripcion->etnia($etnia);
  if($preinscripcion->InsertarDirecciones())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    if($preinscripcion->BuscarPaisResidencia($preinscripcion->cedula_estudiante())){
      $_SESSION['datos']['pais_residencia']=$preinscripcion->pais_residencia();
      $_SESSION['datos']['cedula_estudiante']=$preinscripcion->cedula_estudiante();
      $_SESSION['datos']['mensaje']="Las direcciones han sido cargadas con exito! por favor complete los datos del siguiente formulario.";
      header("Location: ./preinscripcion.php?pa=r#direccionhabitacion");
    }
  }else{
    $_SESSION['datos']['mensaje']="Ya se encuentra pre-inscrito!";
    header("Location: ./preinscripcion.php?pa=r#direccionhabitacion");
  }
}

if($operacion=="Paso3"){
  $preinscripcion->cedula_estudiante($cedula_estudiante);
  $preinscripcion->plantel_edu($plantel_edu);
  $preinscripcion->ciudad_plantel($ciudad_plantel);
  $preinscripcion->dependencia_plantel($dependencia_plantel);
  $preinscripcion->sistema_plantel($sistema_plantel);
  $preinscripcion->anio_egreso($anio_egreso);
  $preinscripcion->rama_plantel($rama_plantel);
  $preinscripcion->prueba_act_acad($prueba_act_acad);
  $preinscripcion->anio_paa($anio_paa);
  $preinscripcion->nro_rusnieu($nro_rusnieu);
  $preinscripcion->anio_rusnieu($anio_rusnieu);
  if($preinscripcion->InsertarDatosPlantel())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['cedula_estudiante']=$preinscripcion->cedula_estudiante();
    $_SESSION['datos']['mensaje']="Los Datos del Plantel han sido cargadas con exito! por favor complete los datos del siguiente formulario.";
    header("Location: ./preinscripcion.php?pa=r#datosplantel");
  }else{
    $_SESSION['datos']['mensaje']="Ya se encuentra pre-inscrito!";
    header("Location: ./preinscripcion.php?pa=r#datosplantel");
  }
}

if($operacion=="Paso4"){
  $preinscripcion->cedula_estudiante($cedula_estudiante);
  $preinscripcion->modalidad_ingreso($modalidad_ingreso);
  $preinscripcion->modalidad_estudio($modalidad_estudio);
  $preinscripcion->esatleta($esatleta);
  $preinscripcion->tipo_atleta($tipo_atleta);
  $preinscripcion->disciplina($disciplina);
  $preinscripcion->entrenador($entrenador);
  $preinscripcion->institucion($institucion);
  $preinscripcion->posee_titulo($posee_titulo);
  $preinscripcion->rif_universidad($rif_universidad);
  $preinscripcion->titulo($titulo);
  $preinscripcion->cod_carrera($cod_carrera);
  $preinscripcion->turno($turno);
  if($preinscripcion->InsertarDatosIngreso())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="Los Datos del Modo de Ingreso han sido cargadas con exito! Gracias por PreInscribirse, consulte su estatus e imprima su comprobante.";
    header("Location: ./preinscripcion.php?pa=l");
  }else{
    $_SESSION['datos']['mensaje']="Ya se encuentra pre-inscrito!";
    header("Location: ./preinscripcion.php?pa=r#modalidadingreso");
  }
}

if($operacion=='comboPais'){
  echo $preinscripcion->BuscarEstados($filtro);
  unset($preinscripcion);
} 

if($operacion=='comboEstado'){
  echo $preinscripcion->BuscarCiudades($filtro);
  unset($preinscripcion);
} 

if($operacion=='comboCiudad'){
  echo $preinscripcion->BuscarMunicipios($filtro);
  unset($preinscripcion);
} 

if($operacion=='comboMunicipio'){
  echo $preinscripcion->BuscarParroquias($filtro);
  unset($preinscripcion);
}
if($operacion=='consultarEstado'){
  $preinscripcion->cedula_estudiante($consultar_cedula);
  if($preinscripcion->Comprobar()){
    $_SESSION['datos']['cedula_estudiante']=$preinscripcion->cedula_estudiante();
    $_SESSION['datos']['estatus']=$preinscripcion->estatus();
    header("Location: ./preinscripcion.php?pa=l");
  }
  else{
    $_SESSION['datos']['mensaje']="No se han encontrado resultados para tu búsqueda(".$consultar_cedula.")";
    header("Location: ./preinscripcion.php?pa=l");
  }
}

function restarFechas($fechaInicial, $fechaFinal){
  $fechaFinal = strtotime($fechaFinal);
  $fechaInicial = strtotime($fechaInicial);
  if ($fechaFinal === false || $fechaFinal < 0 || $fechaInicial === false || $fechaInicial < 0 || $fechaFinal > $fechaInicial)
  return false;

  // Calcular anios
  $anios = date('Y', $fechaInicial) - date('Y', $fechaFinal);

  $mesFinal = date('m', $fechaInicial);
  $mesInicial = date('m', $fechaFinal);

  // Calcular meses
  $meses = $mesFinal - $mesInicial;
  if ($meses <= 0) {
  $meses += 12;
  $anios–;
  }
  if ($anios < 0)
  return false;

  // Calcular Dias
  $organizador = array();
  if ($anios > 0)
  $organizador[] = $anios . (($anios == 1) ? ' year' : ' years');
  if ($meses > 0)
  $organizador[] = $meses . (($meses == 1) ? ' month' : ' months');
  $organizador = count($organizador) > 0 ? '+' . implode(' ', $organizador) : 'now';

  $dias = $fechaInicial - strtotime($organizador, $fechaFinal);
  $dias = date('z', $dias);

  $rows[] = array("AA" => $anios, "MM" => $meses, "DD" => $dias);
  $json = json_encode($rows);
  return $json;
}

if($operacion=='RestarFechas'){
  $diferencia = restarFechas(date('Y-m-d'),date($filtro));
  echo $diferencia;
  unset($diferencia);
}
?>