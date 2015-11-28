<?php
 require_once("class_bd.php");
 class inscripcion
 {
     private $codigo_inscripcion; 
     private $descripcion;
     private $fecha_inicio;
     private $fecha_fin;
     private $fecha_cierre;
     private $estatus;
     private $fecha_desactivacion; 
     private $error; 
     private $mysql; 
   
   public function __construct(){
    $this->codigo_inscripcion=null;
     $this->descripcion=null;
     $this->fecha_inicio=null;
     $this->fecha_fin=null;
     $this->fecha_cierre=null;
     $this->error=null;
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
    $sql="insert into tinscripcion (descripcion,fecha_inicio,fecha_fin,fecha_cierre) values ('$this->descripcion',STR_TO_DATE('$this->fecha_inicio','%d/%m/%Y'),
    STR_TO_DATE('$this->fecha_fin','%d/%m/%Y'),STR_TO_DATE('$this->fecha_cierre','%d/%m/%Y'));";
    if($this->mysql->Ejecutar($sql)!=null)
  return true;
  else{
    $this->error($this->mysql->Error());
    return false;
  }
   }
   
     public function Activar(){
    $sql="update tinscripcion set fecha_desactivacion=NULL where (codigo_inscripcion='$this->codigo_inscripcion');";
    if($this->mysql->Ejecutar($sql)!=null)
  return true;
  else{
    $this->error($this->mysql->Error());
    return false;
  }
   }
    public function Desactivar(){
    $sql="update tinscripcion set fecha_desactivacion=CURDATE() where (codigo_inscripcion='$this->codigo_inscripcion');";
    if($this->mysql->Ejecutar($sql)!=null)
  return true;
  else{
    $this->error($this->mysql->Error());
    return false;
  }
   }
   
    public function Actualizar(){
    $sql="update tinscripcion set descripcion='$this->descripcion',fecha_inicio=STR_TO_DATE('$this->fecha_inicio','%d/%m/%Y'),
    STR_TO_DATE('$this->fecha_fin','%d/%m/%Y'),STR_TO_DATE('$this->fecha_cierre','%d/%m/%Y') where (codigo_inscripcion='$this->codigo_inscripcion');";
    if($this->mysql->Ejecutar($sql)!=null)
  return true;
  else{
    $this->error($this->mysql->Error());
    return false;
  }
   }
   
   public function Consultar(){
    $sql="select codigo_inscripcion,descripcion,date_format(fecha_inicio,'%d/%m/%Y') AS fecha_inicio,
    date_format(fecha_fin,'%d/%m/%Y') AS fecha_fin,date_format(fecha_cierre,'%d/%m/%Y') AS fecha_cierre,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
      ELSE 'Desactivado' END) AS estatus from tinscripcion where descripcion='$this->descripcion'";
  $query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
  $tinscripcion=$this->mysql->Respuesta($query);
  $this->codigo_inscripcion($tinscripcion['codigo_inscripcion']);
  $this->descripcion($tinscripcion['descripcion']);
  $this->fecha_inicio($tinscripcion['fecha_inicio']);
  $this->fecha_fin($tinscripcion['fecha_fin']);
  $this->fecha_cierre($tinscripcion['fecha_cierre']);
  $this->estatus($tinscripcion['estatus']);
  $this->fecha_desactivacion($tinscripcion['fecha_desactivacion']);
  return true;
  }
  else{
    $this->error($this->mysql->Error());
    return false;
  }
   }
   public function Comprobar(){
    $sql="select * from tinscripcion where descripcion='$this->descripcion'";
  $query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
  $tinscripcion=$this->mysql->Respuesta($query);
  $this->codigo_inscripcion($tinscripcion['codigo_inscripcion']);
  $this->descripcion($tinscripcion['descripcion']);
  $this->fecha_inicio($tinscripcion['fecha_inicio']);
  $this->fecha_fin($tinscripcion['fecha_fin']);
  $this->fecha_cierre($tinscripcion['fecha_cierre']);
  $this->fecha_desactivacion($tinscripcion['fecha_desactivacion']);
  $this->error("El registro ya existe !");
  return true;
  }
  else{
  return false;
  }
   }
}
?>