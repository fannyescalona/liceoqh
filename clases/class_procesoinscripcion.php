<?php
require_once("../clases/class_bd.php");
require_once("../clases/class_persona.php");
class Inscripcion {
  private $codigo_procesoinscripcion;
  private $codigo_inscripcion;
  private $fecha_inscripcion; 
  private $codigo_ano_academico;
  private $cedula_estudiante; 
  private $genero;
  private $cedula_escolar;
  private $lateralidad;
  private $codigo_canaima;
  private $canaima_operativa;
  private $nombres; 
  private $apellidos;
  private $peso;
  private $estatura;
  private $fecha_nacimiento;
  private $lugar_nacimiento;
  private $direccion;
  private $telefono_habitacion; 
  private $email;
  private $grado_escolar;
  private $codigo_plantel; 
  private $cedula_madre; 
  private $email_madre;  
  private $nombre_madre;
  private $apellido_madre;
  private $fecha_nacimiento_madre; 
  private $lugar_nacimiento_madre; 
  private $direccion_madre; 
  private $telefono_habitacion_madre;
  private $telefono_movil_madre; 
  private $cedula_padre; 
  private $email_padre;  
  private $nombre_padre;
  private $apellido_padre;
  private $fecha_nacimiento_padre; 
  private $lugar_nacimiento_padre; 
  private $direccion_padre; 
  private $telefono_habitacion_padre;
  private $telefono_movil_padre; 
  private $certificado_sextogrado; 
  private $notascertificadas; 
  private $cartabuenaconducta;
  private $fotoestudiante;
  private $fotorepresentante; 
  private $fotocopia_ciestudiante; 
  private $fotocopia_cirepresentante; 
  private $fotocopia_pnestudiante; 
  private $kitscomedor; 
  private $becado; 
  private $tipobeca;
  private $cedula_docente; 
  private $cedula_representante; 
  private $genero_representante;  
  private $nombre_representante;
  private $apellido_representante;
  private $fecha_nacimiento_representante; 
  private $lugar_nacimiento_representante; 
  private $direccion_representante; 
  private $telefono_habitacion_representante;
  private $telefono_movil_representante;
  private $lugar_trabajo; 
  private $email_representante;  
  private $codigo_parentesco;  
  private $seccion; 
  private $estatus; 
  private $fecha_desactivacion; 
  private $error; 
  private $mysql;
  private $persona; 

  public function __construct(){
    $this->codigo_procesoinscripcion=null;
    $this->codigo_inscripcion=null;
    $this->fecha_inscripcion=null;
    $this->codigo_ano_academico=null;
    $this->cedula_estudiante=null;
    $this->genero=null;
    $this->cedula_escolar=null;
    $this->lateralidad=null;
    $this->codigo_canaima=null;
    $this->canaima_operativa=null;
    $this->nombres=null;
    $this->apellidos=null;
    $this->fecha_nacimiento=null;
    $this->lugar_nacimiento=null;
    $this->direccion=null;
    $this->telefono_habitacion=null;
    $this->email=null;
    $this->grado_escolar=null;
    $this->codigo_plantel=null;
    $this->cedula_madre=null;
    $this->email_madre=null;
    $this->nombre_madre=null;
    $this->apellido_madre=null;
    $this->fecha_nacimiento_madre=null;
    $this->lugar_nacimiento_madre=null;
    $this->direccion_madre=null;
    $this->telefono_habitacion_madre=null;
    $this->telefono_movil_madre=null;
    $this->cedula_padre=null;
    $this->email_padre=null;
    $this->nombre_padre=null;
    $this->apellido_padre=null;
    $this->lugar_nacimiento_padre=null;
    $this->fecha_nacimiento_padre=null;
    $this->direccion_padre=null;
    $this->telefono_habitacion_padre=null;
    $this->telefono_movil_padre=null;
    $this->certificado_sextogrado=null;
    $this->notascertificadas=null;
    $this->cartabuenaconducta=null;
    $this->fotoestudiante=null;
    $this->fotorepresentante=null;
    $this->fotocopia_ciestudiante=null;
    $this->fotocopia_cirepresentante=null;
    $this->fotocopia_pnestudiante=null;
    $this->kitscomedor=null;
    $this->becado=null;
    $this->tipobeca=null;
    $this->cedula_docente=null;
    $this->cedula_representante=null;
    $this->genero_representante=null;
    $this->nombre_representante=null;
    $this->apellido_representante=null;
    $this->lugar_nacimiento_representante=null;
    $this->fecha_nacimiento_representante=null;
    $this->direccion_representante=null;
    $this->telefono_habitacion_representante=null;
    $this->telefono_movil_representante=null;
    $this->lugar_trabajo=null;
    $this->email_representante=null;
    $this->codigo_parentesco=null;
    $this->seccion=null;
    $this->estatus=null;
    $this->fecha_desactivacion=null;
    $this->error=null;
    $this->mysql=new Conexion();
    $this->persona=new Persona();
  }

