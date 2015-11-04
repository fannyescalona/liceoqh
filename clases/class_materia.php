<?php
 require_once("class_bd.php");
 class materia
 {
     private $codigo_materia; 
     private $nombre_materia; 
     private $tipo_materia; 
     private $estatus_materia;
     private $unidad_curricular;
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->nombre_materia=null;
     $this->codigo_materia=null;
     $this->tipo_materia=null;
     $this->unidad_curricular=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_materia(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_materia;
     
	 if($Num_Parametro>0){
	   $this->codigo_materia=func_get_arg(0);
	 }
   }

   public function tipo_materia(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->tipo_materia;
     
	 if($Num_Parametro>0){
	   $this->tipo_materia=func_get_arg(0);
	 }
   }
   
	public function estatus_materia(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_materia;
     
	 if($Num_Parametro>0){
	   $this->estatus_materia=func_get_arg(0);
	 }
   }

   public function nombre_materia(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nombre_materia;
     
	 if($Num_Parametro>0){
	   $this->nombre_materia=func_get_arg(0);
	 }
   }

   public function unidad_curricular(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->unidad_curricular;
     
	 if($Num_Parametro>0){
	   $this->unidad_curricular=func_get_arg(0);
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
    $sql="insert into tmateria (cod_materia,nombre_materia,unidad_curricular,tipo_materia) values ('$this->codigo_materia','$this->nombre_materia','$this->unidad_curricular','$this->tipo_materia');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update tmateria set fecha_desactivacion=NULL where (cod_materia='$this->codigo_materia');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tmateria set fecha_desactivacion=CURDATE() where (cod_materia='$this->codigo_materia');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tmateria set nombre_materia='$this->nombre_materia',unidad_curricular='$this->unidad_curricular',tipo_materia='$this->tipo_materia' where (cod_materia='$this->codigo_materia');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_materia from tmateria where nombre_materia='$this->nombre_materia' or cod_materia='$this->codigo_materia'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tmateria=$this->mysql->Respuesta($query);
	$this->codigo_materia($tmateria['cod_materia']);
	$this->nombre_materia($tmateria['nombre_materia']);
	$this->tipo_materia($tmateria['tipo_materia']);
	$this->estatus_materia($tmateria['estatus_materia']);
	$this->unidad_curricular($tmateria['unidad_curricular']);
	$this->fecha_desactivacion($tmateria['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tmateria where cod_materia='$this->codigo_materia'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tmateria=$this->mysql->Respuesta($query);
	$this->codigo_materia($tmateria['cod_materia']);
	$this->nombre_materia($tmateria['nombre_materia']);
	$this->unidad_curricular($tmateria['unidad_curricular']);
	$this->tipo_materia($tmateria['tipo_materia']);
	$this->fecha_desactivacion($tmateria['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>
