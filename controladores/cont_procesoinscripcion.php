<?php
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
$operacion=trim($_POST['operacion']);

//Campos Pestaña 1
if(isset($_POST['cedula_estudiante']))
$cedula_estudiante=trim($_POST['cedula_estudiante']);

if(isset($_POST['genero']))
$genero=trim($_POST['genero']);

if(isset($_POST['cedula_escolar']))
$cedula_escolar=trim($_POST['cedula_escolar']);

if(isset($_POST['lateralidad']))
$lateralidad=trim($_POST['lateralidad']);

if(isset($_POST['codigo_canaima']))
$codigo_canaima=trim($_POST['codigo_canaima']);

if(isset($_POST['canaima_operativa']))
$canaima_operativa=trim($_POST['canaima_operativa']);

if(isset($_POST['nombres']))
$nombres=trim($_POST['nombres']);

if(isset($_POST['apellidos']))
$apellidos=trim($_POST['apellidos']);

if(isset($_POST['peso']))
$peso=trim($_POST['peso']);

if(isset($_POST['estatura']))
$estatura=trim($_POST['estatura']);

if(isset($_POST['fecha_nacimiento_estudiante']))
$fecha_nacimiento=trim($_POST['fecha_nacimiento_estudiante']);

if(isset($_POST['lugar_nacimiento'])){
  $lugarnacimiento=explode("_",trim($_POST['lugar_nacimiento']));
  $lugar_nacimiento=$lugarnacimiento[0];
}

if(isset($_POST['direccion']))
$direccion=trim($_POST['direccion']);

if(isset($_POST['telefono_habitacion']))
$telefono_habitacion=trim($_POST['telefono_habitacion']);

if(isset($_POST['email']))
$email=trim($_POST['email']);

if(isset($_POST['grado_escolar']))
$grado_escolar=trim($_POST['grado_escolar']);

if(isset($_POST['seccion'])){
  $seccionall=explode('_',trim($_POST['seccion']));
  $seccion=$seccionall[0];
}


if(isset($_POST['codigo_plantel']))
$codigo_plantel=trim($_POST['codigo_plantel']);

//Pestaña 2

if(isset($_POST['cedula_madre'])){
  $cedulamadre=explode("_",trim($_POST['cedula_madre']));
  $cedula_madre=$cedulamadre[0];
}

if(isset($_POST['email_madre']))
$email_madre=trim($_POST['email_madre']);

if(isset($_POST['nombre_madre']))
$nombre_madre=trim($_POST['nombre_madre']);

if(isset($_POST['apellido_madre']))
$apellido_madre=trim($_POST['apellido_madre']);

if(isset($_POST['fecha_nacimiento_madre']))
$fecha_nacimiento_madre=trim($_POST['fecha_nacimiento_madre']);

if(isset($_POST['lugar_nacimiento_madre'])){
  $lugarnacimiento_madre=explode("_",trim($_POST['lugar_nacimiento_madre']));
  $lugar_nacimiento_madre=$lugarnacimiento_madre[0];
}

if(isset($_POST['direccion_madre']))
$direccion_madre=trim($_POST['direccion_madre']);

if(isset($_POST['telefono_habitacion_madre']))
$telefono_habitacion_madre=trim($_POST['telefono_habitacion_madre']);

if(isset($_POST['telefono_movil_madre']))
$telefono_movil_madre=trim($_POST['telefono_movil_madre']);

if(isset($_POST['cedula_padre'])){
  $cedulapadre=explode("_",trim($_POST['cedula_padre']));
  $cedula_padre=$cedulapadre[0];
}

if(isset($_POST['email_padre']))
$email_padre=trim($_POST['email_padre']);

if(isset($_POST['nombre_padre']))
$nombre_padre=trim($_POST['nombre_padre']);

if(isset($_POST['apellido_padre']))
$apellido_padre=trim($_POST['apellido_padre']);

if(isset($_POST['fecha_nacimiento_padre']))
$fecha_nacimiento_padre=trim($_POST['fecha_nacimiento_padre']);

