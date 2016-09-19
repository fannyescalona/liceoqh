<?php
session_start();

include_once("../clases/class_html.php");
$sql=$id=$descripcion=null;

$html=new Html();
if(isset($_POST['combo'])) {
    if($_POST['combo']=="seccion"){
        $id="codigo_materia";
        $descripcion="descripcion";
        $sql="SELECT m.codigo_materia, m.descripcion 
        FROM tmateria m 
        INNER JOIN tmateria_seccion_docente AS tmats ON tmats.codigo_materia = m.codigo_materia 
        INNER JOIN tseccion AS s ON s.seccion = tmats.seccion 
        WHERE m.fecha_desactivacion IS NULL 
        AND s.seccion='".$_POST["elegido"]."' ORDER By m.descripcion";
        if(isset($_POST['elegido1'])) $Seleccionado=$_POST['elegido1']; else $Seleccionado='null';
    }
    else if($_POST['combo']=="materia"){
        $id="cedula";
        $descripcion="nombre";
        $sql="SELECT DISTINCT TRIM(p.cedula) AS cedula,CONCAT(p.nombres,' ',p.apellidos) AS nombre 
        FROM tpersona p 
        INNER JOIN tcargo c ON p.codigo_cargo = c.codigo_cargo 
        LEFT JOIN tmateria_seccion_docente msd ON p.cedula = msd.cedula_docente
        WHERE msd.seccion = '".$_POST["seccion"]."' AND msd.codigo_materia = '".$_POST["elegido"]."'";
        if(isset($_POST['elegido1'])) $Seleccionado=$_POST['elegido1']; else $Seleccionado='null';
    }
}
@$html->Generar_Opciones($sql,$id,$descripcion,$Seleccionado); 
?>