function validar_formulario(param){

document.getElementById('operacion').value=devuelve_boton(param);
if(document.getElementById('cedula')){
 ci=document.form.cedula.value.trim();
}


if(document.getElementById('cedula_usuario')){
 ci=document.form.cedula_usuario.value.trim();
}


if(document.getElementById('cedula_usuario')){
nb=document.form.nombre_usuario.value.trim();
p1=document.form.p1.value.trim();
p2=document.form.p2.value.trim();
r1=document.form.r1.value.trim();
r2=document.form.r2.value.trim();
}


if(document.getElementById('cedula_usuario')){

if(nb.length==0){
alert("el campo de la cédula está vació!","center");
return false;
}

if(nb.length<6){
alert("El nombre de usuario de tener minimum 6 caracteres!");
return false;
}

if(p1.length==0){
alert("el campo de la pregunta 1 está vacío!");
return false;
}

if(r1.length==0){
alert("el campo de la respuesta 1 está vacío!");
return false;
}

if(p2.length==0){
alert("el campo de la pregunta 2 está vacío!");
return false;
}

if(p2==p1){
alert("las preguntas deben ser diferentes");
return false;
}


if(r2.length==0){
alert("el campo de la respuesta 2 está vacío!");
return false;
}

}

if(document.getElementById('nueva_contrasena')){
  if(validar_contrasena()==false)
  return false;
  document.getElementById("form").submit();
}

document.getElementById("form").submit();
return true;
}


		function validar_contrasena(){
           if(document.getElementById('nueva_contrasena').value.replace(/^\s+|\s+$/g, "").length==0){
	                  alert("Ingrese la contrase\u00f1a!.");
	          return false;
	        }
			if(document.getElementById('nueva_contrasena').value.replace(/^\s+|\s+$/g, "").length<6){
	          alert("la contrase\u00f1a debe tener m\u00ednimo 6 caracteres!.");
	          return false;
	        }
			 if(!(/(?=^.{6,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/.test(document.getElementById('nueva_contrasena').value))){
 alert("<div style='text-align:left;'>la contrase\u00f1a debe tener:</br> * Al menos una letra may\u00fascula.</br> * Al menos una letra min\u00fascula.</br> * Al menos un n\u00famero o caracter especial.</br> * Una longitud que sea como m\u00ednimo 6 caracteres.</div>");
	          return false;
	        }

			if(document.getElementById('nueva_contrasena').value.replace(/^\s+|\s+$/g, "")!=document.getElementById('confirmar_contrasena').value.replace(/^\s+|\s+$/g,"")){
	             alert("las contrase\u00f1as no coinciden!.");
	          return false;
	        }
             
              return true;
			}

String.prototype.trim = function() { return this.replace(/^\s+|\s+$/g, ""); };// para cortar espacio en blanco en un cadena similar a trim()  php y mysql
