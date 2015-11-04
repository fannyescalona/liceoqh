<?php
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
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

if(isset($_POST['fecha_nacimiento'])){
  if(!empty($_POST['fecha_nacimiento'])){
    //el formato va acorde a la fecha como string
    $objetoFecha = DateTime::createFromFormat("d/m/Y", $_POST['fecha_nacimiento'] );
     
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

if(isset($_POST['parroquia_residencia']))
$parroquia_residencia=trim($_POST['parroquia_residencia']);

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

if(isset($_POST['seccion']))
$seccion=trim($_POST['seccion']);

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

include_once("../clases/class_inscripcion.php");
$inscripcion=new Inscripcion();
if($operacion=='Registrar'){
  $inscripcion->nacionalidad($nacionalidad);
  $inscripcion->cedula_estudiante($cedula_estudiante);
  $inscripcion->nombre_estudiante($nombre_estudiante);
  $inscripcion->apellido_estudiante($apellido_estudiante);
  $inscripcion->sexo($sexo);
  $inscripcion->edocivil($edocivil);
  $inscripcion->cod_parroquia($parroquia);
  $inscripcion->pais_residencia($pais_residencia);
  $inscripcion->aniosresidencia($aniosresidencia);
  $inscripcion->tlf_fijo($tlf_fijo);
  $inscripcion->tlf_movil($tlf_movil);
  $inscripcion->email($email);
  $inscripcion->fecha_nacimiento($fecha_nacimiento);
  $inscripcion->trabaja($trabaja);
  $inscripcion->dondetrabaja($dondetrabaja);
  $inscripcion->tlf_trabajo($tlf_trabajo);
  $inscripcion->direcciontrabajo($direcciontrabajo);
  $inscripcion->cargo($cargo);
  $inscripcion->antiguedad($antiguedad);
  $inscripcion->discapacidad_visual(comprobarCheckBox($discapacidad_visual));
  $inscripcion->discapacidad_auditiva(comprobarCheckBox($discapacidad_auditiva));
  $inscripcion->discapacidad_motora(comprobarCheckBox($discapacidad_motora));
  $inscripcion->discapacidad_verbal(comprobarCheckBox($discapacidad_verbal));
  if(!$inscripcion->Comprobar()){
    if($inscripcion->Registrar())
       $confirmacion=1;
    else
       $confirmacion=-1;
  }
  else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['pais_residencia']=$inscripcion->pais_residencia();
    $_SESSION['datos']['cedula_estudiante']=$inscripcion->cedula_estudiante();
    $_SESSION['datos']['mensaje']="Los datos personales han sido cargados con éxito, por favor complete los datos del siguiente formulario.";
    header("Location: ../vistas/?inscripcion#datospersonales");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar los datos personales";
    header("Location: ../vistas/?inscripcion#datospersonales");
  }
}

if($operacion=='Modificar'){
  $inscripcion->nacionalidad($nacionalidad);
  $inscripcion->cedula_estudiante($cedula_estudiante);
  $inscripcion->nombre_estudiante($nombre_estudiante);
  $inscripcion->apellido_estudiante($apellido_estudiante);
  $inscripcion->sexo($sexo);
  $inscripcion->edocivil($edocivil);
  $inscripcion->cod_parroquia($parroquia);
  $inscripcion->pais_residencia($pais_residencia);
  $inscripcion->aniosresidencia($aniosresidencia);
  $inscripcion->tlf_fijo($tlf_fijo);
  $inscripcion->tlf_movil($tlf_movil);
  $inscripcion->email($email);
  $inscripcion->fecha_nacimiento($fecha_nacimiento);
  $inscripcion->trabaja($trabaja);
  $inscripcion->dondetrabaja($dondetrabaja);
  $inscripcion->tlf_trabajo($tlf_trabajo);
  $inscripcion->direcciontrabajo($direcciontrabajo);
  $inscripcion->cargo($cargo);
  $inscripcion->antiguedad($antiguedad);
  $inscripcion->discapacidad_visual(comprobarCheckBox($discapacidad_visual));
  $inscripcion->discapacidad_auditiva(comprobarCheckBox($discapacidad_auditiva));
  $inscripcion->discapacidad_motora(comprobarCheckBox($discapacidad_motora));
  $inscripcion->discapacidad_verbal(comprobarCheckBox($discapacidad_verbal));
  if($inscripcion->Actualizar())
   $confirmacion=1;
  else
   $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['pais_residencia']=$inscripcion->pais_residencia();
    $_SESSION['datos']['cedula_estudiante']=$inscripcion->cedula_estudiante();
    $_SESSION['datos']['mensaje']="Los datos personales se han modificados con éxito!";
    header("Location: ../vistas/?inscripcion#datospersonales");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar los datos personales";
    header("Location: ../vistas/?inscripcion#datospersonales");
  }
}

