<div id="defensa_div" >
    <h2>Comprobante de Inscripción Estudiantil</h2>
    <div style="margin: auto 0px;">
      <form action="../pdf/pdf_comprobante_inscripcion_personal.php"  method="post">
      		<span>Cédula Estudiante:</span>
	       <input onKeyPress="return isNumberKey(event)" title="Ingrese el número de cédula del estudiante a consultar" name="cedula" required="" type="text" />
	       <br/>
	       <input type="submit" class="myButton Buttonbuscar"  value="Aceptar"/>
      </form>
	  <hr>
     </div>

</div>

<?php if(isset($_SESSION['datos'])) unset($_SESSION['datos']);?>
