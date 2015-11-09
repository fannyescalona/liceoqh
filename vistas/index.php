<?php
session_start();
date_default_timezone_set("America/Caracas");

$ccc=explode('?',$_SERVER['REQUEST_URI']);
$cccc=explode('&',$ccc[1]);
$ccccc=explode('=',$cccc[0]);
$url='../manuales/'.strtolower($ccccc[0].'.pdf');

if(isset($_SESSION['user_estado'])){
  ?>
  <!DOCTYPE html>
  <html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>:..Liceo Quebrada Honda</title>
    <link rel="stylesheet" href="../css/jquery-ui.css" />
    <link rel="stylesheet" href="../css/normalize.css" />
    <link rel="stylesheet" href="../css/bootstrap.css" />
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../librerias/noty/buttons.css"/>
    
    <link rel="stylesheet" href="../librerias/alert/Alert.css" />
    <script src="../librerias/alert/Alert.js"></script>    
    <!-- load jQuery -->
    <script src="../js/jquery.min.js"></script>
    <script src="../js/jquery.js"></script>
    <script src="../js/jquery-ui.js"></script>
    <script src="../js/jquery.ui.datepicker-es.js"></script>
    <script src="../js/jquery-ui-timepicker.js"></script>
    <!-- load BootStrap -->
    <script src="../js/bootstrap.min.js"></script>
    <!-- load Noty-->
    <script src="../librerias/noty/jquery.noty.packaged.min.js"></script>
    <!-- load Main File -->
    <script src="../js/main.js"  type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../css/css_04.css"/>
    <script type="text/javascript" >
  
              function loading_modal(){
                   <?php
              if(isset($_GET['horario_seccion'])){
                //echo "alertDGC(document.getElementById('xx'));";                
                }            
             ?>
              
              
              }

      </script>
  
  </head>
  <body onload="javascript:loading_modal()">

    <div id='sidebar'>
      <a href='<?PHP echo  $_SERVER['SCRIPT_NAME']; ?>'><img id='logo' src='../images/qhlogo.png'></a>
      <?php
      if($_SESSION['user_estado']==1){
       include("menu.php");
     }
     ?>
   </div>
   <div id="mainBody">

    <h1>
      <?php 
      /*************************************
 Devuelve una cadena con la fecha que se 
 le manda como parámetro en formato largo.
 *************************************/
 function FechaFormateada2($FechaStamp)
 { 
  $ano = date('Y',$FechaStamp);
  $mes = date('n',$FechaStamp);
  $dia = date('d',$FechaStamp);
  $diasemana = date('w',$FechaStamp);

  $diassemanaN= array("Domingo","Lunes","Martes","Miércoles",
    "Jueves","Viernes","Sábado"); $mesesN=array(1=>"Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio",
    "Agosto","Septiembre","Octubre","Noviembre","Diciembre");
    return $diassemanaN[$diasemana].", $dia de ". $mesesN[$mes] ." de $ano";
  }


//Para utilizar la función, se le manda una fecha como parámetro, por ejemplo, si se quisiera imprimir la fecha actual, utilizaríamos el siguiente código:

  $fecha = time();
  echo FechaFormateada2($fecha);


       /*setlocale(LC_ALL, "es_ES");
       print   strftime(" %A, %d de %B de %Y");*/

       ?>


       <div class="pull-right">                         
        <a href="#" title="" class="btn btn-large"><i class="icon icon-question-sign"></i> <span>Manual de Usuario</span></a>
        <a href="?mi-perfil" title="" class="btn btn-large"><i class="icon icon-user"></i> <span>Perfil</span></a>
        <a onclick="salir()"  title="Salir" class="btn btn-large btn-danger"><i class="icon-off"></i></a>
      </div>
    </h1>
    <div id="breadcrumb">
      <a class="tip-bottom" title="" href="./" data-original-title="Principal"><i class="icon-home"></i> Principal</a>
      <a class="current" href="./" id="titulo-menu">Principal</a>
    <?php if(!empty($_GET)){?>
      <div style="float:right"><a href="<?php echo $url;?>" target="_blank">
       <img src="../images/ayuda.png" style="height:40px;cursor:pointer;"></a>
      </div>
      <?php } ?>  
    </div>
    <div class="container-fluid">
      <div class="row-fluid">
        <div style="text-align: center;" class="span12 center">
         <?php 

         include("botones.php");
         if($_SESSION['user_estado']==3){
           $_SESSION['datos']['mensaje']="Completa los datos de seguridad";
           include("serv_usuario.php");                                           	
         }elseif($_SESSION['user_estado']==2){
          $_SESSION['datos']['mensaje']="Usuario bloqueado por intentos fallidos. Por favor recupere su contraseña aqui";
          echo "<script>location.href='../?p=olvidar-clave'</script>";
          exit();
        }elseif($_SESSION['user_caducidad']=='1'){
          $_SESSION['datos']['mensaje']="Debe cambiar la Contraseña cada 180 dias";
          echo "<script>location.href='../?p=olvidar-clave'</script>";
          exit();
        }elseif($_SESSION['user_estado']==1){
            if(isset($_GET['perfil'])) include("serv_usuario.php"); //listo
            else if(isset($_GET['nuevousuario'])) include("serv_nuevo-usuario.php");
            else if(isset($_GET['cambiarcontrasena'])) include("serv_cambiar_contrasena.php"); //listo
            else if(isset($_GET['perfiles'])) include("serv_perfil.php"); //listo
            else if(isset($_GET['cargo'])) include("serv_cargo.php"); //listo
            else if(isset($_GET['botones'])) include("serv_opciones.php"); //listo
            else if(isset($_GET['pais'])) include("serv_pais.php"); //listo
            else if(isset($_GET['estado'])) include("serv_estado.php"); //listo
            else if(isset($_GET['municipio'])) include("serv_municipio.php"); //listo
            else if(isset($_GET['parroquia'])) include("serv_parroquia.php"); //listo
            else if(isset($_GET['materia'])) include("serv_materia.php"); //listo
            else if(isset($_GET['modulo'])) include("serv_modulo.php"); //listo
            else if(isset($_GET['seccion'])) include("serv_seccion.php"); 
            else if(isset($_GET['servicio'])) include("servicio.php"); //listo
            //else if(isset($_GET['estudiante'])) include("serv_estudiante.php");
            else if(isset($_GET['plantel'])) include("serv_plantel.php"); //listo
            else if(isset($_GET['persona'])) include("serv_persona.php"); 
            else if(isset($_GET['parentesco'])) include("serv_parentesco.php"); //listo
            else if(isset($_GET['ano_academico'])) include("serv_ano_academico.php"); //listo
            else if(isset($_GET['lapso'])) include("serv_lapso.php"); //listo  
            else if(isset($_GET['bitacora'])) include("serv_auditoria.php"); //listo
            else if(isset($_GET['inscripcion'])) include("serv_inscripcion.php"); //listo
            else if(isset($_GET['actualizar_pre_inscripcion'])) include("serv_preinscripcion.php");
            else if(isset($_GET['seleccionar_pre_inscripcion'])) include("serv_preinscripcion.php");
            else if(isset($_GET['inscribir_pre_inscripcion'])) include("serv_preinscripcion.php");
            else if(isset($_GET['periodo_inscripcion'])) include("serv_periodo_inscripcion.php");  
            else if(isset($_GET['comprobante_inscripcion'])) include("serv_comprobante_inscripcion.php"); 
            else include("serv_inicio.php"); //listo                               	                                          	                                        	                                          	                                         	                                          	                                        	                                          	
        }else {
          echo "<script>location.href='403.php'</script>";
        }

        ?>                                   
      </div>  
    </div>
  </div>
</div>
<?php
if(isset($_SESSION['datos']['mensaje'])){
  echo "<script>alert('".$_SESSION['datos']['mensaje']."')</script>";	
}
if(isset($_SESSION['datos']))
  unset($_SESSION['datos']);	
?>
</body>
</html>
<?php
}else {
 echo "<script>location.href='403.php'</script>";
}
?>