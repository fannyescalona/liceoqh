$(document).ready(init);

function valida_rif(palabra){
	//formato permitido de una cédula/rif: V210569852 -> la letra puede ser V, G, J, E y minimo 7 maximo 9 digitos
	var patron = /^[VGJE-vgje]\d{7,9}$/;
	return patron.test(palabra);
}

function init(){
	//	Validaciones en tiempo real de algunos campos claves
	$('#cedula').on('keyup',function(){
		if(!valida_rif($(this).val())){
			$(this).css({"border":"2px solid #B21D11"});
			$(this).focus();
		}
		else
			$(this).css({"border":"1px solid #CCC"});
	});
	$('#cedula').on('change',function(){
		if(!valida_rif($(this).val())){
			alert('Error en la cédula ingresada ('+$(this).val()+'), formato permitido de una cédula/rif: V210569852 -> la letra puede ser V, G, J, E y minimo 7 maximo 9 digitos');
			$(this).css({"border":"2px solid #B21D11"});
			$(this).focus();
		}
	});
	//	Limitamos la fecha de ingreso
	$('#fecha_nacimiento').change(function(){
        var day1 = $(this).datepicker('getDate').getDate();
        var month1 = $(this).datepicker('getDate').getMonth() + 1;
        var year1 = $(this).datepicker('getDate').getFullYear();
        var fechaactual = new Date();
        year1 = year1+18;
        if(year1 < fechaactual.getFullYear())
			var fullDate = day1 + "/" + month1 + "/" + year1;
		else
			var fullDate = day1 + "/" + month1 + "/" + fechaactual.getFullYear();
		$("#fecha_ingreso").datepicker("option", "minDate", fullDate);
	});
	//Búsquedas de las parroquias por autocompletar.
	$('#lugar_nacimiento').autocomplete({
		source:'../autocomplete/parroquia.php', 
		minLength:1
	});
	//	Ocultar Elementos references al personal de la institución
	if($('input:radio[name=espersonalinstitucion]:checked').val()=='Y'){
		$('#personal1').show();
		$('#personal2').show();
	}
	else if($('input:radio[name=espersonalinstitucion]:checked').val()=='N'){
		$('#personal1').hide();
		$('#personal2').hide();
	}
	// Ocultar/Mostrar Elementos references al personal de la institución
	$('input[name=espersonalinstitucion]').change(function(){
		if($('input:radio[name=espersonalinstitucion]:checked').val()=='Y'){
			$('#personal1').show();
			$('#personal2').show();
		}
		else if($('input:radio[name=espersonalinstitucion]:checked').val()=='N'){
			$('#personal1').hide();
			$('#personal2').hide();
		}
	});

}

function validar_formulario(param){
	//para validar en caso q no return false
	permitido=true;
	valor1=document.getElementById('cedula').value;
	valor2=document.getElementById('nombres').value;
	valor3=document.getElementById('apellidos').value;
	valor4=document.getElementById('genero').value;
	valor5=document.getElementById('fecha_nacimiento').value;
	valor6=document.getElementById('lugar_nacimiento').value;
	valor7=document.getElementById('direccion').value;
	valor8=document.getElementById('telefono_habitacion').value;
	valor9=document.getElementById('telefono_movil').value;
	valor10=document.getElementById('email').value;
	valor11=document.getElementById('epiSI').checked;
	valor12=document.getElementById('carga_horaria').value;
	//Utilizamos una expresion regular para validar email
	var regex = /[\w-\.]{2,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
	var cedula_rif = /^[VGJE-vgje]\d{7,9}$/;
	var autocompletado = /\d{1,}[_]{1}[\w-]/;
	if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
		if(valor1.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese la cédula')
			permitido=false;
		}
		/*else if(valor1.replace(/^\s+|\s+$/gi,"").length<=7){ //para no permitir que se quede en blanco
			alert('La cédula ingresada debe ser mayor a 6 dígitos')
			permitido=false;
		}*/
		else if(!cedula_rif.test(valor1.trim())){
			alert('Error en la cédula ingresada ('+valor1+'), formato permitido de una cédula/rif: V210569852 -> la letra puede ser V, G, J, E y minimo 7 maximo 9 digitos');
			permitido=false;
		}
		else if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el nombre')
			permitido=false;
		}
		else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el apellido')
			permitido=false;
		}
		else if(valor5.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese la fecha de nacimiento')
			permitido=false;
		}
		else if(valor6==0){
			alert('Seleccione un lugar de nacimiento')
			permitido=false;
		}
		else if(!autocompletado.test(valor6.trim())){
			alert('Error en campo lugar de nacimiento','warning','<font style=\'color:red\'><p>Valor no válido. </br> El valor permitido es: </br> digito segido de underscore ( _ ) segido de texto. </br> Ejemplo: 0_Algun Texto</p></font>');
			permitido=false;
		}
		else if(valor7.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese la dirección')
			permitido=false;
		}
		/*else if(valor8.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el teléfono de habitación')
			permitido=false;
		}
		else if(valor9.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el teléfono de movil')
			permitido=false;
		}
		else if(valor10.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el correo electrónico')
			permitido=false;
		}*/
		else if(valor10.replace(/^\s+|\s+$/gi,"").length!=0 && !regex.test(valor10.trim())){
			alert('La direccion de correo electrónico no es válida, la forma correcta sería por ejemplo pedroperez@gmail.com');
			permitido = false;
		}
		else if(valor11 && valor12 > 36){
			alert('La carga horaria no debe ser mayor a 36');
			permitido = false;
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
		document.getElementById("form").submit();
}