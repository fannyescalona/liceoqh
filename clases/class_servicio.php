<?php
 require_once("class_bd.php");
 class Servicios
 {
     private $codigo_servicio; 
     private $descripcion; 
     private $url;
     private $orden;
     private $codigo_modulo;
     private $estatus;
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
   	$this->codigo_servicio=null;
     $this->descripcion=null;
     $this->codigo_modulo=null;
     $this->url=null;
     $this->orden=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_servicio(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_servicio;
     
	 if($Num_Parametro>0){
	   $this->codigo_servicio=func_get_arg(0);
	 }
   }
   public function descripcion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
	 }
   }
public function url(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->url;
     
	 if($Num_Parametro>0){
	   $this->url=func_get_arg(0);
	 }
   }

   public function orden(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->orden;
     
	 if($Num_Parametro>0){
	   $this->orden=func_get_arg(0);
	 }
   }
 
   public function codigo_modulo(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_modulo;
     
	 if($Num_Parametro>0){
	   $this->codigo_modulo=func_get_arg(0);
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
    $sql="insert into tservicio (descripcion,url,orden,codigo_modulo) values ('$this->descripcion','$this->url',
    	'$this->orden','$this->codigo_modulo');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update tservicio set fecha_desactivacion=NULL where (codigo_servicio='$this->codigo_servicio');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tservicio set fecha_desactivacion=CURDATE() where (codigo_servicio='$this->codigo_servicio');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tservicio set descripcion='$this->descripcion',
    url='$this->url',orden='$this->orden',codigo_modulo='$this->codigo_modulo', where (codigo_servicio='$this->codigo_servicio');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus from tservicio where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tservicio=$this->mysql->Respuesta($query);
	$this->codigo_servicio($tservicio['codigo_servicio']);
	$this->descripcion($tservicio['descripcion']);
	$this->url($tservicio['url']);
	$this->orden($tservicio['orden']);
	$this->codigo_modulo($tservicio['codigo_modulo']);
	$this->estatus($tservicio['estatus']);
	$this->fecha_desactivacion($tservicio['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tservicio where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tservicio=$this->mysql->Respuesta($query);
	$this->codigo_servicio($tservicio['codigo_servicio']);
	$this->descripcion($tservicio['descripcion']);
	$this->url($tservicio['url']);
	$this->orden($tservicio['orden']);
	$this->codigo_modulo($tservicio['codigo_modulo']);
	$this->fecha_desactivacion($tservicio['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>