function validar_formulario(param){
	//para validar en caso q no return false
	permitido=true;

	valor=document.getElementById('seccion').value;
	valor0=document.getElementById('descripcion').value;
	valor1=document.getElementById('turno').value;
	valor2=document.getElementById('capacidad_min').value;
	valor3=document.getElementById('capacidad_max').value;
	materias = document.getElementsByName('materias[]');
	docentes = document.getElementsByName('docentes[]');
	if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
		if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el número de la sección')
			permitido=false;
		}else if(valor0.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese el nombre de la sección')
			permitido=false;
			}else if(valor1==0){
			alert('Seleccione un Turno')
			permitido=false;
		}else if(valor2.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese la capacidad mínima de la sección')
			permitido=false;
		}else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se quede en blanco
			alert('Ingrese la capacidad máxima de la sección')
			permitido=false;
		}
		else if(materias && docentes){
			arregloM = new Array();
			arregloD = new Array();
			for(i=0;i<materias.length;i++){
				arregloM.push($('#materia_'+i).val());
				arregloD.push($('#docente_'+i).val());
			}
			if(contarRepetidos(arregloM)>0){
				alert('¡La Materia no se puede repetir!')
				permitido = false
			}
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
}