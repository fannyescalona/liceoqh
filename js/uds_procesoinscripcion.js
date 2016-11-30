$(document).ready(init);
function init(){
	//Búsquedas de las parroquias por autocompletar.
	$('#lugar_nacimiento').autocomplete({
		source:'../autocomplete/parroquia.php', 
		minLength:1
	});
	$('#lugar_nacimiento_madre').autocomplete({
		source:'../autocomplete/parroquia.php', 
		minLength:1
	});
	$('#lugar_nacimiento_padre').autocomplete({
		source:'../autocomplete/parroquia.php', 
		minLength:1
	});
	$('#lugar_nacimiento_representante').autocomplete({
		source:'../autocomplete/parroquia.php', 
		minLength:1
	});
	$('#lugar_trabajo').autocomplete({
		source:'../autocomplete/parroquia.php', 
		minLength:1
	});
	$('#parentesco').autocomplete({
		source:'../autocomplete/parentesco.php', 
		minLength:1
	});
	//Búsquedas de docente por autocompletar.
	$('#seccion').autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../autocomplete/seccionporgrado.php",
				dataType: "json",
				data: {
					term : request.term,
					grado_escolar : $("#grado_escolar").val()
				},
				success: function(data) {
					response(data);
				}
			});
		},
		minLength: 1
	});
	//Búsquedas de padres por autocompletar.
	$('#cedula_madre').autocomplete({
		source:'../autocomplete/madre.php', 
		minLength:1,
		select: function (event, ui){
			Datos={"operacion":"BuscarDatosRepresentante","cedula":ui.item.value};
			BuscarDatosMadre(Datos);
		}
	});
	$('#cedula_padre').autocomplete({
		source:'../autocomplete/padre.php', 
		minLength:1,
		select: function (event, ui){
			Datos={"operacion":"BuscarDatosRepresentante","cedula":ui.item.value};
			BuscarDatosPadre(Datos);
		}
	});
	//Búsquedas de docente por autocompletar.
	$('#cedula_docente').autocomplete({
		source:'../autocomplete/docente.php', 
		minLength:1
	});
	//Búsquedas de representantes por autocompletar.
	$('#cedula_representante').autocomplete({
		source:'../autocomplete/representante.php', 
		minLength:1,
		select: function (event, ui){
			Datos={"operacion":"BuscarDatosRepresentante","cedula":ui.item.value};
			BuscarDatosRepresentante(Datos);
		}
	});
    //Busca los Datos del Padre seleccionado.
    function BuscarDatosPadre(value){
        $.ajax({
        url: '../controladores/cont_persona.php',
        type: 'POST',
        async: true,
        data: value,
        dataType: "json",
        success: function(resp){
        	$('#nombre_padre').val(resp[0].nombres);
        	$('#apellido_padre').val(resp[0].apellidos);
        	$('#fecha_nacimiento_padre').val(resp[0].fecha_nacimiento);
        	$('#lugar_nacimiento_padre').val(resp[0].lugar_nacimiento);
        	$('#direccion_padre').val(resp[0].direccion);
        	$('#telefono_habitacion_padre').val(resp[0].telefono_habitacion);
        	$('#telefono_movil_padre').val(resp[0].telefono_movil);
        	$('#email_padre').val(resp[0].email);
        },
        error: function(jqXHR, textStatus, errorThrown){
        	alert('¡Error al procesar la petición! '+textStatus+" "+errorThrown)
        }
        });
    }
    //Busca los Datos de la Madre seleccionado.
    function BuscarDatosMadre(value){
        $.ajax({
        url: '../controladores/cont_persona.php',
        type: 'POST',
        async: true,
        data: value,
        dataType: "json",
        success: function(resp){
        	$('#nombre_madre').val(resp[0].nombres);
        	$('#apellido_madre').val(resp[0].apellidos);
        	$('#fecha_nacimiento_madre').val(resp[0].fecha_nacimiento);
        	$('#lugar_nacimiento_madre').val(resp[0].lugar_nacimiento);
        	$('#direccion_madre').val(resp[0].direccion);
        	$('#telefono_habitacion_madre').val(resp[0].telefono_habitacion);
        	$('#telefono_movil_madre').val(resp[0].telefono_movil);
        	$('#email_madre').val(resp[0].email);
        },
        error: function(jqXHR, textStatus, errorThrown){
        	alert('¡Error al procesar la petición! '+textStatus+" "+errorThrown)
        }
        });
    }
    //Busca los Datos del Representante seleccionado.
    function BuscarDatosRepresentante(value){
        $.ajax({
        url: '../controladores/cont_persona.php',
        type: 'POST',
        async: true,
        data: value,
        dataType: "json",
        success: function(resp){
        	$('#genero_representante').val(resp[0].genero);
        	$('#nombre_representante').val(resp[0].nombres);
        	$('#apellido_representante').val(resp[0].apellidos);
        	$('#fecha_nacimiento_representante').val(resp[0].fecha_nacimiento);
        	$('#lugar_nacimiento_representante').val(resp[0].lugar_nacimiento);
        	$('#direccion_representante').val(resp[0].direccion);
        	$('#telefono_habitacion_representante').val(resp[0].telefono_habitacion);
        	$('#telefono_movil_representante').val(resp[0].telefono_movil);
        	$('#email_representante').val(resp[0].email);
        },
        error: function(jqXHR, textStatus, errorThrown){
        	alert('¡Error al procesar la petición! '+textStatus+" "+errorThrown)
        }
        });
    }

	$('#cmdForm1').click(function(){
		validar_formulario1();
	})

	$('#cmdForm2').click(function(){
		validar_formulario2();
	})

	$('#cmdForm3').click(function(){
		validar_formulario3();
	})

	$('#cmdImprimir').click(function(){
		url = "../informe_pdf/ficha_inscripcion.php?cedula_estudiante="+$('#cedula').val();
		window.open(url, '_blank');
	})

	$('#tab-datospadres').click(function(){
		if($('#cedula').val()==""){
			alert('Debe completar los datos del estudiante antes de continuar!');
			return false;
		}
		else{
			return true;
		}
	});

	$('#tab-documentosconsignados').click(function(){
		if($('#cedula').val()==""){
			alert('Debe completar los datos de la condición escolar antes de continuar!');
			return false;
		}
		else{
			return true;
		}
	});

	$('#tab-datosrepresentante').click(function(){
		if($('#cedula').val()==""){
			alert('Debe completar los datos de los documentos consignados antes de continuar!');
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
}

function validar_formulario(param){
	//para validar en caso q no return false
	permitido=true;
	valor1=document.getElementById('cedula_estudiante').value;
	valor2=document.getElementById('cedula_escolar').value;
	valor3=document.getElementById('nombres').value;
	valor4=document.getElementById('apellidos').value;
	valor5=document.getElementById('genero').value;
	valor6=document.getElementById('peso').value;
	valor7=document.getElementById('estatura').value;
	valor8=document.getElementById('fecha_nacimiento_estudiante').value;
	valor9=document.getElementById('lugar_nacimiento').value;
	valor10=document.getElementById('direccion').value;
	valor11=document.getElementById('telefono_habitacion').value;
	valor12=document.getElementById('email').value;
	valor13=document.getElementById('codigo_plantel').value;
	valor14=document.getElementById('seccion').value;
	//Utilizamos una expresion regular para validar email
	var regex = /[\w-\.]{2,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
	var autocompletado = /\d{1,}[_]{1}[\w-]/;
	var ac_seccion = /[\w-]{1,5}[_]{1}[\w-]/;
	//Validamos los campos obligatorios
	if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
		if(valor1.replace(/^\s+|\s+$/gi,"").length==0 && valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese la cédula del estudiante o la cédula escolar')
			permitido=false;
		}
		else if(valor1.replace(/^\s+|\s+$/gi,"").length!=0 && valor1.replace(/^\s+|\s+$/gi,"").length<=6){ //para no permitir que se quede en blanco
			alert('La cédula del estudiante ingresada debe ser mayor a 5 digitos')
			permitido=false;
		}
		else if(valor2.replace(/^\s+|\s+$/gi,"").length!=0 && valor2.replace(/^\s+|\s+$/gi,"").length<=6){ //para no permitir que se quede en blanco
			alert('La cédula escolar ingresada debe ser mayor a 5 digitos')
			permitido=false;
		}
		else if(valor5.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Seleccione el genero')
			permitido=false;
		}
		else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el(los) nombre(s)')
			permitido=false;
		}
		else if(valor4.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el(los) apellido(s)')
			permitido=false;
		}
		else if(valor6.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el peso del estudiante expresado en Kg')
			permitido=false;
		}
		else if(valor7.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Seleccione la estatura del estudiante expresado en Cm')
			permitido=false;
		}
		else if(valor8.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese la fecha de nacimiento del estudiante')
			permitido=false;
		}
		else if(valor9==0){
			alert('Seleccione un lugar de nacimiento del estudiante')
			permitido=false;
		}
		else if(!autocompletado.test(valor9.trim())){
			alert('Error en campo lugar de nacimiento','warning','<font style=\'color:red\'><p>Valor no válido. </br> El valor permitido es: </br> digito segido de underscore ( _ ) segido de texto. </br> Ejemplo: 0_Algun Texto</p></font>');
			permitido=false;
		}
		else if(valor10.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese la dirección del estudiante')
			permitido=false;
		}
		/*else if(valor11.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el teléfono de habitación del estudiante')
			permitido=false;
		}*/
		else if(valor12.replace(/^\s+|\s+$/gi,"").length!=0 && !regex.test(valor12.trim())){
			alert('La direccion de correo electrónico no es válida, la forma correcta sería por ejemplo pedroperez@gmail.com');
			permitido = false;
		}
		else if(valor13.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Seleccione el plantel de procedencia')
			permitido=false;
		}
		else if(valor14.replace(/^\s+|\s+$/gi,"").length!=0 && !ac_seccion.test(valor14.trim())){
			alert('Error en campo sección','warning','<font style=\'color:red\'><p>Valor no válido. </br> El valor permitido es: </br> codigo sección segido de underscore ( _ ) segido de texto. </br> Ejemplo: SEC01_Seccion 01</p></font>');
			permitido=false;
		}
	}
		
	if(devuelve_boton(param)=="Desactivar"){
		if(valor1.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('consultar antes desactivar')
			permitido=false;
			return false;
		}	
		if(!confirm("¿Esta seguro que desea desactivar este registro?"))
	     return false
	}

	document.getElementById("operacion").value=devuelve_boton(param);
	if(permitido==true)
		document.getElementById("form1").submit();
}

function validar_formulario1(){
	permitido=true;
	valor0=document.getElementById('cedula_madre').value;
	valor1=document.getElementById('email_madre').value;
	valor2=document.getElementById('nombre_madre').value;
	valor3=document.getElementById('apellido_madre').value;
	valor4=document.getElementById('fecha_nacimiento_madre').value;
	valor5=document.getElementById('lugar_nacimiento_madre').value;
	valor6=document.getElementById('direccion_madre').value;
	valor7=document.getElementById('telefono_habitacion_madre').value;
	valor8=document.getElementById('cedula_padre').value;
	valor9=document.getElementById('email_padre').value;
	valor10=document.getElementById('nombre_padre').value;
	valor11=document.getElementById('apellido_padre').value;
	valor12=document.getElementById('fecha_nacimiento_padre').value;
	valor13=document.getElementById('lugar_nacimiento_padre').value;
	valor14=document.getElementById('direccion_padre').value;
	valor15=document.getElementById('telefono_habitacion_padre').value;
	//Utilizamos una expresion regular para validar email
	var regex = /[\w-\.]{2,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
	var cedula_rif = /^[VGJE-vgje]\d{7,9}$/;
	var autocompletado = /\d{1,}[_]{1}[\w-]/;
	//Validamos los campos obligatorios
	if((valor0.replace(/^\s+|\s+$/gi,"").length!=0 && valor8.replace(/^\s+|\s+$/gi,"").length!=0) && (valor0==valor8)){
		alert(valor0+' '+valor8+' La cédula de la madre no puede ser igual que la cédula del padre');
		permitido = false;
	}
	
	if(valor0.replace(/^\s+|\s+$/gi,"").length!=0){
		if(!cedula_rif.test(valor0.trim())){
			alert('Error en la cédula ingresada ('+valor0+'), formato permitido de una cédula/rif: V210569852 -> la letra puede ser V, G, J, E y minimo 7 maximo 9 digitos');
			permitido=false;
		}
		else if(valor0.replace(/^\s+|\s+$/gi,"").length<=6){
			alert('La cédula de la madre ingresada de ser mayor a 5 dígitos');
			permitido = false;
		}
		else if(valor1.replace(/^\s+|\s+$/gi,"").length!=0 && !regex.test(valor1.trim())){
			alert('La direccion de correo electrónico no es válida, la forma correcta sería por ejemplo pedroperez@gmail.com');
			permitido = false;
		}
		else if(valor2.replace(/^\s+|\s+$/gi,"").length==0){
			alert('Ingrese el nombre de la madre');
			permitido = false;
		}
		else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){
			alert('Ingrese el apellido de la madre');
			permitido = false;
		}
		else if(valor4.replace(/^\s+|\s+$/gi,"").length==0){
			alert('Ingrese la fecha de nacimiento de la madre');
			permitido = false;
		}
		else if(valor5.replace(/^\s+|\s+$/gi,"").length==0){
			alert('Ingrese el lugar de nacimiento de la madre');
			permitido = false;
		}
		else if(!autocompletado.test(valor5.trim())){
			alert('Error en campo lugar de nacimiento de la madre','warning','<font style=\'color:red\'><p>Valor no válido. </br> El valor permitido es: </br> digito segido de underscore ( _ ) segido de texto. </br> Ejemplo: 0_Algun Texto</p></font>');
			permitido=false;
		}
		else if(valor6.replace(/^\s+|\s+$/gi,"").length==0){
			alert('Ingrese la direccion de la madre');
			permitido = false;
		}
		/*else if(valor7.replace(/^\s+|\s+$/gi,"").length==0){
			alert('Ingrese el número telefónico de habitación de la madre');
			permitido = false;
		}*/
	}
	
	if(valor8.replace(/^\s+|\s+$/gi,"").length!=0){
		if(!cedula_rif.test(valor8.trim())){
			alert('Error en la cédula ingresada ('+valor8+'), formato permitido de una cédula/rif: V210569852 -> la letra puede ser V, G, J, E y minimo 8 maximo 9 digitos');
			permitido=false;
		}
		else if(valor8.replace(/^\s+|\s+$/gi,"").length<=6){
			alert('La cédula del padre ingresada de ser mayor a 5 dígitos');
			permitido = false;
		}
		else if(valor9.replace(/^\s+|\s+$/gi,"").length!=0 && !regex.test(valor9.trim())){
			alert('La direccion de correo electrónico no es válida, la forma correcta sería por ejemplo pedroperez@gmail.com');
			permitido = false;
		}
		else if(valor10.replace(/^\s+|\s+$/gi,"").length==0){
			alert('Ingrese el nombre de la padre');
			permitido = false;
		}
		else if(valor11.replace(/^\s+|\s+$/gi,"").length==0){
			alert('Ingrese el apellido de la padre');
			permitido = false;
		}
		else if(valor12.replace(/^\s+|\s+$/gi,"").length==0){
			alert('Ingrese la fecha de nacimiento de la padre');
			permitido = false;
		}
		else if(valor13.replace(/^\s+|\s+$/gi,"").length==0){
			alert('Ingrese el lugar de nacimiento de la padre');
			permitido = false;
		}
		else if(!autocompletado.test(valor13.trim())){
			alert('Error en campo lugar de nacimiento del padre','warning','<font style=\'color:red\'><p>Valor no válido. </br> El valor permitido es: </br> digito segido de underscore ( _ ) segido de texto. </br> Ejemplo: 0_Algun Texto</p></font>');
			permitido=false;
		}
		else if(valor14.replace(/^\s+|\s+$/gi,"").length==0){
			alert('Ingrese la direccion de la padre');
			permitido = false;
		}
		/*else if(valor15.replace(/^\s+|\s+$/gi,"").length==0){
			alert('Ingrese el número telefónico de habitación de la padre');
			permitido = false;
		}*/
	}

	document.getElementById("operacion_tab2").value="Paso2";
	if(permitido==true)
		document.getElementById("form2").submit();
}

function validar_formulario2(){
	permitido=true;
	valor0=document.getElementById('becado').checked==true ? document.getElementById('becado').value : null;
	valor1=document.getElementById('tipobeca').value;

	if(valor0=="Y" && valor1=="0"){
		alert('Seleccione un tipo de beca')
		permitido=false;
	}

	document.getElementById("operacion_tab3").value="Paso3";
	if(permitido==true)
		document.getElementById("form3").submit();
}

function validar_formulario3(){
	permitido=true;
	valor0=document.getElementById('cedula_docente').value;
	valor1=document.getElementById('cedula_representante').value;
	valor2=document.getElementById('email_representante').value;
	valor3=document.getElementById('nombre_representante').value;
	valor4=document.getElementById('apellido_representante').value;
	valor5=document.getElementById('fecha_nacimiento_representante').value;
	valor6=document.getElementById('lugar_nacimiento_representante').value;
	valor7=document.getElementById('direccion_representante').value;
	valor8=document.getElementById('telefono_habitacion_representante').value;
	valor9=document.getElementById('lugar_trabajo').value;
	valor10=document.getElementById('parentesco').value;
	//Utilizamos una expresion regular para validar email
	var regex = /[\w-\.]{2,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
	var cedula_rif = /^[VGJE-vgje]\d{7,9}$/;
	var autocompletado = /\d{1,}[_]{1}[\w-]/;
	var ac_cedula_rif = /^[VGJE-vgje]\d{7,9}[_]{1}[\w-]/;
	if(valor0.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Seleccione a un docente')
		permitido=false;
	}
	else if(!ac_cedula_rif.test(valor0.trim())){
		alert('Error en campo cédula del docente','warning','<font style=\'color:red\'><p>Valor no válido. </br> El valor permitido es: </br> Cédula / RIF segido de underscore ( _ ) segido del Nombre / Razón Social. </br> Ejemplo: V000000000_NOMBRE DE PERSONA</p></font>');
		permitido=false;
	}
	else if(valor1.replace(/^\s+|\s+$/gi,"").length==0){
		alert('Ingrese un representante')
		permitido=false;
	}
	else if(!cedula_rif.test(valor1.trim())){
		alert('Error en la cédula ingresada ('+valor1+'), formato permitido de una cédula/rif: V210569852 -> la letra puede ser V, G, J, E y minimo 8 maximo 9 digitos');
		permitido=false;
	}
	else if(valor1.replace(/^\s+|\s+$/gi,"").length<=6){
		alert('La cédula del representante ingresada de ser mayor a 5 dígitos')
		permitido=false;
	}
	/*else if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese un correo electrónico')
		permitido=false;
	}
	else if(!regex.test(valor2.trim())){ //para no permitir que se quede en blanco
		alert('La direccion de correo electrónico no es válida, la forma correcta sería por ejemplo pedroperez@gmail.com');
		permitido = false;
	}*/
	else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el nombre del representante')
		permitido=false;
	}
	else if(valor4.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el apellido del representante')
		permitido=false;
	}
	else if(valor5.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese la fecha de nacimiento del representante')
		permitido=false;
	}
	else if(valor6.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el lugar de nacimiento del representante')
		permitido=false;
	}
	else if(!autocompletado.test(valor6.trim())){
		alert('Error en campo lugar de nacimiento del representante','warning','<font style=\'color:red\'><p>Valor no válido. </br> El valor permitido es: </br> digito segido de underscore ( _ ) segido de texto. </br> Ejemplo: 0_Algun Texto</p></font>');
		permitido=false;
	}
	else if(valor7.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese la dirección del representante')
		permitido=false;
	}
	/*else if(valor8.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el teléfono habitación del representante')
		permitido=false;
	}*/
	else if(valor9.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el lugar de trabajo del representante')
		permitido=false;
	}
	else if(!autocompletado.test(valor9.trim())){
		alert('Error en campo lugar de trabajo del representante','warning','<font style=\'color:red\'><p>Valor no válido. </br> El valor permitido es: </br> digito segido de underscore ( _ ) segido de texto. </br> Ejemplo: 0_Algun Texto</p></font>');
		permitido=false;
	}
	else if(valor10.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Seleccione el parentesco del representante con el estudiante')
		permitido=false;
	}
	else if(!autocompletado.test(valor10.trim())){
		alert('Error en campo parentesco','warning','<font style=\'color:red\'><p>Valor no válido. </br> El valor permitido es: </br> digito segido de underscore ( _ ) segido de texto. </br> Ejemplo: 0_Algun Texto</p></font>');
		permitido=false;
	}

	document.getElementById("operacion_tab4").value="Paso4";
	if(permitido==true)
		document.getElementById("form4").submit();
}