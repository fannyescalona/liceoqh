<?php
 require_once("class_bd.php");
 class cargo
 {
     private $codigo_cargo; 
     private $descripcion; 
     private $estatus_cargo; 
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->descripcion=null;
     $this->codigo_cargo=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_cargo(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_cargo;
     
	 if($Num_Parametro>0){
	   $this->codigo_cargo=func_get_arg(0);
	 }
   }
   
	public function estatus_cargo(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_cargo;
     
	 if($Num_Parametro>0){
	   $this->estatus_cargo=func_get_arg(0);
	 }
   }

   public function descripcion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
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
    $sql="insert into tcargo (descripcion) values ('$this->descripcion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update tcargo set fecha_desactivacion=NULL where (codigo_cargo='$this->codigo_cargo');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tcargo set fecha_desactivacion=CURDATE() where (codigo_cargo='$this->codigo_cargo');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tcargo set descripcion='$this->descripcion' where (codigo_cargo='$this->codigo_cargo');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_cargo from tcargo where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tcargo=$this->mysql->Respuesta($query);
	$this->codigo_cargo($tcargo['codigo_cargo']);
	$this->descripcion($tcargo['descripcion']);
	$this->estatus_cargo($tcargo['estatus_cargo']);
	$this->fecha_desactivacion($tcargo['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tcargo where descripcion='$this->descripcion'";

	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tcargo=$this->mysql->Respuesta($query);
	$this->codigo_cargo($tcargo['codigo_cargo']);
	$this->descripcion($tcargo['descripcion']);
	$this->fecha_desactivacion($tcargo['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>
