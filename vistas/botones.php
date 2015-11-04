<?php
 require_once("../clases/class_perfil.php");
function imprimir_boton($disabledRC,$disabledMD,$estatus,$URLservicios){
  	
  	
  	$perfil=new Perfil();
   $perfil->codigo_perfil($_SESSION['user_codigo_perfil']);
   $perfil->url_servicios($URLservicios); 
   $a=$perfil->IMPRIMIR_OPCIONES();
               	       	
   echo '<input type="hidden" name="operacion" value="" id="operacion" />';
for($x=0;$x<count($a);$x++) {
	if($a[$x]['orden']==1){   
   echo '<input '.$disabledRC.' onclick="validar_formulario(this.id)" 
   type="button" id='.$a[$x]['orden'].' name="btregistrar" value="'.ucfirst (strtolower($a[$x]['nombre_opciones'])).'"  /> &nbsp;';
   }
  if($a[$x]['orden']==5){   
  echo '<input '.$disabledRC.' onclick="validar_formulario(this.id)" type="button" id='.$a[$x]['orden'].' 
  name="btbuscar" value="'.ucfirst (strtolower($a[$x]['nombre_opciones'])).'"  /> &nbsp;';
  }
  	if($a[$x]['orden']==2){   
  echo '<input '.$disabledMD.' onclick="validar_formulario(this.id)" type="button" 
  id='.$a[$x]['orden'].' name="btmodificar" value="Modificar"  /> &nbsp;';
   }
    if($estatus==null){
      $ACT='disabled';
      $DES='disabled';    	
    	}elseif($estatus=='Activo') {
      $ACT='disabled';
      $DES=''; 
      }elseif($estatus=='Desactivado'){
           $ACT='';
           $DES='disabled';       	
      	}
	if($a[$x]['orden']==4){   
   echo '<input '.$ACT.' onclick="validar_formulario(this.id)" type="button" id='.$a[$x]['orden'].' 
   name="btactivar" value="'.ucfirst (strtolower($a[$x]['nombre_opciones'])).'"   /> &nbsp;';
   }  

  if($a[$x]['orden']==3){   
   echo '<input '.$DES.' onclick="validar_formulario(this.id)" type="button" id='.$a[$x]['orden'].' 
   name="btdesactivar" value="'.ucfirst (strtolower($a[$x]['nombre_opciones'])).'"   /> &nbsp;';
   }
   	if($a[$x]['orden']==6){   
  echo '<input  onclick="limpiar()" type="button" name="btcancelar" value="'.ucfirst (strtolower($a[$x]['nombre_opciones'])).'"     />&nbsp;';
   }
   	if($a[$x]['orden']==7){   
  echo '<input  onclick="location=\'?'.$URLservicios.'&l\'" type="button" name="btlistar" id='.$a[$x]['orden'].' 
  value="'.ucfirst (strtolower($a[$x]['nombre_opciones'])).'"  /> &nbsp;';
  }
  }
}
?>