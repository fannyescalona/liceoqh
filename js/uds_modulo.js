function validar_formulario(param){
//para validar en caso que no retorne false
permitido=true;
valor0=document.getElementById('codigo_modulo').value;
valor=document.getElementById('descripcion').value;
valor2=document.getElementById('icono').value;
valor3=document.getElementById('orden').value;
if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
	if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
	alert('Ingrese el nombre del módulo')
	permitido=false;
	}
		
	else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el número de orden')
		permitido=false;
	}
	else if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
	alert('Seleccione un ícono')
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