if($operacion=="Paso2"){
  $inscripcion->cedula_estudiante($cedula_estudiante);
  $inscripcion->cod_parroquia($parroquia_residencia);
  $inscripcion->direccionresidencia($direccionresidencia);
  $inscripcion->cod_parroquia_temp($parroquia_temp);
  $inscripcion->direccion_temp($direccion_temp);
  $inscripcion->etnia($etnia);
  if($inscripcion->InsertarDirecciones())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    if($inscripcion->BuscarPaisResidencia($inscripcion->cedula_estudiante())){
      $_SESSION['datos']['pais_residencia']=$inscripcion->pais_residencia();
      $_SESSION['datos']['cedula_estudiante']=$inscripcion->cedula_estudiante();
      $_SESSION['datos']['mensaje']="Las direcciones han sido cargadas con éxito, por favor complete los datos del siguiente formulario.";
      header("Location: ../vistas/?inscripcion#direccionhabitacion");
    }
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar las direcciones.";
    header("Location: ../vistas/?inscripcion#direccionhabitacion");
  }
}

if($operacion=="Paso3"){
  $inscripcion->cedula_estudiante($cedula_estudiante);
  $inscripcion->plantel_edu($plantel_edu);
  $inscripcion->ciudad_plantel($ciudad_plantel);
  $inscripcion->dependencia_plantel($dependencia_plantel);
  $inscripcion->sistema_plantel($sistema_plantel);
  $inscripcion->anio_egreso($anio_egreso);
  $inscripcion->rama_plantel($rama_plantel);
  $inscripcion->prueba_act_acad($prueba_act_acad);
  $inscripcion->anio_paa($anio_paa);
  $inscripcion->nro_rusnieu($nro_rusnieu);
  $inscripcion->anio_rusnieu($anio_rusnieu);
  if($inscripcion->InsertarDatosPlantel())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    if($inscripcion->BuscarPaisResidencia($inscripcion->cedula_estudiante())){
      $_SESSION['datos']['pais_residencia']=$inscripcion->pais_residencia();
      $_SESSION['datos']['cedula_estudiante']=$inscripcion->cedula_estudiante();
      $_SESSION['datos']['mensaje']="Los Datos del Plantel han sido cargados con éxito, por favor complete los datos del siguiente formulario.";
      header("Location: ../vistas/?inscripcion#datosplantel");
    }
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar los datos del plantel.";
    header("Location: ../vistas/?inscripcion#datosplantel");
  }
}

if($operacion=="Paso4"){
  $inscripcion->cedula_estudiante($cedula_estudiante);
  $inscripcion->modalidad_ingreso($modalidad_ingreso);
  $inscripcion->modalidad_estudio($modalidad_estudio);
  $inscripcion->esatleta($esatleta);
  $inscripcion->tipo_atleta($tipo_atleta);
  $inscripcion->disciplina($disciplina);
  $inscripcion->entrenador($entrenador);
  $inscripcion->institucion($institucion);
  $inscripcion->posee_titulo($posee_titulo);
  $inscripcion->rif_universidad($rif_universidad);
  $inscripcion->titulo($titulo);
  $inscripcion->cod_carrera($cod_carrera);
  $inscripcion->turno($turno);
  $inscripcion->seccion($seccion);
  if($inscripcion->InsertarDatosIngreso())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="Los Datos del Modo de Ingreso han sido cargados con éxito.";
    header("Location: ../vistas/?inscripcion");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar los datos del modo de ingreso.";
    header("Location: ../vistas/?inscripcion#modalidadingreso");
  }
}