if(isset($_POST['lugar_nacimiento_padre'])){
  $lugarnacimiento_padre=explode("_",trim($_POST['lugar_nacimiento_padre']));
  $lugar_nacimiento_padre=$lugarnacimiento_padre[0];
}

if(isset($_POST['direccion_padre']))
$direccion_padre=trim($_POST['direccion_padre']);

if(isset($_POST['telefono_habitacion_padre']))
$telefono_habitacion_padre=trim($_POST['telefono_habitacion_padre']);

if(isset($_POST['telefono_movil_padre']))
$telefono_movil_padre=trim($_POST['telefono_movil_padre']);

//Pestaña 3

if(isset($_POST['certificado_sextogrado']))
$certificado_sextogrado=trim($_POST['certificado_sextogrado']);

if(isset($_POST['notascertificadas']))
$notascertificadas=trim($_POST['notascertificadas']);

if(isset($_POST['cartabuenaconducta']))
$cartabuenaconducta=trim($_POST['cartabuenaconducta']);

if(isset($_POST['fotoestudiante']))
$fotoestudiante=trim($_POST['fotoestudiante']);

if(isset($_POST['fotorepresentante']))
$fotorepresentante=trim($_POST['fotorepresentante']);

if(isset($_POST['fotocopia_ciestudiante']))
$fotocopia_ciestudiante=trim($_POST['fotocopia_ciestudiante']);

if(isset($_POST['fotocopia_cirepresentante']))
$fotocopia_cirepresentante=trim($_POST['fotocopia_cirepresentante']);

if(isset($_POST['fotocopia_pnestudiante']))
$fotocopia_pnestudiante=trim($_POST['fotocopia_pnestudiante']);

if(isset($_POST['kitscomedor']))
$kitscomedor=trim($_POST['kitscomedor']);

if(isset($_POST['becado']))
$becado=trim($_POST['becado']);

if(isset($_POST['tipobeca']))
$tipobeca=trim($_POST['tipobeca']);

//Pestaña 4 

if(isset($_POST['cedula_docente'])){
  $ceduladocente=explode("_",trim($_POST['cedula_docente']));
  $cedula_docente=$ceduladocente[0];
}

if(isset($_POST['cedula_representante'])){
  $cedularepresentante=explode("_",trim($_POST['cedula_representante']));
  $cedula_representante=$cedularepresentante[0];
}

if(isset($_POST['genero_representante']))
$genero_representante=trim($_POST['genero_representante']);

if(isset($_POST['email_representante']))
$email_representante=trim($_POST['email_representante']);

if(isset($_POST['nombre_representante']))
$nombre_representante=trim($_POST['nombre_representante']);

if(isset($_POST['apellido_representante']))
$apellido_representante=trim($_POST['apellido_representante']);

if(isset($_POST['fecha_nacimiento_representante']))
$fecha_nacimiento_representante=trim($_POST['fecha_nacimiento_representante']);

if(isset($_POST['lugar_nacimiento_representante'])){
  $lugarnacimiento_representante=explode("_",trim($_POST['lugar_nacimiento_representante']));
  $lugar_nacimiento_representante=$lugarnacimiento_representante[0];
}

if(isset($_POST['direccion_representante']))
$direccion_representante=trim($_POST['direccion_representante']);

if(isset($_POST['telefono_habitacion_representante']))
$telefono_habitacion_representante=trim($_POST['telefono_habitacion_representante']);

if(isset($_POST['telefono_movil_representante']))
$telefono_movil_representante=trim($_POST['telefono_movil_representante']);

if(isset($_POST['lugar_trabajo'])){
  $lugar_trabajo=trim($_POST['lugar_trabajo']);
}

if(isset($_POST['parentesco'])){
  $nombreparentesco=explode("_",trim($_POST['parentesco']));
  $parentesco=$nombreparentesco[0];
}

