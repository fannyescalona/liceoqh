$(document).ready(init);
function init(){
	$("#seccion").on("change",function(){
		var Combo = {"operacion":"ComboMateria","seccion":$(this).val(),"cedula_docente":$("#cedula_docente").val()};
		comboDependiente(Combo,"../controladores/cont_materia.php",$("#codigo_materia"),['materia']);
	});

	$("#codigo_materia").on("change",function(){
		var Data = {"operacion":"BuscarMSD","seccion":$("#seccion").val(),"cedula_docente":$("#cedula_docente").val(),"codigo_materia":$(this).val()};
		$.ajax({
	        url: '../controladores/cont_planevaluacion.php',
	        type: 'POST',
	        async: true,
	        data: Data,
	        dataType: "json",
	        success: function(resp){
	        	$("#codigo_msd").val(resp[0].codigo_msd);
	        	$("#codigo_lapso").val("0");
			    $('#tablaAsignacionNotas thead').remove();
			    $('#tablaAsignacionNotas tbody').remove();
	        },
	        error: function(jqXHR, textStatus, errorThrown){
	        	alert('¡Error al procesar la petición! '+textStatus+" "+errorThrown)
	        }
        });
	});

	$("#codigo_lapso").on("change",function(){
		if($("#codigo_msd").val()!=""){
			var Data = {"operacion":"BuscarDatosNotas","codigo_msd":$("#codigo_msd").val(),"codigo_lapso":$("#codigo_lapso").val()};
			$.ajax({
		        url: '../controladores/cont_seccion.php',
		        type: 'POST',
		        async: true,
		        data: Data,
		        dataType: "json",
		        success: function(resp){
		        	if(resp[0].msj == undefined){
			        	$('#tablaAsignacionNotas thead').remove();
			        	$('#tablaAsignacionNotas tbody').remove();
			        	var result = pivot(resp, ['codigo_plan_evaluacion','cedula_estudiante','estudiante','notaobtenida'], ['unidad_evaluada'], {});
			        	//	Print THead for tablaAsignacionNotas
			        	$('#tablaAsignacionNotas').append("<thead><tr>");
			        	$('#tablaAsignacionNotas > thead').append("<td><label class='control-label' align='center'>ESTUDIANTE</label></td>");
			        	for(var i=0; i<result.columnHeaders.length;i++){
			        		$('#tablaAsignacionNotas > thead').append("<td><label class='control-label' align='center'>"+result.columnHeaders[i]+"</label></td>");
			        	}
			        	$('#tablaAsignacionNotas > thead').append("<td><label class='control-label' align='center'>PROM. NOTA ESTIMADA</label></td>");
			        	$('#tablaAsignacionNotas').append("</tr></thead>");
			        	//	End Print THead for tablaAsignacionNotas
			        	//	Print TBody for tablaAsignacionNotas
			        	$('#tablaAsignacionNotas').append("<tbody>");
			        	var cedula_estudiante = "N/A";
			        	var total = 0;
			        	var contador = 0;
			        	for(var j=0; j<resp.length;j++){
			        		//	Cuando es la misma fila simplemente escribo en las columnas correspondientes la nota
			        		if(cedula_estudiante == resp[j].cedula_estudiante){
				        		contador++;
				        		total += parseFloat(resp[j].notaobtenida); 
			        			$('#tr_'+cedula_estudiante).append("<td><input type='hidden' name='codigos_plan_evaluaciones["+cedula_estudiante+"][]' value='"+resp[j].codigo_plan_evaluacion+"' /><input style='width: 80px;' type='number' name='notas["+cedula_estudiante+"][]' min='"+$('#nota_minima').val()+"' max='"+$('#nota_maxima').val()+"' value='"+resp[j].notaobtenida+"'/></td>");
			        		}
			        		//	Cuando cambia la fila, cierro la anterior y abro una nueva
			        		if(cedula_estudiante != 'N/A' && cedula_estudiante != resp[j].cedula_estudiante){
			        			total = total / contador;
			        			//	Redondeamos a un numero entero
			        			total = Number((total).toFixed(0));
			        			$('#tr_'+cedula_estudiante).append("<td><label style='width: 100px;' align='right' class='control-label'>"+total+"</label></td>");
			        			$('#tablaAsignacionNotas > tbody').append("</tr>");
			        			total = 0;
			        			contador = 0;
				        		contador++;
				        		total += parseFloat(resp[j].notaobtenida); 
			        			cedula_estudiante = resp[j].cedula_estudiante;
			        			$('#tablaAsignacionNotas > tbody').append("<tr id='tr_"+cedula_estudiante+"'>");
			        			$('#tr_'+cedula_estudiante).append("<td><label style='width: 200px;' class='control-label'><input type='hidden' name='estudiantes[]' value='"+cedula_estudiante+"'>"+resp[j].estudiante+"</label></td>");
			        			$('#tr_'+cedula_estudiante).append("<td><input type='hidden' name='codigos_plan_evaluaciones["+cedula_estudiante+"][]' value='"+resp[j].codigo_plan_evaluacion+"' /><input style='width: 80px;' type='number' name='notas["+cedula_estudiante+"][]' min='"+$('#nota_minima').val()+"' max='"+$('#nota_maxima').val()+"' value='"+resp[j].notaobtenida+"'/></td>");
			        		}
			        		//	Cuando es la primera vez que entra en el ciclo, creo la fila y escribo los datos del estudiante.
			        		if(cedula_estudiante == 'N/A' && cedula_estudiante != resp[j].cedula_estudiante){
			        			cedula_estudiante = resp[j].cedula_estudiante;
				        		contador++;
				        		total += parseFloat(resp[j].notaobtenida); 
			        			$('#tablaAsignacionNotas > tbody').append("<tr id='tr_"+cedula_estudiante+"'>");
			        			$('#tr_'+cedula_estudiante).append("<td><label style='width: 200px;' class='control-label'><input type='hidden' name='estudiantes[]' value='"+cedula_estudiante+"'>"+resp[j].estudiante+"</label></td>");
			        			$('#tr_'+cedula_estudiante).append("<td><input type='hidden' name='codigos_plan_evaluaciones["+cedula_estudiante+"][]' value='"+resp[j].codigo_plan_evaluacion+"' /><input style='width: 80px;' type='number' name='notas["+cedula_estudiante+"][]' min='"+$('#nota_minima').val()+"' max='"+$('#nota_maxima').val()+"' value='"+resp[j].notaobtenida+"'/></td>");
			        		}
			        	}
			        	//	Cierro la ultima fila creada
		    			total = total / contador;
	        			//	Redondeamos a un numero entero
	        			total = Number((total).toFixed(0));
		    			$('#tr_'+cedula_estudiante).append("<td><label style='width: 100px;' align='right' class='control-label'>"+total+"</label></td>");
			        	$('#tablaAsignacionNotas > tbody').append("</tr>");
			        	$('#tablaAsignacionNotas').append("</tbody>");
			        	//	End Print TBody for tablaAsignacionNotas
			        	$('#tablaAsignacionNotas').show();
		        	}else{
			        	$('#tablaAsignacionNotas thead').remove();
			        	$('#tablaAsignacionNotas tbody').remove();
		        		alert(resp[0].msj,'warning');
		        	}
		        },
		        error: function(jqXHR, textStatus, errorThrown){
		        	alert('¡Error al procesar la petición! '+textStatus+" "+errorThrown)
		        }
	        });
		}
		else{
			alert("¡Debe seleccionar una sección y una materia para cargar el plan de evaluación!");
		}
	});
}