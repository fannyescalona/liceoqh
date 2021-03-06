var HoraAsignado=0;
var HoraTotal=0;
var HoraLibre=0;
var HoraMAsignado=0;
var HoraMTotal=0;
var HoraMLibre=0;
var indice=0;
var indice_asignado=0;

$(document).on("ready",Principal);

function cargar_hora_maxima(elegido){
	elegido1=$("#codigo_ano_academico").val();
	var parametros={"profesor":elegido,"codigo_ano_academico": elegido1,"combo":"horas"};
	$.ajax({
		data: 	parametros,
		url: 	'../controladores/control_ajax2.php',
		type: 	'post',
		success: 	function(response){
			sacar_valor=$.parseJSON(response);
			//	Campos Visibles
			$('#celdaasignado').html(sacar_valor[0].asignado);
			$('#celdalibre').html(sacar_valor[0].libre);
			$('#celdatotal').html(sacar_valor[0].total);
			//	Campos Ocultos
			$('#A').val(sacar_valor[0].asignado);
			$('#L').val(sacar_valor[0].libre);
			$('#T').val(sacar_valor[0].total);
			//	Agregar valor a las variables
			HoraAsignado=parseInt(document.getElementById("A").value);
			HoraTotal=parseInt(document.getElementById("T").value);
			HoraLibre=parseInt(document.getElementById("L").value);
		}
	});
}

function cargar_hora_materia(seccion,materia,docente){
	elegido1=$("#codigo_ano_academico").val();
	var parametros={"seccion":seccion,"materia":materia,"docente":docente,"codigo_ano_academico": elegido1,"combo":"horas_materia"};
	$.ajax({
		data: 	parametros,
		url: 	'../controladores/control_ajax2.php',
		type: 	'post',
		success: 	function(response){
			sacar_valor=$.parseJSON(response);
			//	Campos Visibles
			$('#celdamateriaasignado').html(sacar_valor[0].asignado);
			$('#celdamaterialibre').html(sacar_valor[0].libre);
			$('#celdamateriatotal').html(sacar_valor[0].total);
			//	Campos Ocultos
			$('#MA').val(sacar_valor[0].asignado);
			$('#ML').val(sacar_valor[0].libre);
			$('#MT').val(sacar_valor[0].total);
			//	Agregar valor a las variables
			HoraMAsignado=parseInt(document.getElementById("MA").value);
			HoraMTotal=parseInt(document.getElementById("MT").value);
			HoraMLibre=parseInt(document.getElementById("ML").value);
		},
		error: function(jqXHR, textStatus, errorThrown){
        	console.log(textStatus);
        	console.log(errorThrown);
        	console.log(jqXHR);
		}
	});
}

function cargar_datos(){
	$("#seccion").on('change',function () {
		elegido=$(this).val();
		elegido1=$("#codigo_ano_academico").val();
		elegido2=$("#codigo_ambiente").val();
		var parametros={ "seccion": elegido,"codigo_ano_academico": elegido1,combo: "seccion", "codigo_ambiente": elegido2  } ;
		$.ajax({
			data:  parametros,
			url:   '../controladores/control_ajax2.php',
			type:  'post',
			success:  function (response) {
				sacar_valor=$.parseJSON(response); 
				for(i=0;i<sacar_valor.length;i++){
					datos=sacar_valor[i].celda+"*"+sacar_valor[i].seccion+"*"+sacar_valor[i].codigo_ambiente+"*"+sacar_valor[i].materia+"*"+sacar_valor[i].profesor;				   
					campo="<input type='hidden' name='contenidos[]' id='"+sacar_valor[i].celda+"_vo'  value='"+datos+"'/>";
					dia=Array("Domingo","Lunes","Martes","Miercoles","Jueves","Viernes","Sabado");
					datos_img="<div id=\"div-msg\">Día: "+dia[sacar_valor[i].dia]+"<br>Hora: "+sacar_valor[i].hora+"<br>Materia: "+sacar_valor[i].nombre_materia+"<br>Prof: "+sacar_valor[i].nombre+" "+sacar_valor[i].apellido+"<br>Aula: "+sacar_valor[i].nombre_ambiente+"<br>Sección: "+sacar_valor[i].nombre_seccion+"</div>";
					var img="<img src='../images/marca.png' alt='"+datos_img+"'/>";
					$("#"+sacar_valor[i].celda).removeAttr('class').html('').html('Asignado').addClass("asignado").append(campo).append(img);
				}
				//var campo="<input type='hidden' name='contenidos[]' id='"+celda.prop('id')+"_vo'  value='"+valor+"'/>";
				//celda.append(campo);
			}
		});

		if($(this).val()=="null" || $(this).val()==""){
			$("#codigo_materia").html("<option value='null'>Elige una opcion...</option>").attr("disabled","disabled");
			$("#cedula_persona > option[value='']").attr("selected",true);       				
			$("#cedula_persona").prop("disabled","disabled");
		}else{
			$("#codigo_materia > option[value='']").attr("selected",true);       
			$("#codigo_materia").attr("disabled",false);
		}
		$("#seccion option:selected").each(function () {
			elegido=$(this).val();
			$.post("../controladores/control_ajax.php", { elegido: elegido,combo: "seccion" }, function(data){
			$("#codigo_materia").html(data);
			});
		});
	});    	

}

