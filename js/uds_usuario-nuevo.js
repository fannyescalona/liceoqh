$(document).ready(init);

function init(){
	//Búsquedas de los municipios por autocompletar.
	$('#cedula').autocomplete({
		source:'../autocomplete/persona.php', 
		minLength:1
	});
}

function validar_formulario(param){
	permitido=true;
	var ac_cedula_rif = /^[VGJE-vgje]\d{7,9}[_]{1}[\w-]/;
	document.getElementById('operacion').value=devuelve_boton(param);
	if(document.getElementById('cedula')){
	    if(document.getElementById('cedula').value.trim().length==0){
			alert("Debe seleccionar una persona")
			permitido=false;
	    }
	    else if(!ac_cedula_rif.test(document.getElementById('cedula').value.trim())){
			alert('Error en campo cédula de la persona','warning','<font style=\'color:red\'><p>Valor no válido. </br> El valor permitido es: </br> Cédula / RIF segido de underscore ( _ ) segido del Nombre / Razón Social. </br> Ejemplo: V000000000_NOMBRE DE PERSONA</p></font>');
			permitido=false;
	    }
	}

	if(document.getElementById('perfil')){
		if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
	    if(document.getElementById('perfil').value.trim()=="" || document.getElementById('perfil').value.trim()=="null"){
	     alert("Debe seleccionar el perfil del usuario")
			permitido=false;
	     }
	   }
	}
	if(devuelve_boton(param)=="Desactivar"){
		if(document.getElementById('perfil').value.trim().replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
			alert('consultar antes desactivar')
			permitido=false;
		}	

		if(!confirm("¿Esta seguro que desea desactivar este registro?"))
			return false
	}
	if(permitido==true)
		document.getElementById("form").submit();
}

String.prototype.trim = function() { return this.replace(/^\s+|\s+$/g, ""); }