  public function __destruct(){}

  public function Transaccion($value){
    if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
    if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
    if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
  }

  public function codigo_procesoinscripcion(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->codigo_procesoinscripcion;

    if($Num_Parametro>0){
      $this->codigo_procesoinscripcion=func_get_arg(0);
    }
  }

  public function codigo_inscripcion(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->codigo_inscripcion;

    if($Num_Parametro>0){
      $this->codigo_inscripcion=func_get_arg(0);
    }
  }

  public function fecha_inscripcion(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->fecha_inscripcion;

    if($Num_Parametro>0){
      $this->fecha_inscripcion=func_get_arg(0);
    }
  }

  public function codigo_ano_academico(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->codigo_ano_academico;

    if($Num_Parametro>0){
      $this->codigo_ano_academico=func_get_arg(0);
    }
  }

  public function cedula_estudiante(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->cedula_estudiante;

    if($Num_Parametro>0){
      $this->cedula_estudiante=func_get_arg(0);
    }
  }

  public function genero(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->genero;

    if($Num_Parametro>0){
      $this->genero=func_get_arg(0);
    }
  }

  public function cedula_escolar(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->cedula_escolar;

  if($Num_Parametro>0){
  $this->cedula_escolar=func_get_arg(0);
  }
  }

  public function lateralidad(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->lateralidad;

  if($Num_Parametro>0){
  $this->lateralidad=func_get_arg(0);
  }
  }

  public function codigo_canaima(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->codigo_canaima;

  if($Num_Parametro>0){
  $this->codigo_canaima=func_get_arg(0);
  }
  }

  public function canaima_operativa(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->canaima_operativa;

  if($Num_Parametro>0){
  $this->canaima_operativa=func_get_arg(0);
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

  public function email(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->email;

  if($Num_Parametro>0){
  $this->email=func_get_arg(0);
  }//
  }

  public function grado_escolar(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->grado_escolar;

  if($Num_Parametro>0){
  $this->grado_escolar=func_get_arg(0);
  }//
  }

  public function codigo_plantel(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->codigo_plantel;

  if($Num_Parametro>0){
  $this->codigo_plantel=func_get_arg(0);
  }//
  }

  public function cedula_madre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->cedula_madre;

  if($Num_Parametro>0){
  $this->cedula_madre=func_get_arg(0);
  }
  }

  public function email_madre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->email_madre;

  if($Num_Parametro>0){
  $this->email_madre=func_get_arg(0);
  }
  }
  
  public function nombre_madre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->nombre_madre;

