<?php
 require_once("class_bd.php");
 class Estado
 {
     private $codigo_estado; 
     private $descripcion; 
     private $codigo_pais;
     private $estatus_estado; 
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->descripcion=null;
     $this->codigo_estado=null;
     $this->codigo_pais=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_estado(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_estado;
     
	 if($Num_Parametro>0){
	   $this->codigo_estado=func_get_arg(0);
	 }
   }

   public function estatus_estado(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_estado;
     
	 if($Num_Parametro>0){
	   $this->estatus_estado=func_get_arg(0);
	 }
   }
   
   public function descripcion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
	 }
   }

   public function codigo_pais(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_pais;
     
	 if($Num_Parametro>0){
	   $this->codigo_pais=func_get_arg(0);
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
    $sql="insert into testado (descripcion,codigo_pais) values ('$this->descripcion','$this->codigo_pais');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update testado set fecha_desactivacion=NULL where (codigo_estado='$this->codigo_estado');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update testado set fecha_desactivacion=CURDATE() where (codigo_estado='$this->codigo_estado');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update testado set descripcion='$this->descripcion',codigo_pais='$this->codigo_pais' where (codigo_estado='$this->codigo_estado');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_estado from testado where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$testado=$this->mysql->Respuesta($query);
	$this->codigo_estado($testado['codigo_estado']);
	$this->descripcion($testado['descripcion']);
	$this->codigo_pais($testado['codigo_pais']);
   	$this->estatus_estado($testado['estatus_estado']);
	$this->fecha_desactivacion($testado['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from testado where descripcion='$this->descripcion' and codigo_pais='$this->codigo_pais'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$testado=$this->mysql->Respuesta($query);
	$this->codigo_estado($testado['codigo_estado']);
	$this->descripcion($testado['descripcion']);
	$this->codigo_pais($testado['codigo_pais']);
	$this->fecha_desactivacion($testado['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>