<?php
 require_once("class_bd.php");
 class Semestre
 {
     private $cod_semestre; 
     private $semestre; 
     private $estatus_semestre;
     private $cod_ano_academico;
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->semestre=null;
     $this->cod_semestre=null;
     $this->cod_ano_academico=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function cod_semestre(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->cod_semestre;
     
	 if($Num_Parametro>0){
	   $this->cod_semestre=func_get_arg(0);
	 }
   }
   public function estatus_semestre(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_semestre;
     
	 if($Num_Parametro>0){
	   $this->estatus_semestre=func_get_arg(0);
	 }
   }
   
   public function semestre(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->semestre;
     
	 if($Num_Parametro>0){
	   $this->semestre=func_get_arg(0);
	 }
   }

   public function cod_ano_academico(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->cod_ano_academico;
     
	 if($Num_Parametro>0){
	   $this->cod_ano_academico=func_get_arg(0);
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
    $sql="insert into tsemestre (semestre,cod_ano_academico) values ('$this->semestre','$this->cod_ano_academico');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update tsemestre set fecha_desactivacion=NULL where (cod_semestre='$this->cod_semestre');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tsemestre set fecha_desactivacion=CURDATE() where (cod_semestre='$this->cod_semestre');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tsemestre set semestre='$this->semestre',cod_ano_academico='$this->cod_ano_academico' where (cod_semestre='$this->cod_semestre');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_semestre from tsemestre where semestre='$this->semestre'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tsemestre=$this->mysql->Respuesta($query);
	$this->cod_semestre($tsemestre['cod_semestre']);
	$this->semestre($tsemestre['semestre']);
	$this->estatus_semestre($tsemestre['estatus_semestre']);
	$this->cod_ano_academico($tsemestre['cod_ano_academico']);
	$this->fecha_desactivacion($tsemestre['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tsemestre where semestre='$this->semestre' and cod_ano_academico=$this->cod_ano_academico";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tsemestre=$this->mysql->Respuesta($query);
	$this->cod_semestre($tsemestre['cod_semestre']);
	$this->semestre($tsemestre['semestre']);
	$this->cod_ano_academico($tsemestre['cod_ano_academico']);
	$this->fecha_desactivacion($tsemestre['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>