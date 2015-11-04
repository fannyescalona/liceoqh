<?php
 require_once("class_bd.php");
 class Persona
 {
   private $rol;
	 private $nacionalidad;
   private $cedula_persona; 
   private $nombre_persona; 
   private $apellido_persona;
   private $sexo;
   private $fecha_nacimiento; 
	 private $edocivil;
   private $tlf_fijo; 
   private $tlf_movil; 
   private $email;
   private $cod_parroquia;
   private $direccion; 
   private $titulo; 
   private $estatus_persona; 
   private $fecha_desactivacion; 
   private $mysql; 
	 
   public function __construct(){
     $this->rol=null;
   	 $this->nacionalidad=null;
     $this->cedula_persona=null;
     $this->nombre_persona=null;
     $this->apellido_persona=null;
     $this->sexo=null;
   	 $this->fecha_nacimiento=null;
     $this->edocivil=null;
     $this->tlf_fijo=null;
     $this->tlf_movil=null;
     $this->email=null;
     $this->cod_parroquia=null;
     $this->direccion=null;
     $this->titulo=null;
     $this->estatus_persona=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function rol(){
      $Num_Parametro=func_num_args();
   if($Num_Parametro==0) return $this->rol;
     
   if($Num_Parametro>0){
     $this->rol=func_get_arg(0);
   }
   }

	 public function nacionalidad(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nacionalidad;
     
	 if($Num_Parametro>0){
	   $this->nacionalidad=func_get_arg(0);
	 }
   }

   public function cedula_persona(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->cedula_persona;
     
	 if($Num_Parametro>0){
	   $this->cedula_persona=func_get_arg(0);
	 }
   }
   
   public function nombre_persona(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nombre_persona;
     
	 if($Num_Parametro>0){
	   $this->nombre_persona=func_get_arg(0);
	 }
   }

   public function apellido_persona(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->apellido_persona;
     
	 if($Num_Parametro>0){
	   $this->apellido_persona=func_get_arg(0);
	 }
   }

   public function sexo(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->sexo;
     
	 if($Num_Parametro>0){
	   $this->sexo=func_get_arg(0);
	 }
   }

   public function fecha_nacimiento(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->fecha_nacimiento;
     
	 if($Num_Parametro>0){
	   $this->fecha_nacimiento=func_get_arg(0);
	 }
   }
   
	 public function edocivil(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->edocivil;
     
	 if($Num_Parametro>0){
	   $this->edocivil=func_get_arg(0);
	 }
   }

   public function tlf_fijo(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->tlf_fijo;
     
	 if($Num_Parametro>0){
	   $this->tlf_fijo=func_get_arg(0);
	 }
   }
   
   public function tlf_movil(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->tlf_movil;
     
	 if($Num_Parametro>0){
	   $this->tlf_movil=func_get_arg(0);
	 }
   }

   public function email(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->email;
     
	 if($Num_Parametro>0){
	   $this->email=func_get_arg(0);
	 }
   }

   public function cod_parroquia(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->cod_parroquia;
     
	 if($Num_Parametro>0){
	   $this->cod_parroquia=func_get_arg(0);
	 }
   }

   public function direccion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->direccion;
     
	 if($Num_Parametro>0){
	   $this->direccion=func_get_arg(0);
	 }
   }

   public function titulo(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->titulo;
     
	 if($Num_Parametro>0){
	   $this->titulo=func_get_arg(0);
	 }
   }

   public function estatus_persona(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_persona;
     
	 if($Num_Parametro>0){
	   $this->estatus_persona=func_get_arg(0);
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
    $sql="INSERT INTO tpersonas (nacionalidad,cedula,nombres,apellidos,sexo,fecha_nacimiento,estado_civil,telefono_fijo,telefono_movil,
    	email,cod_parroquia,direccion,titulo) VALUES ('$this->nacionalidad','$this->cedula_persona','$this->nombre_persona','$this->apellido_persona'
    	,'$this->sexo','$this->fecha_nacimiento','$this->edocivil','$this->tlf_fijo','$this->tlf_movil','$this->email','$this->cod_parroquia'
    	,'$this->direccion','$this->titulo');";
    if($this->mysql->Ejecutar($sql)!=null){
    	$sql2="INSERT INTO tpersonales (cod_personal,cedula,cod_rol) SELECT CONCAT(SUBSTRING(nombre_rol,1,2),'$this->cedula_persona'),
    	'$this->cedula_persona',cod_rol FROM trol WHERE cod_rol = '$this->rol'";
    	if($this->mysql->Ejecutar($sql2)!=null)
    		return true;
		else
			return false;
    }
   }
   
     public function Activar(){
    $sql="UPDATE tpersonas p JOIN tpersonales pr SET p.fecha_desactivacion=NULL, pr.fecha_desactivacion=NULL 
    WHERE p.cedula = pr.cedula AND p.cedula = '$this->cedula_persona';";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="UPDATE tpersonas p JOIN tpersonales pr SET p.fecha_desactivacion=CURDATE(), pr.fecha_desactivacion=CURDATE() 
    WHERE p.cedula = pr.cedula AND p.cedula = '$this->cedula_persona';";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="UPDATE tpersonas p JOIN tpersonales pr SET pr.cod_rol = '$this->rol',
    pr.cod_personal = (SELECT CONCAT(SUBSTRING(nombre_rol,1,2),'$this->cedula_persona') FROM trol WHERE cod_rol = '$this->rol'),
    p.nacionalidad='$this->nacionalidad',p.cedula='$this->cedula_persona',p.nombres='$this->nombre_persona',p.apellidos='$this->apellido_persona',
    p.sexo='$this->sexo',p.fecha_nacimiento='$this->fecha_nacimiento',p.estado_civil='$this->edocivil',p.telefono_fijo='$this->tlf_fijo',
    p.telefono_movil='$this->tlf_movil',p.email='$this->email',p.cod_parroquia='$this->cod_parroquia',p.direccion='$this->direccion',
    p.titulo='$this->titulo' WHERE p.cedula = pr.cedula AND p.cedula='$this->cedula_persona';";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="SELECT pr.cod_rol,p.nacionalidad,p.cedula,p.nombres,p.apellidos,p.sexo,date_format(p.fecha_nacimiento,'%d/%m/%Y') fecha_nacimiento,
    p.estado_civil,p.telefono_fijo,p.telefono_movil,p.email,p.cod_parroquia,p.direccion,p.titulo,(CASE WHEN p.fecha_desactivacion IS NULL THEN  'Activo' 
    ELSE 'Desactivado' END) AS estatus_persona,p.fecha_desactivacion FROM tpersonas p INNER JOIN tpersonales pr ON p.cedula = pr.cedula 
    WHERE p.cedula='$this->cedula_persona'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tpersonas=$this->mysql->Respuesta($query);
  $this->rol($tpersonas['cod_rol']);
	$this->nacionalidad($tpersonas['nacionalidad']);
	$this->cedula_persona($tpersonas['cedula']);
	$this->nombre_persona($tpersonas['nombres']);
	$this->apellido_persona($tpersonas['apellidos']);
	$this->sexo($tpersonas['sexo']);
	$this->fecha_nacimiento($tpersonas['fecha_nacimiento']);
	$this->edocivil($tpersonas['estado_civil']);
	$this->tlf_fijo($tpersonas['telefono_fijo']);
	$this->tlf_movil($tpersonas['telefono_movil']);
	$this->email($tpersonas['email']);
	$this->cod_parroquia($tpersonas['cod_parroquia']);
	$this->direccion($tpersonas['direccion']);
	$this->titulo($tpersonas['titulo']);
	$this->fecha_desactivacion($tpersonas['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="SELECT pr.cod_rol,p.nacionalidad,p.cedula,p.nombres,p.apellidos,p.sexo,date_format(p.fecha_nacimiento,'%d/%m/%Y') fecha_nacimiento,
    p.estado_civil,p.telefono_fijo,p.telefono_movil,p.email,p.cod_parroquia,p.direccion,p.titulo 
    FROM tpersonas p INNER JOIN tpersonales pr ON p.cedula = pr.cedula 
    WHERE p.cedula='$this->cedula_persona'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tpersonas=$this->mysql->Respuesta($query);
  $this->rol($tpersonas['cod_rol']);
	$this->nacionalidad($tpersonas['nacionalidad']);
	$this->cedula_persona($tpersonas['cedula']);
	$this->nombre_persona($tpersonas['nombres']);
	$this->apellido_persona($tpersonas['apellidos']);
	$this->sexo($tpersonas['sexo']);
	$this->fecha_nacimiento($tpersonas['fecha_nacimiento']);
	$this->edocivil($tpersonas['estado_civil']);
	$this->tlf_fijo($tpersonas['telefono_fijo']);
	$this->tlf_movil($tpersonas['telefono_movil']);
	$this->email($tpersonas['email']);
	$this->cod_parroquia($tpersonas['cod_parroquia']);
	$this->direccion($tpersonas['direccion']);
	$this->titulo($tpersonas['titulo']);
	$this->fecha_desactivacion($tpersonas['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }

   public function BuscarParroquias($filtro){
   	$sql = "SELECT pr.cod_parroquia id,pr.nombre_parroquia name, '4' as lvl FROM tpais p 
   	INNER JOIN testado e ON p.cod_pais = e.cod_pais 
   	INNER JOIN tciudad c ON e.cod_estado = c.cod_estado 
   	INNER JOIN tmunicipio m ON c.cod_ciudad = m.cod_ciudad 
   	INNER JOIN tparroquia pr ON m.cod_municipio = pr.cod_municipio 
   	WHERE p.nombre_pais = '$filtro'
   	ORDER BY pr.cod_parroquia DESC";
   	$query = $this->mysql->Ejecutar($sql);
        while($Obj=$this->mysql->Respuesta_assoc($query)){
            $rows[]=array_map("utf8_encode",$Obj);
        }
        if(!empty($rows)){
            $json = json_encode($rows);
        }
        else{
            $rows[] = array("msj" => "Error al buscar los registros ".mysql_error());
            $json = json_encode($rows);
        }
        return $json;
   }
}
?>