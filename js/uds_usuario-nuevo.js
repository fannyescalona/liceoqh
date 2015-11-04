function validar_formulario(param){
	permitido=true;
document.getElementById('operacion').value=devuelve_boton(param);
if(document.getElementById('cedula')){
    if(document.getElementById('cedula').value.trim().length!==8){
     alert("la cédula debe tener 8 caracteres")
     permitido=false;
     return false;
     }
}

if(document.getElementById('perfil')){
	if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
    if(document.getElementById('perfil').value.trim()=="" || document.getElementById('perfil').value.trim()=="null"){
     alert("selecciona el perfil del usuario")
		permitido=false;     
     return false;
     }
   }
}
if(devuelve_boton(param)=="Desactivar"){
	if(document.getElementById('perfil').value.trim().replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
		alert('consultar antes desactivar')
		permitido=false;
		return false;
	}	

	if(!confirm("¿Esta seguro que desea desactivar este registro?"))
		return false
}
if(permitido==true)
document.getElementById("form").submit();
}

String.prototype.trim = function() { return this.replace(/^\s+|\s+$/g, ""); }