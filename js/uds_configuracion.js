function validar_formulario(param){
//para validar en caso q no return false
permitido=true;

valor=document.getElementById('codigo_configuracion').value;
valor1=document.getElementById('descripcion').value;
valor2=document.getElementById('longitud_minclave').value;
valor3=document.getElementById('longitud_maxclave').value;
valor4=document.getElementById('cantidad_letrasmayusculas').value;
valor5=document.getElementById('cantidad_letrasminusculas').value;
valor6=document.getElementById('cantidad_numeros').value;
valor7=document.getElementById('cantidad_caracteresespeciales').value;
valor8=document.getElementById('dias_vigenciaclave').value;
valor9=document.getElementById('dias_aviso').value;
valor10=document.getElementById('numero_ultimasclaves').value;
valor11=document.getElementById('intentos_fallidos').value;
valor12=document.getElementById('numero_preguntas').value;
valor13=document.getElementById('numero_preguntasaresponder').value;
if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
	if(valor1.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
		alert('Ingrese el nombre de la configuración del perfil');
		permitido=false;
	}
	else if(valor2.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Ingrese el longitud mínima para la clave');
		permitido=false;
	}
	else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Ingrese el longitud máxima para la clave');
		permitido=false;
	}
	else if(valor4.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Ingrese la cantidad de letras minúsculas para la clave');
		permitido=false;
	}
	else if(valor5.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Ingrese la cantidad de letras mayúsculas para la clave');
		permitido=false;
	}
	else if(valor6.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Ingrese la cantidad de dígitos para la clave');
		permitido=false;
	}
	else if(valor7.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Ingrese la cantidad de carácteres especiales para la clave');
		permitido=false;
	}
	else if(valor8.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Ingrese la cantidad de días de vigencia de la clave');
		permitido=false;
	}
	else if(valor9.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Ingrese la cantidad de días de aviso de expiración de la clave');
		permitido=false;
	}
	else if(valor10.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Ingrese la cantidad de últimas claves a validar');
		permitido=false;
	}
	else if(valor11.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Ingrese la cantidad de intentos fallidos de acceso');
		permitido=false;
	}
	else if(valor12.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Ingrese la cantidad de preguntas secretas');
		permitido=false;
	}
	else if(valor13.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Ingrese la cantidad de preguntas secretas a responder');
		permitido=false;
	}
}
	
if(devuelve_boton(param)=="Desactivar"){
	if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('consultar antes desactivar');
		permitido=false;
		return false;
	}
    if(!confirm("¿Esta seguro que desea desactivar este registro?"));
     return false
}

document.getElementById("operacion").value=devuelve_boton(param);
if(permitido==true)
document.getElementById("form").submit();
}
