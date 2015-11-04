<article>
   <div id="cambiar_clave" class="efecto2">
     <?php if(isset($_SESSION['pregunta_respuesta']) and $_SESSION['pregunta_respuesta']==3){ ?>
	                 <form action="../controladores/cont_cambiar_clave.php" method='post' id="form_interior" name="form_interior" >
                        <input type="hidden" name="procedencia" value="<?php if(isset($_POST['pagina'])) echo 0; else echo 1;?>" placeholder="" class="campoTexto"/>
	                    <input title="Clave actual" type="hidden" id="contrasena" name="contrasena" size="25" value="<?php echo $_SESSION['user_password'];?>" placeholder="Ingrese su Clave Actual" class="campoTexto" required/>
					    <input type="password" id="nueva_contrasena" name="nueva_contrasena" size="25" placeholder="Ingrese la nueva clave" title="Ingrese la nueva clave" placeholder="Ingrese la Nueva Clave" class="campoTexto"required/>
					    <input type="password" id="confirmar_contrasena" name="confirmar_contrasena" size="25" title="Confirme su nueva clave" placeholder="Confirmar Nueva Clave" class="campoTexto"required/>
						<input type="submit" value="Aceptar" class="boton" name="bt_cambiar_clave_sin_login" id="bt_cambiar_clave" />
					    <input type="hidden" value="<?php echo $_SESSION['pregunta_respuesta'];?>" name="accion"/>
			     <strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong>
      </div>    
      <br>
      <?php echo '<p class="'.$estatus.'" id="estatus_registro">'.$estatus.'</p>'; ?>
      <?php
      imprimir_boton($disabledRC,$disabledMD,$estatus,$servicios);
     ?>   
    </fieldset> 
</form>
      <br>
     <?php }else{?>
	 
	 <form action="../controladores/cont_recuperar_clave.php" method='post' style="padding:3em">
	 
       <label> <?php if(@$_SESSION['pregunta_respuesta']==0) echo "Nombre usuario";
        else if($_SESSION['pregunta_respuesta']==1){
		echo '¿'.ucfirst($_SESSION['user_p1']).'?';
		}else if($_SESSION['pregunta_respuesta']==2){
				echo '¿'.ucfirst($_SESSION['user_p2']).'?';
		}
	   ?></label><br>
	   <input type="text" id='user_name' name='user_name' title="Ingrese nombre de usuario a cambiar la clave" placeholder="Ingrese nombre de usuario a cambiar la clave" class="campoTexto"required/> /><br>
	   <input type="submit" class="boton"/>
	   <input type="hidden" value="<?php echo $_SESSION['pregunta_respuesta'];?>" name="accion"/>
	 </form>
	      <?php } unset($_SESSION['pregunta_respuesta']);?>

   </div>
</article>
<?php if(@$_SESSION['pregunta_respuesta']==0 && isset($_GET['cambiar_clave'])){
       echo "
         <script>
            document.forms[0].user_name.value='".$_SESSION['user_name']."'
            document.forms[0].submit();
        </script>";
	}?>