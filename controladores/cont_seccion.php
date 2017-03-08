<?php
//Verificar Inicio de Session.
session_start();
//Verificar si la variable esta construida.
if(isset($_POST['operacion']))
//Asignar valor a variable
$operacion=ucfirst(trim($_POST['operacion']));

if(isset($_POST['seccion']))
$id=ucfirst(trim($_POST['seccion']));

if(isset($_POST['descripcion']))
$descripcion=ucfirst(trim($_POST['descripcion']));

if(isset($_POST['turno']))
$turno=ucfirst(trim($_POST['turno']));

if(isset($_POST['grado_escolar']))
$grado_escolar=ucfirst(trim($_POST['grado_escolar']));

if(isset($_POST['capacidad_min']))
$capacidad_min=ucfirst(trim($_POST['capacidad_min']));

if(isset($_POST['capacidad_max']))
$capacidad_max=ucfirst(trim($_POST['capacidad_max']));

include_once("../clases/class_seccion.php");
$seccion=new Seccion();
if($operacion=='Registrar'){
  $seccion->Transaccion("iniciando");
  $seccion->seccion($id);
  $seccion->descripcion($descripcion);
  $seccion->turno($turno);
  $seccion->grado_escolar($grado_escolar);
  $seccion->capacidad_min($capacidad_min);
  $seccion->capacidad_max($capacidad_max);
  if(!$seccion->Comprobar()){
    if($seccion->Registrar()){
      if(isset($_POST['materias']) && isset($_POST['docentes'])){
        $seccion->InsertarMateriasDocentes($_POST['materias'],$_POST['docentes']);
        $confirmacion=1;
      }
      else
        $confirmacion=1;
    }
    else
       $confirmacion=-1;
  }else{
    if($seccion->fecha_desactivacion()==null)
      $confirmacion=0;
    else{
      if($seccion->Activar())            
         $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $seccion->Transaccion("finalizado");
    $_SESSION['datos']['mensaje']="La sección ha sido registrado con éxito !";
    header("Location: ../vistas/?seccion");
   }else{
    $seccion->Transaccion("cancelado");
    $_SESSION['datos']['mensaje']="Se presentó un error al registrar la sección.<br><b>Error: ".utf8_encode($seccion->error())."</b>";
    header("Location: ../vistas/?seccion");
  }
}

if($operacion=='Modificar'){
  $seccion->Transaccion("iniciando");
  $seccion->seccion($id);
  $seccion->descripcion($descripcion);
  $seccion->turno($turno);
  $seccion->grado_escolar($grado_escolar);
  $seccion->capacidad_min($capacidad_min);
  $seccion->capacidad_max($capacidad_max);
  if($seccion->Actualizar()){
    if(isset($_POST['codigo_msds']) && isset($_POST['materias']) && isset($_POST['docentes'])){
      if($seccion->ActualizarMSD($_POST['oldcodigo_msd'],count($_POST['codigo_msds']),$_POST['codigo_msds'],$_POST['materias'],$_POST['docentes'],$_POST['oldmateria'],$_POST['olddocente']))
        $confirmacion=1;
      else
        $confirmacion=0;
    }
    else
      $confirmacion=1;
  }
  else
   $confirmacion=-1;
  if($confirmacion==1){
    $seccion->Transaccion("finalizado");
    if(!empty($seccion->error()))
      $_SESSION['datos']['mensaje']="La sección ha sido modificado con éxito! <br> Los siguientes registros no se pueden modificar/eliminar porque tienen transacciones asociadas: <br><b>Error: ".utf8_encode($seccion->error())."</b>";
    else
      $_SESSION['datos']['mensaje']="La sección ha sido modificado con éxito!";
    header("Location: ../vistas/?seccion");
  }else{
    $seccion->Transaccion("cancelado");
    $_SESSION['datos']['mensaje']="Se presentó un error al modificar la sección.<br><b>Error: ".utf8_encode($seccion->error())."</b>";
    header("Location: ../vistas/?seccion");
  }
}

if($operacion=='Desactivar'){
  $seccion->seccion($id);
  $seccion->descripcion($descripcion);
  if($seccion->Consultar()){
    if($seccion->Desactivar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La sección ha sido desactivado con éxito";
    header("Location: ../vistas/?seccion");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar la sección.<br><b>Error: ".utf8_encode($seccion->error())."</b>";
    header("Location: ../vistas/?seccion");
  }
}

if($operacion=='Activar'){
  $seccion->seccion($id);
  $seccion->descripcion($descripcion);
  if($seccion->Consultar()){
    if($seccion->Activar())
    $confirmacion=1;
  else
    $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="La sección ha sido desactivado con éxito";
    header("Location: ../vistas/?seccion");
  }else{
    $_SESSION['datos']['mensaje']="Se presentó un error al desactivar la sección.<br><b>Error: ".utf8_encode($seccion->error())."</b>";
    header("Location: ../vistas/?seccion");
  }
}

if($operacion=='Consultar'){ 
  $seccion->seccion($id);
  $seccion->descripcion($descripcion);
  if($seccion->Consultar()){
    $_SESSION['datos']['seccion']=$seccion->seccion();
    $_SESSION['datos']['descripcion']=$seccion->descripcion();
    $_SESSION['datos']['turno']=$seccion->turno();
    $_SESSION['datos']['grado_escolar']=$seccion->grado_escolar();
    $_SESSION['datos']['capacidad_min']=$seccion->capacidad_min();
    $_SESSION['datos']['capacidad_max']=$seccion->capacidad_max();
    $_SESSION['datos']['estatus']=$seccion->estatus();
    header("Location: ../vistas/?seccion");
  }else{
    $error="";
    if($seccion->error()!=null)
      $error="Se presentó un error al realizar la búsqueda.<br><b>Error: ".utf8_encode($seccion->error())."</b>";
    else 
      $error="No se han encontrado resultados para tu búsqueda(".$id.")";
    $_SESSION['datos']['mensaje']=$error;
    header("Location: ../vistas/?seccion");
  }
}

if($operacion=='Asignar_Notas'){
  $seccion->Transaccion("iniciando");
  if($seccion->Eliminar_Notas($_POST['codigo_msd'],$_POST['codigo_lapso']))
    if($seccion->Asignar_Notas($_POST['estudiantes'],$_POST['codigos_plan_evaluaciones'],$_POST['notas']))
      $confirmacion = 1;
    else
      $confirmacion = 0;
  else
    $confirmacion = 0;
  if($confirmacion==1){
    $seccion->Transaccion("finalizado");
    $_SESSION['datos']['mensaje']="Las notas han sido asignadas con éxito";
    header("Location: ../vistas/?asignar_notas");
  }
  else{
    $seccion->Transaccion("cancelado");
    $_SESSION['datos']['mensaje']="Se presentó un error al asignar las notas.<br><b>Error: ".utf8_encode($seccion->error())."</b>";
    header("Location: ../vistas/?asignar_notas");
  }
}

if($operacion=='Aplicar_Notas'){
  $con=0;
  if(isset($_POST['msd']) && isset($_POST['estudiante']) && isset($_POST['lapso']) && isset($_POST['notas']) && isset($_POST['aprobados'])){
    for($i=0;$i<count($_POST['msd']);$i++){
      $seccion->Eliminar_NotaFinal($_POST['msd'][$i],$_POST['estudiante'][$i],$_POST['lapso'][$i]);
      if($seccion->Aplicar_NotaFinal($_POST['msd'][$i],$_POST['estudiante'][$i],$_POST['lapso'][$i],$_POST['notas'][$i],$_POST['aprobados'][$i]))
        $con++;
    }
  }
  $rest=count($_POST['msd'])-$con;
  $_SESSION['datos']['mensaje']="Cantidad de Estudiantes Seleccionados: ".count($_POST['msd']).", Cantidad Calificados: ".$con.", Cantidad Restantes: ".$rest."<br>".$seccion->error();
  header("Location: ../vistas/?aplicar_notas");
}

if($operacion=="BuscarDatosNotas"){
  echo $seccion->BuscarDatosNotas($_POST['codigo_msd'],$_POST['codigo_lapso']);
  unset($seccion);
} 

if($operacion=="ComboSeccion"){
  echo $seccion->ComboSeccion($_POST['cedula_docente']);
  unset($seccion);
} 

?>