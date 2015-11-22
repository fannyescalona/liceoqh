<?php
  require_once("../clases/class_bd.php");
  $mysql=new Conexion();
  $sql = "SELECT descripcion,
  date_format(fecha_inicio,'%d/%m/%Y') fecha_inicio,date_format(fecha_cierre,'%d/%m/%Y') fecha_cierre 
  FROM tinscripcion WHERE fecha_desactivacion IS NULL";
  $query = $mysql->Ejecutar($sql);
  while ($row = $mysql->Respuesta($query)){
    echo "<span style='font-weight: bold;'> \"".$row['descripcion']."  FECHA DE INICIO: </span>".$row['fecha_inicio']." <span style='font-weight: bold;'>FECHA DE CIERRE: </span>".$row['fecha_cierre']."<span style='font-weight: bold;'> \"</span><br /><br />";
  }
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