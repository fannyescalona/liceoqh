function validar_formulario(param){
//para validar en caso que no retorne false
permitido=true;

valor=document.getElementById('nombre_materia').value;
valor2=document.getElementById('cod_materia').value;
valor3=document.getElementById('unidad_curricular').value;
valor4=document.getElementById('tipo_materia').value;
if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
	if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el nombre de la materia')
		permitido=false;
	}else if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el código de la materia')
		permitido=false;
	}else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese la unidad curricular')
		permitido=false;
	}else if(valor4==0){ //para no permitir que se quede en blanco
		alert('Seleccione el tipo de materia')
		permitido=false;
	}
}
	
if(devuelve_boton(param)=="Desactivar"){
	if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
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
