function validar_formulario(param){
//para validar en caso q no return false
permitido=true;

valor=document.getElementById('nombre_parroquia').value;
valor2=document.getElementById('cod_parroquia').value;
valor3=document.getElementById('cod_municipio').value;
if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
alert('Ingrese el nombre de la Parroquia')
permitido=false;
}else if(valor3==0){
	alert('Seleccione un Municipio')
	permitido=false;
}
}
	
if(devuelve_boton(param)=="Desactivar"){
	
      if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
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