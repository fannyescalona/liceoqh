<?php session_start();?>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  	<title>:..Unidad Educativa Nacional Quebrada Honda..:</title>
  	<link rel="stylesheet" href="css/normalize.css" />
  	<link rel="stylesheet" href="css/bootstrap.css" />
    <link rel="stylesheet" href="librerias/sweetalert/css/sweetalert.css"/>
  	<link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/css_04.css"/>
  	<!-- load jQuery -->
    <script src="js/jquery.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/jquery.ui.datepicker-es.js"></script>
    <script src="js/jquery-ui-timepicker.js"></script>
  	<!-- load BootStrap -->
    <script src="js/bootstrap.min.js"></script>
    <!-- load SweetAlert -->
      <script type="text/javascript" src="librerias/sweetalert/js/sweetalert.min.js"></script>
    <!-- load Others -->
    <script src="js/main.js"></script>
    <script src="js/uds_usuario.js"></script>
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
      <form id="form1" name="form1" method="POST" action="<?=$url;?>" <?php if(isset($_GET['p']) and $_GET['p']=='cambiar-contrasena') echo "onsubmit='return validar_contrasena()'"; ?> >
        <div class="control-group">  
          <center><img src="images/logo2.png"></center>                
          <!-- LOGEAR!-->
            <?php if(empty($_GET['p'])){?>
            <div class="group">
                <input required type="text" name="usuario" autocomplete="off" onKeyUp="this.value=this.value.toUpperCase()"><span class="highlight"></span><span class="bar"></span>
                <label>Usuario</label>
            </div>
            <div class="group">
                <input required type="password" name="contrasena" ><span class="highlight"></span><span class="bar"></span>
                <label>Clave</label>
            </div>
            <div class="group">
                <div class="col-md-12" align="center">
                    <img src="captcha.php">
                </div>
            </div>
            <div class="group">
                <input required type="text" name="captcha" id="captcha"/><span class="highlight"></span><span class="bar"></span>
                <label>Código de la Imagen</label>
            </div>
            <div class="row">
                <div class="col-md-6 pull-right">
                    <a class="btn-sm btn-danger" href="?p=olvidar-clave" class="verde">¿Olvidó su Clave?</a>
                </div>
            </div>
            <?php } ?>
          <!-- IDENTIFICAR USUARIO!-->
            <?php if(!empty($_GET['p']) and $_GET['p']=='olvidar-clave'){?>
            <div class="group">
                <input required type="text" name="user_name" autocomplete="off" onKeyUp="this.value=this.value.toUpperCase()" ><span class="highlight"></span><span class="bar"></span>
                <label>Usuario</label>
            </div>
            <div class="group">
                <div class="col-md-12" align="center">
                    <img src="captcha.php">
                </div>
            </div>
            <div class="group">
                <input required type="text" name="captcha" id="captcha"/><span class="highlight"></span><span class="bar"></span>
                <label>Código de la Imagen</label>
            </div>
            <?php } ?>
          <!-- PREGUNTAS SECRETAS!-->
            <?php if(!empty($_GET['p']) and $_GET['p']=='pregunta-seguridad'){?> 
              <input type='hidden' value="<?php echo $_SESSION['pregunta_respuesta'];?>" name="accion" />
              <?php
                if(isset($_SESSION['pregunta_respuesta'])){
                  for($i=0;$i<$_SESSION['user_preguntas_a_responder'];$i++){
                    for($j=0;$j<$_SESSION['user_numero_preguntas'];$j++){
                      if($i==$j){
                        echo "<div class='group'>";
                        echo "<input type='text' autocomplete='off' onKeyUp='this.value=this.value.toUpperCase()' name='respuesta[]' title='Por favor ingrese la respuesta' required /><span class='highlight'></span><span class='bar'></span>";
                        echo "<label>¿".ucfirst($_SESSION['user_pregunta'][$j])."?</label>";
                        echo "</div>";
                      }
                    }
                  }
                }
              ?>
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
            <div class="group">
              <input required class="used" type="password" name="contrasena_actual" id="contrasena_actual" value="<?php echo $_SESSION['user_passwd'];?>" readonly><span class="highlight"></span><span class="bar"></span>
              <label>Clave Actual</label>
            </div>
            <div class="group">
              <input required type="password" name="nueva_contrasena" id="nueva_contrasena" ><span class="highlight"></span><span class="bar"></span>
              <label>Clave Nueva</label>
            </div>
            <div class="group">
              <input type="hidden" name="cambiar_clave_sin_logeo"/>
              <input required type="password" name="confirmar_contrasena" id="confirmar_contrasena" ><span class="highlight"></span><span class="bar"></span>
              <label>Confirmar Clave</label>
            </div>
            <?php } ?>
        </div>
        <button type="submit" name="cmdRegistrar" value="Aceptar" id="cmdRegistrar" class="button buttonBlue">Aceptar
            <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
        </button> 
        <br>
        <?php if(!empty($_GET['p'])){?>      
          <center><img src="/liceoqh/images/home.png" alt="" style="width:80px; height:80px;cursor:pointer" onclick="location.href='/liceoqh/'"></center>
        <?php 
          } //cierre de condicion de la captcha
        ?>   
      </form>
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
  <script type="text/javascript">
    $(window, document, undefined).ready(function() {
      $('input').blur(function() {
        var $this = $(this);
        if ($this.val())
          $this.addClass('used');
        else
          $this.removeClass('used');
      });
      var $ripples = $('.ripples');
      $ripples.on('click.Ripples', function(e) {
        var $this = $(this);
        var $offset = $this.parent().offset();
        var $circle = $this.find('.ripplesCircle');
        var x = e.pageX - $offset.left;
        var y = e.pageY - $offset.top;
        $circle.css({top: y + 'px',left: x + 'px'});
        $this.addClass('is-active');
      });
      $ripples.on('animationend webkitAnimationEnd mozAnimationEnd oanimationend MSAnimationEnd', function(e) {
        $(this).removeClass('is-active');
      });
      /*document.body.oncopy = function() { //esta funcion es para evitar el robo de informacion
        return false; 
      };
      document.ondragstart = function() { //prohibir el arrastar las imagenes
        return false;
      };
      document.onpaste = function() {
        return false;
      }
      document.layers ? (document.captureEvents(Event.MOUSEDOWN), document.onmousedown = ClickOtro) : (document.onmouseup = ClickOtro, document.oncontextmenu = clickExplorador);
      "undefined" != typeof document.onselectstart && (document.onselectstart = function() {  return false; }); */
    });
    //funciones para evitar el robo de informacion en navegadores viejos mediante click o drag and drop, las cuales seran llamadas desde el evento onload
    /*function clickExplorador() {
      document.all && alert("PROHIBIDO ESTA FUNCI\u00d3N"); 
      return false; 
    }
    function ClickOtro(a) {
      if (document.layers || document.getElementById && !document.all) {
        if (2 == a.which || 3 == a.which) {
          return false; 
        } 
      }
    }*/
    /* fin de las funciones del robo de informacion*/ 
  </script>
</html>
