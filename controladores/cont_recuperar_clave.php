<?php
//Verificar Inicio de Session.
session_start(); 
if(isset($_POST['user_name'])){
   include("../clases/class_usuario.php");
   $Usuario=new Usuario();
   $Usuario->user_name(trim($_POST['user_name']));
   if($_POST['accion']==1){
      if(strtoupper($_SESSION['user_r1'])==strtoupper($_POST['user_name'])){
         $_SESSION['pregunta_respuesta']=3;
         header("Location: ../?p=cambiar-contrasena");
      }else{
         $_SESSION['datos']['mensaje']="La respuesta no coecide!";
         $_SESSION['pregunta_respuesta']=$_POST['accion']+1;
         header("Location: ../?p=pregunta-seguridad");
          }

   }else if($_POST['accion']==2){

      if(strtoupper($_SESSION['user_r2'])==strtoupper($_POST['user_name'])){
      $_SESSION['pregunta_respuesta']=3;
      header("Location: ../?p=cambiar-contrasena");
   }else{
         unset($_SESSION['pregunta_respuesta']);
         $_SESSION['datos']['mensaje']="Ud. no es usuario de este sistema!";
         header("Location: ../?p=olvidar-clave");
   }
   }else{
      if(empty($_POST['user_name'])){
         $_SESSION['datos']['mensaje']="Introduzca usuario!";
         header("Location: ../?p=olvidar-clave");
      }else{
         $res=$Usuario->Buscar_1();
         $_SESSION['pregunta_respuesta']=0;
         if($res!=null){
            $_SESSION['user_name']=$_POST['user_name'];
            $_SESSION['user_p1']=$res['p1'];
            $_SESSION['user_p2']=$res['p2'];
            $_SESSION['user_r1']=$res['r1'];
            $_SESSION['user_r2']=$res['r2'];
            $_SESSION['pregunta_respuesta']++;
            header("Location: ../?p=pregunta-seguridad");
         }else{
            $_SESSION['datos']['mensaje']="Usuario incorrecto!";
            header("Location: ../?p=olvidar-clave");
         }
      }
   }
}
?>