function cargar_datos_celda(){
	$("#codigo_ambiente").on('change',function () {
		$("#tb_horario tr td[id]").each(function(i){
			if($(this).attr("class")!="weekend_noche")
				$(this).html('').removeAttr('class'); 
		});
		if(!($(this).val()=="null" || $(this).val()=="")){
			$("#seccion").prop("disabled","");
			$("#codigo_ambiente option:selected").each(function () {
				elegido=$(this).val();
				elegido1=$("#codigo_ano_academico").val();
				var parametros={ "codigo_ambiente": elegido,"codigo_ano_academico": elegido1,combo: "codigo_ambiente" } ;
				$.ajax({
					data:  parametros,
					url:   '../controladores/control_ajax2.php',
					type:  'POST',
					success:  function (response) {
						sacar_valor=$.parseJSON(response);
						for(i=0;i<sacar_valor.length;i++)
							$("#"+sacar_valor[i].celda).removeAttr('class').addClass("h_academica");
					}
				});		
			});
		}else{
			$("#seccion").prop("disabled","disabled");
			$("#cedula_persona").prop("disabled","disabled");
			$("#codigo_materia").prop("disabled","disabled");
			$("#cedula_persona").val("");
			$("#codigo_materia > option[value='']").attr("selected",true); 
			$("#seccion > option[value='']").attr("selected",true);                    
			alert('debe seleccionar un Ambiente');
		}
	});    	

}

function Principal(){
	cargar_datos();
	cargar_datos_celda();
	$("td[id]").live("click",Seleccionar);
	$("td[class=asignado]").live("dblclick",ExtraerDatos);
	$("td[class=seleccionado]").live("click",desactivar);
	$("td[class=asignado] img").live("click",mostrar_alt);
	$("#btaceptar").live("click",Enviar);
	$("#ok").on("click",celdaID);
	$("#tb_horario").live("click",function(){
		indice_asignado=$("td.seleccionado").attr("data-hora_academica");
	});
	$("#btaceptar").on("mouseover",function(){
		$(this).prop("src","../images/add_hover.png")
	});
	$("#btaceptar").on("mouseout",function(){
		$(this).prop("src","../images/add.png")
	});

	$("#codigo_materia").on('change',function (){
		/*if(!($(this).val()=="null" || $(this).val()=="")){
			$("#cedula_persona").prop("disabled","");
		}else{
			$("#cedula_persona").attr("value","");
			$("#cedula_persona").prop("disabled","false");
		}*/
		if($(this).val()=="null" || $(this).val()==""){
			$("#cedula_persona").html("<option value='null'>Elige una opcion...</option>").attr("disabled","disabled");
		}else{
			$("#cedula_persona > option[value='']").attr("selected",true);       
			$("#cedula_persona").attr("disabled",false);
		}
		$("#codigo_materia option:selected").each(function () {
			elegido=$(this).val();
			seccion=$("#seccion").val();
			$.post("../controladores/control_ajax.php", { elegido: elegido,seccion: seccion,combo: "materia" }, function(data){
				$("#cedula_persona").html(data);
			});
		});
	}); 

	$('#cedula_persona').on('change',function(){
		//	Cargamos las horas consumidas del docuente
		cargar_hora_maxima($(this).val());
		//	Cargamos las horas consumidas del docente en la materia seleccionada
		cargar_hora_materia($('#seccion').val(),$('#codigo_materia').val(),$(this).val());
	});

	$('#btnGuardar').on("click",function(){
		var send = true;
		var contenido = document.getElementsByName('contenidos[]');
		if(contenido.length==0){
			alert('Debe seleccionar al menos un bloque de hora');
			send=false;
		}

		if(send==true){
			$('#form1').submit();
		}
	});

	//Búsquedas del docente por autocompletar.
	/*$('#cedula_persona').autocomplete({
		source: function(request,response){
			var Data = {term : request.term, seccion: $("#seccion").val(), codigo_materia: $("#codigo_materia").val()};
			$.ajax({
                url: '../autocomplete/docente.php',
                dataType: "json",
                data: Data,
                success: function(data) {
                    response(data);
                },
                error: function(jqXHR, textStatus, errorThrown){
                    alert('¡Error al procesar la petición! '+textStatus+" "+errorThrown+" "+jqXHR);
                    console.log(jqXHR);
                }
            });
		}, 
		minLength:1,
		select: function (event, ui){
			docente=ui.item.value;
			docente=docente.split('_');
			cargar_hora_maxima(docente[0]);
		}
	});
	*/
}

