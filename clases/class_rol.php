<?php
 require_once("class_bd.php");
 class Rol
 {
     private $codigo_rol; 
     private $nombre_rol; 
     private $estatus_rol; 
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->nombre_rol=null;
     $this->codigo_rol=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_rol(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_rol;
     
	 if($Num_Parametro>0){
	   $this->codigo_rol=func_get_arg(0);
	 }
   }
   
	public function estatus_rol(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_rol;
     
	 if($Num_Parametro>0){
	   $this->estatus_rol=func_get_arg(0);
	 }
   }

   public function nombre_rol(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nombre_rol;
     
	 if($Num_Parametro>0){
	   $this->nombre_rol=func_get_arg(0);
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
    $sql="insert into trol (nombre_rol) values ('$this->nombre_rol');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update trol set fecha_desactivacion=NULL where (cod_rol='$this->codigo_rol');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update trol set fecha_desactivacion=CURDATE() where (cod_rol='$this->codigo_rol');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update trol set nombre_rol='$this->nombre_rol' where (cod_rol='$this->codigo_rol');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_rol from trol where nombre_rol='$this->nombre_rol'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$trol=$this->mysql->Respuesta($query);
	$this->codigo_rol($trol['cod_rol']);
	$this->nombre_rol($trol['nombre_rol']);
	$this->estatus_rol($trol['estatus_rol']);
	$this->fecha_desactivacion($trol['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from trol where nombre_rol='$this->nombre_rol'";

	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$trol=$this->mysql->Respuesta($query);
	$this->codigo_rol($trol['cod_rol']);
	$this->nombre_rol($trol['nombre_rol']);
	$this->fecha_desactivacion($trol['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>
