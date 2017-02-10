<?php
include("../clases/class_usuario.php");
session_start();
$sesion = sha1(md5("liceoqh-".date('Y-m-d')));
$preguntas=null;
$respuestas=null;
$Usuario=new Usuario();
$Usuario->user_name(trim($_POST['usuario']));
$Usuario->password(trim($_POST['contrasena']));
if(trim(md5(strtolower($_POST["captcha"]))) == trim($_SESSION["captcha"])){
   $checkStatus=$Usuario->Buscar(false);
   if($checkStatus!=null){
      if($checkStatus[0]['estado']==4){
         $_SESSION['datos']['mensaje']="¡Usuario bloqueado, contacte al administrador!";
         header("Location: ../");
      }
      else{
         $res=$Usuario->Buscar(true);
         if($res!=null){
            if($res[0]['estado']==4){
               $_SESSION['datos']['mensaje']="¡Usuario bloqueado, contacte al administrador!";
               header("Location: ../");
            }
            else if($res[0]['dias_ultimasesion']>=$res[0]['dias_inactividad']){
               $Usuario->Bloquear_Por_Inactividad();
               $_SESSION['datos']['mensaje']="¡Usuario bloqueado por inactividad, contacte al administrador!";
               header("Location: ../");
            }
            else{
               if ($res[0]['sesion']==$sesion) {
                  if($res[0]['sesion_abierta']>=$res[0]['maxsesion']){
                     $_SESSION['datos']['mensaje']="¡Alcanzó el máximo de sesiones abiertas permitidas!";
                     header("Location: ../");
                  }
                  else{
                     $_SESSION['user_name']=$res[0]['name'];
                     $_SESSION['fullname_user']=$res[0]['fullname_user'];
                     $_SESSION['user_cedula']=$res[0]['cedula'];
                     $_SESSION['user_pregunta']=$preguntas;
                     $_SESSION['user_respuesta']=$respuestas;
                     $_SESSION['user_password']=$res[0]['contrasena'];
                     $_SESSION['user_perfil']=$res[0]['perfil'];
                     $_SESSION['user_codigo_perfil']=$res[0]['codigo_perfil'];
                     $_SESSION['user_caducidad']=$res[0]['caducidad'];
                     $_SESSION['user_diasaviso']=$res[0]['dias_aviso'];
                     $_SESSION['user_preguntas']=$res[0]['numero_preguntas'];
                     $_SESSION['user_respuestas']=$res[0]['numero_preguntasaresponder'];
                     $_SESSION['user_estado']=$res[0]['estado'];
                     $_SESSION['vigencia_clave']=$res[0]['dias_vigenciaclave'];
                     for($i=0;$i<$res[0]['numero_preguntas'];$i++){
                        $preguntas[]=$res[$i]['preguntas'];
                        $respuestas[]=$res[$i]['respuestas'];
                     }
                     $_SESSION['user_pregunta']=$preguntas;
                     $_SESSION['user_respuesta']=$respuestas;
                     $Usuario->Intento_Fallido(false);
                     if(!isset($_SESSION['session_control']) && $res[0]['dias_ultimasesion']>0)
                        $Usuario->Reset_Sesion();
                     $_SESSION['session_control']=$sesion;
                     $Usuario->Administrar_Sesion(true,$sesion);
                     header("Location: ../vistas/");
                  }
               }
               else{
                  $_SESSION['user_name']=$res[0]['name'];
                  $_SESSION['fullname_user']=$res[0]['fullname_user'];
                  $_SESSION['user_cedula']=$res[0]['cedula'];
                  $_SESSION['user_pregunta']=$preguntas;
                  $_SESSION['user_respuesta']=$respuestas;
                  $_SESSION['user_password']=$res[0]['contrasena'];
                  $_SESSION['user_perfil']=$res[0]['perfil'];
                  $_SESSION['user_codigo_perfil']=$res[0]['codigo_perfil'];
                  $_SESSION['user_caducidad']=$res[0]['caducidad'];
                  $_SESSION['user_diasaviso']=$res[0]['dias_aviso'];
                  $_SESSION['user_preguntas']=$res[0]['numero_preguntas'];
                  $_SESSION['user_respuestas']=$res[0]['numero_preguntasaresponder'];
                  $_SESSION['user_estado']=$res[0]['estado'];
                  $_SESSION['vigencia_clave']=$res[0]['dias_vigenciaclave'];
                  for($i=0;$i<$res[0]['numero_preguntas'];$i++){
                     $preguntas[]=$res[$i]['preguntas'];
                     $respuestas[]=$res[$i]['respuestas'];
                  }
                  $_SESSION['user_pregunta']=$preguntas;
                  $_SESSION['user_respuesta']=$respuestas;
                  $Usuario->Intento_Fallido(false);
                  if(!isset($_SESSION['session_control']) && $res[0]['dias_ultimasesion']>0)
                     $Usuario->Reset_Sesion();
                  $_SESSION['session_control']=$sesion;
                  $Usuario->Administrar_Sesion(true,$sesion);
                  header("Location: ../vistas/");
               }
            }
         }else{
            $Usuario->Intento_Fallido(true);
            $Usuario->Bloquear_Usuario();
            $_SESSION['datos']['mensaje']="¡Usuario/Clave incorrecto!";
            header("Location: ../");
         }
      }
   }
   else{
      $Usuario->Intento_Fallido(true);
      $Usuario->Bloquear_Usuario();
      $_SESSION['datos']['mensaje']="¡Usuario/Clave incorrecto!";
      header("Location: ../");
   }
}
else{
   $_SESSION['datos']['mensaje']="El código captcha está mal escrito, vuelva a intentarlo";
   header("Location: ../");
}
?>