<?php
   require_once("class_bd.php");
   require_once("class_perfil.php");
   class Html 
   {
	  private $c,$con;
	  public function __construct()
	  {
	    $this->c=new Conexion();
	  }
	  
	  public function __destruct()
	  {	  
	  }
	  
      public function Generar_Opciones($sql,$codigo,$descripcion,$Seleccionado)
	  { 
		 $lbResultado=false;
		 
		 $query=$this->c->Ejecutar($sql);
		 $Seleccionado!="null"? 
		 $opcion_inicial="<option value='null' > Elige una opcion...</option>": $opcion_inicial="<option value='' selected> Elige una opcion...</option>";
		 echo $opcion_inicial;
		 while($Datos=$this->c->Respuesta($query))
         {
			$lbResultado=true;
		    $id=$Datos[$codigo];
			$value=$Datos[$descripcion];
			if ($id==$Seleccionado)
			{
			  echo "<option value='$id' selected> $value</option>";
			}
			else
			{
			  echo "<option value='$id'>$value</option>";
			}
		 }
		 return $lbResultado;
	  }
	  	  
	        public function Generar_checkbox($sql,$codigo,$descripcion,$Seleccionado)
	  { 
		 $lbResultado=false;
		 $query=$this->c->Ejecutar($sql);
		 $x=-1;
		 while($Datos=$this->c->Respuesta($query))
         {
             $x++;			    
			    $lbResultado=true;
		       $id=$Datos[$codigo];
			    $value=$Datos[$descripcion];
			    $var=false;
			   if(is_array($Seleccionado)){
                $var=in_array($id,$Seleccionado);			   	
			   	}
			if (is_array($Seleccionado)==true && $var==true)
			{
			  echo $value."<input type='checkbox' value='".$id."' name='".$codigo."[]' id='".$codigo.$x."' checked />&nbsp; | &nbsp;";
			}
			else
			{
			  echo $value."<input type='checkbox'  value='".$id."' name='".$codigo."[]' id='".$codigo.$x."' />&nbsp;|&nbsp; ";
			}
		 }
		// $this->c->Liberar_Resultado($Datos);
		 return $lbResultado;
	  }
	

	public function configurar_menu($perfil_usuario)
	  {
	  	echo "<script>
    function checkear(param){
    	       var x=0;
	          var AB = document.getElementsByClassName(param);
	            for(i=1;i<AB.length;i++){
		             if(AB[i].checked){
			          AB[0].checked=true;
			          x++;
		             }
	          }
	           if(AB[0].checked==true && x==0){
			          AB[0].checked=false;
		            return false;
	            }
            }
            
           function checkear2(param){
    	       var x=0;
	          var AB = document.getElementsByClassName(param);
               if(AB[0].checked){
                   prompt('yes')               	
               	}	            
	            for(i=1;i<AB.length;i++){
		             if(AB[i].checked){
			          AB[0].checked=true;
			          x++;
		             }
	          }
	           if(AB[0].checked==true && x==0){
			          AB[0].checked=false;
		            return false;
	            }
            }
            
           
            function seleccionar_todos(param){
         
             var t=document.getElementsByTagName('input');

                 for(i=0;i<t.length;i++){
             	       if(t[i].type=='checkbox')
             	          t[i].checked=param; 
             	    }
                 document.getElementById('todos').checked=true;
                  	if(param==true){
                     document.getElementById('todos').checked=true;
                     document.getElementById('ninguno').checked=false;
            		 }else{
            	      document.getElementById('todos').checked=false;
                     document.getElementById('ninguno').checked=true;
            		 }            	
            	}

    </script>"; 
	     $perfil=new Perfil();
		 $query=$this->c->Ejecutar("SELECT * FROM tmodulos where fecha_desactivacion is null");
       echo "Todos&nbsp;&nbsp;
       <input onclick=seleccionar_todos(true) type='checkbox' name='todos' id='todos'/> 
       / Ninguno&nbsp;&nbsp;<input onclick=seleccionar_todos(false) type='checkbox' name='ninguno' id='ninguno'/>";		 
		 echo "<table style='width:100%;font-size:9pt' border=2>";
		 echo "<tr style='color:#FFFFFF;background:#000'><td>SERVICIOS / OPCIONES</td><td><table border=2 style='width:100%'><tr>";
		 $query3=$this->c->Ejecutar("SELECT * FROM topciones where fecha_desactivacion is null");
		 while($Datos3=$this->c->Respuesta($query3)){  //opciones
		 echo "<td style='width: 118px;'>".$Datos3['nombre_opciones']."</td>";
		 }
	    echo "</tr></table></td></tr>";
		 while($Datos1=$this->c->Respuesta($query)) // modulos
         {
          $query2=$this->c->Ejecutar("SELECT * FROM tservicios where cod_modulo='".$Datos1['cod_modulo']."' and fecha_desactivacion is null");         	
	       echo "<tr style='color:#FFFFFF;background:#8B0000'>";
	           echo "<td align='left'><input type='hidden' value='".$Datos1['cod_modulo']."' name='modulos[]'/>"."&nbsp;&nbsp;&nbsp;".$Datos1['nombre_modulo']."</td><td>".""."</td>";
	       echo "</tr>";
	           while($Datos2=$this->c->Respuesta($query2)){  // servicios
            $perfil->codigo_perfil($perfil_usuario);
            $perfil->codigo_servicios($Datos2['cod_servicios']);             	       	
	       	$perfil->Consultar_SERVICIOS()==true? $checked='checked': $checked='';
  	       echo "<tr>";
	           echo "<td align='left' style='padding-left:2em;'>"; 
	           echo "<input onclick=checkear2(this.class) class='cls_".$Datos2['cod_servicios']."' $checked type='checkbox' name='servicios[]' value='".$Datos2['cod_servicios']."'/>"; 
	           echo $Datos2['nombre_servicios']; 
	           echo "</td>"; 
	                 $query3=$this->c->Ejecutar("SELECT * FROM topciones where fecha_desactivacion is null");
	                 	           echo "<td><table border=0 class='options'><tr>"; 
                        
	                   while($Datos3=$this->c->Respuesta($query3)){  //opciones
	                                    	           echo "<td style='border-right:1px #000 solid;'>";          	
	                 	$perfil->codigo_opciones($Datos3['cod_opciones']);             	       	
	       	         $perfil->Consultar_OPCIONES()==true? $checked='checked': $checked='';
                       	          echo "<input onclick=checkear('cls_".$Datos2['cod_servicios']."') 
                       	          class='cls_".$Datos2['cod_servicios']."'
                       	           $checked type='checkbox' value='".$Datos3['cod_opciones']."' 
                       	           name='opciones[".$Datos2['cod_servicios']."][]'/> "."                      ";
                       	         echo "</td>";          	
	                 	}   
	                 		       echo "</tr></table></td>";    	 
	       echo "</tr>";
	       }
		   }
		 
      echo "<tr style='color:#FFFFFF;background:#8B0000'><td colspan=2>FIN DE SERVICIOS</td></tr></table>";		 
	  }  
	  //Funcion para optener la url actual
      public function obtenerURL(){
        $url="http://".$_SERVER['HTTP_HOST'].":".$_SERVER['SERVER_PORT'].$_SERVER['REQUEST_URI'];
        return $url;
      }
	      
   }
?>