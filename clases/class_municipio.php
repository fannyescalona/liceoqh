<?php
 require_once("class_bd.php");
 class Municipio
 {
     private $codigo_municipio; 
     private $nombre_municipio; 
     private $estatus_municipio; 
     private $codigo_ciudad;
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->nombre_municipio=null;
     $this->codigo_municipio=null;
     $this->codigo_ciudad=null;
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
   
   public function nombre_municipio(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nombre_municipio;
     
	 if($Num_Parametro>0){
	   $this->nombre_municipio=func_get_arg(0);
	 }
   }

   public function codigo_ciudad(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_ciudad;
     
	 if($Num_Parametro>0){
	   $this->codigo_ciudad=func_get_arg(0);
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
    $sql="insert into tmunicipio (nombre_municipio,cod_ciudad) values ('$this->nombre_municipio','$this->codigo_ciudad');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update tmunicipio set fecha_desactivacion=NULL where (cod_municipio='$this->codigo_municipio');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tmunicipio set fecha_desactivacion=CURDATE() where (cod_municipio='$this->codigo_municipio');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tmunicipio set nombre_municipio='$this->nombre_municipio',cod_ciudad='$this->codigo_ciudad' where (cod_municipio='$this->codigo_municipio');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_municipio from tmunicipio where nombre_municipio='$this->nombre_municipio'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tmunicipio=$this->mysql->Respuesta($query);
	$this->codigo_municipio($tmunicipio['cod_municipio']);
	$this->nombre_municipio($tmunicipio['nombre_municipio']);
	$this->estatus_municipio($tmunicipio['estatus_municipio']);
	$this->codigo_ciudad($tmunicipio['cod_ciudad']);
	$this->fecha_desactivacion($tmunicipio['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tmunicipio where nombre_municipio='$this->nombre_municipio' and cod_ciudad='$this->codigo_ciudad'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tmunicipio=$this->mysql->Respuesta($query);
	$this->codigo_municipio($tmunicipio['cod_municipio']);
	$this->nombre_municipio($tmunicipio['nombre_municipio']);
	$this->codigo_ciudad($tmunicipio['cod_ciudad']);
	$this->fecha_desactivacion($tmunicipio['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>