include_once("../clases/class_procesoinscripcion.php");
$inscripcion=new Inscripcion();
if($operacion=='Registrar'){
  $inscripcion->cedula_estudiante($cedula_estudiante=="" ? $cedula_escolar : $cedula_estudiante);
  $inscripcion->genero($genero);
  $inscripcion->cedula_escolar($cedula_escolar);
  $inscripcion->lateralidad($lateralidad);
  $inscripcion->codigo_canaima($codigo_canaima);
  $inscripcion->canaima_operativa($canaima_operativa);
  $inscripcion->nombres($nombres);
  $inscripcion->apellidos($apellidos);
  $inscripcion->peso($peso);
  $inscripcion->estatura($estatura);
  $inscripcion->fecha_nacimiento($fecha_nacimiento);
  $inscripcion->lugar_nacimiento($lugar_nacimiento);
  $inscripcion->direccion($direccion);
  $inscripcion->telefono_habitacion($telefono_habitacion);
  $inscripcion->email($email);
  $inscripcion->grado_escolar($grado_escolar);
  $inscripcion->seccion($seccion);
  $inscripcion->codigo_plantel($codigo_plantel);
  $confirmacion=false;
  $inscripcion->Transaccion('iniciando');
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
    $inscripcion->Transaccion('finalizado');
    $_SESSION['datos']['cedula']=$inscripcion->cedula_estudiante();
    $_SESSION['datos']['mensaje']="Los datos del estudiante han sido cargados con éxito, por favor complete los datos del siguiente formulario.";
    header("Location: ../vistas/?proceso_inscripcion#datospadres");
  }else{
    $inscripcion->Transaccion('cancelado');
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar los datos del estudiante.<br><b>Error: ".utf8_encode($inscripcion->error())."</b>";
    header("Location: ../vistas/?proceso_inscripcion#datosestudiantes");
  }
}

if($operacion=='Modificar'){
  $inscripcion->cedula_estudiante($cedula_estudiante);
  $inscripcion->genero($genero);
  $inscripcion->cedula_escolar($cedula_escolar);
  $inscripcion->lateralidad($lateralidad);
  $inscripcion->codigo_canaima($codigo_canaima);
  $inscripcion->canaima_operativa($canaima_operativa);
  $inscripcion->nombres($nombres);
  $inscripcion->apellidos($apellidos);
  $inscripcion->peso($peso);
  $inscripcion->estatura($estatura);
  $inscripcion->fecha_nacimiento($fecha_nacimiento);
  $inscripcion->lugar_nacimiento($lugar_nacimiento);
  $inscripcion->direccion($direccion);
  $inscripcion->telefono_habitacion($telefono_habitacion);
  $inscripcion->email($email);
  $inscripcion->grado_escolar($grado_escolar);
  $inscripcion->seccion($seccion);
  $inscripcion->codigo_plantel($codigo_plantel);
  $confirmacion=false;
  $inscripcion->Transaccion('iniciando');
  if($inscripcion->Actualizar())
   $confirmacion=1;
  else
   $confirmacion=-1;
  if($confirmacion==1){
    $inscripcion->Transaccion('finalizado');
    $_SESSION['datos']['mensaje']="Los datos del estudiante se han modificados con éxito!";
    header("Location: ../vistas/?proceso_inscripcion#datosestudiantes");
  }else{
    $inscripcion->Transaccion('cancelado');
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar los datos del estudiante.<br><b>Error: ".utf8_encode($inscripcion->error())."</b>";
    header("Location: ../vistas/?proceso_inscripcion#datosestudiantes");
  }
}

