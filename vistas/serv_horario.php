<?php
  require_once("../clases/class_perfil.php");
  $perfil=new Perfil();
  $perfil->codigo_perfil(@$_SESSION['user_codigo_perfil']);
  $servicios_permitidos=$perfil->IMPRIMIR_SERVICIOS_USUARIO();
  $servicio_solicitado=strtoupper(preg_replace('/(serv_)|(\.php)/','',basename(__FILE__)));
  if(array_search($servicio_solicitado,$servicios_permitidos)){
    $id_hora=array();
    $turno='todos';
?>
  <div id="xx">
    <link rel="stylesheet" href="../css/estilo-03.css" />
    <link rel="stylesheet" href="../css/estilo-02.css" />
    <script src="../js/uds_horario.js"></script>
    <style>
      select{
        width: auto;      
      }
    </style>
    <section>
      <form class="form-horizontal" action="../controladores/cont_horario.php" method="post" id="form1">  
        <fieldset>
          <legend><center>HORARIO ACADÉMICO</center></legend>    
          <div id="paginador" class="enjoy-css">        
            <?php
              include_once("../clases/class_horario.php");
              $bloque_horas=new horario();
              $get_hora=$bloque_horas->bloque_hora($turno);
              $lapso_actual=$bloque_horas->lapso_actual();      
            ?>
            <h2>Año Académico: <?php echo $lapso_actual['nombre_lapso_actual'][0];?>  </h2>
            <form class="form-horizontal" action="../controladores/cont_horario.php" method="post" id="form1">  
              <input type="hidden" id="codigo_ano_academico" name="codigo_ano_academico" value="<?php echo $lapso_actual['codigo_ano_academico'][0];?>" />
              <table id="filtro_tabla_horario" >
                <tr>
                  <td><label>Ambiente</label>
                    <select class="bootstrap-select form-control" id="codigo_ambiente" name="codigo_ambiente">
                      <?php 
                      include_once("../clases/class_html.php");
                      $html=new Html();
                      $id="codigo_ambiente";
                      $descripcion="descripcion";
                      $sql="SELECT * FROM tambiente WHERE fecha_desactivacion IS NULL ORDER BY codigo_ambiente";
                      $Seleccionado='null';
                      $html->Generar_Opciones($sql,$id,$descripcion,$Seleccionado); 
                      ?>
                    </select>
                  </td>
                  <td><label>Sección</label>
                    <select class="bootstrap-select form-control" id="seccion" name="seccion" >
                      <?php 
                      include_once("../clases/class_html.php");
                      $html=new Html();
                      $id="seccion";
                      $descripcion="descripcion";
                      $sql="SELECT * FROM tseccion WHERE fecha_desactivacion IS NULL ORDER BY seccion";
                      $Seleccionado='null';
                      $html->Generar_Opciones($sql,$id,$descripcion,$Seleccionado); 
                      ?>
                    </select>
                  </td>
                </tr>
                <tr> 
                  <td><label>Profesor</label>
                    <!-- <input class="input-xlarge" type="text" name="cedula_persona" id="cedula_persona" onKeyUp="this.value=this.value.toUpperCase()" disabled=""/> -->
                    <select class="bootstrap-select form-control" id="cedula_persona" name="cedula_persona" disabled="">
                      <option value="">Elige una opción...</option>
                    </select>
                  </td>
                  <td><label>Materia</label>
                    <select class="bootstrap-select form-control" id="codigo_materia" name="codigo_materia" disabled="">
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
                <tr>
                  <td rowspan=2>Bloques</td>
                  <td rowspan=2>Hora</td>
                  <td colspan=7>Día de la Semana</td>
                </tr>
                <tr>
                  <td>Lunes</td>
                  <td>Martes</td>
                  <td>Miércoles</td>
                  <td>Jueves</td>
                  <td>Viernes</td>
                  <!-- <td>Sabado</td>
                  <td>Domingo</td> -->
                </tr>
                <?php 
                for($i=0;$i<count($get_hora['id']);$i++){
                  if(!isset($_SESSION['datos']['dia'])){
                ?>
                <tr>
                  <?php  
                    $hora=$get_hora['hora_inicio'][$i]."<br>".$get_hora['hora_fin'][$i]; 
                    $hora_title = $get_hora['hora_inicio'][$i]." - ".$get_hora['hora_fin'][$i];
                    $hora_academica = $get_hora['hora_academica'][$i];
                    echo "<td>".$get_hora['descripcion'][$i]."</td>";
                    echo "<td>".$hora."</td>";
                    $x=trim($get_hora['id'][$i]);
                  ?>
                  <td id="<?php echo $x."-1"; ?>" data-hora_academica="<?php echo $hora_academica; ?>" title="<?php echo $hora_title;?>" <?php if(in_array($x."-1",$id_hora,true)) echo "class='h_academica'";  ?>>  </td>
                  <td id="<?php echo $x."-2"; ?>" data-hora_academica="<?php echo $hora_academica; ?>" title="<?php echo $hora_title;?>"  <?php if(in_array($x."-2",$id_hora,true)) echo "class='h_academica'";  ?>>  </td>
                  <td id="<?php echo $x."-3"; ?>" data-hora_academica="<?php echo $hora_academica; ?>" title="<?php echo $hora_title;?>"  <?php if(in_array($x."-3",$id_hora,true)) echo "class='h_academica'";  ?>>  </td>
                  <td id="<?php echo $x."-4"; ?>" data-hora_academica="<?php echo $hora_academica; ?>" title="<?php echo $hora_title;?>"  <?php if(in_array($x."-4",$id_hora,true)) echo "class='h_academica'"; ?>>  </td>
                  <td id="<?php echo $x."-5"; ?>" data-hora_academica="<?php echo $hora_academica; ?>" title="<?php echo $hora_title;?>"  <?php if(in_array($x."-5",$id_hora,true)) echo "class='h_academica'"; ?>>  </td>
                  <!--<?php 
                    if($get_hora['id_turno'][$i]!='N'){ 
                  ?>
                  <td id="<?php echo $x."-6"; ?>"  data-hora_academica="<?php echo $hora_academica; ?>" title="<?php echo $hora_title;?>"  class="weekend_noche"><i>No Laboral</i></td>
                  <td id="<?php echo $x."-0"; ?>"  data-hora_academica="<?php echo $hora_academica; ?>" title="<?php echo $hora_title;?>"  class="weekend_noche"><i>No Laboral</i></td>
                  <?php
                    }else{
                  ?>
                  <td id="<?php echo $x."-6"; ?>" data-hora_academica="<?php echo $hora_academica; ?>" title="<?php echo $hora_title;?>" <?php if(in_array($x."-6",$id_hora,true)) echo "class='h_academica'"; ?>>  </td>
                  <td id="<?php echo $x."-0"; ?>" data-hora_academica="<?php echo $hora_academica; ?>" title="<?php echo $hora_title;?>" <?php if(in_array($x."-0",$id_hora,true)) echo "class='h_academica'"; ?>>  </td>
                  <?php }?> -->
                </tr>
                <?php
                  }else{
                ?>
                  <tr>
                  <td>
                  <?php 
                    echo $get_hora['hora_inicio'][$i]."-".$get_hora['hora_fin'][$i];
                    $x=trim($get_hora['id'][$i]);
                  ?>  
                  </td>
                  <td id="<?php echo $x."-1"; ?>" data-hora_academica="<?php echo $hora_academica; ?>" <?php if(in_array($x."-1",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-1",$id_celda,true)) echo "class='asignado'";?>> <?php if(in_array($x."-1",$id_celda,true)){$valor=array_search($x."-1",$id_celda);echo "Asignado<input id='$x-1_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='../images/marca.png' alt='".$desc[$valor]."'/>";} ?>  </td>
                  <td id="<?php echo $x."-2"; ?>" data-hora_academica="<?php echo $hora_academica; ?>" <?php if(in_array($x."-2",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-2",$id_celda,true)) echo "class='asignado'";?>> <?php if(in_array($x."-2",$id_celda,true)){$valor=array_search($x."-2",$id_celda);echo "Asignado<input id='$x-2_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='../images/marca.png' alt='".$desc[$valor]."'/>";} ?>  </td>
                  <td id="<?php echo $x."-3"; ?>" data-hora_academica="<?php echo $hora_academica; ?>" <?php if(in_array($x."-3",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-3",$id_celda,true)) echo "class='asignado'";?>> <?php if(in_array($x."-3",$id_celda,true)){$valor=array_search($x."-3",$id_celda);echo "Asignado<input id='$x-3_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='../images/marca.png' alt='".$desc[$valor]."'/>";} ?>  </td>
                  <td id="<?php echo $x."-4"; ?>" data-hora_academica="<?php echo $hora_academica; ?>" <?php if(in_array($x."-4",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-4",$id_celda,true)) echo "class='asignado'";?>> <?php if(in_array($x."-4",$id_celda,true)){$valor=array_search($x."-4",$id_celda);echo "Asignado<input id='$x-4_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='../images/marca.png' alt='".$desc[$valor]."'/>";} ?>  </td>
                  <td id="<?php echo $x."-5"; ?>" data-hora_academica="<?php echo $hora_academica; ?>" <?php if(in_array($x."-5",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-5",$id_celda,true)) echo "class='asignado'";?>> <?php if(in_array($x."-5",$id_celda,true)){$valor=array_search($x."-5",$id_celda);echo "Asignado<input id='$x-5_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='../images/marca.png' alt='".$desc[$valor]."'/>";} ?>  </td>
                  <!--<?php 
                    if($get_hora['id_turno'][$i]!='N'){
                  ?>
                  <td id="<?php echo $x."-6"; ?>"  class="weekend_noche" <?php if(in_array($x."-6",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-6",$id_celda,true)) echo "class='asignado'";?> > <i>No Laborable</i> <?php if(in_array($x."-6",$id_celda,true)){$valor=array_search($x."-6",$id_celda);echo "Asignado<input id='$x-6_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='../images/marca.png' alt='".$desc[$valor]."'/>";} ?>  </td>
                  <td id="<?php echo $x."-0"; ?>"  class="weekend_noche" <?php if(in_array($x."-0",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-0",$id_celda,true)) echo "class='asignado'";?> ><i>No Laborable</i> <?php if(in_array($x."-0",$id_celda,true)){$valor=array_search($x."-0",$id_celda);echo "Asignado<input id='$x-0_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='../images/marca.png' alt='".$desc[$valor]."'/>";} ?>  </td>
                  <?php
                    }else{
                  ?>
                  <td id="<?php echo $x."-6"; ?>" <?php if(in_array($x."-6",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-6",$id_celda,true)) echo "class='asignado'";?>><?php if(in_array($x."-6",$id_celda,true)){$valor=array_search($x."-6",$id_celda);echo "Asignado<input id='$x-6_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='../images/marca.png' alt='".$desc[$valor]."'/>";} ?>  </td>
                  <td id="<?php echo $x."-0"; ?>" <?php if(in_array($x."-0",@$id_hora,true)) echo "class='h_academica'";?> <?php if(in_array($x."-0",$id_celda,true)) echo "class='asignado'";?>><?php if(in_array($x."-0",$id_celda,true)){$valor=array_search($x."-0",$id_celda);echo "Asignado<input id='$x-0_vo' type='hidden' name='contenidos[]' value='".$id_celda[$valor]."-".$ambiente[$valor]."-".$desc[$valor]."'/>"."<img src='../images/marca.png' alt='".$desc[$valor]."'/>";} ?>  </td>      
                  <?php
                    }
                  ?> -->
                  </tr>
                <?php
                  }
                }
                ?>
                <tr>
                  <td colspan=9>
                    <br>
                    <button type="button" id="btnGuardar" class="btn btn-large btn-primary"> <i class="icon-hdd"></i>&nbsp;Aceptar</button>
                    <a href="?horario"><button type="button" class="btn btn-large btn-primary"/><i class="icon-repeat"></i>&nbsp;Volver</button></a>
                  </td>
                </tr>
                <tr>
                  <td class="tr_header" colspan="3">Horas del Docente</td>
                  <td></td>
                  <td class="tr_header" colspan="3">Horas de la Materia por Sección y Docente</td>
                </tr>
                <tr>
                  <td>Asignado</td>
                  <td>Libre</td>
                  <td>Total</td>
                  <td></td>
                  <td>Asignado</td>
                  <td>Libre</td>
                  <td>Total</td>
                </tr>
                <tr>
                  <td id="celdaasignado" class=""></td>
                  <td id="celdalibre" class=""></td> 
                  <td id="celdatotal" class=""></td>
                  <td></td>
                  <td id="celdamateriaasignado" class=""></td>
                  <td id="celdamaterialibre" class=""></td> 
                  <td id="celdamateriatotal" class=""></td>
                </tr>
                <tr>
                  <td class="tr_footer" colspan=3><?php echo "Turno: ".ucwords(str_replace("manana","mañana",$turno));?></td>
                  <td></td>
                  <td class="tr_footer" colspan=3><?php echo "Turno: ".ucwords(str_replace("manana","mañana",$turno));?></td>
                </tr>
              </table>
              <input  type="hidden" value="0" id="T"/>
              <input  type="hidden" value="0" id="L"/>
              <input  type="hidden" value="0" id="A"/>
              <input  type="hidden" value="0" id="MT"/>
              <input  type="hidden" value="0" id="ML"/>
              <input  type="hidden" value="0" id="MA"/>
            </fieldset>
          </form>
        </fieldset>
      </form>
    </section>
  </div>
<?php }else{
  include('403.php');    	
}?>