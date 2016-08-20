<?php
//	Se recupera la sesión
session_start();
include("../clases/class_usuario.php");
$Usuario=new Usuario();
$Usuario->user_name(trim($_SESSION['user_name']));
$Usuario->Administrar_Sesion(false);
session_unset(); 
//	A continuación, la sesión de este modo destruye el número único de sesión
session_destroy();
header('Location: ../');
?>