if($operacion=="Paso2"){
  $inscripcion->cedula_estudiante($cedula_estudiante);
  $inscripcion->cedula_madre($cedula_madre);
  $inscripcion->email_madre($email_madre);
  $inscripcion->nombre_madre($nombre_madre);
  $inscripcion->apellido_madre($apellido_madre);
  $inscripcion->fecha_nacimiento_madre($fecha_nacimiento_madre);
  $inscripcion->lugar_nacimiento_madre($lugar_nacimiento_madre);
  $inscripcion->direccion_madre($direccion_madre);
  $inscripcion->telefono_habitacion_madre($telefono_habitacion_madre);
  $inscripcion->telefono_movil_madre($telefono_movil_madre);
  $inscripcion->cedula_padre($cedula_padre);
  $inscripcion->email_padre($email_padre);
  $inscripcion->nombre_padre($nombre_padre);
  $inscripcion->apellido_padre($apellido_padre);
  $inscripcion->fecha_nacimiento_padre($fecha_nacimiento_padre);
  $inscripcion->lugar_nacimiento_padre($lugar_nacimiento_padre);
  $inscripcion->direccion_padre($direccion_padre);
  $inscripcion->telefono_habitacion_padre($telefono_habitacion_padre);
  $inscripcion->telefono_movil_padre($telefono_movil_padre);
  $confirmacion=false;
  $inscripcion->Transaccion('iniciando');
  if($inscripcion->InsertarDatosPadres())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $inscripcion->Transaccion('finalizado'); 
    $_SESSION['datos']['cedula']=$inscripcion->cedula_estudiante();
    $_SESSION['datos']['mensaje']="Los datos de los padres han sido cargados con éxito, por favor complete los datos del siguiente formulario.";
    header("Location: ../vistas/?proceso_inscripcion#documentosconsignados");
  }else{
    $inscripcion->Transaccion('cancelado');
    $_SESSION['datos']['cedula']=$inscripcion->cedula_estudiante();
    $_SESSION['datos']['mensaje']="Se presentó un error al cargar los datos de los padres.<br><b>Error: ".utf8_encode($inscripcion->error())."</b>";
    header("Location: ../vistas/?proceso_inscripcion#datospadres");
  }
}

if($operacion=="Paso3"){
  $inscripcion->cedula_estudiante($cedula_estudiante);
  $inscripcion->certificado_sextogrado($certificado_sextogrado);
  $inscripcion->notascertificadas($notascertificadas);
  $inscripcion->cartabuenaconducta($cartabuenaconducta);
  $inscripcion->fotoestudiante($fotoestudiante);
  $inscripcion->fotorepresentante($fotorepresentante);
  $inscripcion->fotocopia_ciestudiante($fotocopia_ciestudiante);
  $inscripcion->fotocopia_cirepresentante($fotocopia_cirepresentante);
  $inscripcion->fotocopia_pnestudiante($fotocopia_pnestudiante);
  $inscripcion->kitscomedor($kitscomedor);
  $inscripcion->becado($becado);
  $inscripcion->tipobeca($tipobeca);
  $confirmacion=false;
  $inscripcion->Transaccion('iniciando');
  if($inscripcion->InsertarDocumentosConsignados())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $inscripcion->Transaccion('finalizado');
    $_SESSION['datos']['cedula']=$inscripcion->cedula_estudiante();
    $_SESSION['datos']['mensaje']="Los Documentos Consignados han sido cargados con éxito, por favor complete los datos del siguiente formulario.";
    header("Location: ../vistas/?proceso_inscripcion#datosrepresentante");
  }else{
    $inscripcion->Transaccion('cancelado');
    $_SESSION['datos']['cedula']=$inscripcion->cedula_estudiante();
    $_SESSION['datos']['mensaje']="Se presentó un error al cargar los documentos consignados.<br><b>Error: ".utf8_encode($inscripcion->error())."</b>";
    header("Location: ../vistas/?proceso_inscripcion#documentosconsignados");
  }
}

