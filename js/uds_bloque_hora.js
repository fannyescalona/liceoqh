function validar_formulario(param){
	//para validar en caso q no return false
	permitido=true;

	valor=document.getElementById('descripcion').value;
	valor2=document.getElementById('codigo_bloque_hora').value;
	valor3=document.getElementById('hora_inicio').value;
	valor4=document.getElementById('hora_fin').value;
	valor5=document.getElementById('turno').value;
	valor6=document.getElementById('hora_academica').value;
	if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
		if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
			alert('Ingrese el nombre del bloque de hora')
			permitido=false;
		}
		else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
			alert('Ingrese la hora de inicio del bloque de hora')
			permitido=false;
		}
		else if(valor4.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
			alert('Ingrese la hora de salida del bloque de hora')
			permitido=false;
		}
		else if(valor6.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
			alert('Ingrese la cantidad de horas académicas que equivale el bloque de hora')
			permitido=false;
		}
		else if(valor3 > valor4){ //para no permitir que se queda en blanco
			alert('La hora de inicio no puede ser mayor a la hora de salida')
			permitido=false;
		}
		else if(valor5.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
			alert('Seleccione el turno del bloque de hora')
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