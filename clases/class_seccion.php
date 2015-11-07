<?php
 require_once("class_bd.php");
 class Seccion
 {
     private $seccion; 
     private $descripcion;
     private $turno;  
     private $capacidad_min;
     private $capacidad_max; 
     private $estatus; 
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
 
     $this->seccion=null;
     $this->descripcion=null;
     $this->turno=null;
     $this->capacidad_min=null;
     $this->capacidad_max=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function seccion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->seccion;
     
	 if($Num_Parametro>0){
	   $this->seccion=func_get_arg(0);
	 }
   }

   public function descripcion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
	 }
   }

   public function turno(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->turno;
     
	 if($Num_Parametro>0){
	   $this->turno=func_get_arg(0);
	 }
   }

   public function capacidad_min(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->capacidad_min;
     
	 if($Num_Parametro>0){
	   $this->capacidad_min=func_get_arg(0);
	 }
   }

   public function capacidad_max(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->capacidad_max;
     
	 if($Num_Parametro>0){
	   $this->capacidad_max=func_get_arg(0);
	 }
   }
   
    public function estatus(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus;
     
	 if($Num_Parametro>0){
	   $this->estatus=func_get_arg(0);
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
    $sql="insert into tseccion (seccion,descripcion,turno,capacidad_min,capacidad_max) values 
    ('$this->seccion','$this->descripcion','$this->turno','$this->capacidad_min','$this->capacidad_max');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }

   
    public function Activar(){
    $sql="update tseccion set fecha_desactivacion=NULL where (seccion='$this->seccion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tseccion set fecha_desactivacion=CURDATE() where (seccion='$this->seccion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tseccion set seccion='$this->seccion',descripcion='$this->descripcion',turno='$this->turno',capacidad_min='$this->capacidad_min',
    capacidad_max='$this->capacidad_max' where (seccion='$this->seccion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="SELECT *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus FROM tseccion WHERE seccion='$this->seccion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tseccion=$this->mysql->Respuesta($query);
	$this->seccion($tseccion['seccion']);
	$this->descripcion($tseccion['descripcion']);
	$this->turno($tseccion['turno']);
	$this->capacidad_min($tseccion['capacidad_min']);
	$this->capacidad_max($tseccion['capacidad_max']);
	$this->estatus($tseccion['estatus']);
	$this->fecha_desactivacion($tseccion['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tseccion where seccion='$this->seccion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tseccion=$this->mysql->Respuesta($query);
	$this->seccion($tseccion['seccion']);
	$this->descripcion($tseccion['descripcion']);
	$this->turno($tseccion['turno']);
	$this->capacidad_min($tseccion['capacidad_min']);
	$this->capacidad_max($tseccion['capacidad_max']);
	$this->estatus($tseccion['estatus']);
	$this->fecha_desactivacion($tseccion['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>