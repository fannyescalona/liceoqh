function validar_formulario(param){
//para validar en caso q no return false
permitido=true;

valor=document.getElementById('nombre_ciudad').value;
valor2=document.getElementById('cod_ciudad').value;
valor3=document.getElementById('cod_estado').value;
if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
alert('Ingrese el nombre de la Ciudad')
permitido=false;
}else if(valor3==0){
	alert('Seleccione un Estado')
	permitido=false;
}
}
	
if(devuelve_boton(param)=="Desactivar"){
	
  	if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('consultar antes desactivar')
		permitido=false;
		return false;
	}	
	
    if(!confirm(stringUnicode("¿Está seguro que desea desactivar este registro?"))){
    	return false
    }
}

document.getElementById("operacion").value=devuelve_boton(param);
if(permitido==true)
document.getElementById("form").submit();
}
