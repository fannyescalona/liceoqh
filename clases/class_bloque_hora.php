<?php
 require_once("class_bd.php");
 class Bloque_Hora
 {
     private $bloque_hora; 
     private $hora_inicio; 
     private $hora_hora; 
     private $turno; 
     private $estatus_bloque_hora; 
     private $fecha_desactivacion; 
     private $mysql; 
	 
   public function __construct(){
     $this->hora_inicio=null;
     $this->hora_fin=null;
     $this->turno=null;
     $this->bloque_hora=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function bloque_hora(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->bloque_hora;
     
	 if($Num_Parametro>0){
	   $this->bloque_hora=func_get_arg(0);
	 }
   }

   public function estatus_bloque_hora(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_bloque_hora;
     
	 if($Num_Parametro>0){
	   $this->estatus_bloque_hora=func_get_arg(0);
	 }
   }
   
   public function hora_inicio(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->hora_inicio;
     
	 if($Num_Parametro>0){
	   $this->hora_inicio=func_get_arg(0);
	 }
   }
   
   public function hora_fin(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->hora_fin;
     
	 if($Num_Parametro>0){
	   $this->hora_fin=func_get_arg(0);
	 }
   }
   
   public function turno(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->turno;
     
	 if($Num_Parametro>0){
	   $this->turno=func_get_arg(0);
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
    $sql="insert into bloque_hora (hora_inicio,hora_fin,turno) values ('$this->hora_inicio','$this->hora_fin','$this->turno');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update bloque_hora set fecha_desactivacion=NULL where (cod_bloque_hora='$this->bloque_hora');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update bloque_hora set fecha_desactivacion=CURDATE() where (cod_bloque_hora='$this->bloque_hora');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update bloque_hora set hora_inicio='$this->hora_inicio',hora_fin='$this->hora_fin',turno='$this->turno' where (cod_bloque_hora='$this->bloque_hora');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    	ELSE 'Desactivado' END) AS estatus_bloque_hora from bloque_hora 
	where (hora_inicio='$this->hora_inicio' or hora_fin='$this->hora_fin')";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$bloque_hora=$this->mysql->Respuesta($query);
	$this->bloque_hora($bloque_hora['cod_bloque_hora']);
	$this->estatus_bloque_hora($bloque_hora['estatus_bloque_hora']);
	$this->hora_inicio($bloque_hora['hora_inicio']);
	$this->hora_fin($bloque_hora['hora_fin']);
	$this->turno($bloque_hora['turno']);
	$this->fecha_desactivacion($bloque_hora['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="select * from bloque_hora where hora_inicio='$this->hora_inicio' or hora_fin='$this->hora_fin'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$bloque_hora=$this->mysql->Respuesta($query);
	$this->bloque_hora($bloque_hora['cod_bloque_hora']);
	$this->hora_inicio($bloque_hora['hora_inicio']);
	$this->hora_fin($bloque_hora['hora_fin']);
	$this->turno($bloque_hora['turno']);
	$this->fecha_desactivacion($bloque_hora['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>
