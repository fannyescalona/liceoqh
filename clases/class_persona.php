<?php
 require_once("class_bd.php");
 class Persona
 {
   private $cedula; 
   private $nombres; 
   private $apellidos;
   private $genero;
   private $fecha_nacimiento; 
	 private $lugar_nacimiento;
   private $direccion; 
   private $telefono_habitacion; 
   private $telefono_movil; 
   private $email;
   private $esestudiante;
   private $esrepresentante; 
   private $espersonalinstitucion; 
   private $fecha_ingreso; 
   private $codigo_cargo; 
   private $codigo_dependencia; 
   private $condicion_cargo; 
   private $nivel_academico; 
   private $carga_horaria; 
   private $codigo_plantel; 
   private $fecha_desactivacion; 
   private $mysql; 
	 
   public function __construct(){
     $this->cargo=null;
   	 $this->nacionalidad=null;
     $this->cedula_persona=null;
     $this->nombres=null;
     $this->apellidos=null;
     $this->genero=null;
   	 $this->fecha_nacimiento=null;
     $this->lugar_nacimiento=null;
     $this->telefono_habitacion=null;
     $this->telefono_movil=null;
     $this->email=null;
     $this->esestudiante=null;
     $this->direccion=null;
     $this->esrepresentante=null;
     $this->espersonalinstitucion=null;
     $this->espersonalinstitucion=null;
     $this->fecha_ingreso=null;
     $this->codigo_cargo=null;
     $this->codigo_dependencia=null;
     $this->condicion_cargo=null;
     $this->nivel_academico=null;
     $this->carga_horaria=null;
     $this->codigo_plantel=null;
	   $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function cargo(){
      $Num_Parametro=func_num_args();
   if($Num_Parametro==0) return $this->cargo;
     
   if($Num_Parametro>0){
     $this->cargo=func_get_arg(0);
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
   
   public function nombres(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nombres;
     
	 if($Num_Parametro>0){
	   $this->nombres=func_get_arg(0);
	 }
   }

   public function apellidos(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->apellidos;
     
	 if($Num_Parametro>0){
	   $this->apellidos=func_get_arg(0);
	 }
   }

   public function genero(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->genero;
     
	 if($Num_Parametro>0){
	   $this->genero=func_get_arg(0);
	 }
   }

   public function fecha_nacimiento(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->fecha_nacimiento;
     
	 if($Num_Parametro>0){
	   $this->fecha_nacimiento=func_get_arg(0);
	 }
   }
   
	 public function lugar_nacimiento(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->lugar_nacimiento;
     
	 if($Num_Parametro>0){
	   $this->lugar_nacimiento=func_get_arg(0);
	 }
   }

   public function telefono_habitacion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->telefono_habitacion;
     
	 if($Num_Parametro>0){
	   $this->telefono_habitacion=func_get_arg(0);
	 }
   }
   
   public function telefono_movil(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->telefono_movil;
     
	 if($Num_Parametro>0){
	   $this->telefono_movil=func_get_arg(0);
	 }
   }

   public function email(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->email;
     
	 if($Num_Parametro>0){
	   $this->email=func_get_arg(0);
	 }
   }

   public function esestudiante(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->esestudiante;
     
	 if($Num_Parametro>0){
	   $this->esestudiante=func_get_arg(0);
	 }
   }

   public function direccion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->direccion;
     
	 if($Num_Parametro>0){
	   $this->direccion=func_get_arg(0);
	 }
   }

   public function esrepresentante(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->esrepresentante;
     
	 if($Num_Parametro>0){
	   $this->esrepresentante=func_get_arg(0);
	 }
   }

   public function espersonalinstitucion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->espersonalinstitucion;
     
	 if($Num_Parametro>0){
	   $this->espersonalinstitucion=func_get_arg(0);
	 }
   }

   public function codigo_cargo(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_cargo;
     
	 if($Num_Parametro>0){
	   $this->codigo_cargo=func_get_arg(0);
	 }
   }

   public function codigo_dependencia(){
      $Num_Parametro=func_num_args();
   if($Num_Parametro==0) return $this->codigo_dependencia;
     
   if($Num_Parametro>0){
     $this->codigo_dependencia=func_get_arg(0);
   }
   }

   public function condicion_cargo(){
      $Num_Parametro=func_num_args();
   if($Num_Parametro==0) return $this->condicion_cargo;
     
   if($Num_Parametro>0){
     $this->condicion_cargo=func_get_arg(0);
   }
   }

   public function nivel_academico(){
      $Num_Parametro=func_num_args();
   if($Num_Parametro==0) return $this->nivel_academico;
     
   if($Num_Parametro>0){
     $this->nivel_academico=func_get_arg(0);
   }
   }

   public function carga_horaria(){
      $Num_Parametro=func_num_args();
   if($Num_Parametro==0) return $this->carga_horaria;
     
   if($Num_Parametro>0){
     $this->carga_horaria=func_get_arg(0);
   }
   }

   public function codigo_plantel(){
      $Num_Parametro=func_num_args();
   if($Num_Parametro==0) return $this->codigo_plantel;
     
   if($Num_Parametro>0){
     $this->codigo_plantel=func_get_arg(0);
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
    $sql="INSERT INTO tpersona (nacionalidad,cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,
    	email,esestudiante,esrepresentante,espersonalinstitucion,fecha_ingreso,codigo_cargo,codigo_dependencia,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES ('$this->nacionalidad','$this->cedula_persona','$this->nombres','$this->apellidos'
    	,'$this->genero','$this->fecha_nacimiento','$this->lugar_nacimiento','$this->direccion','$this->telefono_habitacion','$this->telefono_movil','$this->email','$this->esestudiante'
      '$this->esrepresentante','$this->espersonalinstitucion','$this->fecha_ingreso','$this->codigo_cargo','$this->codigo_dependencia','$this->condicion_cargo',
      '$this->nivel_academico','$this->carga_horaria','$this->codigo_plantel');";
    if($this->mysql->Ejecutar($sql)!=null){
    	$sql2="INSERT INTO tpersonal (codigo_personal,cedula,codigo_cargo) SELECT CONCAT(SUBSTRING(descripcion,1,2),'$this->cedula_persona'),
    	'$this->cedula_persona',codigo_cargo FROM tcargo WHERE codigo_cargo = '$this->cargo'";
    	if($this->mysql->Ejecutar($sql2)!=null)
    		return true;
		else
			return false;
    }
   }
   
     public function Activar(){
    $sql="UPDATE tpersona p JOIN tpersonal pr SET p.fecha_ingreso=NULL, pr.fecha_ingreso=NULL 
    WHERE p.cedula = pr.cedula AND p.cedula = '$this->cedula_persona';";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="UPDATE tpersona p JOIN tpersonal pr SET p.fecha_ingreso=CURDATE(), pr.fecha_ingreso=CURDATE() 
    WHERE p.cedula = pr.cedula AND p.cedula = '$this->cedula_persona';";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="UPDATE tpersona p JOIN tpersonal pr SET pr.codigo_cargo = '$this->cargo',
    pr.codigo_personal = (SELECT CONCAT(SUBSTRING(descripcion,1,2),'$this->cedula_persona') FROM tcargo WHERE codigo_cargo = '$this->cargo'),
    p.nacionalidad='$this->nacionalidad',p.cedula='$this->cedula_persona',p.nombres='$this->nombres',p.apellidos='$this->apellidos',
    p.genero='$this->genero',p.fecha_nacimiento='$this->fecha_nacimiento',p.lugar_nacimiento='$this->lugar_nacimiento',p.direccion='$this->direccion',p.telefono_habitacion='$this->telefono_habitacion',
    p.telefono_movil='$this->telefono_movil',p.email='$this->email',p.esestudiante='$this->esestudiante',p.esrepresentante='$this->esrepresentante',
    p.esrepresentante='$this->esrepresentante' WHERE p.cedula = pr.cedula AND p.cedula='$this->cedula_persona';";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="SELECT pr.codigo_cargo,p.nacionalidad,p.cedula,p.nombres,p.apellidos,p.genero,date_format(p.fecha_nacimiento,'%d/%m/%Y') fecha_nacimiento,
    p.lugar_nacimiento,p.telefono_habitacion,p.telefono_movil,p.email,p.esestudiante,p.direccion,p.esrepresentante,(CASE WHEN p.fecha_ingreso IS NULL THEN  'Activo' 
    ELSE 'Desactivado' END) AS espersonalinstitucion,p.fecha_ingreso FROM tpersona p INNER JOIN tpersonal pr ON p.cedula = pr.cedula 
    WHERE p.cedula='$this->cedula_persona'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tpersona=$this->mysql->Respuesta($query);
  $this->cargo($tpersona['codigo_cargo']);
	$this->nacionalidad($tpersona['nacionalidad']);
	$this->cedula_persona($tpersona['cedula']);
	$this->nombres($tpersona['nombres']);
	$this->apellidos($tpersona['apellidos']);
	$this->genero($tpersona['genero']);
	$this->fecha_nacimiento($tpersona['fecha_nacimiento']);
	$this->lugar_nacimiento($tpersona['lugar_nacimiento']);
	$this->telefono_habitacion($tpersona['telefono_habitacion']);
	$this->telefono_movil($tpersona['telefono_movil']);
	$this->email($tpersona['email']);
	$this->esestudiante($tpersona['esestudiante']);
	$this->direccion($tpersona['direccion']);
	$this->esrepresentante($tpersona['esrepresentante']);
	$this->fecha_ingreso($tpersona['fecha_ingreso']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="SELECT pr.codigo_cargo,p.nacionalidad,p.cedula,p.nombres,p.apellidos,p.genero,date_format(p.fecha_nacimiento,'%d/%m/%Y') fecha_nacimiento,
    p.lugar_nacimiento,p.telefono_habitacion,p.telefono_movil,p.email,p.esestudiante,p.direccion,p.esrepresentante 
    FROM tpersona p INNER JOIN tpersonal pr ON p.cedula = pr.cedula 
    WHERE p.cedula='$this->cedula_persona'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tpersona=$this->mysql->Respuesta($query);
  $this->cargo($tpersona['codigo_cargo']);
	$this->nacionalidad($tpersona['nacionalidad']);
	$this->cedula_persona($tpersona['cedula']);
	$this->nombres($tpersona['nombres']);
	$this->apellidos($tpersona['apellidos']);
	$this->genero($tpersona['genero']);
	$this->fecha_nacimiento($tpersona['fecha_nacimiento']);
	$this->lugar_nacimiento($tpersona['lugar_nacimiento']);
	$this->telefono_habitacion($tpersona['telefono_habitacion']);
	$this->telefono_movil($tpersona['telefono_movil']);
	$this->email($tpersona['email']);
	$this->esestudiante($tpersona['esestudiante']);
	$this->direccion($tpersona['direccion']);
	$this->esrepresentante($tpersona['esrepresentante']);
	$this->fecha_ingreso($tpersona['fecha_ingreso']);
	return true;
	}
	else{
	return false;
	}
   }

   public function BuscarParroquias($filtro){
   	$sql = "SELECT pr.esestudiante id,pr.nombre_parroquia name, '4' as lvl FROM tpais p 
   	INNER JOIN testado e ON p.cod_pais = e.cod_pais 
   	INNER JOIN tciudad c ON e.cod_estado = c.cod_estado 
   	INNER JOIN tmunicipio m ON c.cod_ciudad = m.cod_ciudad 
   	INNER JOIN tparroquia pr ON m.cod_municipio = pr.cod_municipio 
   	WHERE p.nombre_pais = '$filtro'
   	ORDER BY pr.esestudiante DESC";
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