<?php
require_once("class_bd.php");
class Persona {
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
  private $codigo_dependencia_anterior; 
  private $condicion_cargo; 
  private $nivel_academico; 
  private $carga_horaria; 
  private $codigo_plantel; 
  private $peso; 
  private $estatura; 
  private $fecha_desactivacion; 
  private $estatus; 
  private $error; 
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
    $this->codigo_dependencia_anterior=null;
    $this->condicion_cargo=null;
    $this->nivel_academico=null;
    $this->carga_horaria=null;
    $this->codigo_plantel=null;
    $this->peso=null;
    $this->estatura=null;
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

  public function codigo_dependencia_anterior(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->codigo_dependencia_anterior;

    if($Num_Parametro>0){
      $this->codigo_dependencia_anterior=func_get_arg(0);
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

  public function cedula_docente(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->cedula_docente;

    if($Num_Parametro>0){
      $this->cedula_docente=func_get_arg(0);
    }
  }

  public function seccion(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->seccion;

    if($Num_Parametro>0){
      $this->seccion=func_get_arg(0);
    }
  }

  public function plantel_procedencia(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->plantel_procedencia;

    if($Num_Parametro>0){
      $this->plantel_procedencia=func_get_arg(0);
    }
  }

  public function peso(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->peso;

    if($Num_Parametro>0){
      $this->peso=func_get_arg(0);
    }
  }

  public function estatura(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->estatura;

    if($Num_Parametro>0){
      $this->estatura=func_get_arg(0);
    }
  }

  public function cedula_representante(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->cedula_representante;

    if($Num_Parametro>0){
      $this->cedula_representante=func_get_arg(0);
    }
  }

  public function codigo_parentesco(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->codigo_parentesco;

    if($Num_Parametro>0){
      $this->codigo_parentesco=func_get_arg(0);
    }
  }

  public function estatus(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->estatus;

    if($Num_Parametro>0){
      $this->estatus=func_get_arg(0);
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
    if($this->espersonalinstitucion=="Y"){
      $sql="INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,";
      $sql.="email,esestudiante,esrepresentante,espersonalinstitucion,fecha_ingreso,codigo_cargo,codigo_dependencia,codigo_dependencia_anterior,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) ";
      $sql.="VALUES ('$this->cedula','$this->nombres','$this->apellidos','$this->genero',STR_TO_DATE('$this->fecha_nacimiento','%d/%m/%Y'),'$this->lugar_nacimiento',";
      $sql.="'$this->direccion','$this->telefono_habitacion','$this->telefono_movil','$this->email','$this->esestudiante','$this->esrepresentante','$this->espersonalinstitucion',";
      $sql.="STR_TO_DATE('$this->fecha_ingreso','%d/%m/%Y'),$this->codigo_cargo,'$this->codigo_dependencia','$this->codigo_dependencia_anterior','$this->condicion_cargo','$this->nivel_academico','$this->carga_horaria','$this->codigo_plantel');"; 
    }
    else{
      $sql="INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,";
      $sql.="fecha_ingreso,codigo_cargo,codigo_dependencia,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES ('$this->cedula','$this->nombres','$this->apellidos',";
      $sql.="'$this->genero',STR_TO_DATE('$this->fecha_nacimiento','%d/%m/%Y'),'$this->lugar_nacimiento','$this->direccion','$this->telefono_habitacion','$this->telefono_movil','$this->email',";
      $sql.="'$this->esestudiante','$this->esrepresentante',NULL,NULL,NULL,NULL,NULL,NULL,NULL);";
    }
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
      $this->error($this->mysql->Error());
      return false;
    } 
  }

  public function Activar(){
    $sql="UPDATE tpersona SET fecha_desactivacion=NULL WHERE cedula = '$this->cedula';";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
      $this->error($this->mysql->Error());
      return false;
    } 
  }

  public function Desactivar(){
    $sql="UPDATE tpersona SET fecha_desactivacion=CURDATE() WHERE cedula = '$this->cedula';";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
      $this->error($this->mysql->Error());
      return false;
    } 
  }

