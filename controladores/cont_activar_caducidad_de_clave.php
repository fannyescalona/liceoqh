<?php
include("../clases/class_usuario.php");
$Usuario=new Usuario();
$Usuario->Desactivar_Caducidad_de_clave();
$b=false;
$a=array();
if(isset($_POST['nc'])){
$a=$_POST['nc'];
    $b=true;	
}
$Usuario->Activar_Caducidad_de_clave($a,$b);

?>