<?php
    session_start();
	     include_once("../clases/class_horario.php");
	     $horario=new Horario();
	     $profesor=new Horario();;
		 if(isset($_POST['lapso']) and !empty($_POST['lapso'])){
           $lapso=trim($_POST['lapso']);
        }
		 if(isset($_POST['cedula'])){
	     $buscar_como=null;
	if(!isset($_GET['horario_completo'])){
	if(isset($_POST['cedula']) and !empty($_POST['cedula'])){
       $cedula=trim($_POST['cedula']);
    }
	    $profesor->cedula($cedula);
	  if($profesor->Consultar_cedula()){
	     $horario->cedula_profesor($cedula);
		 $horario->codigo_lapso_academica($lapso);	       
	
	if(true){
	     if(!$horario->Comprobar_existencia()){
		    $datos=$horario->Consultar();
			for($i=0;$i<count($datos['dia']);$i++){
			   $_SESSION['datos']['dia'][$i]=$datos['dia'][$i];
			   $_SESSION['datos']['hora'][$i]=$datos['hora'][$i];
			   $_SESSION['datos']['ambiente'][$i]=$datos['ambiente'][$i];
			   $_SESSION['datos']['cedula'][$i]=$datos['cedula'][$i];
			   $_SESSION['datos']['lapso'][$i]=$datos['lapso'][$i];
			   $_SESSION['datos']['celda'][$i]=$datos['celda'][$i];
			   $_SESSION['datos']['descripcion'][$i]=$datos['descripcion'][$i];
	       }
	
			 $_SESSION['datos']['turno']=$_POST['turno'];
		  if(isset($_POST['formato']) and $_POST['formato']=="pdf")
		   header("Location: ../pdf/?horario-profesor");
		   else
		   header("Location: ".$_SERVER['HTTP_REFERER']);
		 }else{
		 	  $_SESSION['datos']['turno']=$_POST['turno'];
		      $_SESSION['datos']['cedula_profesor']=$cedula;
	          $_SESSION['datos']['lapso']=$lapso;
			  if(isset($_POST['formato']) and $_POST['formato']=="pdf"){
			  $_SESSION['datos']['mensaje']=$profesor->nombre().' '.$profesor->apellido().' no ha entregado su horario administrativo para ese lapso';
		      header("Location: ".$_SERVER['HTTP_REFERER']);
			  } else
		   	  header("Location: ../vistas/formularios/?horario");
		 }
		     $_SESSION['datos']['cedula_profesor']=$cedula;
			  $_SESSION['datos']['nombre']=$profesor->nombre();
			  $_SESSION['datos']['apellido']=$profesor->apellido();
	          $_SESSION['datos']['lapso']=$lapso;
		 }else{
		     $_SESSION['datos']['mensaje']='Aun no puede registrar horario administrativo del profesor,<br> debe esperar el horario academico';
	         header("Location: ../vistas/paginas/?horario");
		 }  	  
	  }else{
	  $_SESSION['datos']['mensaje']='Este profesor no esta registrado en el sistema';
	  header("Location: ../vistas/paginas/?horario");
	  }
	
	}
	
	
	}else{
	  $_SESSION['datos']['lapso']=$lapso;
	  header("Location: ../reportes/?horario-completo");
	 }
	?>
