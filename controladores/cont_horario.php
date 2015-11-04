<?php
session_start();
//echo $_SERVER["HTTP_REFERER"];


       include_once("../clases/class_horario.php");
       $horario=new Horario();
        $hubo_error=FALSE;
		 //$cedula=trim($_POST['cedula']);
		 $lapso=trim($_POST['lapso']);
		 $horario->codigo_lapso_academica($lapso);
		 $horario->Transaccion('iniciando');
	    
   if(isset($_POST['contenidos'])){
   	       $extraer_valor=explode('*',$_POST['contenidos'][0]);
             $horario->codigo_ambiente($extraer_valor[2]);
             $horario->seccion($extraer_valor[1]);
   	    if($horario->Comprobar_existencia())
		    $horario->Quitar_hora("todos");
   foreach($_POST['contenidos'] as $x => $y){   
	    $extraer_valor=explode('*',$y);
	    	    $extraer_valor2=explode('-',$extraer_valor[0]);
	    	    $dia=$extraer_valor2[1];
	    	    $hora=$extraer_valor2[0];
		       $horario->codigo_bloque_hora($hora);
             $horario->codigo_dia($dia);
             $horario->codigo_ambiente($extraer_valor[2]);
             $horario->codigo_materia($extraer_valor[3]);
             $horario->seccion($extraer_valor[1]);
             $horario->cedula_profesor($extraer_valor[4]);
             if(!$horario->Comprobar_horario_profesor())
             (!$horario->Registrar_Horario_Profesor())? $hubo_error=true : '';

        (!$horario->Registrar())? $hubo_error=true : '';
   }
   }else{
     header("Location: ".$_SERVER["HTTP_REFERER"]);
   }
                       if($hubo_error==true){ 
					        $horario->Transaccion('cancelado');
						    $_SESSION['datos']['mensaje']="Los datos no han podido guardar!";
		                     header("Location: ".$_SERVER["HTTP_REFERER"]);
							}
					    else{
							$horario->Transaccion('finalizado');
							 $_SESSION['datos']['mensaje']="Los datos han sido guardado exitosamente";
		                     header("Location: ../vistas/");
							}

?>