if($operacion=="Paso4"){
  $inscripcion->cedula_estudiante($cedula_estudiante);
  $inscripcion->cedula_docente($cedula_docente);
  $inscripcion->cedula_representante($cedula_representante);
  $inscripcion->genero_representante($genero_representante);
  $inscripcion->email_representante($email_representante);
  $inscripcion->nombre_representante($nombre_representante);
  $inscripcion->apellido_representante($apellido_representante);
  $inscripcion->fecha_nacimiento_representante($fecha_nacimiento_representante);
  $inscripcion->lugar_nacimiento_representante($lugar_nacimiento_representante);
  $inscripcion->direccion_representante($direccion_representante);
  $inscripcion->telefono_habitacion_representante($telefono_habitacion_representante);
  $inscripcion->telefono_movil_representante($telefono_movil_representante);
  $inscripcion->lugar_trabajo($lugar_trabajo);
  $inscripcion->codigo_parentesco($parentesco);
  $confirmacion=false;
  $inscripcion->Transaccion('iniciando');
  if($inscripcion->InsertarDatosRepresentante())
    $confirmacion=1;
  else
    $confirmacion=-1;
  if($confirmacion==1){
    $inscripcion->Transaccion('finalizado');
    $_SESSION['datos']['mensaje']="Los Datos del Representante han sido cargados con éxito.";
    header("Location: ../vistas/?proceso_inscripcion");
  }else{
    $inscripcion->Transaccion('cancelado');
    $_SESSION['datos']['cedula']=$inscripcion->cedula_estudiante();
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar los datos del representante.<br><b>Error: ".utf8_encode($inscripcion->error())."</b>";
    header("Location: ../vistas/?proceso_inscripcion#datosrepresentante");
  }
}

if($operacion=='Consultar'){  
  $inscripcion->cedula_estudiante($cedula_estudiante);
  if($inscripcion->Consultar()){
    $_SESSION['datos']['cedula']=$inscripcion->cedula_estudiante();
    $_SESSION['datos']['genero']=$inscripcion->genero();
    $_SESSION['datos']['cedula_escolar']=$inscripcion->cedula_escolar();
    $_SESSION['datos']['lateralidad']=$inscripcion->lateralidad();
    $_SESSION['datos']['codigo_canaima']=$inscripcion->codigo_canaima();
    $_SESSION['datos']['canaima_operativa']=$inscripcion->canaima_operativa();
    $_SESSION['datos']['nombres']=$inscripcion->nombres();
    $_SESSION['datos']['apellidos']=$inscripcion->apellidos();
    $_SESSION['datos']['peso']=$inscripcion->peso();
    $_SESSION['datos']['estatura']=$inscripcion->estatura();
    $_SESSION['datos']['fecha_nacimiento']=$inscripcion->fecha_nacimiento();
    $_SESSION['datos']['lugar_nacimiento']=$inscripcion->lugar_nacimiento();
    $_SESSION['datos']['direccion']=$inscripcion->direccion();
    $_SESSION['datos']['telefono_habitacion']=$inscripcion->telefono_habitacion();
    $_SESSION['datos']['email']=$inscripcion->email();
    $_SESSION['datos']['grado_escolar']=$inscripcion->grado_escolar();
    $_SESSION['datos']['seccion']=$inscripcion->seccion();
    $_SESSION['datos']['codigo_plantel']=$inscripcion->codigo_plantel();
    $_SESSION['datos']['estatus']=$inscripcion->estatus();
    header("Location: ../vistas/?proceso_inscripcion#datosestudiantes");
  }else{
    $error="";
    if($inscripcion->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($inscripcion->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$cedula_estudiante.")";
    $_SESSION['datos']['mensaje']=$error;
    header("Location: ../vistas/?proceso_inscripcion#datosestudiantes");
  }                              
}

if($operacion=='Asignar_Seccion'){
  $con=0;
  if(isset($_POST['estudiantes'])){               
    foreach($_POST['estudiantes'] as $indiceE => $valorE){                      
      if(isset($_POST['secciones'])){              
        foreach($_POST['secciones'][$valorE] as $indiceS => $valorS){
          if($inscripcion->Asignar_Seccion($valorE,$valorS)){
            $con++;
          }
        }                                 
      }                                                        
    }
    $rest=count($_POST['estudiantes'])-$con;
  }
  $_SESSION['datos']['mensaje']="Cantidad de Estudiantes Seleccionados: ".count($_POST['estudiantes']).", Cantidad Asignados: ".$con.", Cantidad Restantes: ".$rest." <br>".$inscripcion->error();
  header("Location: ../vistas/?asignar_seccion");
}
?>