function validar_formulario(param){
//para validar en caso q no return false
permitido=true;

valor=document.getElementById('seccion').value;
valor0=document.getElementById('descripcion').value;
valor1=document.getElementById('turno').value;
valor2=document.getElementById('capacidad_min').value;
valor3=document.getElementById('capacidad_max').value;
if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
	if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el número de la sección')
		permitido=false;
	}else if(valor0.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el nombre de la sección')
		permitido=false;
		}else if(valor1==0){
		alert('Seleccione un Turno')
		permitido=false;
	}else if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese la capacidad mínima de la sección')
		permitido=false;
	}else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese la capacidad máxima de la sección')
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
