<?php
session_start(); 
if(isset($_POST['cambiar_clave_con_logeo']) && $_POST['cambiar_clave_con_logeo']!="1"){
  if($_POST['nueva_contrasena']!=$_POST['confirmar_contrasena']){
    $_SESSION['datos']['mensaje']=utf8_encode("las contraseñas no coeciden!");
    header("Location: ../vistas/?cambiarcontrasena");
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
    $Usuario->rol(trim($_POST['rol']));
    $Usuario->user_name($cedula_persona[0]);
    $Usuario->cedula($cedula_persona[0]);
    $Usuario->password("12345678");
    if(!$Usuario->Registrar()){
      $_SESSION['datos']['mensaje']=utf8_encode("Lo sentimos, el usuario no se ha podido registrar. Intenta más tarde");
      header("Location: ../vistas/");
    }else{
      $_SESSION['datos']['mensaje']=utf8_encode("El usuario se ha creado éxitosamente!");
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
  if($_SESSION['user_estado']<>3){
    $Usuario->user_name($_POST['nombre_usuario']);
    if($Usuario->Actualizar($_SESSION['user_name'],$_SESSION['user_pregunta'],$_POST['pregunta'],$_POST['respuesta'])){
      //$Usuario->user_name($_POST['nombre_usuario']);
      $res=$Usuario->Buscar();
      if($res!=null){
        for($i=0;$i<$res[0]['numero_preguntas'];$i++){
           $preguntas[]=$res[$i]['preguntas'];
           $respuestas[]=$res[$i]['respuestas'];
        }
        unset($_SESSION['user_pregunta']);
        unset($_SESSION['user_respuesta']);
        $_SESSION['user_pregunta']=$preguntas;
        $_SESSION['user_respuesta']=$respuestas;
      }
      $_SESSION['datos']['mensaje']=utf8_encode("Los cambios han sido guardados éxitosamente!");
      $_SESSION['user_estado']=1;
      header("Location: ../vistas/");
    }else{
      $_SESSION['datos']['mensaje']=utf8_encode("Lo sentimos, los datos no se han podido actualizar. Intenta más tarde");
      header("Location: ../vistas/");
    }
  }
  else{
    $Usuario->Transaccion("iniciando");
    $Usuario->user_name($_POST['nombre_usuario']);
    $Usuario->password($_POST['nueva_contrasena']);
    $confirmacion = 0;
    if($Usuario->Cambiar_password()){
      if($Usuario->CompletarDatos($_SESSION['user_name'],$_POST['pregunta'],$_POST['respuesta'])){
        $Usuario->user_name($_POST['nombre_usuario']);
        $res=$Usuario->Buscar();
        if($res!=null){
          for($i=0;$i<$res[0]['numero_preguntas'];$i++){
             $preguntas[]=$res[$i]['preguntas'];
             $respuestas[]=$res[$i]['respuestas'];
          }
          unset($_SESSION['user_pregunta']);
          unset($_SESSION['user_respuesta']);
          $confirmacion=1;
        }
        else
          $confirmacion=-1;
      }else
        $confirmacion=-1;
    }else
      $confirmacion=-1;
    if($confirmacion==1){
      $Usuario->Transaccion("finalizado");
      $_SESSION['datos']['mensaje']=utf8_encode("¡Se han realizado los cambios éxitosamente!");
      $_SESSION['user_estado']=1;
      $_SESSION['user_pregunta']=$preguntas;
      $_SESSION['user_respuesta']=$respuestas;
      header("Location: ../vistas/");
    }
    else{
      $Usuario->Transaccion("cancelado");
      $_SESSION['datos']['mensaje']=utf8_encode("¡Ocurrió un error al actualizar los datos, intenta más tarde!");
      header("Location: ../vistas/");
    }
  }
}

if(isset($_POST['operacion']) and $_POST['operacion']=='Modificar' and isset($_POST['rol'])){
  include("../clases/class_usuario.php");
  $Usuario=new Usuario();
  $Usuario->rol($_POST['rol']);
  if($Usuario->Actualizar2($_POST['cedula'])){ 	
    $_SESSION['datos']['mensaje']=utf8_encode("Los cambio han sido guardado éxitosamente!");
    header("Location: ../vistas/");
  }else{
    $_SESSION['datos']['mensaje']=utf8_encode("Lo sentimos, los datos no se han podido actualizar. Intenta más tarde");
    header("Location: ../vistas/");
  }
}
/*
if(isset($_POST['operacion']) and $_POST['operacion']=='Modificar' and isset($_POST['cambiar_clave_con_logeo']) && $_POST['cambiar_clave_con_logeo']!="1"){
  include("../clases/class_usuario.php");
  $Usuario=new Usuario();
  if($_SESSION['user_estado']<>3){
    $Usuario->user_name($_POST['nombre_usuario']);
    if($Usuario->Actualizar($_SESSION['user_name'],$_SESSION['user_pregunta'],$_POST['pregunta'],$_POST['respuesta'])){
      $Usuario->user_name($_POST['nombre_usuario']);
      $res=$Usuario->Buscar();
      if($res!=null){
        for($i=0;$i<$res[0]['numero_preguntas'];$i++){
           $preguntas[]=$res[$i]['preguntas'];
           $respuestas[]=$res[$i]['respuestas'];
        }
        unset($_SESSION['user_pregunta']);
        unset($_SESSION['user_respuesta']);
        $_SESSION['user_pregunta']=$preguntas;
        $_SESSION['user_respuesta']=$respuestas;
      }
      $_SESSION['datos']['mensaje']="Los cambios han sido guardados éxitosamente!";
      $_SESSION['user_estado']=1;
      header("Location: ../vistas/");
    }else{
      $_SESSION['datos']['mensaje']="Lo sentimos, los datos no se han podido actualizar. Intenta más tarde";
      header("Location: ../vistas/");
    }
  }
  else{
    $Usuario->user_name($_POST['nombre_usuario']);
    $Usuario->contrasena($_POST['nueva_contrasena']);
    if($Usuario->Cambiar_Clave($_SESSION['user_name'])){
      if($Usuario->CompletarDatos($_SESSION['user_name'],$_POST['pregunta'],$_POST['respuesta'])){
        $Usuario->user_name($_POST['nombre_usuario']);
        $res=$Usuario->Buscar();
        if($res!=null){
          for($i=0;$i<$res[0]['numero_preguntas'];$i++){
             $preguntas[]=$res[$i]['preguntas'];
             $respuestas[]=$res[$i]['respuestas'];
          }
          unset($_SESSION['user_pregunta']);
          unset($_SESSION['user_respuesta']);
          $_SESSION['user_pregunta']=$preguntas;
          $_SESSION['user_respuesta']=$respuestas;
        }
        $_SESSION['datos']['mensaje']="¡Se han realizado los cambios exitosamente!";
        $_SESSION['user_estado']=1;
        header("Location: ../vistas/menu_principal.php");
      }else{
        $_SESSION['datos']['mensaje']="¡Ocurrió un error al actualizar los datos, intenta más tarde!";
        header("Location: ../vistas/menu_principal.php");
      }
    }else{
      $_SESSION['datos']['mensaje']="¡Ocurrió un error al actualizar los datos, intenta más tarde!";
      header("Location: ../vistas/menu_principal.php");
    }
  }
}
*/
if(isset($_POST['operacion']) and $_POST['operacion']=='Consultar'){
  include("../clases/class_usuario.php");
  $Usuario=new Usuario();
  $Usuario->user_name($_POST['cedula']);
  $data=$Usuario->Buscar_2();
  if(!is_null($data)){
    $_SESSION['datos']=$data;
    header("Location: ../vistas/?nuevo_usuario");
  }else{
    $_SESSION['datos']['mensaje']=utf8_encode("Lo sentimos,no encontramos resultado con (".$_POST['nombre_usuario'].")");
    header("Location: ../vistas/?nuevo_usuario");
  }
}

if(isset($_POST['cambiar_clave_sin_logeo'])){
  if($_POST['nueva_contrasena']!=$_POST['confirmar_contrasena']){
    $_SESSION['datos']['mensaje']=utf8_encode("las contraseñas no coeciden!");
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
    $_SESSION['datos']['mensaje']=utf8_encode("El usuario ha sido Desactivado con éxito");
    header("Location: ../vistas/?nuevo_usuario");
  }else{
    $_SESSION['datos']['mensaje']=utf8_encode("Problema al Desactivar el usuario.");
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
    $_SESSION['datos']['mensaje']=utf8_encode("El usuario ha sido Activado con éxito");
    header("Location: ../vistas/?nuevo_usuario");
  }else{
    $_SESSION['datos']['mensaje']=utf8_encode("Problema al Activar el usuario.");
    header("Location: ../vistas/?nuevo_usuario");
  }
}	
?>