  if($Num_Parametro>0){
  $this->nombre_madre=func_get_arg(0);
  }
  }

  public function apellido_madre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->apellido_madre;

  if($Num_Parametro>0){
  $this->apellido_madre=func_get_arg(0);
  }
  }

  public function fecha_nacimiento_madre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->fecha_nacimiento_madre;

  if($Num_Parametro>0){
  $this->fecha_nacimiento_madre=func_get_arg(0);
  }
  }

  public function lugar_nacimiento_madre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->lugar_nacimiento_madre;

  if($Num_Parametro>0){
  $this->lugar_nacimiento_madre=func_get_arg(0);
  }
  }

  public function direccion_madre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->direccion_madre;

  if($Num_Parametro>0){
  $this->direccion_madre=func_get_arg(0);
  }
  }

  public function telefono_habitacion_madre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->telefono_habitacion_madre;

  if($Num_Parametro>0){
  $this->telefono_habitacion_madre=func_get_arg(0);
  }
  }

  public function telefono_movil_madre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->telefono_movil_madre;

  if($Num_Parametro>0){
  $this->telefono_movil_madre=func_get_arg(0);
  }
  }

  public function cedula_padre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->cedula_padre;

  if($Num_Parametro>0){
  $this->cedula_padre=func_get_arg(0);
  }
  }

  public function email_padre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->email_padre;

  if($Num_Parametro>0){
  $this->email_padre=func_get_arg(0);
  }
  }

  public function nombre_padre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->nombre_padre;

  if($Num_Parametro>0){
  $this->nombre_padre=func_get_arg(0);
  }
  }

  public function apellido_padre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->apellido_padre;

  if($Num_Parametro>0){
  $this->apellido_padre=func_get_arg(0);
  }
  }

  public function fecha_nacimiento_padre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->fecha_nacimiento_padre;

  if($Num_Parametro>0){
  $this->fecha_nacimiento_padre=func_get_arg(0);
  }
  }

  public function lugar_nacimiento_padre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->lugar_nacimiento_padre;

  if($Num_Parametro>0){
  $this->lugar_nacimiento_padre=func_get_arg(0);
  }
  }

  public function direccion_padre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->direccion_padre;

  if($Num_Parametro>0){
  $this->direccion_padre=func_get_arg(0);
  }
  }

  public function telefono_habitacion_padre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->telefono_habitacion_padre;

  if($Num_Parametro>0){
  $this->telefono_habitacion_padre=func_get_arg(0);
  }
  }

  public function telefono_movil_padre(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->telefono_movil_padre;

  if($Num_Parametro>0){
  $this->telefono_movil_padre=func_get_arg(0);
  }
  }

  public function certificado_sextogrado(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->certificado_sextogrado;

  if($Num_Parametro>0){
  $this->certificado_sextogrado=func_get_arg(0);
  }
  }

  public function notascertificadas(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->notascertificadas;

  if($Num_Parametro>0){
  $this->notascertificadas=func_get_arg(0);
  }
  }

  public function cartabuenaconducta(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->cartabuenaconducta;

  if($Num_Parametro>0){
  $this->cartabuenaconducta=func_get_arg(0);
  }
  }

  public function fotoestudiante(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->fotoestudiante;

  if($Num_Parametro>0){
  $this->fotoestudiante=func_get_arg(0);
  }
  }

  public function fotorepresentante(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->fotorepresentante;

  if($Num_Parametro>0){
  $this->fotorepresentante=func_get_arg(0);
  }
  }

  public function fotocopia_ciestudiante(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->fotocopia_ciestudiante;

  if($Num_Parametro>0){
  $this->fotocopia_ciestudiante=func_get_arg(0);
  }
  }

  public function fotocopia_cirepresentante(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->fotocopia_cirepresentante;

  if($Num_Parametro>0){
  $this->fotocopia_cirepresentante=func_get_arg(0);
  }
  }

  public function fotocopia_pnestudiante(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->fotocopia_pnestudiante;

  if($Num_Parametro>0){
  $this->fotocopia_pnestudiante=func_get_arg(0);
  }
  }

  public function kitscomedor(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->kitscomedor;

  if($Num_Parametro>0){
  $this->kitscomedor=func_get_arg(0);
  }
  }

  public function becado(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->becado;

  if($Num_Parametro>0){
  $this->becado=func_get_arg(0);
  }
  }

  public function tipobeca(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->tipobeca;

  if($Num_Parametro>0){
  $this->tipobeca=func_get_arg(0);
  }
  }
 //
  public function cedula_docente(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->cedula_docente;

  if($Num_Parametro>0){
  $this->cedula_docente=func_get_arg(0);
  }//
  }

  public function cedula_representante(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->cedula_representante;

  if($Num_Parametro>0){
  $this->cedula_representante=func_get_arg(0);
  }
  }

  public function genero_representante(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->genero_representante;

  if($Num_Parametro>0){
  $this->genero_representante=func_get_arg(0);
  }
  }

  public function nombre_representante(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->nombre_representante;

  if($Num_Parametro>0){
  $this->nombre_representante=func_get_arg(0);
  }
  }

  public function apellido_representante(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->apellido_representante;

  if($Num_Parametro>0){
  $this->apellido_representante=func_get_arg(0);
  }
  }

  public function fecha_nacimiento_representante(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->fecha_nacimiento_representante;

  if($Num_Parametro>0){
  $this->fecha_nacimiento_representante=func_get_arg(0);
  }
  }

  public function lugar_nacimiento_representante(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->lugar_nacimiento_representante;

  if($Num_Parametro>0){
  $this->lugar_nacimiento_representante=func_get_arg(0);
  }
  }

  public function direccion_representante(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->direccion_representante;

  if($Num_Parametro>0){
  $this->direccion_representante=func_get_arg(0);
  }
  }

  public function telefono_habitacion_representante(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->telefono_habitacion_representante;

  if($Num_Parametro>0){
  $this->telefono_habitacion_representante=func_get_arg(0);
  }
  }

  public function telefono_movil_representante(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->telefono_movil_representante;

  if($Num_Parametro>0){
  $this->telefono_movil_representante=func_get_arg(0);
  }
  }

  public function lugar_trabajo(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->lugar_trabajo;

  if($Num_Parametro>0){
  $this->lugar_trabajo=func_get_arg(0);
  }
  }

  public function email_representante(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->email_representante;

  if($Num_Parametro>0){
  $this->email_representante=func_get_arg(0);
  }
  }

  public function codigo_parentesco(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->codigo_parentesco;

  if($Num_Parametro>0){
  $this->codigo_parentesco=func_get_arg(0);
  }
  }

  public function seccion(){
  $Num_Parametro=func_num_args();
  if($Num_Parametro==0) return $this->seccion;

  if($Num_Parametro>0){
  $this->seccion=func_get_arg(0);
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

  public function RegistrarInscripcionManual(){
    $sql="INSERT INTO tproceso_inscripcion (codigo_inscripcion,fecha_inscripcion,codigo_ano_academico,cedula_estudiante,";
    $sql.="codigo_plantel,primerafi,cedula_docente,seccion,cedula_representante,codigo_parentesco) VALUES ((SELECT MAX(codigo_inscripcion) FROM tinscripcion WHERE fecha_desactivacion IS NULL),";
    $sql.="CURDATE(),(SELECT MAX(codigo_ano_academico) FROM tano_academico WHERE fecha_desactivacion IS NULL),'$this->cedula_estudiante','$this->codigo_plantel',CURDATE(),";
    $sql.="'$this->cedula_docente','$this->seccion','$this->cedula_representante','$this->codigo_parentesco');";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
      $this->error($this->mysql->Error());
      return false;
    }
  }

  public function ActualizarInscripcionManual(){
    $sql="UPDATE tproceso_inscripcion SET codigo_plantel='$this->codigo_plantel',cedula_docente='$this->cedula_docente',";
    $sql.="seccion='$this->seccion',cedula_representante='$this->cedula_representante',codigo_parentesco='$this->codigo_parentesco' ";
    $sql.="WHERE cedula_estudiante='$this->cedula_estudiante';";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
      $this->error($this->mysql->Error());
      return false;
    }
  }

  public function Registrar(){
    $this->persona->cedula($this->cedula_estudiante);
    $this->persona->nombres($this->nombres);
    $this->persona->apellidos($this->apellidos);
    $this->persona->genero($this->genero);
    $this->persona->fecha_nacimiento($this->fecha_nacimiento);
    $this->persona->lugar_nacimiento($this->lugar_nacimiento);
    $this->persona->direccion($this->direccion);
    $this->persona->telefono_habitacion($this->telefono_habitacion);
    $this->persona->telefono_movil(NULL);
    $this->persona->email($this->email);
    $this->persona->esestudiante("Y");
    $this->persona->esrepresentante("N");
    $this->persona->fecha_ingreso(NULL);
    $this->persona->codigo_cargo(NULL);
    $this->persona->codigo_dependencia(NULL);
    $this->persona->condicion_cargo(NULL);
    $this->persona->nivel_academico(NULL);
    $this->persona->carga_horaria(NULL);
    $this->persona->codigo_plantel(NULL);
    if(!$this->persona->Comprobar()){
      if($this->persona->Registrar()){
        $sql="INSERT INTO tproceso_inscripcion (codigo_inscripcion,fecha_inscripcion,codigo_ano_academico,cedula_estudiante,";
        $sql.="cedula_escolar,lateralidad,codigo_canaima,canaima_operativa,peso,estatura,codigo_plantel,grado_escolar,seccion,primerafi) VALUES ((SELECT MAX(codigo_inscripcion) FROM tinscripcion WHERE fecha_desactivacion IS NULL),";
        $sql.="CURDATE(),(SELECT MAX(codigo_ano_academico) FROM tano_academico WHERE fecha_desactivacion IS NULL),'$this->cedula_estudiante','$this->cedula_escolar','$this->lateralidad',";
        $sql.="'$this->codigo_canaima','$this->canaima_operativa','$this->peso','$this->estatura','$this->codigo_plantel','$this->grado_escolar','$this->seccion',CURDATE());";
        if($this->mysql->Ejecutar($sql)!=null)
          return true;
        else{
          $this->error($this->mysql->Error());
          return false;
        }
      }
      else{
        $this->error($this->persona->error());
        return false;
      }
    }else{
      if($this->persona->fecha_desactivacion()==null){
        if($this->persona->Actualizar())
          return true;
        else{
          $this->error($this->persona->error());
          return false;
        }
      }
      else{
        if($this->persona->Activar())           
        return true;
      }
    }
  }

  public function Actualizar(){
    $this->persona->cedula($this->cedula_estudiante);
    $this->persona->nombres($this->nombres);
    $this->persona->apellidos($this->apellidos);
    $this->persona->genero($this->genero);
    $this->persona->fecha_nacimiento($this->fecha_nacimiento);
    $this->persona->lugar_nacimiento($this->lugar_nacimiento);
    $this->persona->direccion($this->direccion);
    $this->persona->telefono_habitacion($this->telefono_habitacion);
    $this->persona->telefono_movil(NULL);
    $this->persona->email($this->email);
    $this->persona->esestudiante("Y");
    $this->persona->esrepresentante("N");
    $this->persona->fecha_ingreso(NULL);
    $this->persona->codigo_cargo(NULL);
    $this->persona->codigo_dependencia(NULL);
    $this->persona->condicion_cargo(NULL);
    $this->persona->nivel_academico(NULL);
    $this->persona->carga_horaria(NULL);
    $this->persona->codigo_plantel(NULL);
    if($this->persona->Actualizar($this->cedula_estudiante)){
      $sql="UPDATE tproceso_inscripcion SET cedula_escolar='$this->cedula_escolar',lateralidad='$this->lateralidad',codigo_canaima='$this->codigo_canaima',canaima_operativa='$this->canaima_operativa',";
      $sql.="peso=$this->peso,estatura='$this->estatura',codigo_plantel='$this->codigo_plantel',grado_escolar='$this->grado_escolar',seccion='$this->seccion' WHERE cedula_estudiante ='$this->cedula_estudiante';";
      if($this->mysql->Ejecutar($sql)!=null)
        return true;
      else{
        $this->error($this->mysql->Error());
        return false;
      }
    }
    else{
      $this->error($this->persona->error());
      return false;
    }
  }

  public function InsertarDatosPadres(){
    $logico=false;
    if($this->cedula_madre!=""){
      $this->persona->cedula($this->cedula_madre);
      $this->persona->nombres($this->nombre_madre);
      $this->persona->apellidos($this->apellido_madre);
      $this->persona->genero("F");
      $this->persona->fecha_nacimiento($this->fecha_nacimiento_madre);
      $this->persona->lugar_nacimiento($this->lugar_nacimiento_madre);
      $this->persona->direccion($this->direccion_madre);
      $this->persona->telefono_habitacion($this->telefono_habitacion_madre);
      $this->persona->telefono_movil($this->telefono_movil_madre);
      $this->persona->email($this->email_madre);
      $this->persona->esestudiante("N");
      $this->persona->esrepresentante("Y");
      $this->persona->fecha_ingreso(NULL);
      $this->persona->codigo_cargo(NULL);
      $this->persona->codigo_dependencia(NULL);
      $this->persona->condicion_cargo(NULL);
      $this->persona->nivel_academico(NULL);
      $this->persona->carga_horaria(NULL);
      $this->persona->codigo_plantel(NULL);
      if(!$this->persona->ComprobarPersona()){
        if($this->persona->Registrar()){
          $sql="UPDATE tproceso_inscripcion SET cedula_madre='$this->cedula_madre' WHERE cedula_estudiante='$this->cedula_estudiante';";
          if($this->mysql->Ejecutar($sql)!=null)
            $logico=true;
          else{
            $this->error($this->mysql->Error());
            $logico=false;
          }
        }
        else{
          $this->error($this->persona->error());
          $logico=false;
        }
      }else{
        if(($this->persona->genero!="F") || ($this->persona->genero=="F" && $this->persona->esestudiante=="Y")){
          $this->error($this->persona->error());
          $logico=false;
        }
        else if($this->persona->fecha_desactivacion()==null){
          if($this->persona->Actualizar($this->cedula_madre)){
            $sql="UPDATE tproceso_inscripcion SET cedula_madre='$this->cedula_madre' WHERE cedula_estudiante='$this->cedula_estudiante';";
            if($this->mysql->Ejecutar($sql)!=null)
              $logico=true;
            else{
              $this->error($this->mysql->Error());
              $logico=false;
            }
          }
          else{
            $this->error($this->persona->error());
            $logico=false;
          }
        }
        else{
          if($this->persona->Activar())           
          $logico=true;
        }
      }
    }
    if($this->cedula_padre!=""){
      $this->persona->cedula($this->cedula_padre);
      $this->persona->nombres($this->nombre_padre);
      $this->persona->apellidos($this->apellido_padre);
      $this->persona->genero("M");
      $this->persona->fecha_nacimiento($this->fecha_nacimiento_padre);
      $this->persona->lugar_nacimiento($this->lugar_nacimiento_padre);
      $this->persona->direccion($this->direccion_padre);
      $this->persona->telefono_habitacion($this->telefono_habitacion_padre);
      $this->persona->telefono_movil($this->telefono_movil_padre);
      $this->persona->email($this->email_padre);
      $this->persona->esestudiante("N");
      $this->persona->esrepresentante("Y");
      $this->persona->fecha_ingreso(NULL);
      $this->persona->codigo_cargo(NULL);
      $this->persona->codigo_dependencia(NULL);
      $this->persona->condicion_cargo(NULL);
      $this->persona->nivel_academico(NULL);
      $this->persona->carga_horaria(NULL);
      $this->persona->codigo_plantel(NULL);
      if(!$this->persona->ComprobarPersona()){
        if($this->persona->Registrar()){
          $sql="UPDATE tproceso_inscripcion SET cedula_padre='$this->cedula_padre' WHERE cedula_estudiante='$this->cedula_estudiante';";
          if($this->mysql->Ejecutar($sql)!=null)
            $logico=true;
          else{
            $this->error($this->mysql->Error());
            $logico=false;
          }
        }
        else{
          $this->error($this->persona->error());
          $logico=false;
        }
      }else{
        if(($this->persona->genero!="M") || ($this->persona->genero=="M" && $this->persona->esestudiante=="Y")){
          $this->error($this->persona->error());
          $logico=false;
        }
        else if($this->persona->fecha_desactivacion()==null){
          if($this->persona->Actualizar($this->cedula_padre)){
            $sql="UPDATE tproceso_inscripcion SET cedula_padre='$this->cedula_padre' WHERE cedula_estudiante='$this->cedula_estudiante';";
            if($this->mysql->Ejecutar($sql)!=null)
              $logico=true;
            else{
              $this->error($this->mysql->Error());
              $logico=false;
            }
          }
          else{
            $this->error($this->persona->error());
            $logico=false;
          }
        }
        else{
          if($this->persona->Activar())           
          $logico=true;
        }
      }
    }
    if($this->cedula_madre=="" && $this->cedula_padre==""){
      $logico=true;
    }
    if($logico==true){
      return true;
    }else{
      return false;
    }

  }
  
  public function InsertarDocumentosConsignados(){
    $sql="UPDATE tproceso_inscripcion SET certificado_sextogrado='$this->certificado_sextogrado',notascertificadas='$this->notascertificadas',";
    $sql.="cartabuenaconducta='$this->cartabuenaconducta',fotoestudiante='$this->fotoestudiante',fotorepresentante='$this->fotorepresentante',";
    $sql.="fotocopia_ciestudiante='$this->fotocopia_ciestudiante',fotocopia_cirepresentante='$this->fotocopia_cirepresentante',";
    $sql.="fotocopia_pnestudiante='$this->fotocopia_pnestudiante',kitscomedor='$this->kitscomedor',becado='$this->becado',tipobeca='$this->tipobeca' ";
    $sql.="WHERE cedula_estudiante = '$this->cedula_estudiante'";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
        $this->error($this->mysql->Error());
        return false;
    }
  }
  
  public function InsertarDatosRepresentante(){
    $logico=false;
    $this->persona->cedula($this->cedula_representante);
    $this->persona->nombres($this->nombre_representante);
    $this->persona->apellidos($this->apellido_representante);
    $this->persona->genero($this->genero_representante);
    $this->persona->fecha_nacimiento($this->fecha_nacimiento_representante);
    $this->persona->lugar_nacimiento($this->lugar_nacimiento_representante);
    $this->persona->direccion($this->direccion_representante);
    $this->persona->telefono_habitacion($this->telefono_habitacion_representante);
    $this->persona->telefono_movil($this->telefono_movil_representante);
    $this->persona->email($this->email_representante);
    $this->persona->esestudiante("N");
    $this->persona->esrepresentante("Y");
    $this->persona->fecha_ingreso(NULL);
    $this->persona->codigo_cargo(NULL);
    $this->persona->codigo_dependencia(NULL);
    $this->persona->condicion_cargo(NULL);
    $this->persona->nivel_academico(NULL);
    $this->persona->carga_horaria(NULL);
    $this->persona->codigo_plantel(NULL);
    if(!$this->persona->ComprobarPersona()){
      if($this->persona->Registrar()){
        $sql="UPDATE tproceso_inscripcion SET cedula_docente='$this->cedula_docente',cedula_representante='$this->cedula_representante',";
        $sql.="codigo_parentesco='$this->codigo_parentesco',lugar_trabajo='$this->lugar_trabajo',proceso_completado='Y'";
        $sql.="WHERE cedula_estudiante='$this->cedula_estudiante';";
        if($this->mysql->Ejecutar($sql)!=null)
          $logico=true;
        else{
          $this->error($this->mysql->Error());
          $logico=false;
        }
      }
      else{
        $this->error($this->persona->error());
        $logico=false;
      }
    }else{
      if($this->persona->esestudiante=='Y'){
        $this->error($this->persona->error());
        $logico=false;
      }
      else if($this->persona->fecha_desactivacion()==null){
        if($this->persona->Actualizar($this->cedula_representante)){
          $sql="UPDATE tproceso_inscripcion SET cedula_docente='$this->cedula_docente',cedula_representante='$this->cedula_representante',";
          $sql.="codigo_parentesco='$this->codigo_parentesco',lugar_trabajo='$this->lugar_trabajo',proceso_completado='Y'";
          $sql.="WHERE cedula_estudiante='$this->cedula_estudiante';";
          if($this->mysql->Ejecutar($sql)!=null)
            $logico=true;
          else{
            $this->error($this->mysql->Error());
            $logico=false;
          }
        }
        else{
          $this->error($this->persona->error());
          $logico=false;
        }
      }
      else{
        if($this->persona->Activar())           
        $logico=true;
      }
    }
  if($logico==true){
      return true;
    }else{
      return false;
    }
  }

  public function Asignar_Seccion($estudiante,$codigo_seccion){
    $seccion=explode('_',$codigo_seccion);
    $seccion=$seccion[0];
    $sqlx="SELECT COUNT(s.seccion) AS cantidad  
    FROM tseccion s 
    WHERE s.seccion = '$seccion' 
    AND s.capacidad_max-(SELECT COUNT(pi.cedula_estudiante) FROM tproceso_inscripcion pi WHERE pi.seccion = s.seccion) > 0";
    $query=$this->mysql->Ejecutar($sqlx);
    $tinscripcion=$this->mysql->Respuesta($query);
    if($tinscripcion['cantidad'] > 0){
      $sql="UPDATE tproceso_inscripcion SET seccion='$seccion' WHERE cedula_estudiante = '$estudiante'";
      if($this->mysql->Ejecutar($sql)!=null)
        return true;
      else{
        $this->error($this->mysql->Error());
        return false;
      }
    }else{
      $this->error("¡Sección Totalmente ocupada!");
      return false;
    }
  }

  public function Consultar(){
    $sql="SELECT p.cedula,p.genero,i.cedula_escolar,i.lateralidad,i.codigo_canaima,i.canaima_operativa,p.nombres,p.apellidos,i.peso,i.estatura,";
    $sql.="DATE_FORMAT(p.fecha_nacimiento,'%d/%m/%Y') fecha_nacimiento,CONCAT(p.lugar_nacimiento,'_',pa.descripcion) AS lugar_nacimiento,";
    $sql.="p.direccion,p.telefono_habitacion,p.email,i.codigo_plantel,p.fecha_desactivacion,i.grado_escolar,CONCAT(i.seccion,'_',s.descripcion) AS seccion,";
    $sql.="CASE WHEN p.fecha_desactivacion IS NULL THEN 'Activo' ELSE 'Desactivado' END AS estatus ";
    $sql.="FROM tpersona p ";
    $sql.="INNER JOIN tproceso_inscripcion i ON p.cedula = i.cedula_estudiante ";
    $sql.="INNER JOIN tparroquia pa ON p.lugar_nacimiento = pa.codigo_parroquia ";
    $sql.="LEFT JOIN tseccion s ON i.seccion = s.seccion ";
    $sql.="WHERE p.cedula='$this->cedula_estudiante'";
    $query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
      $tinscripcion=$this->mysql->Respuesta($query);
      $this->cedula_estudiante($tinscripcion['cedula']);
      $this->genero($tinscripcion['genero']);
      $this->cedula_escolar($tinscripcion['cedula_escolar']);
      $this->lateralidad($tinscripcion['lateralidad']);
      $this->codigo_canaima($tinscripcion['codigo_canaima']);
      $this->canaima_operativa($tinscripcion['canaima_operativa']);
      $this->nombres($tinscripcion['nombres']);
      $this->apellidos($tinscripcion['apellidos']);
      $this->peso($tinscripcion['peso']);
      $this->estatura($tinscripcion['estatura']);
      $this->fecha_nacimiento($tinscripcion['fecha_nacimiento']);
      $this->lugar_nacimiento($tinscripcion['lugar_nacimiento']);
      $this->direccion($tinscripcion['direccion']);
      $this->telefono_habitacion($tinscripcion['telefono_habitacion']);
      $this->email($tinscripcion['email']);
      $this->grado_escolar($tinscripcion['grado_escolar']);
      $this->seccion($tinscripcion['seccion']);
      $this->codigo_plantel($tinscripcion['codigo_plantel']);
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
    $sql="SELECT *,CASE WHEN fecha_desactivacion IS NULL THEN 'Activo' ELSE 'Desactivado' END AS estatus ";
    $sql.="FROM tproceso_inscripcion ";
    $sql.="WHERE cedula_estudiante='$this->cedula_estudiante' AND fecha_desactivacion IS NULL";
    $query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
      $tproceso_inscripcion=$this->mysql->Respuesta($query);
      $this->cedula_estudiante($tproceso_inscripcion['cedula_estudiante']);
      $this->estatus($tproceso_inscripcion['estatus']);
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