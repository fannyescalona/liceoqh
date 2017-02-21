$(document).ready(init);
function init(){

	if($("materia").val()!=""){
		var Combo = {"operacion":"ComboMateria","seccion":$("#seccion").val(),"cedula_docente":$("#cedula_docente").val()};
		comboDependiente(Combo,"../controladores/cont_materia.php",$("#codigo_materia"),['materia']);
	}

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
	        },
	        error: function(jqXHR, textStatus, errorThrown){
	        	alert('¡Error al procesar la petición! '+textStatus+" "+errorThrown)
	        }
        });
	});
}

function validar_formulario(param){
	//para validar en caso q no return false
	permitido=true;

	valor=document.getElementById('seccion').value;
	valor2=document.getElementById('codigo_msd').value;
	valor3=document.getElementById('codigo_lapso').value;
	descripcion=document.getElementsByName('descripciones[]');
	porcentaje=document.getElementsByName('porcentajes[]');
	if(devuelve_boton(param)=="Registrar" || devuelve_boton(param)=="Modificar"){
		if(valor.replace(/^\s+|\s+$/gi,"").length==0){ //para no permitir que se queda en blanco
			alert('Seleccione una sección')
			permitido=false;
		}
		else if(valor3.replace(/^\s+|\s+$/gi,"").length==0){
			alert('Seleccione un lapso')
			permitido=false;
		}
		else if(descripcion && porcentaje){
			arregloD = new Array();
			var ptotal = 0;
			var maxprocentaje = false;
			for(i=0;i<descripcion.length;i++){
				arregloD.push($('#descripcion_'+i).val());
				if(parseFloat($('#porcentaje_'+i).val()) > 25)
					maxprocentaje = true;
				ptotal+=parseFloat($('#porcentaje_'+i).val());
			}
			if(maxprocentaje){
				alert("Error","info","<font style='color:red;'>¡El porcentaje de cada unidad debe ser menor o igual a 25!</font>");
				permitido = false;
			}
			if(ptotal > 100){
				alert("Error","info","<font style='color:red;'>¡El porcentaje total debe ser menor a 100!<br>Total porcentaje enviado: "+ptotal+"</font>");
				permitido = false;
			}
			if(contarRepetidos(arregloD)>0){
				alert('¡La descripción no se puede repetir!');
				permitido = false;
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