<?php
 require_once("class_bd.php");
 class Carrera
 {
     private $codigo_carrera; 
     private $nombre_carrera; 
     private $estatus_carrera; 
     private $rif;
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->nombre_carrera=null;
     $this->codigo_carrera=null;
     $this->rif=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_carrera(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_carrera;
     
	 if($Num_Parametro>0){
	   $this->codigo_carrera=func_get_arg(0);
	 }
   }

   public function estatus_carrera(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_carrera;
     
	 if($Num_Parametro>0){
	   $this->estatus_carrera=func_get_arg(0);
	 }
   }
   
   public function nombre_carrera(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nombre_carrera;
     
	 if($Num_Parametro>0){
	   $this->nombre_carrera=func_get_arg(0);
	 }
   }

   public function rif(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->rif;
     
	 if($Num_Parametro>0){
	   $this->rif=func_get_arg(0);
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
    $sql="insert into tcarrera (nombre_carrera,rif) values ('$this->nombre_carrera','$this->rif');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update tcarrera set fecha_desactivacion=NULL where (cod_carrera='$this->codigo_carrera');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tcarrera set fecha_desactivacion=CURDATE() where (cod_carrera='$this->codigo_carrera');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tcarrera set nombre_carrera='$this->nombre_carrera',rif='$this->rif' where (cod_carrera='$this->codigo_carrera');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_carrera from tcarrera where nombre_carrera='$this->nombre_carrera'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tcarrera=$this->mysql->Respuesta($query);
	$this->codigo_carrera($tcarrera['cod_carrera']);
	$this->nombre_carrera($tcarrera['nombre_carrera']);
	$this->estatus_carrera($tcarrera['estatus_carrera']);
	$this->rif($tcarrera['rif']);
	$this->fecha_desactivacion($tcarrera['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tcarrera where nombre_carrera='$this->nombre_carrera' and rif='$this->rif'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tcarrera=$this->mysql->Respuesta($query);
	$this->codigo_carrera($tcarrera['cod_carrera']);
	$this->nombre_carrera($tcarrera['nombre_carrera']);
	$this->rif($tcarrera['rif']);
	$this->fecha_desactivacion($tcarrera['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>