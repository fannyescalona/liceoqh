$(document).ready(function(){
	if($("#materia_compuestaN").attr('checked'))
		$("#materia_oculta").hide();
	if($("#materia_compuestaY").attr('checked'))
		$("#materia_oculta").show();

	$("input[name=materia_compuesta]").click(function(){
		if($('input:radio[name=materia_compuesta]:checked').val()=="N"){
			$("#materia_oculta").hide();
			$("#materia_compuesta_oculta").val("N");
		}
		else{
			$("#materia_oculta").show();
			$("#materia_compuesta_oculta").val("Y");
		}
	});
});

function validar_formulario(param){
//para validar en caso que no retorne false
permitido=true;

valor2=document.getElementById('codigo_materia').value;
valor=document.getElementById('descripcion').value;
valor3=document.getElementById('unidad_curricular').value;
valor4=document.getElementById('grado_escolar').value;
valor5=document.getElementById('materia_compuesta_oculta').value;
valor6=document.getElementById('codigo_materia_padre').value;
valor7=document.getElementById('hora_academica').value;
valor8=document.getElementById('hora_minima_materia').value;
valor9=document.getElementById('hora_maxima_materia').value;
if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
	if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el código de la materia')
		permitido=false;
	}else if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el nombre de la materia')
		permitido=false;
	
	}else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese la unidad curricular')
		permitido=false;
	}else if(valor4.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Seleccione el grado escolar')
		permitido=false;
	}else if(valor5=="Y" && valor6.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Seleccione la materia padre')
		permitido=false;
	}
	else if(parseInt(valor7) < parseInt(valor8) || parseInt(valor7) > parseInt(valor9)){
		alert('Las horas academicas deben estar entre '+valor8+' y '+valor9);
		permitido = false;
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
