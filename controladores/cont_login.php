<?php
session_start();
include("../clases/class_usuario.php");
$Usuario=new Usuario();
$Usuario->user_name(trim($_POST['usuario']));
$Usuario->password(trim($_POST['contrasena']));
$res=$Usuario->Buscar();
if($res!=null){
   $_SESSION['user_name']=$res['name'];
   $_SESSION['fullname_user']=$res['fullname_user'];
   $_SESSION['user_cedula']=$res['cedula'];
   $_SESSION['user_p1']=$res['p1'];
   $_SESSION['user_p2']=$res['p2'];
   $_SESSION['user_r1']=$res['r1'];
   $_SESSION['user_r2']=$res['r2'];
   $_SESSION['user_password']=$res['contrasena'];
   $_SESSION['user_perfil']=$res['perfil'];
   $_SESSION['user_codigo_perfil']=$res['codigo_perfil'];
   $_SESSION['user_estado']=$res['estado'];
   if($res['activar_caducidad']==1)
   $_SESSION['user_caducidad']=$res['caducidad'];
   else 
   $_SESSION['user_caducidad']=0;
   	$Usuario->Intento_Fallido(false);
   header("Location: ../vistas/");
}else{
	$Usuario->Intento_Fallido(true);
	$Usuario->Desactivar_clave();
   $_SESSION['datos']['mensaje']="Usuario/Clave Incorrecto!";
   header("Location: ../");
}
?>