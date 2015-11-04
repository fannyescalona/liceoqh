<?php
 require_once("class_bd.php");
 class Parroquia
 {
     private $codigo_parroquia; 
     private $nombre_parroquia; 
     private $codigo_municipio;
     private $estatus_parroquia;
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->nombre_parroquia=null;
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
   
   public function nombre_parroquia(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nombre_parroquia;
     
	 if($Num_Parametro>0){
	   $this->nombre_parroquia=func_get_arg(0);
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
    $sql="insert into tparroquia (nombre_parroquia,cod_municipio) values ('$this->nombre_parroquia','$this->codigo_municipio');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update tparroquia set fecha_desactivacion=NULL where (cod_parroquia='$this->codigo_parroquia');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tparroquia set fecha_desactivacion=CURDATE() where (cod_parroquia='$this->codigo_parroquia');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tparroquia set nombre_parroquia='$this->nombre_parroquia',cod_municipio='$this->codigo_municipio' where (cod_parroquia='$this->codigo_parroquia');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_parroquia from tparroquia where nombre_parroquia='$this->nombre_parroquia'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tparroquia=$this->mysql->Respuesta($query);
	$this->codigo_parroquia($tparroquia['cod_parroquia']);
	$this->nombre_parroquia($tparroquia['nombre_parroquia']);
	$this->estatus_parroquia($tparroquia['estatus_parroquia']);
	$this->codigo_municipio($tparroquia['cod_municipio']);
	$this->fecha_desactivacion($tparroquia['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tparroquia where nombre_parroquia='$this->nombre_parroquia' and cod_municipio='$this->codigo_municipio'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tparroquia=$this->mysql->Respuesta($query);
	$this->codigo_parroquia($tparroquia['cod_parroquia']);
	$this->nombre_parroquia($tparroquia['nombre_parroquia']);
	$this->codigo_municipio($tparroquia['cod_municipio']);
	$this->fecha_desactivacion($tparroquia['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>