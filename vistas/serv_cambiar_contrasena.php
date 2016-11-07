<script type="text/javascript" src="../js/uds_usuario.js"></script>
<?php
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
		echo "<input type='hidden' id='longitud_minclave' value='".$Obj['longitud_minclave']."' />";
		echo "<input type='hidden' id='longitud_maxclave' value='".$Obj['longitud_maxclave']."' />";
		echo "<input type='hidden' id='cantidad_letrasmayusculas' value='".$Obj['cantidad_letrasmayusculas']."' />";
		echo "<input type='hidden' id='cantidad_letrasminusculas' value='".$Obj['cantidad_letrasminusculas']."' />";
		echo "<input type='hidden' id='cantidad_caracteresespeciales' value='".$Obj['cantidad_caracteresespeciales']."' />";
		echo "<input type='hidden' id='cantidad_numeros' value='".$Obj['cantidad_numeros']."' />";
	}
?>
<article>
	<form action="../controladores/cont_cambiar_clave.php" method='post' id="form_interior" name="form_interior" onsubmit='return validar_contrasena()'>
		<fieldset>
			<legend>Cambiar Contrase&ntilde;a</legend>
			<div id="contenedorFormulario">
				<label>Contrase&ntilde;a Actual:</label>
				<input type="hidden" name="cambiar_clave_con_logeo"/>
				<input title="Clave actual" type="password" id="contrasena" name="contrasena" size="25" value="<?php echo $_SESSION['user_password'];?>" class="campoTexto" readonly required/>
				<label>Contrase&ntilde;a Nueva:</label>
				<input type="password" id="nueva_contrasena" minlength="<?php echo $longitud_minclave; ?>" maxlength="<?php echo $longitud_maxclave; ?>" name="nueva_contrasena" size="25" placeholder="Ingrese la nueva clave" title="Ingrese la nueva clave" placeholder="Ingrese la Nueva Clave" class="campoTexto"required/>
				<label>Confirmar Contrase&ntilde;a:</label>
				<input type="password" id="confirmar_contrasena" minlength="<?php echo $longitud_minclave; ?>" maxlength="<?php echo $longitud_maxclave; ?>" name="confirmar_contrasena" size="25" title="Confirme su nueva clave" placeholder="Confirmar Nueva Clave" class="campoTexto"required/>
				<strong class="obligatorio">Los campos resaltados en rojo son obligatorios</strong><br />
				<input type="submit" value="Aceptar" class="boton" name="bt_cambiar_clave_sin_login" id="bt_cambiar_clave" />
			</div>
		</fieldset> 
	</form>
</article>