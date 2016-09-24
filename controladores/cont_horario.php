<?php
session_start();
//echo $_SERVER["HTTP_REFERER"];

include_once("../clases/class_horario.php");
$horario=new horario();
$hubo_error=false;
//$cedula=trim($_POST['cedula']);
$codigo_ano_academico=trim($_POST['codigo_ano_academico']);
$horario->codigo_ano_academico($codigo_ano_academico);
$horario->Transaccion('iniciando');

if(isset($_POST['contenidos'])){
  $filtro = array();
  foreach ($_POST['contenidos'] as $key => $value) {
    $extraer_valor=explode('*',$value);
    array_push($filtro,array('codigo_ambiente' => $extraer_valor[2], 'seccion' => $extraer_valor[1], 'cedula_docente' => $extraer_valor[4]));
  }
  $duplicates = array_map("unserialize", array_unique(array_map("serialize", $filtro)));
  for($i = 0; $i<count($duplicates);$i++){
    $horario->codigo_ambiente($duplicates[$i]["codigo_ambiente"]);
    $horario->seccion($duplicates[$i]["seccion"]);
    $horario->cedula_docente($duplicates[$i]["cedula_docente"]);
    if($horario->Comprobar_existencia())
      $horario->Quitar_hora("todos");
  }
  foreach($_POST['contenidos'] as $x => $y){
    $extraer_valor=explode('*',$y);
    $extraer_valor2=explode('-',$extraer_valor[0]);
    $dia=$extraer_valor2[1];
    $hora=$extraer_valor2[0];
    $horario->codigo_bloque_hora($hora);
    $horario->dia($dia);
    $horario->codigo_ambiente($extraer_valor[2]);
    $horario->codigo_materia($extraer_valor[3]);
    $horario->seccion($extraer_valor[1]);
    $horario->cedula_docente($extraer_valor[4]);
    if(!$horario->Comprobar_horario_profesor()){
      (!$horario->Registrar($_SESSION['user_name'])) ? $hubo_error=true : '';
    }
  }
}else{
  header("Location: ".$_SERVER["HTTP_REFERER"]);
}
if($hubo_error==true){ 
  $horario->Transaccion('cancelado');
  $_SESSION['datos']['mensaje']="¡Los datos no han podido guardar!";
  header("Location: ".$_SERVER["HTTP_REFERER"]);
}
else{
  $horario->Transaccion('finalizado');
  $_SESSION['datos']['mensaje']="¡Los datos han sido guardado exitosamente!";
  header("Location: ../vistas/?horario");
}
?>