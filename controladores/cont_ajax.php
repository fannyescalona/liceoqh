<?php
       session_start();
       
include_once("../clases/class_html.php");
		$sql=$id=$descripcion=null;
                 
               $html=new Html();
              if(isset($_POST['combo'])) {
	                  
		               
		              if($_POST['combo']=="seccion"){
                     $id="cod_materia";
                     $descripcion="nombre_materia";
                     $sql="SELECT m.cod_materia, m.nombre_materia
FROM tmateria m
INNER JOIN tmateria_seccion AS tmats ON tmats.cod_materia = m.cod_materia
INNER JOIN tseccion AS s ON s.seccion = tmats.seccion
WHERE m.fecha_desactivacion IS NULL 
AND s.seccion='".$_POST["elegido"]."' order by m.nombre_materia";
                             if(isset($_POST['elegido1'])) $Seleccionado=$_POST['elegido1']; else $Seleccionado='null';
                     }
          }
                     @$html->Generar_Opciones($sql,$id,$descripcion,$Seleccionado); 
	                
	                  
     ?>