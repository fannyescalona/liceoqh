function validar_formulario(param){
//para validar en caso q no return false
permitido=true;
valor=document.getElementById('codigo_inscripcion').value;
valor1=document.getElementById('descripcion').value;
valor2=document.getElementById('fecha_inicio').value;
valor3=document.getElementById('fecha_fin').value;
valor4=document.getElementById('fecha_cierre').value;
if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
	if(valor1.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el Nombre del Período de Inscripción')
		permitido=false;
	}else if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese la Fecha Inicio')
		permitido=false;
	}else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Ingrese la Fecha Fin')
		permitido=false;
	}else if(valor4.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Ingrese la Fecha Cierre')
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
