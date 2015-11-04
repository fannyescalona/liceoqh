<?php
 require_once("class_bd.php");
 class Periodo
 {
     private $codigo_periodo; 
     private $descripcion; 
     private $fecha_inicio;
     private $fecha_fin;
     private $estatus_periodo; 
     private $fecha_desactivacion;    
     private $mysql; 
	 
   public function __construct(){
     $this->descripcion=null;
     $this->codigo_periodo=null;
     $this->fecha_inicio=null;
     $this->fecha_fin=null;
     $this->fecha_desactivacion=null;
     $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_periodo(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_periodo;
     
	 if($Num_Parametro>0){
	   $this->codigo_periodo=func_get_arg(0);
	 }
   }

   public function estatus_periodo(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_periodo;
     
	 if($Num_Parametro>0){
	   $this->estatus_periodo=func_get_arg(0);
	 }
   }
   
   public function descripcion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
	 }
   }

   public function fecha_inicio(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->fecha_inicio;
     
	 if($Num_Parametro>0){
	   $this->fecha_inicio=func_get_arg(0);
	 }
   }

   public function fecha_fin(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->fecha_fin;
     
	 if($Num_Parametro>0){
	   $this->fecha_fin=func_get_arg(0);
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
    $sql="insert into tperiodo (descripcion,fecha_inicio,fecha_fin,esinscripcion) values ('$this->descripcion','$this->fecha_inicio','$this->fecha_fin','N');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Activar(){
    $sql="update tperiodo set fecha_desactivacion=NULL where (cod_periodo='$this->codigo_periodo');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tperiodo set fecha_desactivacion=CURDATE() where (cod_periodo='$this->codigo_periodo');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tperiodo set descripcion='$this->descripcion',fecha_inicio='$this->fecha_inicio',fecha_fin='$this->fecha_fin' where (cod_periodo='$this->codigo_periodo');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select cod_periodo,descripcion,date_format(fecha_inicio,'%d/%m/%Y') fecha_inicio,
    date_format(fecha_fin,'%d/%m/%Y') fecha_fin,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_periodo from tperiodo where descripcion=('$this->descripcion') and esinscripcion = 'N'"; 
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tperiodo=$this->mysql->Respuesta($query);
	$this->codigo_periodo($tperiodo['cod_periodo']);
	$this->descripcion($tperiodo['descripcion']);
	$this->fecha_inicio($tperiodo['fecha_inicio']);
	$this->fecha_fin($tperiodo['fecha_fin']);
	$this->estatus_periodo($tperiodo['estatus_periodo']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tperiodo where descripcion='$this->descripcion' and esinscripcion = 'N'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tperiodo=$this->mysql->Respuesta($query);
	$this->codigo_periodo($tperiodo['cod_periodo']);
	$this->descripcion($tperiodo['descripcion']);
	$this->fecha_inicio($tperiodo['fecha_inicio']);
	$this->fecha_fin($tperiodo['fecha_fin']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>