<?php
  require_once("../clases/class_bd.php");
  $mysql=new Conexion();
  $sql = "SELECT inscripcion_abierta,edad_maxima_primer_anio 
  FROM tconfiguracion_negocio WHERE fecha_desactivacion IS NULL";
  $query = $mysql->Ejecutar($sql);
  if($mysql->Total_Filas($query)==0)
    $inscripcion_abierta='N';
  while ($row = $mysql->Respuesta($query)){
    $inscripcion_abierta=$row['inscripcion_abierta'];
    $edad_maxima_primer_anio = $row['edad_maxima_primer_anio'];
  }
  if($inscripcion_abierta=="N"){
    echo "<strong class='obligatorio'>¡No es posible cargar el formulario, ya que el Proceso de Inscripción esta cerrado!</strong>";
  }
  else{
?>
<div class="well">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#datosestudiantes" data-toggle="tab" id="tab-datosestudiantes">Datos del Estudiante</a></li>
    <li><a href="#datospadres" data-toggle="tab" id="tab-datospadres">Datos de los Padres</a></li>
    <li><a href="#documentosconsignados" data-toggle="tab" id="tab-documentosconsignados">Documentos Consignados</a></li>
    <li><a href="#datosrepresentante" data-toggle="tab" id="tab-datosrepresentante">Datos del Rep. Legal</a></li>
  </ul>
  <div id="myTabContent" class="tab-content">
    <script src="../js/uds_procesoinscripcion.js"></script>
    <div class="tab-pane active in" id="datosestudiantes">
      <input type="hidden" id="edad_maxima_primer_anio" value="<?php echo !empty($edad_maxima_primer_anio) ? $edad_maxima_primer_anio : 17; ?>" >
      <?php
          include_once('serv_datosestudiantes.php');
        ?>
    </div>
    <div class="tab-pane" id="datospadres">
      <?php
          include_once('serv_datospadres.php');
        ?>
    </div>
    <div class="tab-pane" id="documentosconsignados">
      <?php
          include_once('serv_documentosconsignados.php');
        ?>
    </div>
    <div class="tab-pane" id="datosrepresentante">
      <?php
          include_once('serv_datosrepresentantes.php');
        ?>
    </div>
  </div>
</div>
<?php
  }
?>