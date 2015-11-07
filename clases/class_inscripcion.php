<?php
 require_once("class_bd.php");
 class inscripcion
 {
     private $codigo_inscripcion; 
     private $fecha_inicio;
     private $fecha_fin;
     private $fecha_cierre;
     private $estatus;
     private $fecha_desactivacion; 
     private $mysql; 
   
   public function __construct(){
    $this->codigo_inscripcion=null;
     $this->descripcion=null;
     $this->fecha_inicio=null;
     $this->fecha_fin=null;
     $this->fecha_cierre=null;
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
   
   public function Registrar(){
    $sql="insert into tinscripcion (fecha_inicio,fecha_fin,fecha_cierre) values ('$this->fecha_inicio',
    '$this->fecha_fin','$this->fecha_cierre');";
    if($this->mysql->Ejecutar($sql)!=null)
  return true;
  else
  return false;
   }
   
     public function Activar(){
    $sql="update tinscripcion set fecha_desactivacion=NULL where (codigo_inscripcion='$this->codigo_inscripcion');";
    if($this->mysql->Ejecutar($sql)!=null)
  return true;
  else
  return false;
   }
    public function Desactivar(){
    $sql="update tinscripcion set fecha_desactivacion=CURDATE() where (codigo_inscripcion='$this->codigo_inscripcion');";
    if($this->mysql->Ejecutar($sql)!=null)
  return true;
  else
  return false;
   }
   
    public function Actualizar(){
    $sql="update tinscripcion set fecha_inicio='$this->fecha_inicio',
    fecha_fin='$this->fecha_fin',fecha_cierre='$this->fecha_cierre' where (codigo_inscripcion='$this->codigo_inscripcion');";
    if($this->mysql->Ejecutar($sql)!=null)
  return true;
  else
  return false;
   }
   
   public function Consultar(){
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
      ELSE 'Desactivado' END) AS estatus from tinscripcion where codigo_inscripcion='$this->codigo_inscripcion'";
  $query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
  $tinscripcion=$this->mysql->Respuesta($query);
  $this->codigo_inscripcion($tinscripcion['codigo_inscripcion']);
  $this->fecha_inicio($tinscripcion['fecha_inicio']);
  $this->fecha_fin($tinscripcion['fecha_fin']);
  $this->fecha_cierre($tinscripcion['fecha_cierre']);
  $this->estatus($tinscripcion['estatus']);
  $this->fecha_desactivacion($tinscripcion['fecha_desactivacion']);
  return true;
  }
  else{
  return false;
  }
   }
   public function Comprobar(){
    $sql="select * from tinscripcion where codigo_inscripcion='$this->codigo_inscripcion'";
  $query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
  $tinscripcion=$this->mysql->Respuesta($query);
  $this->codigo_inscripcion($tinscripcion['codigo_inscripcion']);
  $this->fecha_inicio($tinscripcion['fecha_inicio']);
  $this->fecha_fin($tinscripcion['fecha_fin']);
  $this->fecha_cierre($tinscripcion['fecha_cierre']);
  $this->fecha_desactivacion($tinscripcion['fecha_desactivacion']);
  return true;
  }
  else{
  return false;
  }
   }
}
?>