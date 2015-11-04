<?php
 require_once("class_bd.php");
 class modulo
 {
     private $codigo_modulo; 
     private $descripcion; 
     private $icono;
     private $orden;
     private $estatus;
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->codigo_modulo=null;
     $this->descripcion=null;
     $this->icono=null;
     $this->orden=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_modulo(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_modulo;
     
	 if($Num_Parametro>0){
	   $this->codigo_modulo=func_get_arg(0);
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
    $sql="insert into tmodulo (descripcion,icono,orden) values ('$this->descripcion','$this->icono','$this->orden');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update tmodulo set fecha_desactivacion=NULL where (codigo_modulo='$this->codigo_modulo');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tmodulo set fecha_desactivacion=CURDATE() where (codigo_modulo='$this->codigo_modulo');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tmodulo set descripcion='$this->descripcion',icono='$this->icono',orden='$this->orden' where (codigo_modulo='$this->codigo_modulo');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus from tmodulo where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tmodulo=$this->mysql->Respuesta($query);
	$this->codigo_modulo($tmodulo['codigo_modulo']);
	$this->descripcion($tmodulo['descripcion']);
	$this->icono($tmodulo['icono']);
	$this->orden($tmodulo['orden']);
	$this->estatus($tmodulo['estatus']);
	$this->fecha_desactivacion($tmodulo['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tmodulo where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tmodulo=$this->mysql->Respuesta($query);
	$this->codigo_modulo($tmodulo['codigo_modulo']);
	$this->descripcion($tmodulo['descripcion']);
	$this->fecha_desactivacion($tmodulo['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>