  public function Actualizar(){
    if($this->espersonalinstitucion=="Y"){
      $sql="UPDATE tpersona SET nombres='$this->nombres',apellidos='$this->apellidos',genero='$this->genero',";
      $sql.="fecha_nacimiento=STR_TO_DATE('$this->fecha_nacimiento','%d/%m/%Y'),lugar_nacimiento='$this->lugar_nacimiento',direccion='$this->direccion',telefono_habitacion='$this->telefono_habitacion',";
      $sql.="telefono_movil='$this->telefono_movil',email='$this->email',esestudiante='$this->esestudiante',esrepresentante='$this->esrepresentante',";
      $sql.="espersonalinstitucion='$this->espersonalinstitucion',codigo_cargo=$this->codigo_cargo,fecha_ingreso=STR_TO_DATE('$this->fecha_ingreso','%d/%m/%Y'),";
      $sql.="codigo_dependencia='$this->codigo_dependencia',codigo_dependencia_anterior='$this->codigo_dependencia_anterior',condicion_cargo='$this->condicion_cargo',nivel_academico='$this->nivel_academico',";
      $sql.="carga_horaria='$this->carga_horaria',codigo_plantel='$this->codigo_plantel' ";
      $sql.="WHERE cedula='$this->cedula';";
    }else{
      $sql="UPDATE tpersona SET nombres='$this->nombres',apellidos='$this->apellidos',genero='$this->genero',";
      $sql.="fecha_nacimiento=STR_TO_DATE('$this->fecha_nacimiento','%d/%m/%Y'),lugar_nacimiento='$this->lugar_nacimiento',direccion='$this->direccion',telefono_habitacion='$this->telefono_habitacion',";
      $sql.="telefono_movil='$this->telefono_movil',email='$this->email',esestudiante='$this->esestudiante',esrepresentante='$this->esrepresentante' ";
      $sql.="WHERE cedula='$this->cedula';";
    }
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
      $this->error($this->mysql->Error());
      return false;
    } 
  }

  public function Consultar(){
    $sql="SELECT p.cedula,p.nombres,p.apellidos,p.genero,date_format(p.fecha_nacimiento,'%d/%m/%Y') AS fecha_nacimiento, ";
    $sql.="CONCAT(p.lugar_nacimiento,'_',par.descripcion) AS lugar_nacimiento,p.direccion,p.telefono_habitacion,p.telefono_movil,";
    $sql.="p.email, p.esestudiante,p.esrepresentante,p.espersonalinstitucion,(CASE WHEN p.fecha_desactivacion IS NULL THEN 'Activo' ELSE 'Desactivado' END) AS estatus,";
    $sql.="date_format(p.fecha_ingreso,'%d/%m/%Y') AS fecha_ingreso,p.codigo_cargo,p.codigo_dependencia,p.codigo_dependencia_anterior,p.condicion_cargo,";
    $sql.="p.nivel_academico,p.carga_horaria,p.codigo_plantel ";
    $sql.="FROM tpersona p ";
    $sql.="INNER JOIN tparroquia par ON p.lugar_nacimiento = par.codigo_parroquia ";
    $sql.="WHERE p.cedula='$this->cedula' AND p.esestudiante='N'";
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
      $this->codigo_dependencia_anterior($tpersona['codigo_dependencia_anterior']);
      $this->condicion_cargo($tpersona['condicion_cargo']);
      $this->nivel_academico($tpersona['nivel_academico']);
      $this->carga_horaria($tpersona['carga_horaria']);
      $this->codigo_plantel($tpersona['codigo_plantel']);
      $this->estatus($tpersona['estatus']);
      return true;
    }
    else{
      $this->error($this->mysql->Error());
      return false;
    } 
  }

  public function Comprobar(){
    $sql="SELECT p.cedula,p.nombres,p.apellidos,p.genero,Date_Format(p.fecha_nacimiento,'%d/%m/%Y') AS fecha_nacimiento, 
    p.lugar_nacimiento,p.direccion,p.telefono_habitacion,p.telefono_movil,p.email, p.esestudiante,p.esrepresentante,
    p.espersonalinstitucion,(CASE WHEN p.fecha_desactivacion IS NULL THEN 'Activo' ELSE 'Desactivado' END) AS estatus,
    Date_Format(p.fecha_ingreso,'%d/%m/%Y') AS fecha_ingreso,p.codigo_cargo,p.codigo_dependencia,p.codigo_dependencia_anterior,
    p.condicion_cargo, p.nivel_academico,p.carga_horaria,p.codigo_plantel,p.fecha_desactivacion 
    FROM tpersona p 
    INNER JOIN tparroquia par ON p.lugar_nacimiento = par.codigo_parroquia 
    WHERE p.cedula='$this->cedula' AND p.esestudiante='N'";
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
      $this->codigo_dependencia_anterior($tpersona['codigo_dependencia_anterior']);
      $this->condicion_cargo($tpersona['condicion_cargo']);
      $this->nivel_academico($tpersona['nivel_academico']);
      $this->carga_horaria($tpersona['carga_horaria']);
      $this->codigo_plantel($tpersona['codigo_plantel']);
      $this->fecha_desactivacion($tpersona['fecha_desactivacion']);
      $this->estatus($tpersona['estatus']);
      $this->error("El registro ya existe !");
      return true;
    }
    else{
      $this->error($this->mysql->Error()); 
      return false;
    } 
  }

  public function BuscarDatosRepresentante($representante){
    $sql="SELECT p.cedula,p.nombres,p.apellidos,p.genero,date_format(p.fecha_nacimiento,'%d/%m/%Y') AS fecha_nacimiento, 
    CONCAT(p.lugar_nacimiento,'_',par.descripcion) AS lugar_nacimiento,p.direccion,p.telefono_habitacion,p.telefono_movil,
    p.email 
    FROM tpersona p 
    INNER JOIN tparroquia par ON p.lugar_nacimiento = par.codigo_parroquia 
    WHERE p.cedula = '$representante'";
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

  public function ConsultarEstudiante(){
    $sql="SELECT p.cedula,p.nombres,p.apellidos,p.genero,date_format(p.fecha_nacimiento,'%d/%m/%Y') AS fecha_nacimiento,";
    $sql.="CONCAT(p.lugar_nacimiento,'_',par.descripcion) AS lugar_nacimiento,p.direccion,p.telefono_habitacion,p.telefono_movil,";
    $sql.="p.email,(CASE WHEN p.fecha_desactivacion IS NULL THEN 'Activo' ELSE 'Desactivado' END) AS estatus,";
    $sql.="CONCAT(pi.cedula_docente,'_',d.nombres,' ',d.apellidos) AS cedula_docente,CONCAT(pi.seccion,'_',s.descripcion) AS seccion,";
    $sql.="CONCAT(pi.cedula_representante,'_',r.nombres,' ',r.apellidos) AS cedula_representante,";
    $sql.="CONCAT(pi.codigo_parentesco,'_',parent.descripcion) AS codigo_parentesco,pi.peso,pi.estatura,pi.plantel_procedencia ";
    $sql.="FROM tpersona p ";
    $sql.="INNER JOIN tproceso_inscripcion pi ON p.cedula = pi.cedula_estudiante ";
    $sql.="INNER JOIN tparroquia par ON p.lugar_nacimiento = par.codigo_parroquia ";
    $sql.="LEFT JOIN tpersona d ON pi.cedula_docente = d.cedula ";
    $sql.="LEFT JOIN tseccion s ON pi.seccion = s.seccion ";
    $sql.="LEFT JOIN tpersona r ON pi.cedula_representante = r.cedula ";
    $sql.="LEFT JOIN tparentesco parent ON pi.codigo_parentesco = parent.codigo_parentesco ";
    $sql.="WHERE p.cedula='$this->cedula'";
    $query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
      $tpersona=$this->mysql->Respuesta($query);
      $this->cedula_docente($tpersona['cedula_docente']);
      $this->seccion($tpersona['seccion']);
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
      $this->plantel_procedencia($tpersona['plantel_procedencia']);
      $this->peso($tpersona['peso']);
      $this->estatura($tpersona['estatura']);
      $this->cedula_representante($tpersona['cedula_representante']);
      $this->codigo_parentesco($tpersona['codigo_parentesco']);
      $this->estatus($tpersona['estatus']);
      return true;
    }
    else{
      $this->error($this->mysql->Error());
      return false;
    } 
  }
}
?>