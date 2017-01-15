<?php
 require_once("class_bd.php");
 class Seccion
 {
     private $seccion; 
     private $descripcion;
     private $turno;  
     private $grado_escolar;  
     private $capacidad_min;
     private $capacidad_max; 
     private $estatus; 
     private $fecha_desactivacion; 
     private $error; 
     private $mysql; 
	 
   public function __construct(){
 
     $this->seccion=null;
     $this->descripcion=null;
     $this->turno=null;
     $this->grado_escolar=null;
     $this->capacidad_min=null;
     $this->capacidad_max=null;
     $this->error=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function seccion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->seccion;
     
	 if($Num_Parametro>0){
	   $this->seccion=func_get_arg(0);
	 }
   }

   public function descripcion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
	 }
   }

   public function turno(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->turno;
     
	 if($Num_Parametro>0){
	   $this->turno=func_get_arg(0);
	 }
   }

   public function grado_escolar(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->grado_escolar;
     
	 if($Num_Parametro>0){
	   $this->grado_escolar=func_get_arg(0);
	 }
   }

   public function capacidad_min(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->capacidad_min;
     
	 if($Num_Parametro>0){
	   $this->capacidad_min=func_get_arg(0);
	 }
   }

   public function capacidad_max(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->capacidad_max;
     
	 if($Num_Parametro>0){
	   $this->capacidad_max=func_get_arg(0);
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

  public function EliminarMateriasDocentes(){
    $sql="DELETE FROM tmateria_seccion_docente WHERE (seccion='$this->seccion');";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
      $this->error($this->mysql->Error());
      return false;
    }
  } 

	public function InsertarMateriasDocentes($materias,$docentes){
      print_r($materias);
	    $sql="INSERT INTO tmateria_seccion_docente(seccion,codigo_materia,cedula_docente) VALUES ";
	    for($i=0;$i<count($materias);$i++){
	    	//	Obtenemos el codigo de la materia y el docente
	    	$materia=explode('_',$materias[$i]);
	    	$codigo_materia = $materia[0];
	    	$docente=explode('_',$docentes[$i]);
	    	$cedula_docente = $docente[0];
	    	$sql.="('$this->seccion','$codigo_materia','$cedula_docente'),";
	    }
	    $sql=substr($sql,0,-1);
	    $sql=$sql.";";
      echo $sql;
	    if($this->mysql->Ejecutar($sql)!=null)
	      return true;
	    else{
	      $this->error($this->mysql->Error());
	      return false;
	    }
    }

  public function ActualizarMSD($msd_old,$cant_msd_new,$codigo_msd,$materias,$docentes,$oldmateria,$olddocente){
    $con=0;
    $msd_old = explode("_",$msd_old);
    $msg = "";
    $error = "";
    if(count($msd_old) == $cant_msd_new){
      for($i=0;$i<$cant_msd_new;$i++){
        //  Obtenemos el codigo de la materia y el docente
        $materia=explode('_',$materias[$i]);
        $docente=explode('_',$docentes[$i]);
        //  Comprobamos dependencias
        $sqlx="SELECT * FROM tmateria_seccion_docente msd WHERE codigo_msd = ".$msd_old[$i]." 
        AND (EXISTS (SELECT 1 FROM tplan_evaluacion pe WHERE msd.codigo_msd = pe.codigo_msd)
        OR EXISTS (SELECT 1 FROM tcontrol_notas cn WHERE msd.codigo_msd = cn.codigo_msd))";
        $query=$this->mysql->Ejecutar($sqlx);
        if($this->mysql->Total_Filas($query)==0){
          //  Actualizamos registros
          $sql1="UPDATE tmateria_seccion_docente SET codigo_materia='".$materia[0]."',cedula_docente = '".$docente[0]."' WHERE codigo_msd='".$msd_old[$i]."'";
          if($this->mysql->Ejecutar($sql1)!=null)
            $con++;
          else{
            $error.=$this->mysql->Error()."<br>";
            $con--; 
          }
        }
        else{
          $oldmateria=explode("_",$oldmateria[$i]);
          $olddocente=explode("_",$olddocente[$i]);
          //  Error en caso que exista dependencia con el registro
          $msg.="Codigo: ".$msd_old[$i]." - Materia: ".$oldmateria[1]." - Docente: ".$olddocente[1];
          $con++;
        }
      }
    }
    else if(count($msd_old) < $cant_msd_new){
      for($i=0;$i<count($msd_old);$i++){
        //  Obtenemos el codigo de la materia y el docente
        $materia=explode('_',$materias[$i]);
        $docente=explode('_',$docentes[$i]);
        //  Comprobamos dependencias
        $sqlx="SELECT * FROM tmateria_seccion_docente msd WHERE codigo_msd = ".$msd_old[$i]." 
        AND (EXISTS (SELECT 1 FROM tplan_evaluacion pe WHERE msd.codigo_msd = pe.codigo_msd)
        OR EXISTS (SELECT 1 FROM tcontrol_notas cn WHERE msd.codigo_msd = cn.codigo_msd))";
        $query=$this->mysql->Ejecutar($sqlx);
        if($this->mysql->Total_Filas($query)==0){
          //  Actualizamos registros
          $sql1="UPDATE tmateria_seccion_docente SET codigo_materia='".$materia[0]."',cedula_docente = '".$docente[0]."' WHERE codigo_msd='".$msd_old[$i]."'";
          if($this->mysql->Ejecutar($sql1)!=null)
            $con++;
          else{
            $error.=$this->mysql->Error()."<br>";
            $con--; 
          }
        }
        else{
          $oldmateria=explode("_",$oldmateria[$i]);
          $olddocente=explode("_",$olddocente[$i]);
          //  Error en caso que exista dependencia con el registro
          $msg.="Codigo: ".$msd_old[$i]." - Materia: ".$oldmateria[1]." - Docente: ".$olddocente[1];
          $con++;
        }
      }
      for ($j=$con;$j < $cant_msd_new;$j++) { 
        //  Obtenemos el codigo de la materia y el docente
        $materia=explode('_',$materias[$j]);
        $docente=explode('_',$docentes[$j]);
        $sql2="INSERT INTO tmateria_seccion_docente (seccion,codigo_materia,cedula_docente) 
        VALUES ('$this->seccion','".$materia[0]."','".$docente[0]."');";
        if($this->mysql->Ejecutar($sql2))
          $con++;
        else{
          $error.=$this->mysql->Error()."<br>";
          $con--; 
        }
      }
    }
    else{
      for($i=0;$i<$cant_msd_new;$i++){
        //  Obtenemos el codigo de la materia y el docente
        $materia=explode('_',$materias[$i]);
        $docente=explode('_',$docentes[$i]);
        //  Comprobamos dependencias
        $sqlx="SELECT * FROM tmateria_seccion_docente msd WHERE codigo_msd = ".$msd_old[$i]." 
        AND (EXISTS (SELECT 1 FROM tplan_evaluacion pe WHERE msd.codigo_msd = pe.codigo_msd)
        OR EXISTS (SELECT 1 FROM tcontrol_notas cn WHERE msd.codigo_msd = cn.codigo_msd))";
        $query=$this->mysql->Ejecutar($sqlx);
        if($this->mysql->Total_Filas($query)==0){
          //  Actualizamos registros
          $sql1="UPDATE tmateria_seccion_docente SET codigo_materia='".$materia[0]."',cedula_docente = '".$docente[0]."' WHERE codigo_msd='".$msd_old[$i]."'";
          if($this->mysql->Ejecutar($sql1)!=null){
            $con++;
          }else{
            $error.=$this->mysql->Error()."<br>";
            $con--; 
          }
        }
        else{
          $oldmateria=explode("_",$oldmateria[$i]);
          $olddocente=explode("_",$olddocente[$i]);
          //  Error en caso que exista dependencia con el registro
          $msg.="Codigo: ".$msd_old[$i]." - Materia: ".$oldmateria[1]." - Docente: ".$olddocente[1];
          $con++;
        }
      }
      for ($k=$con;$k < count($msd_old);$k++) {
        //  Obtenemos el codigo de la materia y el docente
        $materia=explode('_',$materias[$k]);
        $docente=explode('_',$docentes[$k]);
        //  Comprobamos dependencias
        $sqlx="SELECT * FROM tmateria_seccion_docente msd WHERE codigo_msd = ".$msd_old[$k]." 
        AND (EXISTS (SELECT 1 FROM tplan_evaluacion pe WHERE msd.codigo_msd = pe.codigo_msd)
        OR EXISTS (SELECT 1 FROM tcontrol_notas cn WHERE msd.codigo_msd = cn.codigo_msd))";
        $query=$this->mysql->Ejecutar($sqlx);
        if($this->mysql->Total_Filas($query)==0){
          //  Actualizamos registros
          $sql2="DELETE FROM tmateria_seccion_docente WHERE codigo_msd='".$msd_old[$k]."';";
          if($this->mysql->Ejecutar($sql2)){
            $con++;
          }else{
            $error.=$this->mysql->Error()."<br>";
            $con--; 
          }
        }
        else{
          $oldmateria=explode("_",$oldmateria[$i]);
          $olddocente=explode("_",$olddocente[$i]);
          //  Error en caso que exista dependencia con el registro
          $msg.="Codigo: ".$msd_old[$i]." - Materia: ".$oldmateria[1]." - Docente: ".$olddocente[1];
          $con++;
        }
      }
      $cant_msd_new = count($msd_old);
    }
    if($con==$cant_msd_new){
      $this->error($msg);
      return true;
    }
    else{
      $this->error($error);
      return false;
    }
  }

   public function Registrar(){
    $sql="insert into tseccion (seccion,descripcion,turno,grado_escolar,capacidad_min,capacidad_max) values ";
    $sql.="('$this->seccion','$this->descripcion','$this->turno','$this->grado_escolar','$this->capacidad_min','$this->capacidad_max');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }

   
    public function Activar(){
    $sql="update tseccion set fecha_desactivacion=NULL where (seccion='$this->seccion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
    public function Desactivar(){
    $sql="update tseccion set fecha_desactivacion=CURDATE() where (seccion='$this->seccion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
   
    public function Actualizar(){
    $sql="update tseccion set seccion='$this->seccion',descripcion='$this->descripcion',turno='$this->turno',grado_escolar='$this->grado_escolar', ";
    $sql.="capacidad_min='$this->capacidad_min',capacidad_max='$this->capacidad_max' where (seccion='$this->seccion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
   
   public function Consultar(){
    $sql="SELECT *,(CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' ELSE 'Desactivado' END) AS estatus FROM tseccion WHERE seccion='$this->seccion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tseccion=$this->mysql->Respuesta($query);
	$this->seccion($tseccion['seccion']);
	$this->descripcion($tseccion['descripcion']);
	$this->turno($tseccion['turno']);
	$this->grado_escolar($tseccion['grado_escolar']);
	$this->capacidad_min($tseccion['capacidad_min']);
	$this->capacidad_max($tseccion['capacidad_max']);
	$this->estatus($tseccion['estatus']);
	$this->fecha_desactivacion($tseccion['fecha_desactivacion']);
	return true;
	}
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }
   public function Comprobar(){
    $sql="select * from tseccion where (seccion='$this->seccion' OR descripcion='$this->descripcion')";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tseccion=$this->mysql->Respuesta($query);
	$this->seccion($tseccion['seccion']);
	$this->descripcion($tseccion['descripcion']);
	$this->turno($tseccion['turno']);
	$this->capacidad_min($tseccion['capacidad_min']);
	$this->capacidad_max($tseccion['capacidad_max']);
	$this->estatus($tseccion['estatus']);
	$this->fecha_desactivacion($tseccion['fecha_desactivacion']);
    $this->error("El registro ya existe !");
	return true;
	}
	else{
      $this->error($this->mysql->Error());
      return false;
    } 
   }

  public function Eliminar_Notas($codigo_msd,$codigo_lapso){
    $sql="DELETE FROM tasignacion_nota WHERE codigo_plan_evaluacion IN (SELECT codigo_plan_evaluacion FROM tplan_evaluacion WHERE codigo_msd = $codigo_msd AND codigo_lapso = $codigo_lapso)";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
      $this->error($this->mysql->Error());
      return false;
    } 
  }

  public function Asignar_Notas($estudiante,$plan_evaluacion,$nota){
    $codigo_plan_evaluacion = null;
    $notaobtenida = null;
    $sql="INSERT INTO tasignacion_nota(codigo_plan_evaluacion,cedula_estudiante,notaobtenida) VALUES ";
    foreach ($estudiante as $keyE => $valueE) {
      for($i=0;$i<count($plan_evaluacion[$valueE]);$i++){
        $codigo_plan_evaluacion = $plan_evaluacion[$valueE][$i];
        $notaobtenida = $nota[$valueE][$i];
        $sql.="($codigo_plan_evaluacion,'$valueE',$notaobtenida),";
      }
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

  public function Eliminar_NotaFinal($msd,$estudiante,$lapso){
    $sql="DELETE FROM tcontrol_notas WHERE codigo_msd=$msd AND cedula_estudiante='$estudiante' AND codigo_lapso=$lapso;";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
      $this->error($this->mysql->Error());
      return false;
    }
  }

  public function Aplicar_NotaFinal($msd,$estudiante,$lapso,$nota,$aprobado){
    $sql="INSERT INTO tcontrol_notas (codigo_msd,cedula_estudiante,codigo_lapso,notafinal,aprobado) VALUES ($msd,'$estudiante',$lapso,$nota,'$aprobado');";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
      $this->error($this->mysql->Error());
      return false;
    }
  }

  public function BuscarDatosNotas($codigo_msd,$codigo_lapso){
    $sql="SELECT DISTINCT pe.codigo_plan_evaluacion,COALESCE(an.cedula_estudiante,pi.cedula_estudiante) AS cedula_estudiante, 
    CONCAT(pi.cedula_estudiante,' ',p.nombres,' ',p.apellidos) AS estudiante,pe.descripcion AS unidad_evaluada,
    ROUND(COALESCE(an.notaobtenida,0),0) AS notaobtenida 
    FROM tplan_evaluacion pe 
    INNER JOIN tmateria_seccion_docente msd ON pe.codigo_msd = pe.codigo_msd 
    INNER JOIN tproceso_inscripcion pi ON msd.seccion = pi.seccion 
    INNER JOIN tpersona p ON pi.cedula_estudiante = p.cedula 
    LEFT JOIN tasignacion_nota an ON pe.codigo_plan_evaluacion = an.codigo_plan_evaluacion AND pi.cedula_estudiante = an.cedula_estudiante
    WHERE pe.codigo_msd = $codigo_msd AND pe.codigo_lapso = $codigo_lapso 
    ORDER BY COALESCE(an.cedula_estudiante,pi.cedula_estudiante),pe.descripcion ASC";
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

  public function ComboSeccion($cedula_docente){
    $sql="SELECT DISTINCT s.seccion AS id,upper(s.descripcion) AS name 
    FROM tseccion s 
    INNER JOIN tmateria_seccion_docente msd ON s.seccion = msd.seccion 
    WHERE s.fecha_desactivacion IS NULL AND msd.cedula_docente = '$cedula_docente' 
    ORDER BY s.seccion";
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