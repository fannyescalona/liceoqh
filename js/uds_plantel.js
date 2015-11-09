$(document).ready(init);
function init(){
	//Búsquedas de los municipios por autocompletar.
	$('#codigo_municipio').autocomplete({
		source:'../autocomplete/municipio.php', 
		minLength:1
	});
}

function validar_formulario(param){
	//para validar en caso que no retorne false
	permitido=true;

	valor=document.getElementById('nombre').value;
	valor2=document.getElementById('codigo_plantel').value;
	valor3=document.getElementById('direccion').value;
	valor4=document.getElementById('telefono_habitacion').value;
	valor5=document.getElementById('localidad').value;
	valor6=document.getElementById('codigo_municipio').value;
	if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
		if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el nombre del plantel educativo')
		permitido=false;
		}	
		else if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el código del plantel educativo')
		permitido=false;
		}	
		else if(valor3==0){ //para no permitir que se quede en blanco
		alert('Ingrese la dirección del plantel educativo')
		permitido=false;
		}
		else if(valor4==0){ //para no permitir que se quede en blanco
		alert('Ingrese el telefóno de habitación del plantel educativo')
		permitido=false;
		}
		else if(valor6==0){ //para no permitir que se quede en blanco
		alert('Seleccione el municipio donde pertenece el plantel educativo')
		permitido=false;
		}
	}

	if(devuelve_boton(param)=="Desactivar"){
		
	      if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
	alert('consultar antes desactivar')
	permitido=false;
	return false;
	}	
		
	    if(!confirm("Esta seguro que desea desactivar este registro"))
	     return false
	}

	document.getElementById("operacion").value=devuelve_boton(param);
	if(permitido==true)
	document.getElementById("form").submit();
	}