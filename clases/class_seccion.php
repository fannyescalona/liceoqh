<?php
 require_once("class_bd.php");
 class Seccion
 {
     private $seccion; 
     private $descripcion;
     private $turno;  
     private $grado_escolar;  
     private $capacidad_min;
     private $capacidad_max; 
     private $estatus; 
     private $fecha_desactivacion; 
     private $error; 
     private $mysql; 
	 
   public function __construct(){
 
     $this->seccion=null;
     $this->descripcion=null;
     $this->turno=null;
     $this->grado_escolar=null;
     $this->capacidad_min=null;
     $this->capacidad_max=null;
     $this->error=null;
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

   public function descripcion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
	 }
   }

   public function turno(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->turno;
     
	 if($Num_Parametro>0){
	   $this->turno=func_get_arg(0);
	 }
   }

   public function grado_escolar(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->grado_escolar;
     
	 if($Num_Parametro>0){
	   $this->grado_escolar=func_get_arg(0);
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

	public function EliminarMateriasDocentes(){
		$sql="DELETE FROM tmateria_seccion_docente WHERE (seccion='$this->seccion');";
		if($this->mysql->Ejecutar($sql)!=null)
			return true;
		else{
	      $this->error($this->mysql->Error());
	      return false;
	    } 
	} 

	public function InsertarMateriasDocentes($materias,$docentes){
	    $sql="INSERT INTO tmateria_seccion_docente(seccion,codigo_materia,cedula_docente) VALUES ";
	    for($i=0;$i<count($materias);$i++){
	    	//	Obtenemos el codigo de la materia y el docente
	    	$materia=explode('_',$materias[$i]);
	    	$codigo_materia = $materia[0];
	    	$docente=explode('_',$docentes[$i]);
	    	$cedula_docente = $docente[0];
	    	$sql.="('$this->seccion','$codigo_materia','$cedula_docente'),";
	    }
	    $sql=substr($sql,0,-1);
	    $sql=$sql.";";
	    if($this->mysql->Ejecutar($sql)!=null)
	      return true;
	    else{
	      $this->error($this->mysql->Error());
	      return false;
	    } 
    }

   public function Registrar(){
    $sql="insert into tseccion (seccion,descripcion,turno,grado_escolar,capacidad_min,capacidad_max) values ";
    $sql.="('$this->seccion','$this->descripcion','$this->turno','$this->grado_escolar','$this->capacidad_min','$this->capacidad_max');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }

   
    public function Activar(){
    $sql="update tseccion set fecha_desactivacion=NULL where (seccion='$this->seccion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
    public function Desactivar(){
    $sql="update tseccion set fecha_desactivacion=CURDATE() where (seccion='$this->seccion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
   
    public function Actualizar(){
    $sql="update tseccion set seccion='$this->seccion',descripcion='$this->descripcion',turno='$this->turno',grado_escolar='$this->grado_escolar', ";
    $sql.="capacidad_min='$this->capacidad_min',capacidad_max='$this->capacidad_max' where (seccion='$this->seccion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
   
   public function Consultar(){
    $sql="SELECT *,(CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' ELSE 'Desactivado' END) AS estatus FROM tseccion WHERE seccion='$this->seccion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tseccion=$this->mysql->Respuesta($query);
	$this->seccion($tseccion['seccion']);
	$this->descripcion($tseccion['descripcion']);
	$this->turno($tseccion['turno']);
	$this->grado_escolar($tseccion['grado_escolar']);
	$this->capacidad_min($tseccion['capacidad_min']);
	$this->capacidad_max($tseccion['capacidad_max']);
	$this->estatus($tseccion['estatus']);
	$this->fecha_desactivacion($tseccion['fecha_desactivacion']);
	return true;
	}
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
   public function Comprobar(){
    $sql="select * from tseccion where (seccion='$this->seccion' OR descripcion='$this->descripcion')";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tseccion=$this->mysql->Respuesta($query);
	$this->seccion($tseccion['seccion']);
	$this->descripcion($tseccion['descripcion']);
	$this->turno($tseccion['turno']);
	$this->capacidad_min($tseccion['capacidad_min']);
	$this->capacidad_max($tseccion['capacidad_max']);
	$this->estatus($tseccion['estatus']);
	$this->fecha_desactivacion($tseccion['fecha_desactivacion']);
    $this->error("El registro ya existe !");
	return true;
	}
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }

  public function Eliminar_Notas($msd,$estudiante,$lapso){
    $sql="DELETE FROM tcontrol_notas WHERE codigo_msd=$msd AND cedula_estudiante='$estudiante' AND codigo_lapso=$lapso;";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
      $this->error($this->mysql->Error());
      return false;
    } 
  }

  public function Asignar_Notas($msd,$estudiante,$lapso,$nota){
    $sql="INSERT INTO tcontrol_notas (codigo_msd,cedula_estudiante,codigo_lapso,notafinal) VALUES ($msd,'$estudiante',$lapso,$nota);";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
      $this->error($this->mysql->Error());
      return false;
    } 
  }
}
?>