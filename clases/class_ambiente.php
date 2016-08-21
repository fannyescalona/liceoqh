<?php
 require_once("class_bd.php");
 class Ambiente
 {
     private $codigo_ambiente;
     private $descripcion;
     private $tipo_ambiente;
     private $estatus_ambiente; 
     private $fecha_desactivacion; 
     private $error;
     private $mysql; 
	 
   public function __construct(){
     $this->descripcion=null;
     $this->codigo_ambiente=null;
     $this->tipo_ambiente=null;
     $this->error=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_ambiente(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_ambiente;
     
	 if($Num_Parametro>0){
	   $this->codigo_ambiente=func_get_arg(0);
	 }
   }

   public function estatus_ambiente(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_ambiente;
     
	 if($Num_Parametro>0){
	   $this->estatus_ambiente=func_get_arg(0);
	 }
   }
   
   public function descripcion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
	 }
   }
   
   public function tipo_ambiente(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->tipo_ambiente;
     
	 if($Num_Parametro>0){
	   $this->tipo_ambiente=func_get_arg(0);
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
    $sql="insert into tambiente (descripcion,tipo_ambiente) values ('$this->descripcion','$this->tipo_ambiente');";
    if($this->mysql->Ejecutar($sql)!=null)
		return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
     public function Activar(){
    $sql="update tambiente set fecha_desactivacion=NULL where (codigo_ambiente='$this->codigo_ambiente');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
    public function Desactivar(){
    $sql="update tambiente set fecha_desactivacion=CURDATE() where (codigo_ambiente='$this->codigo_ambiente');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
    public function Actualizar(){
    $sql="update tambiente set descripcion='$this->descripcion',tipo_ambiente='$this->tipo_ambiente' where (codigo_ambiente='$this->codigo_ambiente');";
    if($this->mysql->Ejecutar($sql)!=null)
		return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
   public function Consultar(){
    $sql="select *,(CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' ELSE 'Desactivado' END) AS estatus_ambiente from tambiente where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
		$tambiente=$this->mysql->Respuesta($query);
		$this->codigo_ambiente($tambiente['codigo_ambiente']);
		$this->descripcion($tambiente['descripcion']);
		$this->tipo_ambiente($tambiente['tipo_ambiente']);
	   	$this->estatus_ambiente($tambiente['estatus_ambiente']);
		$this->fecha_desactivacion($tambiente['fecha_desactivacion']);
		return true;
	}
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tambiente where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tambiente=$this->mysql->Respuesta($query);
	$this->codigo_ambiente($tambiente['codigo_ambiente']);
	$this->descripcion($tambiente['descripcion']);
	$this->tipo_ambiente($tambiente['tipo_ambiente']);
	$this->fecha_desactivacion($tambiente['fecha_desactivacion']);
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
