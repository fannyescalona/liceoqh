<?php
 require_once("class_bd.php");
 class Ciudad
 {
     private $codigo_ciudad; 
     private $nombre_ciudad; 
     private $codigo_estado;
     private $estatus_ciudad;
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->nombre_ciudad=null;
     $this->codigo_ciudad=null;
     $this->codigo_estado=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_ciudad(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_ciudad;
     
	 if($Num_Parametro>0){
	   $this->codigo_ciudad=func_get_arg(0);
	 }
   }

   public function estatus_ciudad(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_ciudad;
     
	 if($Num_Parametro>0){
	   $this->estatus_ciudad=func_get_arg(0);
	 }
   }
   
   public function nombre_ciudad(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nombre_ciudad;
     
	 if($Num_Parametro>0){
	   $this->nombre_ciudad=func_get_arg(0);
	 }
   }

   public function codigo_estado(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_estado;
     
	 if($Num_Parametro>0){
	   $this->codigo_estado=func_get_arg(0);
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
    $sql="insert into tciudad (nombre_ciudad,cod_estado) values ('$this->nombre_ciudad','$this->codigo_estado');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update tciudad set fecha_desactivacion=NULL where (cod_ciudad='$this->codigo_ciudad');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tciudad set fecha_desactivacion=CURDATE() where (cod_ciudad='$this->codigo_ciudad');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tciudad set nombre_ciudad='$this->nombre_ciudad',cod_estado='$this->codigo_estado' where (cod_ciudad='$this->codigo_ciudad');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_ciudad from tciudad where nombre_ciudad='$this->nombre_ciudad'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tciudad=$this->mysql->Respuesta($query);
	$this->codigo_ciudad($tciudad['cod_ciudad']);
	$this->nombre_ciudad($tciudad['nombre_ciudad']);
	$this->codigo_estado($tciudad['cod_estado']);
	$this->estatus_ciudad($tciudad['estatus_ciudad']);
	$this->fecha_desactivacion($tciudad['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tciudad where nombre_ciudad='$this->nombre_ciudad' and cod_estado='$this->codigo_estado'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tciudad=$this->mysql->Respuesta($query);
	$this->codigo_ciudad($tciudad['cod_ciudad']);
	$this->nombre_ciudad($tciudad['nombre_ciudad']);
	$this->codigo_estado($tciudad['cod_estado']);
	$this->fecha_desactivacion($tciudad['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>