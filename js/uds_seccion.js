function validar_formulario(param){
//para validar en caso q no return false
permitido=true;

valor=document.getElementById('seccion').value;
valor0=document.getElementById('nombre_seccion').value;
valor1=document.getElementById('turno').value;
valor2=document.getElementById('cod_periodo').value;
valor3=document.getElementById('cod_semestre').value;
valor4=document.getElementById('capacidad_min').value;
valor5=document.getElementById('capacidad_max').value;
valor6=document.getElementsByName('materias[]');
if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
	if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el número de la sección')
		permitido=false;
	}else if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese el nombre de la sección')
		permitido=false;
	}else if(valor4.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese la capacidad mínima de la sección')
		permitido=false;
	}else if(valor5.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
		alert('Ingrese la capacidad máxima de la sección')
		permitido=false;
	}else if(valor1==0){
		alert('Seleccione un Turno')
		permitido=false;
	}else if(valor2==0){
		alert('Seleccione un Período')
		permitido=false;
	}else if(valor3==0){
		alert('Seleccione un Semestre')
		permitido=false;
	}else if(valor6){
		arreglo = new Array();
		numero=0;
		for(i=0;i<valor6.length;i++){
			numero=i;
			arreglo.push(document.getElementById('materia_'+i).value);
		}
		if(contarRepetidos(arreglo)>0){
			alert('No pueden haber materias repetidas!')
			return false;
		}
	}
}
	
if(devuelve_boton(param)=="Desactivar"){
    if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
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

function contarRepetidos(arreglo){
    var arreglo2 = arreglo;
    var con=0;
    for (var m=0; m<arreglo2.length; m++)
    {
        for (var n=0; n<arreglo2.length; n++)
        {
            if(n!=m)
            {
                if(arreglo2[m]==arreglo2[n])
                {
                	con++;
                }
            }
        }
    }
    return con;
}