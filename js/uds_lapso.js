$(document).ready(function(){
	$('#codigo_ano_academico').on("change",function(){
		var Data = {"operacion":"BuscarFechas","codigo_ano_academico":$(this).val()};
		$.ajax({
	        url: '../controladores/cont_ano_academico.php',
	        type: 'POST',
	        async: true,
	        data: Data,
	        dataType: "json",
	        success: function(resp){
	        	$("#fecha_inicio").datepicker("option", "minDate", resp[0].fecha_inicio);
	        	$("#fecha_inicio").datepicker("option", "maxDate", resp[0].fecha_fin);
	        	$("#fecha_fin").datepicker("option", "maxDate", resp[0].fecha_fin);
	        },
	        error: function(jqXHR, textStatus, errorThrown){
	        	alert('¡Error al procesar la petición! '+textStatus+" "+errorThrown)
	        }
        });
	});

	if($('#codigo_ano_academico').val()!=""){
		var Data = {"operacion":"BuscarFechas","codigo_ano_academico":$('#codigo_ano_academico').val()};
		$.ajax({
	        url: '../controladores/cont_ano_academico.php',
	        type: 'POST',
	        async: true,
	        data: Data,
	        dataType: "json",
	        success: function(resp){
	        	if($('fecha_inicio').val()!=""){
		        	$("#fecha_inicio").datepicker("option", "minDate", $('fecha_inicio').val());
		        	$("#fecha_inicio").datepicker("option", "maxDate", $('fecha_fin').val());
	        	}
	        	else
	        	{
		        	$("#fecha_inicio").datepicker("option", "minDate", resp[0].fecha_inicio);
		        	$("#fecha_inicio").datepicker("option", "maxDate", resp[0].fecha_fin);	
	        	}
	        	if($('fecha_fin').val()!=""){
	        		$("#fecha_fin").datepicker("option", "maxDate", $('fecha_fin').val());
	        	}
	        	else{
	        		$("#fecha_fin").datepicker("option", "maxDate", resp[0].fecha_fin);
	        	}
	        },
	        error: function(jqXHR, textStatus, errorThrown){
	        	alert('¡Error al procesar la petición! '+textStatus+" "+errorThrown)
	        }
        });
	}
});

function validar_formulario(param){
//para validar en caso q no return false
permitido=true;
valor=document.getElementById('codigo_lapso').value;
valor1=document.getElementById('descripcion').value;
valor2=document.getElementById('fecha_inicio').value;
valor3=document.getElementById('fecha_fin').value;
valor4=document.getElementById('codigo_ano_academico').value;
if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
	if(valor1.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el Lapso')
		permitido=false;
	}else if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese la Fecha Inicio')
		permitido=false;
	}else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Ingrese la Fecha Fin')
		permitido=false;
	}else if(valor4==0){
		alert('Seleccione un Año')
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
