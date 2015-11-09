$(document).ready(init);
function init(){
	//Búsquedas de los municipios por autocompletar.
	$('#lugar_nacimiento').autocomplete({
		source:'../autocomplete/parroquia.php', 
		minLength:1
	});

	/*$('#personal1').hide();
	$('#personal2').hide();

	$('#espersonalinstitucion').change(function(){
		if($(this).val()=="Y"){
			$('#personal1').show();
			$('#personal2').show();
		}
		else if($(this).val()=="N"){
			$('#personal1').hide();
			$('#personal2').hide();
		}
	});*/
}

function validar_formulario(param){
//para validar en caso q no return false
permitido=true;
valor1=document.getElementById('cedula').value;
valor2=document.getElementById('nombres').value;
valor3=document.getElementById('apellidos').value;
valor4=document.getElementById('genero').value;
valor5=document.getElementById('fecha_nacimiento').value;
valor6=document.getElementById('lugar_nacimiento').value;
valor7=document.getElementById('direccion').value;
valor8=document.getElementById('telefono_habitacion').value;
valor9=document.getElementById('telefono_movil').value;
valor10=document.getElementById('email').value;
valor11=document.getElementById('esrepresentante').value;
valor12=document.getElementById('espersonalinstitucion').value;
if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
	if(valor1.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese la cédula')
		permitido=false;
	}
	else if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el nombre')
		permitido=false;
	}
	else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el apellido')
		permitido=false;
	}
	else if(valor5.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese la fecha de nacimiento')
		permitido=false;
	}
	else if(valor6==0){
		alert('Seleccione un lugar de nacimiento')
		permitido=false;
	}
	else if(valor7.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese la dirección')
		permitido=false;
	}
	else if(valor8.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el teléfono de habitación')
		permitido=false;
	}
	else if(valor9.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el teléfono de movil')
		permitido=false;
	}
	else if(valor10.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el correo electrónico')
		permitido=false;
	}
	else if(valor11.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Seleccione si es representante')
		permitido=false;
	}
	else if(valor12.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Seleccione si es personal del plantel')
		permitido=false;
	}
}
	
if(devuelve_boton(param)=="Desactivar"){
	if(valor1.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('consultar antes desactivar')
		permitido=false;
		return false;
	}	
	if(!confirm("¿Esta seguro que desea desactivar este registro?"))
     return false
}

document.getElementById("operacion").value=devuelve_boton(param);
if(permitido==true)
document.getElementById("form").submit();
}
