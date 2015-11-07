<?php
 require_once("class_bd.php");
 class parentesco
 {
     private $codigo_parentesco; 
     private $descripcion;
     private $estatus_parentesco; 
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->descripcion=null;
     $this->codigo_parentesco=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_parentesco(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_parentesco;
     
	 if($Num_Parametro>0){
	   $this->codigo_parentesco=func_get_arg(0);
	 }
   }

   public function estatus_parentesco(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_parentesco;
     
	 if($Num_Parametro>0){
	   $this->estatus_parentesco=func_get_arg(0);
	 }
   }
   
   public function descripcion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
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
    $sql="insert into tparentesco (descripcion) values ('$this->descripcion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update tparentesco set fecha_desactivacion=NULL where (codigo_parentesco='$this->codigo_parentesco');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tparentesco set fecha_desactivacion=CURDATE() where (codigo_parentesco='$this->codigo_parentesco');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tparentesco set descripcion='$this->descripcion' where (codigo_parentesco='$this->codigo_parentesco');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_parentesco from tparentesco where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tparentesco=$this->mysql->Respuesta($query);
	$this->codigo_parentesco($tparentesco['codigo_parentesco']);
	$this->descripcion($tparentesco['descripcion']);
   	$this->estatus_parentesco($tparentesco['estatus_parentesco']);
	$this->fecha_desactivacion($tparentesco['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tparentesco where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tparentesco=$this->mysql->Respuesta($query);
	$this->codigo_parentesco($tparentesco['codigo_parentesco']);
	$this->descripcion($tparentesco['descripcion']);
	$this->fecha_desactivacion($tparentesco['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>
