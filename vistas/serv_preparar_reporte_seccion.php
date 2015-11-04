<div id="defensa_div" >    
	<div style="margin: auto 0px;">
		<form action="../pdf/pdf_horario_seccion.php"  method="post">
			<input type="hidden" id="formato" name="formato" value="horario_completo"/>
			<input type="hidden" id="mensaje" name="mensaje" value="<?php if(isset($_SESSION['mensaje']))echo $_SESSION['mensaje'];else echo 'no_asignado';?>"/>
			<?php
			include_once("../clases/class_horario.php");
			$bloque_horas=new horario();
			$turno='todos';
			$get_hora=$bloque_horas->bloque_hora($turno);
			$lapso_actual=$bloque_horas->lapso_actual();      
			?>
			<fieldset>
				<legend>Visualizar Horario de Secciones</legend>
				<input type="hidden" id="lapso" name="lapso" value="<?php echo $lapso_actual['cod_periodo'][0];?>" />
				<?php if(!isset($_GET['horario_completo'])){?>
				<input type="hidden" id="turno" name="turno" value="todos" />
				<label>Seleccionar la Sección</label>
				<select id="seccion" name="seccion" >
					<?php 
					include_once("../clases/class_html.php");
					$html=new Html();
					$id="seccion";
					$descripcion="nombre_seccion";
					$sql="select seccion,nombre_seccion from tseccion where cod_periodo='".$lapso_actual['cod_periodo'][0]."' and fecha_desactivacion IS NULL order by seccion";
		            //(!isset($_SESSION['seccion']))? $Seleccionado='null' : $Seleccionado=$codigo_seccion;
					$Seleccionado='null';
					$html->Generar_Opciones($sql,$id,$descripcion,$Seleccionado); 
					?>
				</select>
				<?php }?>
				<br/>				
				<input type="submit" class="boton"  value="Aceptar"/>
			</form>
		</fieldset>
	</div>

</div>

<?php if(isset($_SESSION['datos'])) unset($_SESSION['datos']);?>
