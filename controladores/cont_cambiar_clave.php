<?php
session_start(); 

if(isset($_POST['cambiar_clave_con_logeo'])){
  if(!(isset($_SESSION['user_name']) and isset($_SESSION['user_password']) and $_SESSION['user_perfil']))
    header("Location: controladores/cont_desconectar.php");
  else if($_SESSION['user_password']!=sha1(md5($_POST['contrasena']))){
    $_SESSION['datos']['mensaje']=utf8_encode("Ud. ingresó una contraseña incorrecta!");
    header("Location: ../vistas/");
  }else if($_POST['nueva_contrasena']!=$_POST['confirmar_contrasena']){
    $_SESSION['datos']['mensaje']=utf8_encode("las contraseñas no coeciden!");
    header("Location: ../vistas/");
  }else if(strlen($_POST['nueva_contrasena'])<6){
    $_SESSION['datos']['mensaje']=utf8_encode("la contraseña debe tener mínimo 6 caracteres!");
    header("Location: ../vistas/");
  }else if(strlen($_POST['nueva_contrasena'])>10){
    $_SESSION['datos']['mensaje']=utf8_encode("la contraseña debe tener máximo 10 caracteres!");
    header("Location: ../vistas/");
  }else if($_POST['nueva_contrasena']==$_POST['confirmar_contrasena']){
    include("../clases/class_usuario.php");
    $Usuario=new Usuario();
    $Usuario->user_name($_SESSION['user_name']);
    $Usuario->password($_POST['nueva_contrasena']);
    if($Usuario->Buscar_ultimas_3_clave()==false){
      if($Usuario->Cambiar_password()){
        $_SESSION['datos']['mensaje']=utf8_encode("tu contraseña ha sido cambiada éxitosamente!");
        $_SESSION['user_password']=sha1(md5($_POST['nueva_contrasena']));
      }
      else
        $_SESSION['datos']['mensaje']=utf8_encode("tu contraseña no ha sido cambiada!");
    }else {
      $_SESSION['datos']['mensaje']="Esta clave ha sido usada anteriormente, ingrese una clave nueva!";
    }
    header("Location: ../vistas/");
  }else{
    header("Location: ../vistas/");
  }
}

if(isset($_POST['operacion']) and $_POST['operacion']=='Registrar'){
  include("../clases/class_usuario.php");
  $Usuario=new Usuario();
  //  Extraemos la cedula
  $cedula_persona=explode("_",trim($_POST['cedula']));
  $cedula=$cedula_persona[0];
  //  Establecemos la cedula en el objeto
  $Usuario->cedula($cedula);
  if($Usuario->Consultar_personal()){
    $Usuario=new Usuario();
    $Usuario->rol(trim($_POST['rol']));
    $user_name=explode('_',trim($_POST['cedula']));
    $Usuario->user_name($user_name[0]);
    $cedula=explode('_',trim($_POST['cedula']));
    $Usuario->cedula($cedula[0]);
    $Usuario->password("12345678");
    if(!$Usuario->Registrar()){
      $_SESSION['datos']['mensaje']=utf8_encode("Lo sentimos, el usuario no se ha podido registrar. Intenta más tarde");
      header("Location: ../vistas/");
    }else{
      $_SESSION['datos']['mensaje']="El usuario se ha creado éxitosamente!";
      header("Location: ../vistas/");
    }
  }else{
    $_SESSION['datos']['mensaje']=utf8_encode("Lo sentimos, (".$_POST['cedula'].") no está registrado como personal de la institución");
  }
  header("Location: ../vistas/?nuevousuario");
}

if(isset($_POST['operacion']) and $_POST['operacion']=='Modificar' and !isset($_POST['rol'])){
  include("../clases/class_usuario.php");
  $Usuario=new Usuario();
  $Usuario->pregunta_uno($_POST['p1']);
  $Usuario->pregunta_dos($_POST['p2']);
  $Usuario->respuesta_uno($_POST['r1']);
  $Usuario->respuesta_dos($_POST['r2']);
  $Usuario->user_name($_POST['nombre_usuario']);
  if($Usuario->Actualizar($_SESSION['user_name'])){
    $_SESSION['user_p1']=$Usuario->pregunta_uno();
    $_SESSION['user_p2']=$Usuario->pregunta_dos();
    $_SESSION['user_r1']=$Usuario->respuesta_uno();
    $_SESSION['user_r2']=$Usuario->respuesta_dos();  	
    $_SESSION['datos']['mensaje']="Los cambios han sido guardados éxitosamente!";
    $_SESSION['user_estado']=1;
    header("Location: ../vistas/");
  }else{
    $_SESSION['datos']['mensaje']="Lo sentimos, los datos no se han podido actualizar. Intenta más tarde";
    header("Location: ../vistas/");
  }
}

