function validar_formulario(param){
//para validar en caso q no return false
permitido=true;

valor=document.getElementById('hora_inicio').value;
valor2=document.getElementById('hora_fin').value;
if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
alert('Ingrese la hora de inicio')
permitido=false;
}else if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
alert('Ingrese la hora fin')
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
