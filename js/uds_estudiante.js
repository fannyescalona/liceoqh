$(document).ready(init);
function init(){
	//Búsquedas de las parroquias por autocompletar.
	$('#lugar_nacimiento').autocomplete({
		source:'../autocomplete/parroquia.php', 
		minLength:1
	});
	//Búsquedas de docente por autocompletar.
	$('#cedula_docente').autocomplete({
		source:'../autocomplete/docente.php', 
		minLength:1
	});
	//Búsquedas de docente por autocompletar.
	$('#seccion').autocomplete({
		source:'../autocomplete/seccion.php', 
		minLength:1
	});
	//Búsquedas de docente por autocompletar.
	$('#cedula_representante').autocomplete({
		source:'../autocomplete/rep_estudiante.php', 
		minLength:1
	});
	//Búsquedas de docente por autocompletar.
	$('#codigo_parentesco').autocomplete({
		source:'../autocomplete/parentesco.php', 
		minLength:1
	});
}

function validar_formulario(param){
	//para validar en caso q no return false
	permitido=true;
	valor0=document.getElementById('cedula_docente').value;
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
	valor11=document.getElementById('cedula_representante').value;
	valor12=document.getElementById('codigo_parentesco').value;
	valor13=document.getElementById('seccion').value;
	valor14=document.getElementById('codigo_plantel').value;
	//Utilizamos una expresion regular para validar email
	var regex = /[\w-\.]{2,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
	if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
		if(valor0.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese la cédula del docente')
			permitido=false;
		}
		else if(valor13.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese la sección a la cual asignará al estudiante')
			permitido=false;
		}
		else if(valor1.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese la cédula del estudiante')
			permitido=false;
		}
		else if(valor1.replace(/^\s+|\s+$/gi,"").length<=6){ //para no permitir que se quede en blanco
			alert('La cédula ingresada debe ser mayor a 5 digitos')
			permitido=false;
		}
		else if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el nombre del estudiante')
			permitido=false;
		}
		else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el apellido del estudiante')
			permitido=false;
		}
		else if(valor5.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese la fecha de nacimiento del estudiante')
			permitido=false;
		}
		else if(valor6==0){
			alert('Seleccione un lugar de nacimiento del estudiante')
			permitido=false;
		}
		else if(valor7.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese la dirección del estudiante')
			permitido=false;
		}
		/*else if(valor8.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el teléfono de habitación del estudiante')
			permitido=false;
		}
		else if(valor9.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el teléfono de movil del estudiante')
			permitido=false;
		}
		else if(valor10.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el correo electrónico del estudiante')
			permitido=false;
		}*/
		else if(valor10.replace(/^\s+|\s+$/gi,"").length!=0 && !regex.test(valor10.trim())){
			alert('La direccion de correo electrónico no es válida, la forma correcta sería por ejemplo pedroperez@gmail.com');
			permitido = false;
		}
		else if(valor11.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese la cédula del representante')
			permitido=false;
		}
		else if(valor12.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el parentesco del representante con el estudiante')
			permitido=false;
		}
		else if(valor14.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el plantel de procedencia del estudiante')
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