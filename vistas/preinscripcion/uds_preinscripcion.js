$(document).ready(init);
function init(){
	$("#pais").change(function(){
	    var str = "";
	    $( "#pais option:selected" ).each(function() {
	      str += $( this ).text() + " ";
	      var Datos = {"operacion":"comboPais","filtro":str};
	      var Url = 'cont_preinscripcion.php';
	      comboDependiente(Datos,Url,$("#estado"));
	    });
	});

	$("#estado").change(function(){
	    var str = "";
	    $( "#estado option:selected" ).each(function() {
	      str += $( this ).text() + " ";
	      var Datos = {"operacion":"comboEstado","filtro":str};
	      var Url = 'cont_preinscripcion.php';
	      comboDependiente(Datos,Url,$("#ciudad"));
	    });
	});
	$("#ciudad").change(function(){
	    var str = "";
	    $( "#ciudad option:selected" ).each(function() {
	      str += $( this ).text() + " ";
	      var Datos = {"operacion":"comboCiudad","filtro":str};
	      var Url = 'cont_preinscripcion.php';
	      comboDependiente(Datos,Url,$("#municipio"));
	    });
	});
	$("#municipio").change(function(){
	    var str = "";
	    $( "#municipio option:selected" ).each(function() {
	      str += $( this ).text() + " ";
	      var Datos = {"operacion":"comboMunicipio","filtro":str};
	      var Url = 'cont_preinscripcion.php';
	      comboDependiente(Datos,Url,$("#parroquia"));
	    });
	});

	$("#estado_residencia").change(function(){
	    var str = "";
	    $( "#estado_residencia option:selected" ).each(function() {
	      str += $( this ).text() + " ";
	      var Datos = {"operacion":"comboEstado","filtro":str};
	      var Url = 'cont_preinscripcion.php';
	      comboDependiente(Datos,Url,$("#ciudad_residencia"));
	    });
	});
	$("#ciudad_residencia").change(function(){
	    var str = "";
	    $( "#ciudad_residencia option:selected" ).each(function() {
	      str += $( this ).text() + " ";
	      var Datos = {"operacion":"comboCiudad","filtro":str};
	      var Url = 'cont_preinscripcion.php';
	      comboDependiente(Datos,Url,$("#municipio_residencia"));
	    });
	});
	$("#municipio_residencia").change(function(){
	    var str = "";
	    $( "#municipio_residencia option:selected" ).each(function() {
	      str += $( this ).text() + " ";
	      var Datos = {"operacion":"comboMunicipio","filtro":str};
	      var Url = 'cont_preinscripcion.php';
	      comboDependiente(Datos,Url,$("#parroquia_residencia"));
	    });
	});

	$("#estado_temp").change(function(){
	    var str = "";
	    $( "#estado_temp option:selected" ).each(function() {
	      str += $( this ).text() + " ";
	      var Datos = {"operacion":"comboEstado","filtro":str};
	      var Url = 'cont_preinscripcion.php';
	      comboDependiente(Datos,Url,$("#ciudad_temp"));
	    });
	});
	$("#ciudad_temp").change(function(){
	    var str = "";
	    $( "#ciudad_temp option:selected" ).each(function() {
	      str += $( this ).text() + " ";
	      var Datos = {"operacion":"comboCiudad","filtro":str};
	      var Url = 'cont_preinscripcion.php';
	      comboDependiente(Datos,Url,$("#municipio_temp"));
	    });
	});
	$("#municipio_temp").change(function(){
	    var str = "";
	    $( "#municipio_temp option:selected" ).each(function() {
	      str += $( this ).text() + " ";
	      var Datos = {"operacion":"comboMunicipio","filtro":str};
	      var Url = 'cont_preinscripcion.php';
	      comboDependiente(Datos,Url,$("#parroquia_temp"));
	    });
	});

	$("#estado_plantel").change(function(){
	    var str = "";
	    $( "#estado_plantel option:selected" ).each(function() {
	      str += $( this ).text() + " ";
	      var Datos = {"operacion":"comboEstado","filtro":str};
	      var Url = 'cont_preinscripcion.php';
	      comboDependiente(Datos,Url,$("#ciudad_plantel"));
	    });
	});

	$('#cmdForm1').click(function(){
		validar_formulario1();
	})

	$('#cmdForm2').click(function(){
		validar_formulario2();
	})

	$('#cmdForm3').click(function(){
		validar_formulario3();
	})

	$('#cmdForm4').click(function(){
		validar_formulario4();
	})

	$('#cmdConsultar').click(function(){
		if($('#cedula_estudiante').val()==""){
			alert('Ingrese su cédula')
		}
		else{
			$('#operacion').val("consultarEstado");
			$('#form1').submit();
		}
	})

	$('#cmdIr').click(function(){
		location.href="preinscripcion.php?pa=r#datospersonales";
	});

	$('#cmdImprimir').click(function(){
		window.open("pdf_comprobante_inscripcion.php?cedula="+$("#cedula").val(),"_blank");
	});

	$('#cmdImprimirPreInscripcion').click(function(){
		window.open("pdf_comprobante_preinscripcion.php?cedula="+$("#cedula").val(),"_blank");
	});

	$('#tab-direccionhabitacion').click(function(){
		if($('#cedula').val()==""){
			alert('Debe completar los datos personales antes de continuar!');
			return false;
		}
		else{
			return true;
		}
	});

	$('#tab-datosplantel').click(function(){
		if($('#cedula').val()==""){
			alert('Debe completar los datos de la dirección de habitación antes de continuar!');
			return false;
		}
		else{
			return true;
		}
	});

	$('#tab-modalidadingreso').click(function(){
		if($('#cedula').val()==""){
			alert('Debe completar los datos de la educación media diversificada antes de continuar!');
			return false;
		}
		else{
			return true;
		}
	});

	var hash = window.location.hash.substr(1); 
	var href = $('ul.nav-tabs li a').each(function(){ 
		var href = $(this).attr('href'); 
		href=href.substr(1); 
		if(hash==href){ 
			$(".tab-pane").hide(); 
			$("ul.nav-tabs li").removeClass("active"); 
			$(this).parent('li').addClass("active"); 
			$('#'+hash).fadeIn(); 
		}	 
	})     

	$("ul.nav-tabs li").click(function(){ 
		$("ul.nav-tabs li").removeClass("active"); 
		$(this).addClass("active"); 
		$(".tab-pane").hide();   
		var content = $(this).find("a").attr("href"); 
		$(content).fadeIn(); return false; 
	});

	//Acciones del Formulario Pestaña 1
	$(".temp").hide();
	$(".tmp").hide();

	$("#pais_residencia").change(function(){
		if($("#pais").val()!=$("#pais_residencia").val()){
			$(".temp").show();
		}
		else{
			$(".temp").hide();
		}
	})

	$("#trabaja").change(function(){
		if($("#trabaja").val()=="S"){
			$(".tmp").show();
		}
		else{
			$(".tmp").hide();
		}
	})
	//Acciones del Formulario Pestaña 2
	$(".temp1").hide();
	$(".temp2").hide();
	$(".temp3").hide();

	$("#modalidad_estudio1").click(function(){
		if($("#modalidad_estudio1").attr("checked","checked")){
			$(".temp1").show();
			$("#esatleta1").click(function(){
				if($("#esatleta1").attr("checked","checked")){
					$(".temp2").show();
				}else{
					$(".temp2").hide();
				}
			})	
		}else{
			$(".temp1").hide();
		}
	})
	$("#modalidad_estudio2").click(function(){
		$(".temp1").hide();
		$(".temp2").hide();
	})
	$("#modalidad_estudio3").click(function(){
		$(".temp1").hide();
		$(".temp2").hide();
	})
	$("#esatleta2").click(function(){
		$(".temp2").hide();
	})
	$('#posee_titulo1').click(function(){
		if($('#posee_titulo1').attr("checked","checked"))
			$(".temp3").show();
		else
			$(".temp3").hide();
	})
	$('#posee_titulo2').click(function(){
		$(".temp3").hide();
	})

	$('#antiguedad').change(function(){
		var Datos = {"operacion":"RestarFechas","filtro":$('#fecha').val()};
		var Url = 'cont_preinscripcion.php';
		compararFechas(Datos,Url);
	})
	function compararFechas(value,url){
		$.ajax({
	        url: url,
	        type: 'POST',
	        data: value,
	        dataType: 'JSON',
	        success: function(resp){
	        	var aniosdetrabajo = parseInt(resp[0].AA)-parseInt(18);//Si quisieran cambiar el valor de edad para iniciar a trabajar modificar el 18 por el valor nuevo.
	        	if(aniosdetrabajo<$('#antiguedad').val()){
	        		alert("Su antigüedad no puede ser mayor a sus "+aniosdetrabajo+" años luego de ser mayor de edad!");
	        		$('#antiguedad').val("");
	        	}
	        },
	        error: function(){
	            alert("¡Error al procesar la petición!");
	        }
	    });
	}
}

