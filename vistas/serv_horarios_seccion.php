<?php

if(isset($_SESSION['datos']['horario'])){ 
                 $disabledRC='disabled';//para desactivar el boton registrar y consultar (RC)
                  $disabledMD='';//para activar el boton Modificar y Desactivar (MD)
                }else {
                     $disabledRC='';//para activar el boton registrar y consultar (RC)
                     $disabledMD=''; //para desactivar el boton Modificar y Desactivar (MD)
                	}
                	$servicios='horario_seccion';
if(isset($_SESSION['datos'])){

            @$estatus=$_SESSION['datos']['estatus'];
            }
       else{
            $nombre_perfil=null;
            $codigo_perfil=null;
            $estatus=null;
            }

$id_hora=array();
$turno='todos';
?>
<!DOCTYPE html>
 <html >
    <head>
     <title> Horario </title>
     <link rel="stylesheet" href="../css/estilo-03.css" />
     <link rel="stylesheet" href="../css/estilo-02.css" />
	  <script src="../js/uds_horario.js"></script>
    <style>
     select{
          width: auto;     	
     	
     	
     	}
     	
</style>
	</head>
   <body>

<div id="xx">
   <section>
          <h2>Horario de la Sección</h2>
      <?php
     	     include_once("../clases/class_horario.php");
           $bloque_horas=new horario();
		     $get_hora=$bloque_horas->bloque_hora($turno);
		     $lapso_actual=$bloque_horas->lapso_actual();      
      ?>
          <h5>   <?php echo $lapso_actual['nombre_lapso_actual'][0];?>  </h5>
      <form   id="form" name="form" action="../controladores/cont_horario.php" method="POST">
        <input type="hidden" id="lapso" name="lapso" value="<?php echo $lapso_actual['cod_periodo'][0];?>" />
  <table id="filtro_tabla_horario" >
   <tr><td>
   Ambiente
			   <select id="ambiente" name="ambiente">
		        <?php 
		         include_once("../clases/class_html.php");
		         $html=new Html();
		            $id="cod_ambiente";
					   $descripcion="nombre_ambiente";
		            $sql="select $id ,$descripcion  from tambiente where  fecha_desactivacion IS NULL";
		            //(!isset($_SESSION['seccion']))? $Seleccionado='null' : $Seleccionado=$codigo_seccion;
		            $Seleccionado='null';
		            $html->Generar_Opciones($sql,$id,$descripcion,$Seleccionado); 
		             ?>
			   </select>
			   </td><td>
              Sección
			   <select id="seccion" name="seccion" disabled="" >
		        <?php 
		         include_once("../clases/class_html.php");
		         $html=new Html();
		            $id="seccion";
					   $descripcion="nombre_seccion";
		          $sql="select seccion,nombre_seccion from tseccion where cod_periodo='".$lapso_actual['cod_periodo'][0]."' and fecha_desactivacion IS NULL order by seccion";
		            //(!isset($_SESSION['seccion']))? $Seleccionado='null' : $Seleccionado=$codigo_seccion;
		            $Seleccionado='null';
		            $html->Generar_Opciones($sql,$id,$descripcion,$Seleccionado); 
		             ?>
			   </select></td>
			   </tr><tr> 
			   <td>	   
 	      Profesor
			   <select id="cedula" name="cedula" disabled="">
		        <?php 
		         include_once("../clases/class_html.php");
		         $html=new Html();
		            $id="cod_personal";
					   $descripcion="nombre";
		            $sql="SELECT ples.cod_personal,CONCAT(p.cedula,  ' ---', p.nombres,  ' ', p.apellidos ) AS nombre, p.cedula
		            FROM tpersonas AS p
		            INNER JOIN tpersonales AS ples ON ples.cedula = p.cedula
		            INNER JOIN trol AS tr ON tr.cod_rol = ples.cod_rol
		            AND UCASE( tr.nombre_rol ) =  'PROFESOR'";
		            //(!isset($_SESSION['seccion']))? $Seleccionado='null' : $Seleccionado=$codigo_seccion;
		            $Seleccionado='null';
		            $html->Generar_Opciones($sql,$id,$descripcion,$Seleccionado); 
		             ?>
			   </select>
			   </td>
			   <td>
			  Materia
			   <select id="materia" name="materia" disabled="">
                     <option value="">Elige una opción...</option>
			   </select>
			   </td>
			  </tr>
			  </table>	
            <img src="../images/add.png" alt="" style="cursor:pointer" title="Agregar" id="btaceptar">
	  <input value="<?php echo $turno;?>" type="hidden" name="turno" id="turno"/>
	  <br><br>

       <table id="tb_horario">
       <CAPTION>FORMULARIO HORARIO </CAPTION>
		<tr ><td rowspan=2>Hora</td> <td colspan=7>Día de la Semana</td></tr>
		<tr><td>Lunes</td><td>Martes</td><td>Miércoles</td><td>Jueves</td><td>Viernes</td><td>Sabado</td><td>Domingo</td></tr>
           		  
		  <?php 
		  for($i=0;$i<count($get_hora['id']);$i++){		  
		     if(!isset($_SESSION['datos']['dia'])){
		  ?>
		    
		   <tr>
		     <td><?php  $hora=$get_hora['desde'][$i]."-".$get_hora['hasta'][$i]; echo $hora;
			 			 $x=trim($get_hora['id'][$i]);
			 ?></td>
		     <td id="<?php echo $x."-1"; ?>" title="<?php echo $hora;?>" <?php if(in_array($x."-1",$id_hora,true)) echo "class='h_academica'";  ?>>  </td>
		     <td id="<?php echo $x."-2"; ?>" title="<?php echo $hora;?>"  <?php if(in_array($x."-2",$id_hora,true)) echo "class='h_academica'";  ?>>  </td>
		     <td id="<?php echo $x."-3"; ?>" title="<?php echo $hora;?>"  <?php if(in_array($x."-3",$id_hora,true)) echo "class='h_academica'";  ?>>  </td>
		     <td id="<?php echo $x."-4"; ?>" title="<?php echo $hora;?>"  <?php if(in_array($x."-4",$id_hora,true)) echo "class='h_academica'"; ?>>  </td>
		     <td id="<?php echo $x."-5"; ?>" title="<?php echo $hora;?>"  <?php if(in_array($x."-5",$id_hora,true)) echo "class='h_academica'"; ?>>  </td>
            		   
		   <?php if($get_hora['id_turno'][$i]=='2'){?>
			 <td id="<?php echo $x."-6"; ?>"  title="<?php echo $hora;?>"  class="weekend_noche"><i>No Laboral</i></td>
		     <td id="<?php echo $x."-0"; ?>"  title="<?php echo $hora;?>"   class="weekend_noche"><i>No Laboral</i></td>
		   <?php } else{?>
		     <td id="<?php echo $x."-6"; ?>" title="<?php echo $hora;?>"  <?php if(in_array($x."-6",$id_hora,true)) echo "class='h_academica'"; ?>>  </td>
		     <td id="<?php echo $x."-0"; ?>" title="<?php echo $hora;?>" <?php if(in_array($x."-0",$id_hora,true)) echo "class='h_academica'"; ?>>  </td>
		   <?php }?>
		   </tr>
		   <?php 
		   }else{
		   ?>
		   <tr>
		     <td><?php echo $get_hora['desde'][$i]."-".$get_hora['hasta'][$i];
			 $x=trim($get_hora['id'][$i]);
			 ?></td>
		     <td id="<?php echo $x."-1"; ?>" <?php if(in_array($x."-1",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-1",$id_celda,true)) echo "class='asignado'";?>> <?php if(in_array($x."-1",$id_celda,true)){$valor=array_search($x."-1",$id_celda);echo "Asignado<input id='$x-1_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='Imagenes/pst-ver.gif' alt='".$desc[$valor]."'/>";} ?>  </td>
		     <td id="<?php echo $x."-2"; ?>" <?php if(in_array($x."-2",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-2",$id_celda,true)) echo "class='asignado'";?>> <?php if(in_array($x."-2",$id_celda,true)){$valor=array_search($x."-2",$id_celda);echo "Asignado<input id='$x-2_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='Imagenes/pst-ver.gif' alt='".$desc[$valor]."'/>";} ?>  </td>
		     <td id="<?php echo $x."-3"; ?>" <?php if(in_array($x."-3",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-3",$id_celda,true)) echo "class='asignado'";?>> <?php if(in_array($x."-3",$id_celda,true)){$valor=array_search($x."-3",$id_celda);echo "Asignado<input id='$x-3_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='Imagenes/pst-ver.gif' alt='".$desc[$valor]."'/>";} ?>  </td>
		     <td id="<?php echo $x."-4"; ?>" <?php if(in_array($x."-4",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-4",$id_celda,true)) echo "class='asignado'";?>> <?php if(in_array($x."-4",$id_celda,true)){$valor=array_search($x."-4",$id_celda);echo "Asignado<input id='$x-4_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='Imagenes/pst-ver.gif' alt='".$desc[$valor]."'/>";} ?>  </td>
		     <td id="<?php echo $x."-5"; ?>" <?php if(in_array($x."-5",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-5",$id_celda,true)) echo "class='asignado'";?>> <?php if(in_array($x."-5",$id_celda,true)){$valor=array_search($x."-5",$id_celda);echo "Asignado<input id='$x-5_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='Imagenes/pst-ver.gif' alt='".$desc[$valor]."'/>";} ?>  </td>
		     <?php if($get_hora['id_turno'][$i]=='2'){?>
			 <td id="<?php echo $x."-6"; ?>"  class="weekend_noche" <?php if(in_array($x."-6",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-6",$id_celda,true)) echo "class='asignado'";?> > <i>No Laborable</i> <?php if(in_array($x."-6",$id_celda,true)){$valor=array_search($x."-6",$id_celda);echo "Asignado<input id='$x-6_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='Imagenes/pst-ver.gif' alt='".$desc[$valor]."'/>";} ?>  </td>
		     <td id="<?php echo $x."-0"; ?>"  class="weekend_noche" <?php if(in_array($x."-0",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-0",$id_celda,true)) echo "class='asignado'";?> ><i>No Laborable</i> <?php if(in_array($x."-0",$id_celda,true)){$valor=array_search($x."-0",$id_celda);echo "Asignado<input id='$x-0_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='Imagenes/pst-ver.gif' alt='".$desc[$valor]."'/>";} ?>  </td>
		     <?php } else{?>
			  <td id="<?php echo $x."-6"; ?>" <?php if(in_array($x."-6",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-6",$id_celda,true)) echo "class='asignado'";?>><?php if(in_array($x."-6",$id_celda,true)){$valor=array_search($x."-6",$id_celda);echo "Asignado<input id='$x-6_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='Imagenes/pst-ver.gif' alt='".$desc[$valor]."'/>";} ?>  </td>
		     <td id="<?php echo $x."-0"; ?>" <?php if(in_array($x."-0",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-0",$id_celda,true)) echo "class='asignado'";?>><?php if(in_array($x."-0",$id_celda,true)){$valor=array_search($x."-0",$id_celda);echo "Asignado<input id='$x-0_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='Imagenes/pst-ver.gif' alt='".$desc[$valor]."'/>";} ?>  </td>		   
			 <?php }?>

		   </tr>
		   
		   <?php
		   }
		   }
		   ?>

		<tr> 
		<td colspan=8>
    <?php
      imprimir_boton($disabledRC,$disabledMD,$estatus,$servicios);
     ?>   
		</td></tr>
	   </table>
	  <input type="hidden" size="15" id="ci_p" name="ci_p" value="<?php if(isset($_SESSION['datos']['cedula_profesor'])) echo $_SESSION['datos']['cedula_profesor'];?>"/><br>
	  <input type="hidden" size="15" id="lap_p" name="lap_p" value="<?php if(isset($_SESSION['datos']['lapso'])) echo $_SESSION['datos']['lapso'];?>"/><br>
			  
	</form>



   <div id="ventana" class="contenedor" style="display:none">
	    <fieldset style="background: #fff;color:#000">
<br>
		<form id="form_emergente" name="form_emergente"> 
			 <label for="cedula"> C&#233;dula: </label>&nbsp;
			 <input type="text" size="15" id="cedula" name="cedula" readonly 
			 value=""/><br>
			 
			 <label for="FE_descripcion"> Que actividad vas a realizar?</label><br>
			 <textarea id="FE_descripcion" name="FE_descripcion" cols=25 rows=2></textarea><br>
	
		    <label for="FE_ambiente"> Ambiente: </label>
			<select id="FE_ambiente" name="FE_ambiente">
			     <?php 
		            include_once("../modelos/class_pst-html.php");
		            $html=new Html();		 
		            $id="cod_ambiente";
					   $descripcion="amb_nombre";
		            $sql="select distinct $id, $descripcion from tambiente where amb_fecha_desactivacion IS NULL order by $descripcion";
		            $Seleccionado='null';
		            $html->Generar_Opciones($sql,$id,$descripcion,$Seleccionado); 
		             ?>
			</select><br><br>
			   <input type="button" class="btn btn-danger" id="btaceptar" name="btaceptar" value="Aceptar"/>
			   <input type="button" class="btn btn-danger" id="btcancelar" name="btcancelar" value="Cerrar" onclick="overlay('none')"/>
		</form>
	    </fieldset>
       </div>
       <div id="fade"> </div>
       
   </section>
   <div id="tablaR" style="display:none" >
   <table>
   <tr>
   <td>Asignado</td><td>Libre</td> <td>Total</td>
      </tr>
      <tr>
   <td id="celdaasignado" class=""><?php  // echo count(@$id_celda);?> </td>
   <td id="celdalibre" class=""><?php //echo (@$_SESSION['datos']['hora_ad']-count(@$id_celda));?></td> 
   <td id="celdatotal" class=""><?php //cho @$_SESSION['datos']['hora_ad'];?></td>
   </tr>
   <tr>
       <td colspan=3><?php echo "Turno: ".ucwords(str_replace("manana","mañana",$turno));?></td>
   </tr>
   </table>
   <form>
   <input  type="hidden" value="12<?php //echo @$_SESSION['datos']['hora_ad'];?>" id="T"/>
   <input  type="hidden" value="0<?php //echo (@$_SESSION['datos']['hora_ad']-count(@$id_celda));?>" id="L"/>
   <input  type="hidden" value="0<?php //echo count(@$id_celda);?>" id="A"/>
   </form>
   </div> 
   </body>
</html>
<?php if(isset($_SESSION['datos'])) unset($_SESSION['datos']); //unset($_SESSION['mensaje']); ?>
