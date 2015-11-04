<?php
	echo '<div id="usuarioEntra">Bievenid@: '.$_SESSION['fullname_user'].'</div>';
?>
<div class="accordion" id="leftMenu">
	<div class="accordion-group">
      	<div class="accordion-heading">
         	<a class="accordion-toggle" href="./">
            	<i class="icon-home active"></i> Principal
       		</a>
		</div>
	</div>
	<?php  
	require_once("../clases/class_perfil.php");
	$perfil=new Perfil();
	$perfil->codigo_perfil($_SESSION['user_codigo_perfil']);
	$a=$perfil->IMPRIMIR_MODULOS();
	for($x=0;$x<count($a);$x++) {
		$titulo=ucfirst(strtolower($a[$x]['nombre_modulo']));
	echo '	
		<div class="accordion-group">
			<div class="accordion-heading">
			    <a onclick=document.getElementById("titulo-menu").innerHTML="'.$titulo.'" class="accordion-toggle" data-toggle="collapse" data-parent="#leftMenu" href="#collapse_'.$x.'">
			    	<i class="'.strtolower($a[$x]['icono']).'"></i> '.ucfirst(strtolower($a[$x]['nombre_modulo'])).'
			  	</a>
			</div>
			<div id="collapse_'.$x.'" class="accordion-body collapse" style="height: 0px; ">
				<div class="accordion-inner">
					<ul class="navi">';
					$perfil->codigo_modulo($a[$x]['codigo_modulo']);
					$b=$perfil->IMPRIMIR_SERVICIOS();
					for($y=0;$y<count($b);$y++) {
					echo 	'<li><a href="?'.strtolower($b[$y]['url']).'"><i></i>'.ucfirst(strtolower($b[$y]['nombre_servicios'])).'</a></li>';
					}
				  echo '</ul>
				</div>
			</div>
		</div> ';
		}
		?>
</div>
