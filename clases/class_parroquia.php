<?php
 require_once("class_bd.php");
 class Parroquia
 {
     private $codigo_parroquia; 
     private $descripcion; 
     private $codigo_municipio;
     private $estatus_parroquia;
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->descripcion=null;
     $this->codigo_parroquia=null;
     $this->codigo_municipio=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_parroquia(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_parroquia;
     
	 if($Num_Parametro>0){
	   $this->codigo_parroquia=func_get_arg(0);
	 }
   }
   public function estatus_parroquia(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_parroquia;
     
	 if($Num_Parametro>0){
	   $this->estatus_parroquia=func_get_arg(0);
	 }
   }
   
   public function descripcion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
	 }
   }

   public function codigo_municipio(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_municipio;
     
	 if($Num_Parametro>0){
	   $this->codigo_municipio=func_get_arg(0);
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
    $sql="insert into tparroquia (descripcion,codigo_municipio) values ('$this->descripcion','$this->codigo_municipio');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update tparroquia set fecha_desactivacion=NULL where (codigo_parroquia='$this->codigo_parroquia');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tparroquia set fecha_desactivacion=CURDATE() where (codigo_parroquia='$this->codigo_parroquia');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tparroquia set descripcion='$this->descripcion',codigo_municipio='$this->codigo_municipio' where (codigo_parroquia='$this->codigo_parroquia');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_parroquia from tparroquia where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tparroquia=$this->mysql->Respuesta($query);
	$this->codigo_parroquia($tparroquia['codigo_parroquia']);
	$this->descripcion($tparroquia['descripcion']);
	$this->estatus_parroquia($tparroquia['estatus_parroquia']);
	$this->codigo_municipio($tparroquia['codigo_municipio']);
	$this->fecha_desactivacion($tparroquia['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tparroquia where descripcion='$this->descripcion' and codigo_municipio='$this->codigo_municipio'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tparroquia=$this->mysql->Respuesta($query);
	$this->codigo_parroquia($tparroquia['codigo_parroquia']);
	$this->descripcion($tparroquia['descripcion']);
	$this->codigo_municipio($tparroquia['codigo_municipio']);
	$this->fecha_desactivacion($tparroquia['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>