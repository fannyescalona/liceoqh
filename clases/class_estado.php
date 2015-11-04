<?php
 require_once("class_bd.php");
 class Estado
 {
     private $codigo_estado; 
     private $nombre_estado; 
     private $codigo_pais;
     private $estatus_estado; 
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->nombre_estado=null;
     $this->codigo_estado=null;
     $this->codigo_pais=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_estado(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_estado;
     
	 if($Num_Parametro>0){
	   $this->codigo_estado=func_get_arg(0);
	 }
   }

   public function estatus_estado(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_estado;
     
	 if($Num_Parametro>0){
	   $this->estatus_estado=func_get_arg(0);
	 }
   }
   
   public function nombre_estado(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nombre_estado;
     
	 if($Num_Parametro>0){
	   $this->nombre_estado=func_get_arg(0);
	 }
   }

   public function codigo_pais(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_pais;
     
	 if($Num_Parametro>0){
	   $this->codigo_pais=func_get_arg(0);
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
    $sql="insert into testado (nombre_estado,cod_pais) values ('$this->nombre_estado','$this->codigo_pais');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update testado set fecha_desactivacion=NULL where (cod_estado='$this->codigo_estado');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update testado set fecha_desactivacion=CURDATE() where (cod_estado='$this->codigo_estado');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update testado set nombre_estado='$this->nombre_estado',cod_pais='$this->codigo_pais' where (cod_estado='$this->codigo_estado');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_estado from testado where nombre_estado='$this->nombre_estado'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$testado=$this->mysql->Respuesta($query);
	$this->codigo_estado($testado['cod_estado']);
	$this->nombre_estado($testado['nombre_estado']);
	$this->codigo_pais($testado['cod_pais']);
   	$this->estatus_estado($testado['estatus_estado']);
	$this->fecha_desactivacion($testado['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from testado where nombre_estado='$this->nombre_estado' and cod_pais='$this->codigo_pais'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$testado=$this->mysql->Respuesta($query);
	$this->codigo_estado($testado['cod_estado']);
	$this->nombre_estado($testado['nombre_estado']);
	$this->codigo_pais($testado['cod_pais']);
	$this->fecha_desactivacion($testado['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>