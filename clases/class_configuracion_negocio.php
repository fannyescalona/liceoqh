<?php
 require_once("class_bd.php");
 class Configuracion_Negocio
 {
	private $codigo_configuracion_negocio; 
	private $codigo_plantel; 
	private $inscripcion_abierta;
	private $carga_nota_abierta;
	private $nota_minima;
	private $nota_maxima;
	private $edad_maxima_primer_anio;
	private $nota_aprobacion;
	private $estatus_configuracion_negocio; 
	private $fecha_desactivacion; 
	private $error;
	private $mysql; 
	 
   public function __construct(){
     $this->codigo_configuracion_negocio=null;
     $this->codigo_plantel=null;
     $this->inscripcion_abierta=null;
     $this->carga_nota_abierta=null;
     $this->nota_minima=null;
     $this->nota_maxima=null;
     $this->edad_maxima_primer_anio=null;
     $this->nota_aprobacion=null;
     $this->error=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_configuracion_negocio(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_configuracion_negocio;
     
	 if($Num_Parametro>0){
	   $this->codigo_configuracion_negocio=func_get_arg(0);
	 }
   }

   public function codigo_plantel(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_plantel;
     
	 if($Num_Parametro>0){
	   $this->codigo_plantel=func_get_arg(0);
	 }
   }

   public function estatus_configuracion_negocio(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_configuracion_negocio;
     
	 if($Num_Parametro>0){
	   $this->estatus_configuracion_negocio=func_get_arg(0);
	 }
   }
   
   public function inscripcion_abierta(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->inscripcion_abierta;
     
	 if($Num_Parametro>0){
	   $this->inscripcion_abierta=func_get_arg(0);
	 }
   }
   
   public function carga_nota_abierta(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->carga_nota_abierta;
     
	 if($Num_Parametro>0){
	   $this->carga_nota_abierta=func_get_arg(0);
	 }
   }
   
   public function nota_minima(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nota_minima;
     
	 if($Num_Parametro>0){
	   $this->nota_minima=func_get_arg(0);
	 }
   }
   
   public function nota_maxima(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nota_maxima;
     
	 if($Num_Parametro>0){
	   $this->nota_maxima=func_get_arg(0);
	 }
   }
   
   public function nota_aprobacion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nota_aprobacion;
     
	 if($Num_Parametro>0){
	   $this->nota_aprobacion=func_get_arg(0);
	 }
   }
   
   public function edad_maxima_primer_anio(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->edad_maxima_primer_anio;
     
	 if($Num_Parametro>0){
	   $this->edad_maxima_primer_anio=func_get_arg(0);
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
    $sql="insert into tconfiguracion_negocio (codigo_plantel,inscripcion_abierta,carga_nota_abierta,nota_minima,nota_maxima,edad_maxima_primer_anio,nota_aprobacion) 
    values ('$this->codigo_plantel','$this->inscripcion_abierta','$this->carga_nota_abierta',$this->nota_minima,$this->nota_maxima,$this->edad_maxima_primer_anio,$this->nota_aprobacion);";
    if($this->mysql->Ejecutar($sql)!=null)
		return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
     public function Activar(){
    $sql="update tconfiguracion_negocio set fecha_desactivacion=NULL where (codigo_configuracion_negocio='$this->codigo_configuracion_negocio');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
    public function Desactivar(){
    $sql="update tconfiguracion_negocio set fecha_desactivacion=CURDATE() where (codigo_configuracion_negocio='$this->codigo_configuracion_negocio');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
    public function Actualizar(){
    $sql="update tconfiguracion_negocio set codigo_plantel='$this->codigo_plantel',inscripcion_abierta='$this->inscripcion_abierta',carga_nota_abierta='$this->carga_nota_abierta',
    nota_minima=$this->nota_minima,nota_maxima=$this->nota_maxima,edad_maxima_primer_anio=$this->edad_maxima_primer_anio,nota_aprobacion=$this->nota_aprobacion 
    where (codigo_configuracion_negocio='$this->codigo_configuracion_negocio');";
    if($this->mysql->Ejecutar($sql)!=null)
		return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
}
?>
