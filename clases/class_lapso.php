<?php
 require_once("class_bd.php");
 class lapsos
 {
    private $codigo_lapso; 
    private $descripcion; 
    private $fecha_inicio;
    private $fecha_fin;
    private $codigo_ano_academico;
    private $estatus;
    private $fecha_desactivacion; 
  	private $error; 
    private $mysql; 
	 
   public function __construct(){
   	$this->codigo_lapso=null;
    $this->descripcion=null;
    $this->fecha_inicio=null;
    $this->fecha_fin=null;
    $this->codigo_ano_academico=null;
    $this->error=null;
	$this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_lapso(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_lapso;
     
	 if($Num_Parametro>0){
	   $this->codigo_lapso=func_get_arg(0);
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
 
   public function codigo_ano_academico(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_ano_academico;
     
	 if($Num_Parametro>0){
	   $this->codigo_ano_academico=func_get_arg(0);
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
    $sql="insert into tlapso (descripcion,fecha_inicio,fecha_fin,codigo_ano_academico) values ('$this->descripcion',STR_TO_DATE('$this->fecha_inicio','%d/%m/%Y'),STR_TO_DATE('$this->fecha_fin','%d/%m/%Y'),'$this->codigo_ano_academico');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
   
     public function Activar(){
    $sql="update tlapso set fecha_desactivacion=NULL where (codigo_lapso='$this->codigo_lapso');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
    public function Desactivar(){
    $sql="update tlapso set fecha_desactivacion=CURDATE() where (codigo_lapso='$this->codigo_lapso');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
   
    public function Actualizar(){
    $sql="update tlapso set descripcion='$this->descripcion',fecha_inicio=STR_TO_DATE('$this->fecha_inicio','%d/%m/%Y'),fecha_fin=STR_TO_DATE('$this->fecha_fin','%d/%m/%Y'),codigo_ano_academico='$this->codigo_ano_academico' where (codigo_lapso='$this->codigo_lapso');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
   
   public function Consultar(){
    $sql="select codigo_lapso,descripcion,date_format(fecha_inicio,'%d/%m/%Y') AS fecha_inicio,date_format(fecha_fin,'%d/%m/%Y') fecha_fin,";
    $sql.="codigo_ano_academico,fecha_desactivacion,(CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' ELSE 'Desactivado' END) AS estatus ";
    $sql.="from tlapso where descripcion='$this->descripcion' AND codigo_ano_academico = '$this->codigo_ano_academico'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tlapso=$this->mysql->Respuesta($query);
	$this->codigo_lapso($tlapso['codigo_lapso']);
	$this->descripcion($tlapso['descripcion']);
	$this->fecha_inicio($tlapso['fecha_inicio']);
	$this->fecha_fin($tlapso['fecha_fin']);
	$this->codigo_ano_academico($tlapso['codigo_ano_academico']);
	$this->estatus($tlapso['estatus']);
	$this->fecha_desactivacion($tlapso['fecha_desactivacion']);
	return true;
	}
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }

   public function Comprobar(){
    $sql="select * from tlapso where descripcion='$this->descripcion' AND codigo_ano_academico = '$this->codigo_ano_academico'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tlapso=$this->mysql->Respuesta($query);
	$this->codigo_lapso($tlapso['codigo_lapso']);
	$this->descripcion($tlapso['descripcion']);
	$this->fecha_inicio($tlapso['fecha_inicio']);
	$this->fecha_fin($tlapso['fecha_fin']);
	$this->codigo_ano_academico($tlapso['codigo_ano_academico']);
	$this->fecha_desactivacion($tlapso['fecha_desactivacion']);
    $this->error("El registro ya existe !");
	return true;
	}
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }

   public function ComboLapso($codigo_ano_academico){
    $sql="SELECT l.codigo_lapso AS id, l.descripcion AS name 
    FROM tlapso l 
    WHERE l.fecha_desactivacion IS NULL AND l.codigo_ano_academico = '$codigo_ano_academico' 
    ORDER BY l.fecha_inicio,l.fecha_fin ASC";
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