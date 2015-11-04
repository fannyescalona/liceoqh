<?php
$servicios='mi-perfil';
$disabledRC=null;
$disabledMD=null;
$estatus=null;
?>
<html lang="es">
<head>
  <!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->
  <script type="text/javascript" src="../js/uds_usuario.js"></script>
  <form  id="form" name="form" action="../controladores/cont_cambiar_clave.php" method="post" enctype="multipart/form-data">
  </head>
  <body >
   <fieldset>
    <div id="contenedorFormulario">
      <div class="row">
        <div class="span6">
          <label>C&eacute;dula del Usuario</label>
          <input readonly type="text" name="cedula_usuario" id="cedula_usuario" value="<?php echo $_SESSION['user_cedula'];?>" size="10" placeholder="C&eacute;dula Usuario" class="campoTexto" required /> 
          <label>Primera Pregunta:</label>
          <input  type="text" name="p1" id="p1" value="<?php echo trim($_SESSION['user_p1']);?>" size="80" placeholder="Ingrese la primera pregunta"class="campoTexto" required /> 
          <label>Segunda Pregunta:</label>
          <input type="text" name="p2" id="p2" value="<?php echo trim($_SESSION['user_p2']);?>" size="40" placeholder="Ingrese la segunda pregunta" class="campoTexto" required />
          
          <div class="input-prepend">
            <label>Nueva Contrase&ntilde;a</label>
            <span class="add-on"><i class="icon-lock"></i></span>         
            <input name="nueva_contrasena" type="password" id="nueva_contrasena"  placeholder="Nueva contrase&ntilde;a"  title="Nueva Contrase&ntilde;a"/>
            <input value="123456" type="hidden" name="contrasena"/>                           
          </div>

        </div>
        <div class="span6">
         <label>Nombre de Usuario</label>
         <input readonly type="text" name="nombre_usuario" id="nombre_usuario" value="<?php echo trim($_SESSION['user_name']);?>" size="10" placeholder="Ingrese el Nombre de Usuario" class="campoTexto"/> 
         <label>Primera Respuesta:</label>
         <input type="text" name="r1" id="r1" value="<?php echo trim($_SESSION['user_r1']);?>" size="40" placeholder="Ingrese respuesta de la primera pregunta" class="campoTexto" required /> 
         <label>Primera Respuesta:</label>
         <input type="text" name="r2" id="r2" value="<?php echo trim($_SESSION['user_r2']);?>" size="40" placeholder="Ingrese respuesta de la segunda pregunta" class="campoTexto" required /> 
         <div class="input-prepend">
          <label>Repetir Contrase&ntilde;a</label>
          <span class="add-on"><i class="icon-lock"></i></span>
          <input name="confirmar_contrasena" type="password" id="confirmar_contrasena" placeholder="Repita la Contrase&ntilde;a" title="Repita la Contrase&ntilde;a"/>
        </div>
      </div>
    </div>             
    



  </div>  
</div>  

<br><br>
<?php if($_SESSION['user_estado']==3){?>
<div class="controls">
  <input type="hidden" name="cambiar_clave_con_logeo" placeholder="Cambiar Clave" value="1" class="campoTexto"/>        
  <?php } ?>
  <?php echo '<tr><td colspan="2" class="'.$estatus.'" id="estatus_registro">'.$estatus.'</td></tr>'; ?>

  <?php
  imprimir_boton($disabledRC,$disabledMD,$estatus,$servicios);
  ?>  

</div>       

</fieldset>
</form>
<br>

</section>
</body>
</html>