<?php
 require_once("class_bd.php");
 class plantel
 {
     private $codigo_plantel; 
     private $nombre; 
     private $direccion; 
     private $telefono_habitacion; 
     private $localidad; 
     private $codigo_municipio; 
     private $email; 
     private $estatus_plantel; 
     private $fecha_desactivacion; 
  	 private $error; 
     private $mysql; 
	 
   public function __construct(){
     $this->nombre=null;
     $this->codigo_plantel=null;
     $this->direccion=null;
     $this->telefono_habitacion=null;
     $this->localidad=null;
     $this->codigo_municipio=null;
     $this->email=null;
     $this->error=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_plantel(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_plantel;
     
	 if($Num_Parametro>0){
	   $this->codigo_plantel=func_get_arg(0);
	 }
   }

   public function direccion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->direccion;
     
	 if($Num_Parametro>0){
	   $this->direccion=func_get_arg(0);
	 }
   }
   
   public function estatus_plantel(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_plantel;
     
	 if($Num_Parametro>0){
	   $this->estatus_plantel=func_get_arg(0);
	 }
   }

   public function nombre(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nombre;
     
	 if($Num_Parametro>0){
	   $this->nombre=func_get_arg(0);
	 }
   }

   public function telefono_habitacion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->telefono_habitacion;
     
	 if($Num_Parametro>0){
	   $this->telefono_habitacion=func_get_arg(0);
	 }
   }

   public function localidad(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->localidad;
     
	 if($Num_Parametro>0){
	   $this->localidad=func_get_arg(0);
	 }
   }

   public function codigo_municipio(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_municipio;
     
	 if($Num_Parametro>0){
	   $this->codigo_municipio=func_get_arg(0);
	 }
   }

   public function email(){
   $Num_Parametro=func_num_args();
   if($Num_Parametro==0) return $this->email;
     
   if($Num_Parametro>0){
     $this->email=func_get_arg(0);
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
    $sql="INSERT INTO tplantel (codigo_plantel,nombre,direccion,telefono_habitacion,localidad,codigo_municipio,email) ";
    $sql.="VALUES ('$this->codigo_plantel','$this->nombre','$this->direccion','$this->telefono_habitacion','$this->localidad','$this->codigo_municipio','$this->email');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
   
     public function Activar(){
    $sql="update tplantel set fecha_desactivacion=NULL where (codigo_plantel='$this->codigo_plantel');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
    public function Desactivar(){
    $sql="update tplantel set fecha_desactivacion=CURDATE() where (codigo_plantel='$this->codigo_plantel');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
   
    public function Actualizar(){
    $sql="UPDATE tplantel SET nombre='$this->nombre',direccion='$this->direccion',telefono_habitacion='$this->telefono_habitacion', ";
    $sql.="localidad='$this->localidad',codigo_municipio='$this->codigo_municipio',email='$this->email' where (codigo_plantel='$this->codigo_plantel');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
   
   public function Consultar(){
    $sql="SELECT p.codigo_plantel,p.nombre,p.direccion,p.telefono_habitacion,p.localidad,CONCAT(p.codigo_municipio,'_',m.descripcion) AS codigo_municipio, ";
    $sql.="(CASE WHEN p.fecha_desactivacion IS NULL THEN  'Activo' ELSE 'Desactivado' END) AS estatus_plantel, p.email ";
	$sql.="FROM tplantel p INNER JOIN tmunicipio m ON p.codigo_municipio = m.codigo_municipio WHERE (codigo_plantel='$this->codigo_plantel')";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tplantel=$this->mysql->Respuesta($query);
	$this->codigo_plantel($tplantel['codigo_plantel']);
	$this->nombre($tplantel['nombre']);
	$this->direccion($tplantel['direccion']);
	$this->telefono_habitacion($tplantel['telefono_habitacion']);
	$this->localidad($tplantel['localidad']);
	$this->codigo_municipio($tplantel['codigo_municipio']);
  $this->email($tplantel['email']);
   	$this->estatus_plantel($tplantel['estatus_plantel']);
	$this->fecha_desactivacion($tplantel['fecha_desactivacion']);
	return true;
	}
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
   public function Comprobar(){
    $sql="select * from tplantel where codigo_plantel='$this->codigo_plantel'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tplantel=$this->mysql->Respuesta($query);
	$this->codigo_plantel($tplantel['codigo_plantel']);
	$this->nombre($tplantel['nombre']);
	$this->direccion($tplantel['direccion']);
	$this->telefono_habitacion($tplantel['telefono_habitacion']);
	$this->localidad($tplantel['localidad']);
	$this->codigo_municipio($tplantel['codigo_municipio']);
  $this->email($tplantel['email']);
	$this->fecha_desactivacion($tplantel['fecha_desactivacion']);
    $this->error("El registro ya existe !");
	return true;
	}
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
}
?>