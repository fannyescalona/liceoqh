<?php session_start();?>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  	<title>:..Unidad Educativa Nacional Quebrada Honda..:</title>
  	<link rel="stylesheet" href="css/normalize.css" />
  	<link rel="stylesheet" href="css/bootstrap.css" />
  	<link rel="stylesheet" href="css/style.css" />
  	<!-- load jQuery -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/jquery.ui.datepicker-es.js"></script>
    <script src="js/jquery-ui-timepicker.js"></script>
    <script src="js/main.js"></script>
  	<!-- load BootStrap -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/uds_usuario.js"></script>
    <script type="text/javascript" src="librerias/noty/jquery.noty.js"></script>
  	<link rel="stylesheet" type="text/css" href="librerias/noty/jquery.noty.css"/>
    <link rel="stylesheet" type="text/css" href="librerias/noty/buttons.css"/>
    <link rel="stylesheet" type="text/css" href="librerias/noty/noty_theme_default.css"/>
    <link rel="stylesheet" type="text/css" href="css/css_04.css"/>
  </head>
  <?php
    $url="#";	   
    if(empty($_GET)){
      $url="controladores/cont_login.php";	
    }elseif($_GET['p']=="olvidar-clave" || $_GET['p']=="pregunta-seguridad"){
      $url="controladores/cont_recuperar_clave.php";	
    }elseif($_GET['p']=="cambiar-contrasena"){
      $url="controladores/cont_cambiar_clave.php";	
    }
  ?>
  <body>
    <header>
      <div class="wrapper logintop"> 
        <img class="cintillo" src="images/cintillo.png" >
        <img class="superior" src="images/qh.jpg" >
        <div class="front-signin" style="background:#FFF;">
          <center><h2>Acceder al Sistema</h2></center>
          <center>
            <?php
              if(!empty($_GET['p']) and $_GET['p']=='pregunta-seguridad' and !isset($_SESSION['captcha_udesur'])){
                //====================INICIO==================
                include_once("librerias/securimage/example_form.php");
                //====================FIN=====================
              }else{ 
            ?>
                <form id="form1" name="form1" method="POST" action="<?=$url;?>" <?php if(isset($_GET['p']) and $_GET['p']=='cambiar-contrasena') echo "onsubmit='return validar_contrasena()'"; ?> >
                  <div class="control-group">                  
                    <!-- LOGEAR!-->
                      <?php if(empty($_GET['p'])){?>      
                      <div class="controls">
                        <div class="input-prepend">
                          <span class="add-on"><i class="icon-user"></i></span>
                          <input name="usuario" type="text" id="Usuario" onKeyUp="this.value=this.value.toUpperCase()" placeholder="Usuario" title="Por favor coloque su nombre de Usuario" required />                      
                        </div><br>
                        <div class="input-prepend">
                          <span class="add-on"><i class="icon-lock"></i></span>
                          <input name="contrasena" type="password" id="Clave" placeholder="Contraseña" title="Contraseña usada apara Ingresar al Sistema" />
                        </div>
                      </div>
                      <?php } ?>
                    <!-- IDENTIFICAR USUARIO!-->
                      <?php if(!empty($_GET['p']) and $_GET['p']=='olvidar-clave'){?>
                      <div class="controls">
                        <div class="input-prepend">
                        <span class="add-on"><i class="icon-user"></i></span>                  
                        <input name="user_name" type="text" id="Usuario" onKeyUp="this.value=this.value.toUpperCase()"  placeholder="Usuario" title="Por favor coloque su nombre de Usuario" required/>                      
                        </div>
                        <br>
                      </div>
                      <?php } ?>
                    <!-- PREGUNTAS SECRETAS!-->
                      <?php if(!empty($_GET['p']) and $_GET['p']=='pregunta-seguridad'){?> 
                      <div class="controls">
                        <input type='hidden' value="<?php echo $_SESSION['pregunta_respuesta'];?>" name="accion" />
                        <?php
                          if(isset($_SESSION['pregunta_respuesta'])){
                            for($i=0;$i<$_SESSION['user_preguntas_a_responder'];$i++){
                              for($j=0;$j<$_SESSION['user_numero_preguntas'];$j++){
                                if($i==$j){
                                  echo "<div class='input-prepend'>";
                                  echo "<h5>¿".ucfirst($_SESSION['user_pregunta'][$j])."?</h5>";
                                  echo "<span class='add-on'><i class='icon-question-sign'></i></span>
                                  <input type='text' onKeyUp='this.value=this.value.toUpperCase()' name='respuesta[]' placeholder='Ingresa la respuesta...' title='Por favor ingrese la respuesta' required />
                                  </div><br />";
                                }
                              }
                            }
                          }
                        ?>
                        <br>
                      </div>
                      <?php } ?>
                    <!-- CAMBIAR CLAVE!-->
                      <?php if(!empty($_GET['p']) and $_GET['p']=='cambiar-contrasena' and isset($_SESSION['pregunta_respuesta']) and $_SESSION['pregunta_respuesta']==4){
                        if(isset($_SESSION['captcha_udesur']))
                          unset($_SESSION['captcha_udesur']); 
                        require_once('clases/class_bd.php');
                        $conexion = new Conexion();
                        $sql = "SELECT p.codigo_perfil,p.descripcion AS nombre_perfil,c.descripcion AS configuracion, 
                        c.longitud_minclave,c.longitud_maxclave,c.cantidad_letrasmayusculas,c.cantidad_letrasminusculas,
                        c.cantidad_caracteresespeciales,c.cantidad_numeros 
                        FROM tusuario u 
                        INNER JOIN tperfil p ON p.codigo_perfil = u.codigo_perfil 
                        INNER JOIN tconfiguracion c ON p.codigo_configuracion = c.codigo_configuracion 
                        WHERE u.nombre_usuario = '".$_SESSION['user_name']."'";
                        $query=$conexion->Ejecutar($sql);
                        if($Obj=$conexion->Respuesta($query)){
                          echo "<input type='hidden' id='longitud_minclave' value='".$Obj['longitud_minclave']."' />";
                          echo "<input type='hidden' id='longitud_maxclave' value='".$Obj['longitud_maxclave']."' />";
                          echo "<input type='hidden' id='cantidad_letrasmayusculas' value='".$Obj['cantidad_letrasmayusculas']."' />";
                          echo "<input type='hidden' id='cantidad_letrasminusculas' value='".$Obj['cantidad_letrasminusculas']."' />";
                          echo "<input type='hidden' id='cantidad_caracteresespeciales' value='".$Obj['cantidad_caracteresespeciales']."' />";
                          echo "<input type='hidden' id='cantidad_numeros' value='".$Obj['cantidad_numeros']."' />";
                        }
                      ?> 
                      <div class="controls">
                        <div class="input-prepend">
                          <span class="add-on"><i class="icon-lock"></i></span>
                          <input type="password" name="contrasena_actual" id="contrasena_actual" title="Contraseña actual" value="<?php echo $_SESSION['user_passwd'];?>" readonly required />
                        </div>
                        <br />
                        <div class="input-prepend">
                          <span class="add-on"><i class="icon-lock"></i></span>                  
                          <input name="nueva_contrasena" type="password" id="nueva_contrasena"  placeholder="Nueva Contraseña" 
                          title="Por favor coloque su contraseña" required/>                      
                        </div><br>
                        <div class="input-prepend">
                          <span class="add-on"><i class="icon-lock"></i></span>
                          <input name="confirmar_contrasena" type="password" id="confirmar_contrasena" 
                          placeholder="Repita la Contraseña" title="Contraseña usada apara Ingresar al Sistema" required/>
                          <input type="hidden" name="cambiar_clave_sin_logeo"/>
                        </div>
                      </div>
                      <?php } ?>
                  </div>
                  <input name="cmdRegistrar" type="submit" id="cmdRegistrar" value="Aceptar" class="btn btn-large"/>            
                  <br>
                  <?php if(empty($_GET['p'])){?>      
                    <p>Olvidaste tu contrase&ntilde;a. click <a href="?p=olvidar-clave">aquí</a> </p>
                  <?php }else {?>
                    <br><img src="/liceoqh/images/home.png" alt="" style="width:80px; height:80px;cursor:pointer" onclick="location.href='/liceoqh/'">
                  <?php 
                    } //cierre de condicion de la captcha
                  ?>   
                </form>
            <?php 
              } 
            ?>
          </center>
        </div>
      </div>
    </header>
    <center>
      <footer>
        <p>&copy Unidad Educativa Nacional "Quebrada Honda", 2015</p>
      </footer>
    </center>
    <?php
      if(isset($_SESSION['datos']['mensaje'])){
        echo "<script>alert('".$_SESSION['datos']['mensaje']."')</script>";	
        unset($_SESSION['datos']['mensaje']);	
        unset($_SESSION['pregunta_respuesta']);
      }
    ?>
  </body>
</html>
