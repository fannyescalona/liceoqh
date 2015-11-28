<?php
 require_once("class_bd.php");
 class Opciones
 {
     private $codigo_opcion; 
     private $descripcion; 
     private $icono; 
     private $orden; 
     private $estatus_opciones; 
     private $fecha_desactivacion; 
     private $error;
     private $mysql; 
	 
   public function __construct(){
     $this->descripcion=null;
     $this->codigo_opcion=null;
     $this->icono=null;
     $this->orden=null;
     $this->error=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_opcion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_opcion;
     
	 if($Num_Parametro>0){
	   $this->codigo_opcion=func_get_arg(0);
	 }
   }
      public function estatus_opciones(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_opciones;
     
	 if($Num_Parametro>0){
	   $this->estatus_opciones=func_get_arg(0);
	 }
   }
   public function descripcion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
	 }
   }

   public function icono(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->icono;
     
	 if($Num_Parametro>0){
	   $this->icono=func_get_arg(0);
	 }
   }

   public function orden(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->orden;
     
	 if($Num_Parametro>0){
	   $this->orden=func_get_arg(0);
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
    $sql="insert into topcion (descripcion,icono,orden) values ('$this->descripcion','$this->icono',$this->orden);";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
     public function Activar(){
    $sql="update topcion set fecha_desactivacion=NULL where (codigo_opcion='$this->codigo_opcion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
    public function Desactivar(){
    $sql="update topcion set fecha_desactivacion=CURDATE() where (codigo_opcion='$this->codigo_opcion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
    public function Actualizar(){
    $sql="update topcion set descripcion='$this->descripcion',icono='$this->icono',orden=$this->orden where (codigo_opcion='$this->codigo_opcion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
   public function Consultar(){
    $sql="select *,(CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' ELSE 'Desactivado' END) AS estatus_opciones from topcion where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$topcion=$this->mysql->Respuesta($query);
	$this->codigo_opcion($topcion['codigo_opcion']);
	$this->descripcion($topcion['descripcion']);
   	$this->estatus_opciones($topcion['estatus_opciones']);
   	$this->orden($topcion['orden']);
	$this->icono($topcion['icono']);
	$this->fecha_desactivacion($topcion['fecha_desactivacion']);
	return true;
	}
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   public function Comprobar(){
    $sql="select * from topcion where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$topcion=$this->mysql->Respuesta($query);
	$this->codigo_opcion($topcion['codigo_opcion']);
	$this->descripcion($topcion['descripcion']);
	$this->icono($topcion['icono']);
   	$this->orden($topcion['orden']);
	$this->fecha_desactivacion($topcion['fecha_desactivacion']);
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
