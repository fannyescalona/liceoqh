<?php
 require_once("class_bd.php");
 class Materia
 {
     private $codigo_materia; 
     private $descripcion; 
     private $hora_academica;
     private $materia_compuesta; 
     private $grado_escolar;
     private $codigo_materia_padre;
     private $estatus_materia;
     private $fecha_desactivacion; 
     private $error;
     private $mysql; 
	 
   public function __construct(){
     $this->descripcion=null;
     $this->codigo_materia=null;
     $this->hora_academica=null;
     $this->materia_compuesta=null;
     $this->grado_escolar=null;
     $this->codigo_materia_padre=null;
     $this->error=null;
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

   public function descripcion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
	 }
   }
   
   public function hora_academica(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->hora_academica;
     
	 if($Num_Parametro>0){
	   $this->hora_academica=func_get_arg(0);
	 }
   }

   public function materia_compuesta(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->materia_compuesta;
     
	 if($Num_Parametro>0){
	   $this->materia_compuesta=func_get_arg(0);
	 }
   }
   
   public function grado_escolar(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->grado_escolar;
     
	 if($Num_Parametro>0){
	   $this->grado_escolar=func_get_arg(0);
	 }
   }

   public function codigo_materia_padre(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_materia_padre;
     
	 if($Num_Parametro>0){
	   $this->codigo_materia_padre=func_get_arg(0);
	 }
   }
   
   public function estatus_materia(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_materia;
     
	 if($Num_Parametro>0){
	   $this->estatus_materia=func_get_arg(0);
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
    	if($this->codigo_materia_padre!="")
    		$sql="insert into tmateria (codigo_materia,descripcion,hora_academica,materia_compuesta,grado_escolar,codigo_materia_padre) values ('$this->codigo_materia','$this->descripcion',$this->hora_academica,'$this->materia_compuesta','$this->grado_escolar','$this->codigo_materia_padre');";
    	else
    		$sql="insert into tmateria (codigo_materia,descripcion,hora_academica,materia_compuesta,grado_escolar) values ('$this->codigo_materia','$this->descripcion',$this->hora_academica,'$this->materia_compuesta','$this->grado_escolar');";
    	if($this->mysql->Ejecutar($sql)!=null)
			return true;
		else{
			$this->error($this->mysql->Error());
			return false;
		}
	}
   
     public function Activar(){
    $sql="update tmateria set fecha_desactivacion=NULL where (codigo_materia='$this->codigo_materia');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
    public function Desactivar(){
    $sql="update tmateria set fecha_desactivacion=CURDATE() where (codigo_materia='$this->codigo_materia');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
    public function Actualizar($oldcodigo){
    	if($this->codigo_materia_padre!="")
    		$sql="update tmateria set codigo_materia='$this->codigo_materia',descripcion='$this->descripcion',hora_academica=$this->hora_academica,materia_compuesta='$this->materia_compuesta',grado_escolar='$this->grado_escolar',codigo_materia_padre='$this->codigo_materia_padre' where (codigo_materia='$oldcodigo');";
    	else
    		$sql="update tmateria set codigo_materia='$this->codigo_materia',descripcion='$this->descripcion',hora_academica=$this->hora_academica,materia_compuesta='$this->materia_compuesta',grado_escolar='$this->grado_escolar',codigo_materia_padre=NULL where (codigo_materia='$oldcodigo');";
    	if($this->mysql->Ejecutar($sql)!=null)
			return true;
		else{
			$this->error($this->mysql->Error());
			return false;
		}
	}
   
   public function Consultar(){
    $sql="select *,(CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' ELSE 'Desactivado' END) AS estatus_materia from tmateria where codigo_materia='$this->codigo_materia'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tmateria=$this->mysql->Respuesta($query);
	$this->codigo_materia($tmateria['codigo_materia']);
	$this->descripcion($tmateria['descripcion']);
	$this->hora_academica($tmateria['hora_academica']);
	$this->materia_compuesta($tmateria['materia_compuesta']);
	$this->grado_escolar($tmateria['grado_escolar']);
	$this->codigo_materia_padre($tmateria['codigo_materia_padre']);
	$this->estatus_materia($tmateria['estatus_materia']);
	$this->fecha_desactivacion($tmateria['fecha_desactivacion']);
	return true;
	}
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
   public function Comprobar(){
    $sql="select * from tmateria where ((codigo_materia='$this->codigo_materia')
    OR (descripcion='$this->descripcion' AND grado_escolar='$this->grado_escolar'))";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tmateria=$this->mysql->Respuesta($query);
	$this->codigo_materia($tmateria['codigo_materia']);
	$this->descripcion($tmateria['descripcion']);
	$this->grado_escolar($tmateria['grado_escolar']);
	$this->fecha_desactivacion($tmateria['fecha_desactivacion']);
    $this->error("El registro ya existe !");
	return true;
	}
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }

   public function ComboMateria($seccion,$cedula_docente){
    $sql="SELECT msd.codigo_materia AS id,m.descripcion AS name 
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

   public function ComboMateriaPorGrado($grado_escolar){
    $sql="SELECT codigo_materia AS id,descripcion AS name FROM tmateria WHERE grado_escolar = '$grado_escolar'";
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