function mostrar_alt(){
	valor=$(this).prop('alt');
	alert("Bloque Seleccionado","info",valor);
}

function desactivar(){
	if($(this).attr('class')=='seleccionado'){
		HoraAsignado-=parseInt($(this).attr('data-hora_academica'));
		HoraLibre+=parseInt($(this).attr('data-hora_academica'));
		$("#celdalibre").html(HoraLibre);
		$("#celdaasignado").html(HoraAsignado);
		//	Para las materias
		HoraMAsignado-=parseInt($(this).attr('data-hora_academica'));
		HoraMLibre+=parseInt($(this).attr('data-hora_academica'));
		$("#celdamaterialibre").html(HoraMLibre);
		$("#celdamateriaasignado").html(HoraMAsignado);
		$($(this)).removeAttr('class');		  
	}
}

function celdaID(){
	var dataforms=document.getElementById("ventana");
	div=document.createElement('div');
	div.innerHTML=dataforms.innerHTML;
}

function Seleccionar(){
	if($(this).attr('class')==undefined){
		HoraAsignado+=parseInt($(this).attr('data-hora_academica'));
		HoraLibre-=parseInt($(this).attr('data-hora_academica'));
		//	Para la materia
		HoraMAsignado+=parseInt($(this).attr('data-hora_academica'));
		HoraMLibre-=parseInt($(this).attr('data-hora_academica'));
		indice_asignado=parseInt($(this).attr('data-hora_academica'));
		if(HoraMLibre>0 || HoraMAsignado==HoraMTotal){
			if(HoraLibre>0 || HoraAsignado==HoraTotal){
				$(this).removeClass($(this).attr('class')).addClass("seleccionado");
				$("#celdalibre").html(HoraLibre);
				$("#celdaasignado").html(HoraAsignado);
				$("#celdamaterialibre").html(HoraMLibre);
				$("#celdamateriaasignado").html(HoraMAsignado);
			}else{
				HoraAsignado-=parseInt($(this).attr('data-hora_academica'));
				HoraLibre+=parseInt($(this).attr('data-hora_academica'));
				alert("Error al seleccionar bloque de hora","info","<font style='color:red;'>Horas Académicas del Bloque: "+indice_asignado+" <br> Horas del Docente Asignadas: "+HoraAsignado+" <br> Horas del Docente Libre: "+HoraLibre+"</font>");
			}
		}else{
			HoraMAsignado-=parseInt($(this).attr('data-hora_academica'));
			HoraMLibre+=parseInt($(this).attr('data-hora_academica'));
			alert("Error al seleccionar bloque de hora","info","<font style='color:red;'>Horas Académicas del Bloque: "+indice_asignado+" <br> Horas de la Materia Asignadas: "+HoraMAsignado+" <br> Horas de la Materia Libre: "+HoraMLibre+"</font>");
		}
	}
}

