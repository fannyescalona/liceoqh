<?php
 require_once("class_bd.php");
 class Pais
 {
     private $codigo_pais; 
     private $nombre_pais;
     private $estatus_pais; 
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->nombre_pais=null;
     $this->codigo_pais=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_pais(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_pais;
     
	 if($Num_Parametro>0){
	   $this->codigo_pais=func_get_arg(0);
	 }
   }

   public function estatus_pais(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_pais;
     
	 if($Num_Parametro>0){
	   $this->estatus_pais=func_get_arg(0);
	 }
   }
   
   public function nombre_pais(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nombre_pais;
     
	 if($Num_Parametro>0){
	   $this->nombre_pais=func_get_arg(0);
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
    $sql="insert into tpais (nombre_pais) values ('$this->nombre_pais');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update tpais set fecha_desactivacion=NULL where (cod_pais='$this->codigo_pais');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tpais set fecha_desactivacion=CURDATE() where (cod_pais='$this->codigo_pais');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tpais set nombre_pais='$this->nombre_pais' where (cod_pais='$this->codigo_pais');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_pais from tpais where nombre_pais='$this->nombre_pais'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tpais=$this->mysql->Respuesta($query);
	$this->codigo_pais($tpais['cod_pais']);
	$this->nombre_pais($tpais['nombre_pais']);
   	$this->estatus_pais($tpais['estatus_pais']);
	$this->fecha_desactivacion($tpais['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tpais where nombre_pais='$this->nombre_pais'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tpais=$this->mysql->Respuesta($query);
	$this->codigo_pais($tpais['cod_pais']);
	$this->nombre_pais($tpais['nombre_pais']);
	$this->fecha_desactivacion($tpais['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>
