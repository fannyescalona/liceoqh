$(document).ready(init);
function init(){
	$("#nacionalidad").change(function(){
	    var str = "";
	    $( "#nacionalidad option:selected" ).each(function() {
	      str += $( this ).text() + " ";
	      var Datos = {"operacion":"combo","filtro":str};
	      var Url = '../controladores/cont_persona.php';
	      comboDependiente(Datos,Url,$("#cod_parroquia"));
	    });
	});

	function BuscarParroquias(){
		var str = "";
		$( "#nacionalidad option:selected" ).each(function() {
	      str += $( this ).text() + " ";
	      var Datos = {"operacion":"combo","filtro":str};
	      var Url = '../controladores/cont_persona.php';
	      comboDependiente(Datos,Url,$("#cod_parroquia"));
	    });
	}

	BuscarParroquias();
}

function validar_formulario(param){
//para validar en caso q no return false
permitido=true;
valor=document.getElementById('rol').value;
valor0=document.getElementById('nacionalidad').value;
valor1=document.getElementById('cedula_persona').value;
valor2=document.getElementById('nombre_persona').value;
valor3=document.getElementById('apellido_persona').value;
valor4=document.getElementById('sexo').value;
valor5=document.getElementById('fecha_nacimiento').value;
valor6=document.getElementById('edocivil').value;
valor7=document.getElementById('tlf_fijo').value;
valor8=document.getElementById('tlf_movil').value;
valor9=document.getElementById('email').value;
valor10=document.getElementById('cod_parroquia').value;
valor11=document.getElementById('direccion').value;
valor12=document.getElementById('titulo').value;
if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
	if(valor==0){
		alert('Seleccione un rol')
		permitido=false;
	}else if(valor0==0){
		alert('Seleccione un país')
		permitido=false;
	}
	else if(valor1.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
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
	else if(valor7.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el teléfono de habitación')
		permitido=false;
	}
	else if(valor10==0){
		alert('Seleccione una parroquia')
		permitido=false;
	}
	else if(valor11.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese la dirección')
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
