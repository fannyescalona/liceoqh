<?php
 require_once("class_bd.php");
 class planevaluacion
 {
     private $codigo_plan_evaluacion;
     private $codigo_msd;
     private $codigo_lapso;
     private $descripcion;
     private $porcentaje;
     private $estatus_planevaluacion;
     private $fecha_desactivacion;
     private $error;
     private $mysql;
	 
   public function __construct(){
     $this->codigo_plan_evaluacion=null;
     $this->codigo_msd=null;
     $this->codigo_lapso=null;
     $this->descripcion=null;
     $this->porcentaje=null;
     $this->error=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_plan_evaluacion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_plan_evaluacion;
     
	 if($Num_Parametro>0){
	   $this->codigo_plan_evaluacion=func_get_arg(0);
	 }
   }

   public function codigo_msd(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_msd;
     
	 if($Num_Parametro>0){
	   $this->codigo_msd=func_get_arg(0);
	 }
   }

   public function codigo_lapso(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_lapso;
     
	 if($Num_Parametro>0){
	   $this->codigo_lapso=func_get_arg(0);
	 }
   }

   public function estatus_planevaluacion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_planevaluacion;
     
	 if($Num_Parametro>0){
	   $this->estatus_planevaluacion=func_get_arg(0);
	 }
   }
   
   public function descripcion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
	 }
   }
   
   public function porcentaje(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->porcentaje;
     
	 if($Num_Parametro>0){
	   $this->porcentaje=func_get_arg(0);
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
    $sql="insert into tplanevaluacion (descripcion) values ('$this->descripcion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
    public function Activar(){
    $sql="update tplanevaluacion set fecha_desactivacion=NULL where (codigo_plan_evaluacion='$this->codigo_plan_evaluacion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
    public function Desactivar(){
    $sql="update tplanevaluacion set fecha_desactivacion=CURDATE() where (codigo_plan_evaluacion='$this->codigo_plan_evaluacion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
    public function Actualizar(){
    $sql="update tplanevaluacion set descripcion='$this->descripcion' where (codigo_plan_evaluacion='$this->codigo_plan_evaluacion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
   public function Consultar(){
    $sql="select *,(CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' ELSE 'Desactivado' END) AS estatus_planevaluacion from tplanevaluacion where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tplanevaluacion=$this->mysql->Respuesta($query);
	$this->codigo_plan_evaluacion($tplanevaluacion['codigo_plan_evaluacion']);
	$this->descripcion($tplanevaluacion['descripcion']);
   	$this->estatus_planevaluacion($tplanevaluacion['estatus_planevaluacion']);
	$this->fecha_desactivacion($tplanevaluacion['fecha_desactivacion']);
	return true;
	}
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tplanevaluacion where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tplanevaluacion=$this->mysql->Respuesta($query);
	$this->codigo_plan_evaluacion($tplanevaluacion['codigo_plan_evaluacion']);
	$this->descripcion($tplanevaluacion['descripcion']);
	$this->fecha_desactivacion($tplanevaluacion['fecha_desactivacion']);
    $this->error("El registro ya existe !");
	return true;
	}
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }

   public function BuscarMSD($seccion,$cedula_docente){
    $sql="SELECT msd.codigo_msd,msd.codigo_materia,m.descripcion AS materia 
    FROM tmateria_seccion_docente msd 
    INNER JOIN tmateria m ON msd.codigo_materia = m.codigo_materia 
    WHERE msd.seccion = '$seccion' AND msd.cedula_docente = '$cedula_docente'";
    $query = $this->mysql->Ejecutar($sql);
    while($Obj=$this->mysql->Respuesta_assoc($query)){
      $rows[]=array_map("html_entity_decode",$Obj);
    }
    if(!empty($rows)){
      $json = json_encode($rows);
    }
    else{
      $rows[] = array("msj" => "Error al Buscar Registros ");
      $json = json_encode($rows);
    }
    return $json;
  }
}
?>
