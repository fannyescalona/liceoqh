<?php
 require_once("class_bd.php");
 class Inscripcion
 {
     private $codigo_inscripcion; 
     private $codigo_periodo; 
     private $descripcion; 
     private $fecha_inicio;
     private $fecha_fin;
     private $fecha_cierre;
     private $estatus_inscripcion; 
     private $fecha_desactivacion;    
     private $mysql; 
	 
   public function __construct(){
     $this->descripcion=null;
     $this->codigo_inscripcion=null;
     $this->fecha_inicio=null;
     $this->fecha_fin=null;
     $this->fecha_cierre=null;
     $this->fecha_desactivacion=null;
     $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_inscripcion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_inscripcion;
     
	 if($Num_Parametro>0){
	   $this->codigo_inscripcion=func_get_arg(0);
	 }
   }

   public function codigo_periodo(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_periodo;
     
	 if($Num_Parametro>0){
	   $this->codigo_periodo=func_get_arg(0);
	 }
   }

   public function estatus_inscripcion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_inscripcion;
     
	 if($Num_Parametro>0){
	   $this->estatus_inscripcion=func_get_arg(0);
	 }
   }
   
   public function descripcion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
	 }
   }

   public function fecha_inicio(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->fecha_inicio;
     
	 if($Num_Parametro>0){
	   $this->fecha_inicio=func_get_arg(0);
	 }
   }

   public function fecha_fin(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->fecha_fin;
     
	 if($Num_Parametro>0){
	   $this->fecha_fin=func_get_arg(0);
	 }
   }

   public function fecha_cierre(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->fecha_cierre;
     
	 if($Num_Parametro>0){
	   $this->fecha_cierre=func_get_arg(0);
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
   	$sqlupdate="update tinscripcion i join tperiodo p set i.fecha_desactivacion=CURDATE(),p.fecha_desactivacion=CURDATE() where i.cod_periodo = p.cod_periodo and p.esinscripcion = 'Y';";
   	$this->mysql->Ejecutar($sqlupdate);
   	$sqlx = "insert into tperiodo (descripcion,fecha_inicio,fecha_fin,esinscripcion) values ('$this->descripcion','$this->fecha_inicio','$this->fecha_fin','Y');";
    if($this->mysql->Ejecutar($sqlx)!=null){
    	$sql="insert into tinscripcion (cod_periodo,fecha_cierre) select cod_periodo,'$this->fecha_cierre' from tperiodo where descripcion = '$this->descripcion' and esinscripcion = 'Y'";
    	if($this->mysql->Ejecutar($sql)!=null)
			return true;
		else
			return false;
    }
	else
		return false;
   }
   
    public function Activar(){
    $sql="update tinscripcion i join tperiodo p set i.fecha_desactivacion=NULL,p.fecha_desactivacion=NULL where cod_inscripcion='$this->codigo_inscripcion' and i.cod_periodo = p.cod_periodo and p.esinscripcion = 'Y';";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tinscripcion i join tperiodo p set i.fecha_desactivacion=CURDATE(),p.fecha_desactivacion=CURDATE() where cod_inscripcion='$this->codigo_inscripcion' and i.cod_periodo = p.cod_periodo and p.esinscripcion = 'Y';";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tinscripcion i join tperiodo p set p.descripcion='$this->descripcion',p.fecha_inicio='$this->fecha_inicio',p.fecha_fin='$this->fecha_fin',
    i.fecha_cierre='$this->fecha_cierre' where cod_inscripcion='$this->codigo_inscripcion' and i.cod_periodo = p.cod_periodo and p.esinscripcion = 'Y';";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select i.cod_inscripcion,i.cod_periodo,p.descripcion,date_format(p.fecha_inicio,'%d/%m/%Y') fecha_inicio,
    date_format(p.fecha_fin,'%d/%m/%Y') fecha_fin,date_format(i.fecha_cierre,'%d/%m/%Y') fecha_cierre,
    (CASE WHEN p.fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_inscripcion 
	from tinscripcion i inner join tperiodo p on i.cod_periodo = p.cod_periodo 
	where p.descripcion='$this->descripcion' and p.esinscripcion = 'Y'"; 
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tinscripcion=$this->mysql->Respuesta($query);
	$this->codigo_inscripcion($tinscripcion['cod_inscripcion']);
	$this->codigo_periodo($tinscripcion['cod_periodo']);
	$this->descripcion($tinscripcion['descripcion']);
	$this->fecha_inicio($tinscripcion['fecha_inicio']);
	$this->fecha_fin($tinscripcion['fecha_fin']);
	$this->fecha_cierre($tinscripcion['fecha_cierre']);
	$this->estatus_inscripcion($tinscripcion['estatus_inscripcion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select i.cod_inscripcion,p.cod_periodo,p.descripcion,p.fecha_inicio,p.fecha_fin,i.fecha_cierre 
    from tinscripcion i left join tperiodo p on i.cod_periodo = p.cod_periodo 
    where p.descripcion='$this->descripcion' and p.esinscripcion = 'Y'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tinscripcion=$this->mysql->Respuesta($query);
	$this->codigo_inscripcion($tinscripcion['cod_inscripcion']);
	$this->codigo_periodo($tinscripcion['cod_periodo']);
	$this->descripcion($tinscripcion['descripcion']);
	$this->fecha_inicio($tinscripcion['fecha_inicio']);
	$this->fecha_fin($tinscripcion['fecha_fin']);
	$this->fecha_cierre($tinscripcion['fecha_fin']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>