<?php
 require_once("class_bd.php");
 class planevaluacion
 {
     private $codigo_msd;
     private $codigo_lapso;
     private $seccion;
     private $codigo_materia;
     private $materia;
     private $estatus_planevaluacion;
     private $fecha_desactivacion;
     private $error;
     private $mysql;
	 
   public function __construct(){
     $this->codigo_msd=null;
     $this->codigo_lapso=null;
     $this->seccion=null;
     $this->codigo_materia=null;
     $this->materia=null;
     $this->error=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_plan_evaluacion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_plan_evaluacion;
     
	 if($Num_Parametro>0){
	   $this->codigo_plan_evaluacion=func_get_arg(0);
	 }
   }

   public function codigo_msd(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_msd;
     
	 if($Num_Parametro>0){
	   $this->codigo_msd=func_get_arg(0);
	 }
   }

   public function codigo_lapso(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_lapso;
     
	 if($Num_Parametro>0){
	   $this->codigo_lapso=func_get_arg(0);
	 }
   }

   public function seccion(){
      $Num_Parametro=func_num_args();
   if($Num_Parametro==0) return $this->seccion;
     
   if($Num_Parametro>0){
     $this->seccion=func_get_arg(0);
   }
   }

   public function codigo_materia(){
      $Num_Parametro=func_num_args();
   if($Num_Parametro==0) return $this->codigo_materia;
     
   if($Num_Parametro>0){
     $this->codigo_materia=func_get_arg(0);
   }
   }

   public function materia(){
      $Num_Parametro=func_num_args();
   if($Num_Parametro==0) return $this->materia;
     
   if($Num_Parametro>0){
     $this->materia=func_get_arg(0);
   }
   }

   public function fecha_desactivacion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->fecha_desactivacion;
     
	 if($Num_Parametro>0){
	   $this->fecha_desactivacion=func_get_arg(0);
	 }
   }

   public function estatus_planevaluacion(){
      $Num_Parametro=func_num_args();
   if($Num_Parametro==0) return $this->estatus_planevaluacion;
     
   if($Num_Parametro>0){
     $this->estatus_planevaluacion=func_get_arg(0);
   }
   }
   
   public function error(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->error;
     
	 if($Num_Parametro>0){
	   $this->error=func_get_arg(0);
	 }
   }      

    public function Registrar($descripcion,$porcentaje){
      $sql="INSERT INTO tplan_evaluacion (codigo_msd,codigo_lapso,descripcion,porcentaje) VALUES ";
      for($i=0;$i<count($descripcion);$i++){
        $sql.="('$this->codigo_msd','$this->codigo_lapso','".$descripcion[$i]."','".$porcentaje[$i]."'),";
      }
      $sql=substr($sql,0,-1);
      $sql=$sql.";";
      if($this->mysql->Ejecutar($sql)!=null)
        return true;
      else{
        $this->error($this->mysql->Error());
        return false;
      } 
    }
   
    public function Activar(){
    $sql="update tplan_evaluacion set fecha_desactivacion=NULL where (codigo_msd='$this->codigo_msd' AND codigo_lapso = '$this->codigo_lapso');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
    public function Desactivar(){
    $sql="update tplan_evaluacion set fecha_desactivacion=CURDATE() where (codigo_msd='$this->codigo_msd' AND codigo_lapso = '$this->codigo_lapso');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
  public function Actualizar($pe_old,$cant_pe_new,$codigo_plan_evaluacion,$descripcion,$porcentaje){
    $con=0;
    $pe_old = explode("_",$pe_old);
    if(count($pe_old) == $cant_pe_new){
      for($i=0;$i<$cant_pe_new;$i++){
      $sql1="UPDATE tplan_evaluacion SET codigo_msd = '$this->codigo_msd',codigo_lapso='$this->codigo_lapso',descripcion = '".$descripcion[$i]."',porcentaje= '".$porcentaje[$i]."' WHERE codigo_plan_evaluacion='".$pe_old[$i]."'";
      if($this->mysql->Ejecutar($sql1)!=null)
        $con++;
      else
        $con--;
      }
    }
    else if(count($pe_old) < $cant_pe_new){
      for($i=0;$i<count($pe_old);$i++){
      $sql1="UPDATE tplan_evaluacion SET codigo_msd = '$this->codigo_msd',codigo_lapso='$this->codigo_lapso',descripcion = '".$descripcion[$i]."',porcentaje= '".$porcentaje[$i]."' WHERE codigo_plan_evaluacion='".$pe_old[$i]."'";
      if($this->mysql->Ejecutar($sql1)!=null)
        $con++;
      else
        $con--;
      }
      for ($j=$con;$j < $cant_pe_new;$j++) { 
        $sql2="INSERT INTO tplan_evaluacion (codigo_msd,codigo_lapso,descripcion,porcentaje) 
        VALUES ('$this->codigo_msd','$this->codigo_lapso','".$descripcion[$j]."','".$porcentaje[$j]."');";
        if($this->mysql->Ejecutar($sql2))
          $con++;
        else
          $con--;
      }
    }
    else{
      $prest = count($pe_old)-$cant_pe_new;
      for($i=0;$i<$cant_pe_new;$i++){
      $sql1="UPDATE tplan_evaluacion SET codigo_msd = '$this->codigo_msd',codigo_lapso='$this->codigo_lapso',descripcion = '".$descripcion[$i]."',porcentaje= '".$porcentaje[$i]."' WHERE codigo_plan_evaluacion='".$pe_old[$i]."'";
      if($this->mysql->Ejecutar($sql1)!=null)
        $con++;
      else
        $con--;
      }
      for ($k=$con;$k < count($pe_old);$k++) { 
        $sql2="DELETE FROM tplan_evaluacion WHERE codigo_plan_evaluacion='".$pe_old[$k]."';";
        if($this->mysql->Ejecutar($sql2))
          $con++;
        else
          $con--;
      }
      $cant_pe_new = count($pe_old);
    }
    if($con==$cant_pe_new)
      return true;
    else
      return false;
  }
   
  public function Consultar(){
    $sql="SELECT DISTINCT pe.codigo_msd,pe.codigo_lapso,s.seccion,m.descripcion AS materia,msd.codigo_materia,
    (CASE WHEN pe.fecha_desactivacion IS NULL THEN 'Activo' ELSE 'Desactivado' END) AS estatus_planevaluacion,
    pe.fecha_desactivacion 
    FROM tplan_evaluacion pe 
    INNER JOIN tmateria_seccion_docente msd ON pe.codigo_msd = msd.codigo_msd 
    INNER JOIN tseccion s ON msd.seccion = s.seccion 
    INNER JOIN tmateria m ON msd.codigo_materia = m.codigo_materia 
    WHERE pe.codigo_msd='$this->codigo_msd' AND pe.codigo_lapso = '$this->codigo_lapso'";
    $query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
      $tplan_evaluacion=$this->mysql->Respuesta($query);
      $this->codigo_msd($tplan_evaluacion['codigo_msd']);
      $this->codigo_lapso($tplan_evaluacion['codigo_lapso']);
      $this->codigo_materia($tplan_evaluacion['codigo_materia']);
      $this->seccion($tplan_evaluacion['seccion']);
      $this->materia($tplan_evaluacion['materia']);
      $this->estatus_planevaluacion($tplan_evaluacion['estatus_planevaluacion']);
      $this->fecha_desactivacion($tplan_evaluacion['fecha_desactivacion']);
      return true;
    }
    else{
      $this->error($this->mysql->Error());
      return false;
    }
  }

   public function BuscarMSD($seccion,$cedula_docente){
    $sql="SELECT msd.codigo_msd,msd.codigo_materia,m.descripcion AS materia 
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
}
?>
