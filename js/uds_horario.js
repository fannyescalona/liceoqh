var HoraAsignado=0;
var HoraTotal=0;
var HoraLibre=0;
var indice=0;
var indice_asignado=0;


function validar_formulario(param){
permitido=true;
 document.getElementById('operacion').value=devuelve_boton(param);
if(permitido==true)
document.getElementById('form').submit();
}



$(document).on("ready",Principal);

    function cargar_datos(){

 $("#seccion").on('change',function () {
	            elegido=$(this).val();
				elegido1=$("#lapso").val();
				elegido2=$("#ambiente").val();
	          var parametros={ "seccion": elegido,"periodo": elegido1,combo: "seccion", "ambiente": elegido2  } ;       

	 
	         $.ajax({
                data:  parametros,
                url:   '../controladores/cont_ajax2.php',
                type:  'post',
                success:  function (response) {
                	 sacar_valor=$.parseJSON(response);				  
                   for(i=0;i<sacar_valor.length;i++){
                    datos=sacar_valor[i].celda+"*"+sacar_valor[i].seccion+"*"+sacar_valor[i].ambiente+"*"+sacar_valor[i].materia+"*"+sacar_valor[i].profesor;				   
                    campo="<input type='hidden' name='contenidos[]' id='"+sacar_valor[i].celda+"_vo'  value='"+datos+"'/>";
					     dia=Array("Domingo","Lunes","Martes","Miercoles","Jueves","Viernes","Sabado");
                    datos_img="Dia: "+dia[sacar_valor[i].dia]+"<br>Hora: "+sacar_valor[i].hora+"<br>Materia: "+sacar_valor[i].nombre_materia+"<br>Prof: "+sacar_valor[i].nombre+" "+sacar_valor[i].apellido+"<br>Aula: "+sacar_valor[i].nombre_ambiente;
                  
                   var img="<img src='../images/marca.png' alt='"+datos_img+"'/>";

                     $("#"+sacar_valor[i].celda).removeAttr('class').html('').html('Asignado').addClass("asignado").append(campo).append(img);
				     }
                     
                     
                //var campo="<input type='hidden' name='contenidos[]' id='"+celda.prop('id')+"_vo'  value='"+valor+"'/>";
				//celda.append(campo);
				
                }
              });
			
	 
	 
	 
	 
            if($(this).val()=="null" ||$(this).val()==""){
				$("#materia").html("<option value='null'>Elige una opcion...</option>").attr("disabled","disabled");
            $("#cedula > option[value='']").attr("selected",true);       				
				$("#cedula").prop("disabled","disabled");
            				
				}else{
			   $("#materia > option[value='']").attr("selected",true);       
				$("#materia").attr("disabled",false);
				}
   		$("#seccion option:selected").each(function () {
				elegido=$(this).val();
				$.post("../controladores/cont_ajax.php", { elegido: elegido,combo: "seccion" }, function(data){
				$("#materia").html(data);
			  });			
        });
       });    	
    	
   }
   
       function cargar_datos_celda(){

   $("#ambiente").on('change',function () {
	      $("#tb_horario tr td[id]").each(function(i){
						$(this).html('').removeAttr('class'); 
						 }); 
            if(!($(this).val()=="null" ||$(this).val()=="")){
             $("#seccion").prop("disabled","");
   		$("#ambiente option:selected").each(function () {
				elegido=$(this).val();
				elegido1=$("#lapso").val();
				
         var parametros={ "ambiente": elegido,"periodo": elegido1,combo: "ambiente" } ;       
        
     
        
        $.ajax({
                data:  parametros,
                url:   '../controladores/cont_ajax2.php',
                type:  'post',
                success:  function (response) {
                	 sacar_valor=$.parseJSON(response);
                	 
                   for(i=0;i<sacar_valor.length;i++)
                     $("#"+sacar_valor[i].celda).removeAttr('class').addClass("h_academica");
                }
        });
				
				//$('#resultados').text(JSON.stringify(datos, null, 4));
            //$('#respuesta').text(datos.respuesta).fadeIn('slow');   
				
				//$.post("../controladores/cont_ajax2.php", { "ambiente": elegido,"periodo": elegido1,combo: "ambiente" },
				// function(data){
			     //  });			
        });
        }else{
        	 $("#seccion").prop("disabled","disabled");
        	 $("#cedula").prop("disabled","disabled");
        	 $("#materia").prop("disabled","disabled");
        	 $("#cedula  > option[value='']").attr("selected",true);
        	 $("#materia > option[value='']").attr("selected",true); 
        	 $("#seccion > option[value='']").attr("selected",true);                    
          alert('debe seleccionar un ambiente')        	
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
			  HoraAsignado=parseInt(document.getElementById("A").value);
			  HoraTotal=parseInt(document.getElementById("T").value);
			  HoraLibre=parseInt(document.getElementById("L").value);
			  $("#tb_horario").live("click",function(){
			  indice_asignado=$("td.seleccionado").size();
			  });
			  $("#btaceptar").on("mouseover",function(){
                   $(this).prop("src","../images/add_hover.png")
			  	});
			  	$("#btaceptar").on("mouseout",function(){
                   $(this).prop("src","../images/add.png")
			  	});
         
          $("#materia").on('change',function () {
          	 
          if(!($(this).val()=="null" ||$(this).val()=="")){
              $("#cedula").prop("disabled","");             		             	   
             	  
           }else{
                 $("#cedula > option[value='']").attr("selected",true);       
                 $("#cedula").prop("disabled","disabled");             		
             		
             		}
             	
          	     
          	});			  	
			  	
			 }
		
		  function mostrar_alt(){
		   valor=$(this).prop('alt');
		   alert(valor);
		  }
		  function desactivar(){
		     if($(this).attr('class')=='seleccionado'){
			 HoraAsignado--;
			 HoraLibre++;
			 $("#celdalibre").html(HoraLibre);
			 $("#celdaasignado").html(HoraAsignado);
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
			// if(HoraTotal>HoraAsignado){
			// HoraAsignado++;
			 //HoraLibre--;
			 
			 $(this).removeClass($(this).attr('class')).addClass("seleccionado");
			 $("#celdalibre").html(HoraLibre);
			 $("#celdaasignado").html(HoraAsignado);
			 //}else{
			 //alert("<font style='color:red'>No puede selecciona m&#225;s "+indice_asignado+"/"+document.getElementById("L").value+"</font>");
			 //}
		    }
		  }
		   
		   function ExtraerDatos(){ 
		    $(this).removeClass('asignado');
		    $(this).removeAttr('title');
		    $(this).removeAttr('class');
		    id=$(this).prop('id')+'_vo';
		    $("#"+id).remove();
			this.innerHTML='';
			HoraAsignado--;
			HoraLibre++;
			$("#celdalibre").html(HoraLibre);
			$("#celdaasignado").html(HoraAsignado);
		   }
		   
		   function Enviar(){
          amb=$("#ambiente").val();
          sec=$("#seccion").val();
          pro=$("#cedula").val();
          mat=$("#materia").val();
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
			      //$(this).text("Asignado");
			      //$(this).addClass("asignado");
			      //$(this).removeClass("seleccionado");
			    var dia=Array("Domingo","Lunes","Martes","Miercoles","Jueves","Viernes","Sabado");	  
                x=$(this).prop("id").split('-');
                eldia=dia[x[1]];
                elegido=$("#lapso").val();
                var dataC=$(this);
            var parametros={ "periodo": elegido,"profesor": $("#cedula").val(),
            "celda": $(this).prop("id"), "combo": "profesor"  } ;   
    
              	$.ajax({
                data:  parametros,
                url:   '../controladores/cont_ajax2.php',
                type:  'post',
                success:  function (response) {
                	 sacar_valor=$.parseJSON(response);	
                     if(sacar_valor.length > 0){
                   for(i=0;i<sacar_valor.length;i++){
                      alert(sacar_valor[0].nombre+' '+ sacar_valor[0].apellido +' Tiene clase con la seccion '+
                      sacar_valor[0].seccion +' los dia '+ eldia + "  a "+dataC.prop('title'))
				        }

				     }else{
	               datos=dataC.prop("id")+"*"+$("#seccion option:selected").val()+"*"+$("#ambiente option:selected").val()+"*"+$("#materia").val()+"*"+$("#cedula").val();				   
				   var iii = document.form.ambiente.options[document.form.ambiente.selectedIndex].innerHTML;
				   datos_img="Dia: "+eldia+"<br>Hora: "+dataC.prop('title')+"<br>Materia: "+ 
				   $("#materia").val()+"<br>Prof: "+$("#cedula").val()+"<br>Aula: "+iii;			   
				      dataC.text("Asignado");
			          dataC.addClass("asignado");
			          dataC.removeClass("seleccionado");     
			          anadir_contenido(dataC,datos,datos_img);						 }
                }
              });              
			  }); 
             }
		  }
		  
		  
              
                  
               
               		  
		  
		  
		   function anadir_contenido(celda,valor,datos_img){	
				var campo="<input type='hidden' name='contenidos[]' id='"+celda.prop('id')+"_vo'  value='"+valor+"'/>";
				var img="<img src='../images/marca.png' alt='"+datos_img+"'/>";
				celda.append(campo);
				celda.append(img);
				indice++;
		   }
		   function validar(){
		   	/*
		   if(HoraLibre==0 && HoraTotal==HoraAsignado && indice_asignado==0){
			  return true;
			 }else if(HoraLibre==0 && indice_asignado>0){
			 	if(indice_asignado>1){ pl='as';nv=indice_asignado; }else{ pl='a';nv="";}
			 	alert("<font style='color:red'>Debe agregar contenido a l"+pl+" "+nv+" celd"+pl+" seleccionad"+pl+"!</font>");
             return false;			
			}else{
			 alert("<font style='color:red'>Completar todas las horas! "+HoraAsignado+"/"+HoraTotal+"</font>");
			 return false;
			 }*/
			 return false;
		   }
		   