function validar_formulario1(){
	//para validar en caso q no return false
	permitido=true;
	valor=document.getElementById('pais').value;
	valor0=document.getElementById('estado').value;
	valor1=document.getElementById('ciudad').value;
	valor2=document.getElementById('municipio').value;
	valor3=document.getElementById('parroquia').value;
	valor4=document.getElementById('cedula_estudiante').value;
	valor5=document.getElementById('nombre_estudiante').value;
	valor6=document.getElementById('apellido_estudiante').value;
	valor7=document.getElementById('sexo').value;
	valor8=document.getElementById('edocivil').value;
	valor9=document.getElementById('pais_residencia').value;
	valor10=document.getElementById('fecha').value;
	valor11=document.getElementById('email').value;
	valor12=document.getElementById('trabaja').value;

	if(valor==0){
		alert('Seleccione un país')
		permitido=false;
	}
	else if(valor0==0){
		alert('Seleccione un estado')
		permitido=false;
	}
	else if(valor1==0){
		alert('Seleccione una ciudad')
		permitido=false;
	}
	else if(valor2==0){
		alert('Seleccione un municipio')
		permitido=false;
	}
	else if(valor3==0){
		alert('Seleccione una parroquia')
		permitido=false;
	}
	else if(valor4.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
		alert('Ingrese su cédula')
		permitido=false;
	}
	else if(valor5.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
		alert('Ingrese su(s) nombre(s)')
		permitido=false;
	}
	else if(valor6.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
		alert('Ingrese su(s) apellido(s)')
		permitido=false;
	}
	else if(valor7==0){ //para no permitir que se queda en blanco
		alert('Seleccione su género')
		permitido=false;
	}
	else if(valor8==0){ //para no permitir que se queda en blanco
		alert('Seleccione su estado civil')
		permitido=false;
	}
	else if(valor9.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Seleccione su país de residencia')
		permitido=false;
	}
	else if(valor10.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
		alert('Ingrese su fecha de nacimiento')
		permitido=false;
	}
	else if(valor11.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
		alert('Ingrese su dirección de correo electronico')
		permitido=false;
	}
	else if(!(/[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/.test(valor11))){// validar dirección de correo valido
		alert('Ingrese una dirección de correo electronico válida. pj: ejemplo@dominio.com')
		permitido=false;
	}
	else if(valor12.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
		alert('Seleccione si tiene trabajo')
		permitido=false;
	}

	document.getElementById("operacion_tab1").value="Paso1";
	if(permitido==true)
		document.getElementById("form1").submit();
}

function validar_formulario2(){
	permitido=true;
	valor0=document.getElementById('estado_residencia').value;
	valor1=document.getElementById('ciudad_residencia').value;
	valor2=document.getElementById('municipio_residencia').value;
	valor3=document.getElementById('parroquia_residencia').value;
	valor4=document.getElementById('direccionresidencia').value;

	if(valor0==0){
		alert('Seleccione un estado')
		permitido=false;
	}
	else if(valor1==0){
		alert('Seleccione una ciudad')
		permitido=false;
	}
	else if(valor2==0){
		alert('Seleccione un municipio')
		permitido=false;
	}
	else if(valor3==0){
		alert('Seleccione una parroquia')
		permitido=false;
	}
	else if(valor4.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
		alert('Ingrese su dirección de habitación')
		permitido=false;
	}

	document.getElementById("operacion_tab2").value="Paso2";
	if(permitido==true)
		document.getElementById("form2").submit();
}

function validar_formulario3(){
	permitido=true;
	valor=document.getElementById('plantel_edu').value;
	valor0=document.getElementById('estado_plantel').value;
	valor1=document.getElementById('ciudad_plantel').value;
	valor2=document.getElementById('anio_egreso').value;

	if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
		alert('Ingrese el nombre del plantel')
		permitido=false;
	}
	else if(valor0==0){
		alert('Seleccione un estado')
		permitido=false;
	}
	else if(valor1==0){
		alert('Seleccione una ciudad')
		permitido=false;
	}
	else if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
		alert('Ingrese el año de egreso del plantel')
		permitido=false;
	}

	document.getElementById("operacion_tab3").value="Paso3";
	if(permitido==true)
		document.getElementById("form3").submit();
}

function validar_formulario4(){
	permitido=true;
	valor=document.getElementById('rif_universidad').value;
	valor0=document.getElementById('cod_carrera').value;
	
	if(valor==0){
		alert('Seleccione una sede')
		permitido=false;
	}
	else if(valor0==0){
		alert('Seleccione una carrera')
		permitido=false;
	}

	document.getElementById("operacion_tab4").value="Paso4";
	if(permitido==true)
		document.getElementById("form4").submit();
}