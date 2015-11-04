<?php
 require_once("class_bd.php");
 class Ano_Academico
 {
     private $codigo_ano_academico; 
     private $ano; 
     private $estatus_ano_academico;
     private $codigo_carrera;
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->ano=null;
     $this->codigo_ano_academico=null;
     $this->codigo_carrera=null;
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
   
   public function estatus_ano_academico(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_ano_academico;
     
	 if($Num_Parametro>0){
	   $this->estatus_ano_academico=func_get_arg(0);
	 }
   }

   public function ano(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->ano;
     
	 if($Num_Parametro>0){
	   $this->ano=func_get_arg(0);
	 }
   }

   public function codigo_carrera(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_carrera;
     
	 if($Num_Parametro>0){
	   $this->codigo_carrera=func_get_arg(0);
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
    $sql="insert into tano_academico (ano,cod_carrera) values ('$this->ano','$this->codigo_carrera');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update tano_academico set fecha_desactivacion=NULL where (cod_ano_academico='$this->codigo_ano_academico');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tano_academico set fecha_desactivacion=CURDATE() where (cod_ano_academico='$this->codigo_ano_academico');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tano_academico set ano='$this->ano',cod_carrera='$this->codigo_carrera' where (cod_ano_academico='$this->codigo_ano_academico');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
   	if(!empty($this->codigo_carrera) && !empty($this->ano)){
   		$sql="SELECT *,
	    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
	    	ELSE 'Desactivado' END) AS estatus_ano_academico from tano_academico 
		WHERE ano='$this->ano' AND cod_carrera='$this->codigo_carrera'";
   	}else if(!empty($this->codigo_carrera)){
   		$sql="SELECT *,
	    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
	    	ELSE 'Desactivado' END) AS estatus_ano_academico from tano_academico 
		WHERE cod_carrera='$this->codigo_carrera'";
   	}else{
   		$sql="SELECT *,
	    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
	    	ELSE 'Desactivado' END) AS estatus_ano_academico from tano_academico 
		WHERE ano='$this->ano'";
   	}
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tano_academico=$this->mysql->Respuesta($query);
	$this->codigo_ano_academico($tano_academico['cod_ano_academico']);
	$this->estatus_ano_academico($tano_academico['estatus_ano_academico']);
	$this->ano($tano_academico['ano']);
	$this->codigo_carrera($tano_academico['cod_carrera']);
	$this->fecha_desactivacion($tano_academico['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tano_academico where ano='$this->ano' and cod_carrera = '$this->cod_carrera'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tano_academico=$this->mysql->Respuesta($query);
	$this->codigo_ano_academico($tano_academico['cod_ano_academico']);
	$this->ano($tano_academico['ano']);
	$this->codigo_carrera($tano_academico['cod_carrera']);
	$this->fecha_desactivacion($tano_academico['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>