if($operacion=='Consultar'){  
  $inscripcion->cedula_estudiante($cedula_estudiante);
  if($inscripcion->Consultar()){
    $_SESSION['datos']['pais']=$inscripcion->nacionalidad();
    $_SESSION['datos']['estado']=$inscripcion->cod_estado();
    $_SESSION['datos']['ciudad']=$inscripcion->cod_ciudad();
    $_SESSION['datos']['municipio']=$inscripcion->cod_municipio();
    $_SESSION['datos']['parroquia']=$inscripcion->cod_parroquia();
    $_SESSION['datos']['cedula_estudiante']=$inscripcion->cedula_estudiante();
    $_SESSION['datos']['nombre_estudiante']=$inscripcion->nombre_estudiante();
    $_SESSION['datos']['apellido_estudiante']=$inscripcion->apellido_estudiante();
    $_SESSION['datos']['sexo']=$inscripcion->sexo();
    $_SESSION['datos']['edocivil']=$inscripcion->edocivil();
    $_SESSION['datos']['pais_residencia']=$inscripcion->pais_residencia();
    $_SESSION['datos']['aniosresidencia']=$inscripcion->aniosresidencia();
    $_SESSION['datos']['tlf_fijo']=$inscripcion->tlf_fijo();
    $_SESSION['datos']['tlf_movil']=$inscripcion->tlf_movil();
    $_SESSION['datos']['email']=$inscripcion->email();
    $_SESSION['datos']['fecha_nacimiento']=$inscripcion->fecha_nacimiento();
    $_SESSION['datos']['trabaja']=$inscripcion->trabaja();
    $_SESSION['datos']['dondetrabaja']=$inscripcion->dondetrabaja();
    $_SESSION['datos']['tlf_trabajo']=$inscripcion->tlf_trabajo();
    $_SESSION['datos']['direcciontrabajo']=$inscripcion->direcciontrabajo();
    $_SESSION['datos']['cargo']=$inscripcion->cargo();
    $_SESSION['datos']['antiguedad']=$inscripcion->antiguedad();
    $_SESSION['datos']['discapacidad_visual']=$inscripcion->discapacidad_visual();
    $_SESSION['datos']['discapacidad_auditiva']=$inscripcion->discapacidad_auditiva();
    $_SESSION['datos']['discapacidad_motora']=$inscripcion->discapacidad_motora();
    $_SESSION['datos']['discapacidad_verbal']=$inscripcion->discapacidad_verbal();
    $_SESSION['datos']['estatus']=$inscripcion->estatus();
    header("Location: ../vistas/?inscripcion#datospersonales");
  }else{
    $_SESSION['datos']['mensaje']="No se han encontrado resultados para tu búsqueda(".$cedula_estudiante.")";
    header("Location: ../vistas/?inscripcion#datospersonales");
  }                              
}

if($operacion=='comboPais'){
  echo $inscripcion->BuscarEstados($filtro);
  unset($inscripcion);
} 

if($operacion=='comboEstado'){
  echo $inscripcion->BuscarCiudades($filtro);
  unset($inscripcion);
} 

if($operacion=='comboCiudad'){
  echo $inscripcion->BuscarMunicipios($filtro);
  unset($inscripcion);
} 

if($operacion=='comboMunicipio'){
  echo $inscripcion->BuscarParroquias($filtro);
  unset($inscripcion);
}

if($operacion=='comboSeccion'){
  echo $inscripcion->BuscarSecciones($filtro);
  unset($inscripcion);
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
  $anios--;
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
  $filtro=substr($filtro,6,4)."-".substr($filtro,3,2)."-".substr($filtro,0,2);
  $diferencia = restarFechas(date('Y-m-d'),date($filtro));
  echo $diferencia;
  unset($diferencia);
}
?>