<?php
 require_once("class_bd.php");
 class Municipio
 {
     private $codigo_municipio; 
     private $descripcion; 
     private $estatus_municipio; 
     private $codigo_estado;
     private $fecha_desactivacion; 
     private $error;
     private $mysql; 
	 
   public function __construct(){
     $this->descripcion=null;
     $this->codigo_municipio=null;
     $this->codigo_estado=null;
     $this->error=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_municipio(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_municipio;
     
	 if($Num_Parametro>0){
	   $this->codigo_municipio=func_get_arg(0);
	 }
   }

   public function estatus_municipio(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_municipio;
     
	 if($Num_Parametro>0){
	   $this->estatus_municipio=func_get_arg(0);
	 }
   }
   
   public function descripcion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
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
   
   public function error(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->error;
     
	 if($Num_Parametro>0){
	   $this->error=func_get_arg(0);
	 }
   }   

   public function Registrar(){
    $sql="insert into tmunicipio (descripcion,codigo_estado) values ('$this->descripcion','$this->codigo_estado');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
     public function Activar(){
    $sql="update tmunicipio set fecha_desactivacion=NULL where (codigo_municipio='$this->codigo_municipio');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
    public function Desactivar(){
    $sql="update tmunicipio set fecha_desactivacion=CURDATE() where (codigo_municipio='$this->codigo_municipio');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
    public function Actualizar(){
    $sql="update tmunicipio set descripcion='$this->descripcion',codigo_estado='$this->codigo_estado' where (codigo_municipio='$this->codigo_municipio');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
   public function Consultar(){
    $sql="select *,(CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' ELSE 'Desactivado' END) AS estatus_municipio from tmunicipio where descripcion='$this->descripcion' and codigo_estado='$this->codigo_estado'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tmunicipio=$this->mysql->Respuesta($query);
	$this->codigo_municipio($tmunicipio['codigo_municipio']);
	$this->descripcion($tmunicipio['descripcion']);
	$this->estatus_municipio($tmunicipio['estatus_municipio']);
	$this->codigo_estado($tmunicipio['codigo_estado']);
	$this->fecha_desactivacion($tmunicipio['fecha_desactivacion']);
	return true;
	}
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tmunicipio where descripcion='$this->descripcion' and codigo_estado='$this->codigo_estado'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tmunicipio=$this->mysql->Respuesta($query);
	$this->codigo_municipio($tmunicipio['codigo_municipio']);
	$this->descripcion($tmunicipio['descripcion']);
	$this->codigo_estado($tmunicipio['codigo_estado']);
	$this->fecha_desactivacion($tmunicipio['fecha_desactivacion']);
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