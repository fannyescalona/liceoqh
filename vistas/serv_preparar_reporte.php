<div id="defensa_div" >
    
    <div style="margin: auto 0px;">
      <form action="../pdf/pdf_horario_profesor.php"  method="post">
	       <input type="hidden" id="formato" name="formato" value="<?php 
		   if(isset($_GET['pdf'])) echo "pdf";
		   if(isset($_GET['horario_completo'])) echo "horario_completo";?>"
		   />
	       <input type="hidden" id="mensaje" name="mensaje" value="<?php if(isset($_SESSION['mensaje']))echo $_SESSION['mensaje'];else echo 'no_asignado';?>"/>
         <?php
     	     include_once("../clases/class_horario.php");
           $bloque_horas=new horario();
           $turno='todos';
		     $get_hora=$bloque_horas->bloque_hora($turno);
		     $lapso_actual=$bloque_horas->lapso_actual();      
        ?>
        <fieldset>
        <legend>Visualizar Horario Profesor</legend>
        <br />
        <label>Cédula Profesor:</label>
        <input type="hidden" id="lapso" name="lapso" value="<?php echo $lapso_actual['cod_periodo'][0];?>" required=""/>		  
		   <?php if(!isset($_GET['horario_completo'])){?>
		    <input type="hidden" id="turno" name="turno" value="todos" />
	       <input type="text" value="" id="cedula" name="cedula" />
		   		   <?php }?>
		   		   <br/>
	       <input type="submit" class="myButton Buttonbuscar"  value="Aceptar"/>
      </form>
	  </fieldset>
     </div>

</div>

<?php if(isset($_SESSION['datos'])) unset($_SESSION['datos']);?>
