<?php
 require_once("class_bd.php");
 class Bloque_Hora
 {
     private $codigo_bloque_hora; 
     private $descripcion;
     private $hora_inicio;
     private $hora_fin;
     private $hora_academica;
     private $turno;
     private $receso;
     private $estatus_bloque_hora; 
     private $fecha_desactivacion; 
     private $error;
     private $mysql; 
	 
   public function __construct(){
     $this->codigo_bloque_hora=null;
     $this->descripcion=null;
     $this->hora_inicio=null;
     $this->hora_fin=null;
     $this->hora_academica=null;
     $this->turno=null;
     $this->receso=null;
     $this->error=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_bloque_hora(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_bloque_hora;
     
	 if($Num_Parametro>0){
	   $this->codigo_bloque_hora=func_get_arg(0);
	 }
   }

   public function estatus_bloque_hora(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_bloque_hora;
     
	 if($Num_Parametro>0){
	   $this->estatus_bloque_hora=func_get_arg(0);
	 }
   }
   
   public function descripcion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
	 }
   }
   
   public function hora_inicio(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->hora_inicio;
     
	 if($Num_Parametro>0){
	   $this->hora_inicio=func_get_arg(0);
	 }
   }
   
   public function hora_fin(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->hora_fin;
     
	 if($Num_Parametro>0){
	   $this->hora_fin=func_get_arg(0);
	 }
   }
   
   public function hora_academica(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->hora_academica;
     
	 if($Num_Parametro>0){
	   $this->hora_academica=func_get_arg(0);
	 }
   }
   
   public function turno(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->turno;
     
	 if($Num_Parametro>0){
	   $this->turno=func_get_arg(0);
	 }
   }
   
   public function receso(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->receso;
     
	 if($Num_Parametro>0){
	   $this->receso=func_get_arg(0);
	 }
   }
   
   public function fecha_desactivacion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->fecha_desactivacion;
     
	 if($Num_Parametro>0){
	   $this->fecha_desactivacion=func_get_arg(0);
	 }
   }
   
   public function error(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->error;
     
	 if($Num_Parametro>0){
	   $this->error=func_get_arg(0);
	 }
   }      

   public function Registrar(){
    $sql="insert into tbloque_hora (descripcion,hora_inicio,hora_fin,hora_academica,turno,receso) values ('$this->descripcion','$this->hora_inicio','$this->hora_fin','$this->hora_academica','$this->turno','$this->receso');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
     public function Activar(){
    $sql="update tbloque_hora set fecha_desactivacion=NULL where (codigo_bloque_hora='$this->codigo_bloque_hora');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
    public function Desactivar(){
    $sql="update tbloque_hora set fecha_desactivacion=CURDATE() where (codigo_bloque_hora='$this->codigo_bloque_hora');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
    public function Actualizar(){
    $sql="update tbloque_hora set descripcion='$this->descripcion',hora_inicio='$this->hora_inicio',hora_fin='$this->hora_fin',hora_academica='$this->hora_academica',turno='$this->turno',receso='$this->receso' where (codigo_bloque_hora='$this->codigo_bloque_hora');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
   public function Consultar(){
    $sql="select *,(CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' ELSE 'Desactivado' END) AS estatus_bloque_hora from tbloque_hora where descripcion='$this->descripcion' and hora_inicio='$this->hora_inicio' and hora_fin='$this->hora_fin'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tbloque_hora=$this->mysql->Respuesta($query);
	$this->codigo_bloque_hora($tbloque_hora['codigo_bloque_hora']);
	$this->descripcion($tbloque_hora['descripcion']);
	$this->hora_inicio($tbloque_hora['hora_inicio']);
	$this->hora_fin($tbloque_hora['hora_fin']);
	$this->hora_academica($tbloque_hora['hora_academica']);
	$this->turno($tbloque_hora['turno']);
	$this->receso($tbloque_hora['receso']);
   	$this->estatus_bloque_hora($tbloque_hora['estatus_bloque_hora']);
	$this->fecha_desactivacion($tbloque_hora['fecha_desactivacion']);
	return true;
	}
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tbloque_hora where descripcion='$this->descripcion' and hora_inicio='$this->hora_inicio' and hora_fin='$this->hora_fin'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
		$tbloque_hora=$this->mysql->Respuesta($query);
		$this->codigo_bloque_hora($tbloque_hora['codigo_bloque_hora']);
		$this->descripcion($tbloque_hora['descripcion']);
		$this->hora_inicio($tbloque_hora['hora_inicio']);
		$this->hora_fin($tbloque_hora['hora_fin']);
		$this->hora_academica($tbloque_hora['hora_academica']);
		$this->turno($tbloque_hora['turno']);
		$this->receso($tbloque_hora['receso']);
		$this->fecha_desactivacion($tbloque_hora['fecha_desactivacion']);
	    $this->error("El registro ya existe !");
		return true;
	}
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
}
?>