if(isset($_POST['operacion']) and $_POST['operacion']=='Modificar' and isset($_POST['rol'])){
  include("../clases/class_usuario.php");
  $Usuario=new Usuario();
  $Usuario->rol($_POST['rol']);
  if($Usuario->Actualizar2($_POST['cedula'])){ 	
    $_SESSION['datos']['mensaje']="los cambio han sido guardado éxitosamente!";
    header("Location: ../vistas/");
  }else{
    $_SESSION['datos']['mensaje']="Lo sentimos, los datos no se han podido actualizar. Intenta más tarde";
    header("Location: ../vistas/");
  }
}

if(isset($_POST['operacion']) and $_POST['operacion']=='Consultar'){
  include("../clases/class_usuario.php");
  $Usuario=new Usuario();
  $Usuario->user_name($_POST['cedula']);
  $data=$Usuario->Buscar_2();
  if(!is_null($data)){
    $_SESSION['datos']=$data;
    header("Location: ../vistas/?nuevo_usuario");
  }else{
    $_SESSION['datos']['mensaje']="Lo sentimos,no encontramos resultado con (".$_POST['nombre_usuario'].")";
    header("Location: ../vistas/?nuevo_usuario");
  }
}

if(isset($_POST['cambiar_clave_sin_logeo'])){
  if($_POST['nueva_contrasena']!=$_POST['confirmar_contrasena']){
    $_SESSION['datos']['mensaje']=utf8_encode("las contraseñas no coeciden!");
    header("Location: ../");
  }else if(strlen($_POST['nueva_contrasena'])<6){
    $_SESSION['datos']['mensaje']=utf8_encode("la contraseña debe tener mínimo 6 caracteres!");
    header("Location: ../");
  }else if(strlen($_POST['nueva_contrasena'])>10){
    $_SESSION['datos']['mensaje']=utf8_encode("la contraseña  debe tener máximo 10 caracteres!");
    header("Location: ../");
  }else if($_POST['nueva_contrasena']==$_POST['confirmar_contrasena']){
    include("../clases/class_usuario.php");
    $Usuario=new Usuario();
    $Usuario->user_name($_SESSION['user_name']);
    $Usuario->password($_POST['nueva_contrasena']);
    if($Usuario->Buscar_ultimas_3_clave()==false){
      if($Usuario->Cambiar_password()){
        $_SESSION['datos']['mensaje']=utf8_encode("tu contraseña ha sido cambiada éxitosamente!");
        $_SESSION['user_password']=sha1(md5($_POST['nueva_contrasena']));
      }else
        $_SESSION['datos']['mensaje']=utf8_encode("tu contraseña no ha sido cambiada!");
    }else{
      $_SESSION['datos']['mensaje']=utf8_encode("Esta clave ha sido usada anteriormente, ingrese una clave nueva!");
    }
    header("Location: ../");
  }else{
    header("Location: ../");
  }
}

if(isset($_POST['operacion']) and $_POST['operacion']=='Desactivar'){
  include("../clases/class_usuario.php");
  $Usuario=new Usuario();
  $Usuario->user_name($_POST['cedula']);
  if($Usuario->Buscar_1()){
    if($Usuario->Desactivar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El usuario ha sido Desactivado con éxito";
    header("Location: ../vistas/?nuevo_usuario");
  }else{
    $_SESSION['datos']['mensaje']="Problema al Desactivar el usuario.";
    header("Location: ../vistas/?nuevo_usuario");
  }
}
		
if(isset($_POST['operacion']) and $_POST['operacion']=='Activar'){
  include("../clases/class_usuario.php");
  $Usuario=new Usuario();
  $Usuario->user_name($_POST['cedula']);
  if($Usuario->Buscar_2()){
    if($Usuario->Activar())
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    $confirmacion=0;
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="El usuario ha sido Activado con éxito";
    header("Location: ../vistas/?nuevo_usuario");
  }else{
    $_SESSION['datos']['mensaje']="Problema al Activar el usuario.";
    header("Location: ../vistas/?nuevo_usuario");
  }
}	
?>