function ExtraerDatos(){
	$(this).removeClass('asignado');
	$(this).removeAttr('title');
	$(this).removeAttr('class');
	id=$(this).prop('id')+'_vo';
	$("#"+id).remove();
	this.innerHTML='';
	HoraAsignado-=parseInt($(this).attr('data-hora_academica'));
	HoraLibre+=parseInt($(this).attr('data-hora_academica'));
	$("#celdalibre").html(HoraLibre);
	$("#celdaasignado").html(HoraAsignado);
	//	Para las materias
	HoraMAsignado-=parseInt($(this).attr('data-hora_academica'));
	HoraMLibre+=parseInt($(this).attr('data-hora_academica'));
	$("#celdamaterialibre").html(HoraMLibre);
	$("#celdamateriaasignado").html(HoraMAsignado);
}

function Enviar(){
	amb=$("#codigo_ambiente").val();
	sec=$("#seccion").val();
	pro=$("#cedula_persona").val();
	mat=$("#codigo_materia").val();
	error=false;
	mensaje="Falta por completar los siguiente campo: ";          
	if(amb==""){
		mensaje=mensaje+"Ambiente   ";
		error=true;
	}
	if(sec==""){
		mensaje=mensaje+"Seccion    ";
		$error=true;
	}	
	if(pro==""){
		mensaje=mensaje+"Profesor   ";
		error=true;
	}		  
	if(mat==""){
		mensaje=mensaje+"Materia    ";
		error=true;
	}
	if(error==true){
		alert(mensaje) 	
	}else{       	
		var datos;
		$("td[class=seleccionado]").each(function(i){ 
			$(this).text("Asignado");
			$(this).addClass("asignado");
			$(this).removeClass("seleccionado");
			datos_profesor=$("#cedula_persona").val().split('_');
			profesor=datos_profesor[0];
			datos=$(this).prop("id")+"*"+$("#seccion option:selected").val()+"*"+$("#codigo_ambiente option:selected").val()+"*"+$("#codigo_materia").val()+"*"+profesor;				   
			dia=Array("Domingo","Lunes","Martes","Miercoles","Jueves","Viernes","Sabado");
			x=$(this).prop("id").split('-');
			eldia=dia[x[1]];
			var iii = $("#codigo_ambiente option:selected").text();
			datos_img="<div id=\"div-msg\">Día: "+eldia+"<br>Hora: "+$(this).prop('title')+"<br>Materia: "+ 
			$("#codigo_materia option:selected").text()+"<br>Prof: "+$("#cedula_persona").val()+"<br>Aula: "+iii+"<br>Sección: "+$("#seccion option:selected").text()+"</div>";
			if(validar_profesor_horario($(this).prop("id"),profesor))				   
				anadir_contenido($(this),datos,datos_img);
		});
	}
}

function validar_profesor_horario(celda,profesor){
	var is_ok=true;
	elegido1=$("#codigo_ano_academico").val();
	var parametros={ "codigo_ano_academico": elegido1,"profesor": profesor,"celda": celda, "combo": "profesor"  } ;       
	$.ajax({
		data:  parametros,
		url:   '../controladores/control_ajax2.php',
		type:  'post',
		success:  function (response){
			sacar_valor=$.parseJSON(response);
			if(!sacar_valor)
				sacar_valor=0;		  
			if(sacar_valor.length > 0){
				is_ok=false;
				for(i=0;i<sacar_valor.length;i++){
					alert(sacar_valor[0].nombre+' '+ sacar_valor[0].apellido );
				}
			}
		}
	});
	return is_ok;
}               

function anadir_contenido(celda,valor,datos_img){
	var campo="<input type='hidden' name='contenidos[]' id='"+celda.prop('id')+"_vo'  value='"+valor+"'/>";
	var img="<img src='../images/marca.png' alt='"+datos_img+"'/>";
	celda.append(campo);
	celda.append(img);
	indice++;
}

function validar(){
	if(HoraLibre==0 && HoraTotal==HoraAsignado && indice_asignado==0){
		return true;
	}else if(HoraLibre==0 && indice_asignado>0){
		if(indice_asignado>1){ pl='as';nv=indice_asignado; }else{ pl='a';nv="";}
		alert("<font style='color:red'>Debe agregar contenido a l"+pl+" "+nv+" celd"+pl+" seleccionad"+pl+"!</font>");
		return false;			
	}else{
		alert("<font style='color:red'>Completar todas las horas! "+HoraAsignado+"/"+HoraTotal+"</font>");
		return false;
	}
	//return false;
}
