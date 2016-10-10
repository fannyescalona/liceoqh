$(document).ready(init);
function init(){
	$("#seccion").on("change",function(){
		var Data = {"operacion":"BuscarMSD","seccion":$(this).val(),"cedula_docente":$("#cedula_docente").val()};
		$.ajax({
	        url: '../controladores/cont_planevaluacion.php',
	        type: 'POST',
	        async: true,
	        data: Data,
	        dataType: "json",
	        success: function(resp){
	        	$("#materia").text(resp[0].materia);
	        	$("#codigo_materia").text(resp[0].codigo_materia);
	        	$("#codigo_msd").text(resp[0].codigo_msd);
	        },
	        error: function(jqXHR, textStatus, errorThrown){
	        	alert('¡Error al procesar la petición! '+textStatus+" "+errorThrown)
	        }
        });
	});
}

function validar_formulario(param){
	//para validar en caso q no return false
	permitido=true;

	valor=document.getElementById('seccion').value;
	valor1=document.getElementById('codigo_materia').value;
	valor2=document.getElementById('codigo_msd').value;
	valor3=document.getElementById('codigo_lapso').value;
	if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
		if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
			alert('Seleccione una sección')
			permitido=false;
		}
		else if(valor1.replace(/^\s+|\s+$/gi,"").length==0){
			alert('Seleccione una materia')
			permitido=false;
		}
		else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){
			alert('Seleccione un lapso')
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
