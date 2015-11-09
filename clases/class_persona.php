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
   private $estatus; 
   private $mysql; 
	 
   public function __construct(){
     $this->cedula=null;
     $this->nombres=null;
     $this->apellidos=null;
     $this->genero=null;
   	 $this->fecha_nacimiento=null;
     $this->lugar_nacimiento=null;
     $this->direccion=null;
     $this->telefono_habitacion=null;
     $this->telefono_movil=null;
     $this->email=null;
     $this->esestudiante=null;
     $this->esrepresentante=null;
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

   public function cedula(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->cedula;
     
	 if($Num_Parametro>0){
	   $this->cedula=func_get_arg(0);
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

   public function direccion(){
      $Num_Parametro=func_num_args();
   if($Num_Parametro==0) return $this->direccion;
     
   if($Num_Parametro>0){
     $this->direccion=func_get_arg(0);
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

   public function fecha_ingreso(){
      $Num_Parametro=func_num_args();
   if($Num_Parametro==0) return $this->fecha_ingreso;
     
   if($Num_Parametro>0){
     $this->fecha_ingreso=func_get_arg(0);
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

   public function estatus(){
      $Num_Parametro=func_num_args();
   if($Num_Parametro==0) return $this->estatus;
     
   if($Num_Parametro>0){
     $this->estatus=func_get_arg(0);
   }
   }

   public function Registrar(){
    $sql="INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,
    email,esestudiante,esrepresentante,espersonalinstitucion,fecha_ingreso,codigo_cargo,codigo_dependencia,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) 
    VALUES ('$this->cedula','$this->nombres','$this->apellidos','$this->genero',STR_TO_DATE('$this->fecha_nacimiento','%d/%m/%Y'),'$this->lugar_nacimiento',
      '$this->direccion','$this->telefono_habitacion','$this->telefono_movil','$this->email','$this->esestudiante','$this->esrepresentante','$this->espersonalinstitucion',
      STR_TO_DATE('$this->fecha_ingreso','%d/%m/%Y'),'$this->codigo_cargo','$this->codigo_dependencia','$this->condicion_cargo','$this->nivel_academico','$this->carga_horaria','$this->codigo_plantel');";
    if($this->mysql->Ejecutar($sql)!=null){
    		return true;
		else
			return false;
    }
   }
   
    public function Activar(){
    $sql="UPDATE tpersona SET fecha_desactivacion=NULL WHERE cedula = '$this->cedula';";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="UPDATE tpersona SET fecha_desactivacion=CURDATE() WHERE cedula = '$this->cedula';";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="UPDATE tpersona SET cedula='$this->cedula',nombres='$this->nombres',apellidos='$this->apellidos',genero='$this->genero',
    STR_TO_DATE('$this->fecha_nacimiento','%d/%m/%Y'),lugar_nacimiento='$this->lugar_nacimiento',direccion='$this->direccion',telefono_habitacion='$this->telefono_habitacion',
    telefono_movil='$this->telefono_movil',email='$this->email',esestudiante='$this->esestudiante',esrepresentante='$this->esrepresentante',
    espersonalinstitucion='$this->espersonalinstitucion',codigo_cargo='$this->codigo_cargo',STR_TO_DATE('$this->fecha_ingreso','%d/%m/%Y'),
    codigo_dependencia='$this->codigo_dependencia',condicion_cargo='$this->condicion_cargo',nivel_academico='$this->nivel_academico',
    carga_horaria='$this->carga_horaria',codigo_plantel='$this->codigo_plantel' 
    WHERE p.cedula = pr.cedula AND p.cedula='$this->cedula';";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
    $sql="SELECT p.cedula,p.nombres,p.apellidos,p.genero,p.fecha_nacimiento, 
    CONCAT(p.lugar_nacimiento,'_',par.descripcion) AS lugar_nacimiento,p.direccion,
    p.telefono_habitacion,p.telefono_movil,p.email, p.esestudiante,p.esrepresentante,p.espersonalinstitucion,
    (CASE WHEN p.fecha_desactivacion IS NULL THEN 'Activo' ELSE 'Desactivado' END) AS estatus,
    p.fecha_ingreso,p.codigo_cargo,p.codigo_dependencia,p.condicion_cargo, p.nivel_academico,p.carga_horaria,p.codigo_plantel 
    FROM tpersona p 
    INNER JOIN tparroquia par ON p.lugar_nacimiento = par.codigo_parroquia";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
  	$tpersona=$this->mysql->Respuesta($query);
  	$this->cedula($tpersona['cedula']);
  	$this->nombres($tpersona['nombres']);
  	$this->apellidos($tpersona['apellidos']);
  	$this->genero($tpersona['genero']);
  	$this->fecha_nacimiento($tpersona['fecha_nacimiento']);
  	$this->lugar_nacimiento($tpersona['lugar_nacimiento']);
    $this->direccion($tpersona['direccion']);
  	$this->telefono_habitacion($tpersona['telefono_habitacion']);
  	$this->telefono_movil($tpersona['telefono_movil']);
  	$this->email($tpersona['email']);
  	$this->esestudiante($tpersona['esestudiante']);
  	$this->esrepresentante($tpersona['esrepresentante']);
    $this->espersonalinstitucion($tpersona['espersonalinstitucion']);
    $this->fecha_ingreso($tpersona['fecha_ingreso']);
    $this->codigo_cargo($tpersona['codigo_cargo']);
    $this->codigo_dependencia($tpersona['codigo_dependencia']);
    $this->condicion_cargo($tpersona['condicion_cargo']);
    $this->nivel_academico($tpersona['nivel_academico']);
    $this->carga_horaria($tpersona['carga_horaria']);
    $this->codigo_plantel($tpersona['codigo_plantel']);
    $this->estatus($tpersona['estatus']);
	return true;
	}
	else{
	return false;
	}
   }
   public function Comprobar(){
    $sql="SELECT p.cedula,p.nombres,p.apellidos,p.genero,p.fecha_nacimiento, 
    CONCAT(p.lugar_nacimiento,'_',par.descripcion) AS lugar_nacimiento,p.direccion,
    p.telefono_habitacion,p.telefono_movil,p.email, p.esestudiante,p.esrepresentante,p.espersonalinstitucion,
    (CASE WHEN p.fecha_desactivacion IS NULL THEN 'Activo' ELSE 'Desactivado' END) AS estatus,
    p.fecha_ingreso,p.codigo_cargo,p.codigo_dependencia,p.condicion_cargo, p.nivel_academico,
    p.carga_horaria,p.codigo_plantel,p.fecha_desactivacion FROM tpersona p 
    INNER JOIN tparroquia par ON p.lugar_nacimiento = par.codigo_parroquia";
    echo $sql;
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tpersona=$this->mysql->Respuesta($query);
    $this->cedula($tpersona['cedula']);
    $this->nombres($tpersona['nombres']);
    $this->apellidos($tpersona['apellidos']);
    $this->genero($tpersona['genero']);
    $this->fecha_nacimiento($tpersona['fecha_nacimiento']);
    $this->lugar_nacimiento($tpersona['lugar_nacimiento']);
    $this->direccion($tpersona['direccion']);
    $this->telefono_habitacion($tpersona['telefono_habitacion']);
    $this->telefono_movil($tpersona['telefono_movil']);
    $this->email($tpersona['email']);
    $this->esestudiante($tpersona['esestudiante']);
    $this->esrepresentante($tpersona['esrepresentante']);
    $this->espersonalinstitucion($tpersona['espersonalinstitucion']);
    $this->fecha_ingreso($tpersona['fecha_ingreso']);
    $this->codigo_cargo($tpersona['codigo_cargo']);
    $this->codigo_dependencia($tpersona['codigo_dependencia']);
    $this->condicion_cargo($tpersona['condicion_cargo']);
    $this->nivel_academico($tpersona['nivel_academico']);
    $this->carga_horaria($tpersona['carga_horaria']);
    $this->codigo_plantel($tpersona['codigo_plantel']);
    $this->fecha_desactivacion($tpersona['fecha_desactivacion']);
    $this->estatus($tpersona['estatus']);
	return true;
	}
	else{
	return false;
	}
   }

   public function BuscarParroquias($filtro){
   	$sql ="SELECT pr.descripcion as lvl 
    FROM tpais p 
    INNER JOIN testado e ON p.codigo_pais = e.codigo_pais 
    INNER JOIN tmunicipio m ON e.codigo_estado = m.codigo_estado 
    INNER JOIN tparroquia pr ON m.codigo_municipio = pr.codigo_municipio ORDER BY pr.descripcion DESC";

     /*"SELECT pr.esestudiante id,pr.descripcion name, '4' as lvl 
    FROM tpais p 
   	INNER JOIN testado e ON p.codigo_pais = e.codigo_pais 
   	INNER JOIN tmunicipio e ON e.codigo_estado = m.codigo_estado 
   	INNER JOIN tparroquia pr ON m.codigo_municipio = pr.codigo_municipio 
   	WHERE p.descripcion = '$filtro'
   	ORDER BY pr.esestudiante DESC";*/

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