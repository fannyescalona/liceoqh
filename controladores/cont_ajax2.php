<?php
       
       session_start();
       
		   if($_POST['combo']=="ambiente"){
		    include_once("../clases/class_horario.php");
			    $Horario=new Horario();
			   echo $Horario->Resultado_Json_de_Consulta($_POST['ambiente'],$_POST['periodo']);
	       }
	            
	      if($_POST['combo']=="seccion"){
		    include_once("../clases/class_horario.php");
			    $Horario=new Horario();
			   echo $Horario->Resultado_Json_de_Consulta_Seccion($_POST['ambiente'],$_POST['seccion'],$_POST['periodo']);
	       } 
	       
	     if($_POST['combo']=="profesor"){
		    include_once("../clases/class_horario.php");
			    $Horario=new Horario();
            echo $Horario->Resultado_Json_de_Consulta_Validar_Profesor($_POST['celda'],$_POST['periodo'],$_POST['profesor']);
	       }       
     ?>
