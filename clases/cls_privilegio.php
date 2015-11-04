<?php
	echo '<div id="usuarioEntra">Bievenid@:</div>';
?>
<div class="accordion" id="leftMenu">
	<div class="accordion-group">
      	<div class="accordion-heading">
         	<a class="accordion-toggle" href="menu.php">
            	<i class="icon-home active"></i> Principal
       		</a>
		</div>
	</div>
	<div class="accordion-group">
		<div class="accordion-heading">
		    <a class="accordion-toggle" data-toggle="collapse" data-parent="#leftMenu" href="#collapseOne">
		    	<i class="icon-list-alt"></i> Ubicación
		  	</a>
		</div>
		<div id="collapseOne" class="accordion-body collapse" style="height: 0px; ">
			<div class="accordion-inner">
				<ul class="navi">
					<li><a href="../pais/pais.php"><i></i>País</a></li>
					<li><a href="../estado/estado.php"><i></i>Estado</a></li>
					<li><a href="../ciudad/ciudad.php"><i></i>Ciudad</a></li>
					<li><a href="../municipio/municipio.php"><i></i>Municipio</a></li>
					<li><a href="../parroquia/parroquia.php"><i></i>Parroquia</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="accordion-group">
		<div class="accordion-heading">
		    <a class="accordion-toggle" data-toggle="collapse" data-parent="#leftMenu" href="#collapseTwo">
		    	<i class="icon-list-alt"></i> Control Administrativo
		  	</a>
		</div>
		<div id="collapseTwo" class="accordion-body collapse" style="height: 0px; ">
			<div class="accordion-inner">
				<ul class="navi">
					<li><a href="../rol/rol.php"><i></i>Rol</a></li>
					<li><a href="../periodo/periodo.php"><i></i>Periodo</a></li>
					<li><a href="../materia/materia.php"><i></i>Materia</a></li>
					<li><a href="../ambiente/ambiente.php"><i></i>Aula de Clases</a></li>
					<li><a href="../bloque_hora/bloque_hora.php"><i></i>Bloque de Horas</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="accordion-group">
		<div class="accordion-heading">
		    <a class="accordion-toggle" data-toggle="collapse" data-parent="#leftMenu" href="#collapseThree">
		    	<i class="icon-list-alt"></i> Control de Estudios
		  	</a>
		</div>
		<div id="collapseThree" class="accordion-body collapse" style="height: 0px; ">
			<div class="accordion-inner">
				<ul class="navi">
					<li><a href="../universidad/universidad.php"><i></i>Universidad</a></li>
					<li><a href="../persona/persona.php"><i></i>Persona</a></li>
					<li><a href="../personal/personal.php"><i></i>Personal</a></li>
					<li><a href="../carrera/carrera.php"><i></i>Carrera</a></li>
					<li><a href="../ano_escolar/ano_escolar.php"><i></i>Año Escolar</a></li>
					<li><a href="../semestre/semestre.php"><i></i>Semestre</a></li>
					<li><a href="../seccion/seccion.php"><i></i>Sección</a></li>
					<li><a href="../preinscripcion/preinscripcion.php"><i></i>Pre-Inscripción</a></li>
					<li><a href="../inscripcion/inscripcion.php"><i></i>Inscripción</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="accordion-group">
		<div class="accordion-heading">
        	<a class="accordion-toggle" data-toggle="collapse" data-parent="#leftMenu" href="#collapseFour">
            	<i class="icon-cog"></i> Asignaciones
            </a>
        </div>
		<div id="collapseFour" class="accordion-body collapse" style="height: 0px; ">
			<div class="accordion-inner">
				<ul class="navi">
					<li><a href="../asigna_materia/asigna_materia.php"><i></i>Sección-Materias</a></li>
					<li><a href="../asigna_seccion/asigna_seccion.php"><i></i>Estudiantes-Sección</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="accordion-group">
		<div class="accordion-heading">
        	<a class="accordion-toggle" data-toggle="collapse" data-parent="#leftMenu" href="#collapseFive">
            	<i class="icon-cog"></i> Planificación de Horarios
            </a>
        </div>
		<div id="collapseFive" class="accordion-body collapse" style="height: 0px; ">
			<div class="accordion-inner">
				<ul class="navi">
					<li><a href="../horario_profesor/horario_profesor.php"><i></i>Horarios de Profesores</a></li>
					<li><a href="../horario_clase/horario_clase.php"><i></i>Horarios de Estudiantes</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="accordion-group">
    	<div class="accordion-heading">
        	<a class="accordion-toggle" data-toggle="collapse" data-parent="#leftMenu" href="#collapseSix">
            	<i class="icon-lock"></i> Seguridad
            </a>
        </div>
        <div id="collapseSix" class="accordion-body collapse" style="height: 0px; ">
            <div class="accordion-inner">
                <ul class="navi">
                    <li><a href="../usuario/usuario.php"><i></i>Registrar Usuario</a></li>
                    <li><a href="../clave/clave.php"><i></i>Cambiar Clave</a></li>
                </ul>
			</div>
		</div>
	</div>
</div>