<?php
 require_once("class_bd.php");
 class Seccion
 {
     private $seccion; 
     private $nombre_seccion; 
     private $capacidad_min;
     private $capacidad_max; 
     private $turno; 
     private $codigo_periodo;
     private $codigo_semestre;
     private $codigo_materia;
     private $estatus_seccion;
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->turno=null;
     $this->seccion=null;
     $this->nombre_seccion=null;
     $this->capacidad_min=null;
     $this->capacidad_max=null;
     $this->codigo_periodo=null;
     $this->codigo_semestre=null;
     $this->codigo_materia=null;
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

   public function nombre_seccion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nombre_seccion;
     
	 if($Num_Parametro>0){
	   $this->nombre_seccion=func_get_arg(0);
	 }
   }


   public function estatus_seccion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_seccion;
     
	 if($Num_Parametro>0){
	   $this->estatus_seccion=func_get_arg(0);
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
   
   public function turno(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->turno;
     
	 if($Num_Parametro>0){
	   $this->turno=func_get_arg(0);
	 }
   }

   public function codigo_periodo(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_periodo;
     
	 if($Num_Parametro>0){
	   $this->codigo_periodo=func_get_arg(0);
	 }
   }

   public function codigo_semestre(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_semestre;
     
	 if($Num_Parametro>0){
	   $this->codigo_semestre=func_get_arg(0);
	 }
   }

   public function codigo_materia(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_materia;
     
	 if($Num_Parametro>0){
	   $this->codigo_materia=func_get_arg(0);
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
    $sql="insert into tseccion (seccion,nombre_seccion,capacidad_min,capacidad_max,turno,cod_periodo,cod_semestre) values 
    ('$this->seccion','$this->nombre_seccion','$this->capacidad_min','$this->capacidad_max','$this->turno','$this->codigo_periodo','$this->codigo_semestre');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }

	public function EliminarMaterias(){
		$sql="DELETE FROM tmateria_seccion WHERE seccion='$this->seccion';";
		if($this->mysql->Ejecutar($sql)!=null)
			return true;
		else
			return false;
	}
   
	public function InsertarMaterias(){
		$sql1="SELECT * FROM tmateria_seccion WHERE seccion='$this->seccion' AND cod_materia='$this->codigo_materia'";
		$sql="INSERT INTO tmateria_seccion(cod_materia,seccion) VALUES ('$this->codigo_materia','$this->seccion')";
		$query=$this->mysql->Ejecutar($sql1);
		if($this->mysql->Total_Filas($query)==0){
			if($this->mysql->Ejecutar($sql)!=null)
				return true;
			else
				return false;
		}else{
			return false;
		}
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
   
    public function Actualizar($oldseccion){
    $sql="update tseccion set seccion='$this->seccion',nombre_seccion='$this->nombre_seccion',capacidad_min='$this->capacidad_min',capacidad_max='$this->capacidad_max',
    turno='$this->turno',cod_periodo='$this->codigo_periodo',cod_semestre='$this->codigo_semestre' 
    where (seccion='$oldseccion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="SELECT *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_seccion FROM tseccion WHERE seccion='$this->seccion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tseccion=$this->mysql->Respuesta($query);
	$this->seccion($tseccion['seccion']);
	$this->nombre_seccion($tseccion['nombre_seccion']);
	$this->estatus_seccion($tseccion['estatus_seccion']);
	$this->capacidad_min($tseccion['capacidad_min']);
	$this->capacidad_max($tseccion['capacidad_max']);
	$this->turno($tseccion['turno']);
	$this->codigo_periodo($tseccion['cod_periodo']);
	$this->codigo_semestre($tseccion['cod_semestre']);
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
	$this->nombre_seccion($tseccion['nombre_seccion']);
	$this->capacidad_min($tseccion['capacidad_min']);
	$this->capacidad_max($tseccion['capacidad_max']);
	$this->turno($tseccion['turno']);
	$this->codigo_periodo($tseccion['cod_periodo']);
	$this->codigo_semestre($tseccion['cod_semestre']);
	$this->fecha_desactivacion($tseccion['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>