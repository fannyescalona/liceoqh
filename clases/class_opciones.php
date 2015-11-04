<?php
 require_once("class_bd.php");
 class Opciones
 {
     private $codigo_opciones; 
     private $nombre_opciones; 
     private $estatus_opciones; 
     private $orden_opciones; 
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->nombre_opciones=null;
     $this->codigo_opciones=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_opciones(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_opciones;
     
	 if($Num_Parametro>0){
	   $this->codigo_opciones=func_get_arg(0);
	 }
   }
      public function estatus_opciones(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_opciones;
     
	 if($Num_Parametro>0){
	   $this->estatus_opciones=func_get_arg(0);
	 }
   }
   public function nombre_opciones(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nombre_opciones;
     
	 if($Num_Parametro>0){
	   $this->nombre_opciones=func_get_arg(0);
	 }
   }

   public function orden_opciones(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->orden_opciones;
     
	 if($Num_Parametro>0){
	   $this->orden_opciones=func_get_arg(0);
	 }
   }
   
   public function fecha_desactivacion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->fecha_desactivacion;
     
	 if($Num_Parametro>0){
	   $this->fecha_desactivacion=func_get_arg(0);
	 }
   }
   

   public function Registrar(){
    $sql="insert into topciones (nombre_opciones,orden) values ('$this->nombre_opciones','$this->nombre_opciones');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update topciones set fecha_desactivacion=NULL where (cod_opciones='$this->codigo_opciones');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update topciones set fecha_desactivacion=CURDATE() where (cod_opciones='$this->codigo_opciones');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update topciones set nombre_opciones='$this->nombre_opciones',orden='$this->orden_opciones' where (cod_opciones='$this->codigo_opciones');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    ( CASE 
        WHEN fecha_desactivacion IS NULL THEN  'Activo'
        ELSE 'Desactivado' END) AS estatus_opciones from topciones where nombre_opciones='$this->nombre_opciones'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$topciones=$this->mysql->Respuesta($query);
	$this->codigo_opciones($topciones['cod_opciones']);
	$this->nombre_opciones($topciones['nombre_opciones']);
   $this->estatus_opciones($topciones['estatus_opciones']);
   $this->orden_opciones($topciones['orden']);
	$this->fecha_desactivacion($topciones['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from topciones where nombre_opciones='$this->nombre_opciones'";

	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$topciones=$this->mysql->Respuesta($query);
	$this->codigo_opciones($topciones['cod_opciones']);
	$this->nombre_opciones($topciones['nombre_opciones']);
   $this->orden_opciones($topciones['orden']);
	$this->fecha_desactivacion($topciones['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>
