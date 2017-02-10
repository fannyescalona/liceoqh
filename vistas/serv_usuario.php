<html lang="es">
  <head>
    <script type="text/javascript" src="../js/uds_usuario.js"></script>
  </head>
  <body >
    <form  id="form" name="form" action="../controladores/cont_cambiar_clave.php" method="post" enctype="multipart/form-data">
      <?php
        $servicios='perfil';
        $disabledRC=null;
        $disabledMD=null;
        $estatus=null;
        $longitud_minclave=0;
        $longitud_maxclave=999;
        require_once('../clases/class_bd.php'); 
        $conexion = new Conexion();
        $sql = "SELECT c.* FROM tconfiguracion c 
        INNER JOIN tperfil p ON p.codigo_configuracion = c.codigo_configuracion 
        WHERE p.codigo_perfil = '".$_SESSION['user_codigo_perfil']."'";
        $query=$conexion->Ejecutar($sql);
        if($Obj=$conexion->Respuesta($query)){
          $longitud_minclave = $Obj['longitud_minclave'];
          $longitud_maxclave = $Obj['longitud_maxclave'];
          $cantidad_letrasmayusculas = $Obj['cantidad_letrasmayusculas'];
          $cantidad_letrasminusculas = $Obj['cantidad_letrasminusculas'];
          $cantidad_caracteresespeciales = $Obj['cantidad_caracteresespeciales'];
          $cantidad_numeros = $Obj['cantidad_numeros'];
          echo "<input type='hidden' id='longitud_minclave' value='".$Obj['longitud_minclave']."' />";
          echo "<input type='hidden' id='longitud_maxclave' value='".$Obj['longitud_maxclave']."' />";
          echo "<input type='hidden' id='cantidad_letrasmayusculas' value='".$Obj['cantidad_letrasmayusculas']."' />";
          echo "<input type='hidden' id='cantidad_letrasminusculas' value='".$Obj['cantidad_letrasminusculas']."' />";
          echo "<input type='hidden' id='cantidad_caracteresespeciales' value='".$Obj['cantidad_caracteresespeciales']."' />";
          echo "<input type='hidden' id='cantidad_numeros' value='".$Obj['cantidad_numeros']."' />";
          echo "<input type='hidden' id='numero_preguntas' value='".$Obj['numero_preguntas']."' />";
          $preguntas = $Obj['numero_preguntas'];
        }
      ?>
      <fieldset>
        <div id="contenedorFormulario">
          <div class="row">
            <div class="span6">
              <label>C&eacute;dula del Usuario</label>
              <input tabindex=1 readonly type="text" name="cedula_usuario" id="cedula_usuario" value="<?php echo $_SESSION['user_cedula'];?>" size="10" placeholder="C&eacute;dula Usuario" class="campoTexto" required /> 
            </div>
            <div class="span6">
              <label>Nombre de Usuario</label>
              <input tabindex=2 readonly type="text" name="nombre_usuario" id="nombre_usuario" value="<?php echo trim($_SESSION['user_name']);?>" size="10" placeholder="Ingrese el Nombre de Usuario" class="campoTexto"/> 
            </div>
          </div> 
          <?php
            $pregunta = null;
            $respuesta = null;
            for($i=0;$i<$preguntas;$i++){
              $numero=$i+1;
              $pregunta = isset($_SESSION['user_pregunta'][$i]) && !empty($_SESSION['user_pregunta'][$i]) ? $_SESSION['user_pregunta'][$i] : null;
              $respuesta = isset($_SESSION['user_respuesta'][$i]) && !empty($_SESSION['user_respuesta'][$i]) ? $_SESSION['user_respuesta'][$i] : null;
              echo '<div class="row">
              <div class="span6">
              <label>Pregunta '.$numero.':</label>
              <textarea class="campoTexto" onKeyUp="this.value=this.value.toUpperCase()" name="pregunta[]" id="pregunta_'.$i.'" title="Ingrese la pregunta '.$numero.' de seguridad" required/>'.$pregunta.'</textarea>
              </div>
              <div class="span6">
              <label>Respuesta '.$numero.':</label>
              <textarea class="campoTexto" onKeyUp="this.value=this.value.toUpperCase()" name="respuesta[]" id="respuesta_'.$i.'" title="Ingrese la respuesta de la pregunta '.$numero.' de seguridad" required/>'.$respuesta.'</textarea>
              </div>
              </div>';
            }
          ?>
          <br><br>
          <?php if($_SESSION['user_estado']==3){?>
          <div class="controls">
            <div class="tooltip_pw"> <img src="../images/password_safe.png" width="50" height="50">&nbsp;Ayuda para contrase&ntilde;a segura 
              <span class='tooltiptext'>La contrase&ntilde;a debe contener:</br>
                * Al menos <?=$cantidad_letrasmayusculas?> letra(s) mayúscula(s).</br> 
                * Al menos <?=$cantidad_letrasminusculas?> letra(s) minúscula(s).</br> 
                * Al menos <?=$cantidad_numeros?> número(s).</br> 
                * Al menos <?=$cantidad_caracteresespeciales?> carácter(es) especial(es). pj: ` ~ ! @ # $ \% \^ & \* ( ) _ \| : ; \" \' < > , \. \? / </br> 
                * Una longitud que sea como mínimo <?=$longitud_minclave?> carácteres. </br> 
                * Una longitud que sea como máximo <?=$longitud_maxclave?> carácteres.
              </span>
            </div>
            <br>
            <div class="input-prepend">
              <label>Nueva Contrase&ntilde;a</label>
              <span class="add-on"><i class="icon-lock"></i></span>         
              <input name="nueva_contrasena" type="password" id="nueva_contrasena" minlength="<?php echo $longitud_minclave; ?>" maxlength="<?php echo $longitud_maxclave; ?>" placeholder="Nueva contrase&ntilde;a"  title="Nueva Contrase&ntilde;a"/>
              <input value="12345678" type="hidden" name="contrasena"/>                           
            </div>
            <div class="input-prepend">
              <label>Repetir Contrase&ntilde;a</label>
              <span class="add-on"><i class="icon-lock"></i></span>
              <input name="confirmar_contrasena" type="password" id="confirmar_contrasena" minlength="<?php echo $longitud_minclave; ?>" maxlength="<?php echo $longitud_maxclave; ?>" placeholder="Repita la Contrase&ntilde;a" title="Repita la Contrase&ntilde;a"/>
            </div>
            <input type="hidden" name="cambiar_clave_con_logeo" placeholder="Cambiar Clave" value="1" class="campoTexto"/>
          </div>
          <?php 
            } 
            echo '<tr><td colspan="2" class="'.$estatus.'" id="estatus_registro">'.$estatus.'</td></tr>'; 
            imprimir_boton($disabledRC,$disabledMD,$estatus,$servicios);
          ?>
        </div>
      </fieldset>
    </form>
  </body>
</html>