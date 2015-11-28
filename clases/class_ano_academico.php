<?php
 require_once("class_bd.php");
 
 class Ano_Academico
 {
     private $codigo_ano_academico; 
     private $descripcion;
     private $estatus; 
     private $fecha_desactivacion; 
     private $error; 
     private $mysql; 
	 
   public function __construct(){
     $this->codigo_ano_academico=null;
     $this->descripcion=null;
     $this->error=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_ano_academico(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_ano_academico;
     
	 if($Num_Parametro>0){
	   $this->codigo_ano_academico=func_get_arg(0);
	 }
   }

    public function descripcion(){
    $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
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
   
   public function error(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->error;
     
	 if($Num_Parametro>0){
	   $this->error=func_get_arg(0);
	 }
   }   

   public function Registrar(){
    $sql="insert into tano_academico (descripcion) values ('$this->descripcion');";
    if($this->mysql->Ejecutar($sql)!=null)
		return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
   public function Activar(){
    $sql="update tano_academico set fecha_desactivacion=NULL where (codigo_ano_academico='$this->codigo_ano_academico');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }

   public function Desactivar(){
    $sql="update tano_academico set fecha_desactivacion=CURDATE() where (codigo_ano_academico='$this->codigo_ano_academico');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
   public function Actualizar(){
    $sql="update tano_academico set descripcion='$this->descripcion' where (codigo_ano_academico='$this->codigo_ano_academico');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus from tano_academico where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
		$tano_academico=$this->mysql->Respuesta($query);
		$this->codigo_ano_academico($tano_academico['codigo_ano_academico']);
		$this->descripcion($tano_academico['descripcion']);
	   	$this->estatus($tano_academico['estatus']);
		$this->fecha_desactivacion($tano_academico['fecha_desactivacion']);
		return true;
	}
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }

   public function Comprobar(){
    $sql="select * from tano_academico where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
		$tano_academico=$this->mysql->Respuesta($query);
		$this->codigo_ano_academico($tano_academico['codigo_ano_academico']);
		$this->descripcion($tano_academico['descripcion']);
		$this->fecha_desactivacion($tano_academico['fecha_desactivacion']);
		$this->error("El registro ya existe!");
		return true;
	}
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
}
?>
