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

   public function Cerrar(){
    $sql="update tano_academico set cerrado='Y',fecha_desactivacion=CURDATE() where (codigo_ano_academico='$this->codigo_ano_academico');";
    if($this->mysql->Ejecutar($sql)!=null)
		return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }

   public function ActualizarInscripciones(){
    $sql="INSERT INTO tproceso_inscripcion (codigo_inscripcion,fecha_inscripcion,codigo_ano_academico,cedula_docente,cedula_estudiante,codigo_canaima,peso,estatura,plantel_procedencia,certificado_sextogrado,";
	$sql.="notascertificadas,cartabuenaconducta,fotoestudiante,fotorepresentante,fotocopia_ciestudiante,fotocopia_cirepresentante,fotocopia_pnestudiante,kitscomedor,becado,tipobeca,cedula_madre,cedula_padre,";
	$sql.="cedula_representante,codigo_parentesco,lugar_trabajo,primerafi,seccion,estatus,cedula_escolar,proceso_completado) ";
	$sql.="SELECT pi.codigo_inscripcion,CURDATE(),(SELECT MAX(aa.codigo_ano_academico) FROM tano_academico aa WHERE fecha_desactivacion IS NULL AND aa.codigo_ano_academico<> $this->codigo_ano_academico),";
	$sql.="pi.cedula_docente,pi.cedula_estudiante,pi.codigo_canaima,pi.peso,pi.estatura,pi.plantel_procedencia,pi.certificado_sextogrado,pi.notascertificadas,pi.cartabuenaconducta,";
	$sql.="pi.fotoestudiante,pi.fotorepresentante,pi.fotocopia_ciestudiante,pi.fotocopia_cirepresentante,pi.fotocopia_pnestudiante,pi.kitscomedor,pi.becado,pi.tipobeca,pi.cedula_madre,";
	$sql.="pi.cedula_padre,pi.cedula_representante,pi.codigo_parentesco,pi.lugar_trabajo,pi.primerafi, ";
	$sql.="(SELECT seccion FROM tseccion sec ";
	$sql.="WHERE sec.capacidad_max-COALESCE((SELECT COUNT(pi.cedula_estudiante) FROM tproceso_inscripcion pi WHERE pi.seccion = sec.seccion),0) <>0 AND sec.grado_escolar=s.grado_escolar+1),";
	$sql.="pi.estatus,pi.cedula_escolar,pi.proceso_completado ";
	$sql.="FROM tproceso_inscripcion pi ";
	$sql.="INNER JOIN tseccion s ON pi.seccion = s.seccion ";
	$sql.="WHERE codigo_ano_academico = $this->codigo_ano_academico ";
	$sql.="AND cedula_estudiante IN ";
	$sql.="(SELECT cedula_estudiante ";
	$sql.="FROM ";
	$sql.="(SELECT cn.cedula_estudiante,msd.codigo_materia,ROUND(AVG(notafinal)) AS notafinal ";
	$sql.="FROM tcontrol_notas cn ";
	$sql.="INNER JOIN tmateria_seccion_docente msd ON cn.codigo_msd = msd.codigo_msd ";
	$sql.="INNER JOIN tlapso l ON cn.codigo_lapso = l.codigo_lapso ";
	$sql.="WHERE l.codigo_ano_academico = $this->codigo_ano_academico ";
	$sql.="GROUP BY msd.codigo_materia,cn.cedula_estudiante ";
	$sql.="ORDER BY cn.cedula_estudiante,msd.codigo_materia) AS notas ";
	$sql.="GROUP BY cedula_estudiante ";
	$sql.="HAVING SUM(CASE WHEN notafinal <10 THEN 1 ELSE 0 END) < 3)";
    if($this->mysql->Ejecutar($sql)!=null)
		return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
}
?>
