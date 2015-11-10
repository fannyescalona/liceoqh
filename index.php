<?php session_start();?>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>:..Liceo Bolivariano Quebrada Honda..:</title>
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
	    <img class="cintillo" src="images/cintillo.jpg" >
	    <img class="superior" src="images/qh.jpg" >
<div class="front-signin" style="background:#FFF;">

    <center><h2>Acceder al Sistema</h2></center>
    <center>
      <?php
       if(!empty($_GET['p']) and $_GET['p']=='pregunta-seguridad' and !isset($_SESSION['captcha_udesur'])){
       	
       	
          //====================INICIO==================
             include_once("librerias/securimage/example_form.php");
          //====================FIN=====================       	
       	
       	
       	
       	
       }else {       
      ?>
  <form id="form1" name="form1" method="POST" action="<?=  $url; ?>" 
  <?php if(isset($_GET['p']) and $_GET['p']=='cambiar-contrasena') echo "onsubmit='return validar_contrasena()'"; ?> 
  >
      <div class="control-group">                  
<!-- LOGEAR!-->
      <?php if(empty($_GET['p'])){?>      
        <div class="controls">
          <div class="input-prepend">
            <span class="add-on"><i class="icon-user"></i></span>

            <input name="usuario" type="text" id="Usuario"  placeholder="Usuario" title="Por favor coloque su nombre de Usuario" required />                      
          </div><br>
          <div class="input-prepend">
            <span class="add-on"><i class="icon-lock"></i></span>
            <input name="contrasena" type="password" id="Clave" placeholder="Contraseña" title="Contraseña usada apara Ingresar al Sistema" />
          </div>
        </div>
      </div> 
      <?php } ?>
      <!-- CAMBIAR CLAVE!-->
            <?php if(!empty($_GET['p']) and $_GET['p']=='cambiar-contrasena'
             and isset($_SESSION['pregunta_respuesta']) and $_SESSION['pregunta_respuesta']==3){
       if(isset($_SESSION['captcha_udesur']))	
	    unset($_SESSION['captcha_udesur']);             	
             	?>        
        <div class="controls">
          <div class="input-prepend">
            <span class="add-on"><i class="icon-lock"></i></span>                  
            <input name="nueva_contrasena" type="password" id="nueva_contrasena"  placeholder="Nueva Contraseña" 
            title="Por favor coloque su contraseña" required/>                      
          </div><br>
          <div class="input-prepend">
            <span class="add-on"><i class="icon-lock"></i></span>
            <input name="confirmar_contrasena" type="password" id="confirmar_contrasena" 
            placeholder="Repita la Contraseña" title="Contraseña usada apara Ingresar al Sistema" required/>
          </div>
        </div>
      </div> 
      <input type="hidden" name="cambiar_clave_sin_logeo"/>        
      <?php } ?>
            <?php if(!empty($_GET['p']) and $_GET['p']=='olvidar-clave'){?>        
<!-- IDENTIFICAR USUARIO!-->
    <div class="input-prepend">
     <span class="add-on"><i class="icon-user"></i></span>                  
      <input name="user_name" type="text" id="Usuario"  placeholder="Usuario" title="Por favor coloque su nombre de Usuario" required/>                      
          </div>
       <br>
             <?php } ?>
             
 <?php if(!empty($_GET['p']) and $_GET['p']=='pregunta-seguridad'){?>        
<!-- IDENTIFICAR USUARIO!-->
    <div class="input-prepend">
    	   <input type="hidden" value="<?php echo $_SESSION['pregunta_respuesta'];?>" name="accion"/>          	
     <H5>¿     
     <?php if(isset($_SESSION['pregunta_respuesta'])){
             if($_SESSION['pregunta_respuesta']==1){
		echo ucfirst($_SESSION['user_p1']);
		}else if($_SESSION['pregunta_respuesta']==2){
		echo ucfirst($_SESSION['user_p2']);
		}
		}
	   ?>?
	   </H5>
       <span class="add-on"><i class="icon-user"></i></span>
            <input name="user_name" type="text" id="respuesta"  placeholder="Ingresa la respuesta..." title="Por favor ingrese la respuesta" size="18" required/>                      
          </div>
       <br>
             <?php } ?>
      <hr>
      <input name="cmdRegistrar" type="submit" id="cmdRegistrar" value="Aceptar" class="btn btn-large"/>            
      <br>
            <?php if(empty($_GET['p'])){?>      
      <p>Olvidaste tu contrase&ntilde;a. click <a href="?p=olvidar-clave">aqui</a> </p>
            <?php }else {?>
                      <br><img src="/liceoqh/images/home.png" alt="" style="width:80px; height:80px;cursor:pointer"
                       onclick="location.href='/liceoqh/'">         
            <?php 
            }
            } //cierre de condicion de la captcha
            ?>   
    </center>
  </form>
  <br />
  <p align="center"><a href="vistas/preinscripcion/preinscripcion.php?pa=l">PRE-INSCRIBETE</a></p>
</div>
	</div>
</header>
<center>
	<footer>
		<p>&copy Universidad Deportiva del Sur 2014</p>
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
