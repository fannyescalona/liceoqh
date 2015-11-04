<?php
 require_once("../../clases/class_bd.php");
 class Pre_Inscripcion {
  private $nacionalidad;
  private $cedula_estudiante; 
  private $nombre_estudiante; 
  private $apellido_estudiante;
  private $sexo;
  private $edocivil;
  private $cod_parroquia;
  private $pais_residencia; 
  private $aniosresidencia; 
  private $tlf_fijo; 
  private $tlf_movil;
  private $email;
  private $fecha_nacimiento;
  private $trabaja;
  private $dondetrabaja; 
  private $tlf_trabajo;
  private $direcciontrabajo; 
  private $cargo;  
  private $antiguedad;
  private $discapacidad_visual;
  private $discapacidad_auditiva; 
  private $discapacidad_motora; 
  private $discapacidad_verbal; 
  private $direccionresidencia;
  private $cod_parroquia_temp; 
  private $direccion_temp; 
  private $etnia; 
  private $plantel_edu;  
  private $ciudad_plantel;
  private $dependencia_plantel;
  private $sistema_plantel; 
  private $anio_egreso; 
  private $rama_plantel; 
  private $prueba_act_acad;
  private $anio_paa; 
  private $nro_rusnieu; 
  private $anio_rusnieu; 
  private $modalidad_ingreso;
  private $modalidad_estudio;
  private $esatleta; 
  private $tipo_atleta; 
  private $disciplina; 
  private $entrenador; 
  private $institucion; 
  private $posee_titulo; 
  private $rif_universidad;
  private $titulo; 
  private $cod_carrera; 
  private $turno; 
  private $estatus; 
  private $mysql; 
	 
  public function __construct(){
    $this->nacionalidad=null;
    $this->cedula_estudiante=null;
    $this->nombre_estudiante=null;
    $this->apellido_estudiante=null;
    $this->sexo=null;
    $this->edocivil=null;
    $this->cod_parroquia=null;
    $this->pais_residencia=null;
    $this->aniosresidencia=null;
    $this->tlf_fijo=null;
    $this->tlf_movil=null;
    $this->email=null;
    $this->fecha_nacimiento=null;
    $this->trabaja=null;
    $this->dondetrabaja=null;
    $this->tlf_trabajo=null;
    $this->direcciontrabajo=null;
    $this->cargo=null;
    $this->antiguedad=null;
    $this->discapacidad_visual=null;
    $this->discapacidad_auditiva=null;
    $this->discapacidad_motora=null;
    $this->discapacidad_verbal=null;
    $this->direccionresidencia=null;
    $this->cod_parroquia_temp=null;
    $this->direccion_temp=null;
    $this->etnia=null;
    $this->plantel_edu=null;
    $this->ciudad_plantel=null;
    $this->dependencia_plantel=null;
    $this->anio_egreso=null;
    $this->sistema_plantel=null;
    $this->rama_plantel=null;
    $this->prueba_act_acad=null;
    $this->anio_paa=null;
    $this->nro_rusnieu=null;
    $this->anio_rusnieu=null;
    $this->modalidad_ingreso=null;
    $this->modalidad_estudio=null;
    $this->esatleta=null;
    $this->tipo_atleta=null;
    $this->disciplina=null;
    $this->entrenador=null;
    $this->institucion=null;
    $this->posee_titulo=null;
    $this->rif_universidad=null;
    $this->titulo=null;
    $this->cod_carrera=null;
    $this->turno=null;
    $this->estatus=null;
    $this->mysql=new Conexion();
  }
   
  public function __destruct(){}

  public function Transaccion($value){
    if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
    if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
    if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
  }

  public function nacionalidad(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->nacionalidad;

    if($Num_Parametro>0){
      $this->nacionalidad=func_get_arg(0);
    }
  }

  public function cedula_estudiante(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->cedula_estudiante;

    if($Num_Parametro>0){
      $this->cedula_estudiante=func_get_arg(0);
    }
  }

  public function nombre_estudiante(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->nombre_estudiante;

    if($Num_Parametro>0){
      $this->nombre_estudiante=func_get_arg(0);
    }
  }

  public function apellido_estudiante(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->apellido_estudiante;

    if($Num_Parametro>0){
      $this->apellido_estudiante=func_get_arg(0);
    }
  }

  public function sexo(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->sexo;

    if($Num_Parametro>0){
      $this->sexo=func_get_arg(0);
    }
  }

  public function edocivil(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->edocivil;

    if($Num_Parametro>0){
      $this->edocivil=func_get_arg(0);
    }
  }

  public function cod_parroquia(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->cod_parroquia;

    if($Num_Parametro>0){
      $this->cod_parroquia=func_get_arg(0);
    }
  }

  public function pais_residencia(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->pais_residencia;

    if($Num_Parametro>0){
      $this->pais_residencia=func_get_arg(0);
    }
  }

  public function aniosresidencia(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->aniosresidencia;

    if($Num_Parametro>0){
      $this->aniosresidencia=func_get_arg(0);
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

  public function tlf_trabajo(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->tlf_trabajo;

    if($Num_Parametro>0){
      $this->tlf_trabajo=func_get_arg(0);
    }
  }

  public function email(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->email;

    if($Num_Parametro>0){
      $this->email=func_get_arg(0);
    }
  }

  public function antiguedad(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->antiguedad;

    if($Num_Parametro>0){
      $this->antiguedad=func_get_arg(0);
    }
  }

  public function fecha_nacimiento(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->fecha_nacimiento;

    if($Num_Parametro>0){
      $this->fecha_nacimiento=func_get_arg(0);
    }
  }

  public function trabaja(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->trabaja;

    if($Num_Parametro>0){
      $this->trabaja=func_get_arg(0);
    }
  }

  public function discapacidad_visual(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->discapacidad_visual;

    if($Num_Parametro>0){
      $this->discapacidad_visual=func_get_arg(0);
    }
  }

  public function dondetrabaja(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->dondetrabaja;

    if($Num_Parametro>0){
      $this->dondetrabaja=func_get_arg(0);
    }
  }

  public function direcciontrabajo(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->direcciontrabajo;

    if($Num_Parametro>0){
      $this->direcciontrabajo=func_get_arg(0);
    }
  }

  public function discapacidad_auditiva(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->discapacidad_auditiva;

    if($Num_Parametro>0){
      $this->discapacidad_auditiva=func_get_arg(0);
    }
  }

  public function cargo(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->cargo;

    if($Num_Parametro>0){
      $this->cargo=func_get_arg(0);
    }
  }

  public function discapacidad_motora(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->discapacidad_motora;

    if($Num_Parametro>0){
      $this->discapacidad_motora=func_get_arg(0);
    }
  }

  public function discapacidad_verbal(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->discapacidad_verbal;

    if($Num_Parametro>0){
      $this->discapacidad_verbal=func_get_arg(0);
    }
  }

  public function estatus(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->estatus;

    if($Num_Parametro>0){
      $this->estatus=func_get_arg(0);
    }
  }

  public function direccionresidencia(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->direccionresidencia;

    if($Num_Parametro>0){
      $this->direccionresidencia=func_get_arg(0);
    }
  }

  public function cod_parroquia_temp(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->cod_parroquia_temp;

    if($Num_Parametro>0){
      $this->cod_parroquia_temp=func_get_arg(0);
    }
  }

  public function direccion_temp(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->direccion_temp;

    if($Num_Parametro>0){
      $this->direccion_temp=func_get_arg(0);
    }
  }

  public function etnia(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->etnia;

    if($Num_Parametro>0){
      $this->etnia=func_get_arg(0);
    }
  }

  public function plantel_edu(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->plantel_edu;

    if($Num_Parametro>0){
      $this->plantel_edu=func_get_arg(0);
    }
  }

  public function ciudad_plantel(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->ciudad_plantel;

    if($Num_Parametro>0){
      $this->ciudad_plantel=func_get_arg(0);
    }
  }

  public function dependencia_plantel(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->dependencia_plantel;

    if($Num_Parametro>0){
      $this->dependencia_plantel=func_get_arg(0);
    }
  }

  public function sistema_plantel(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->sistema_plantel;

    if($Num_Parametro>0){
      $this->sistema_plantel=func_get_arg(0);
    }
  }

  public function anio_egreso(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->anio_egreso;

    if($Num_Parametro>0){
      $this->anio_egreso=func_get_arg(0);
    }
  }

  public function rama_plantel(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->rama_plantel;

    if($Num_Parametro>0){
      $this->rama_plantel=func_get_arg(0);
    }
  }

  public function prueba_act_acad(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->prueba_act_acad;

    if($Num_Parametro>0){
      $this->prueba_act_acad=func_get_arg(0);
    }
  }

  public function anio_paa(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->anio_paa;

    if($Num_Parametro>0){
      $this->anio_paa=func_get_arg(0);
    }
  }

  public function nro_rusnieu(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->nro_rusnieu;

    if($Num_Parametro>0){
      $this->nro_rusnieu=func_get_arg(0);
    }
  }

  public function anio_rusnieu(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->anio_rusnieu;

    if($Num_Parametro>0){
      $this->anio_rusnieu=func_get_arg(0);
    }
  }

  public function modalidad_ingreso(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->modalidad_ingreso;

    if($Num_Parametro>0){
      $this->modalidad_ingreso=func_get_arg(0);
    }
  }

  public function modalidad_estudio(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->modalidad_estudio;

    if($Num_Parametro>0){
      $this->modalidad_estudio=func_get_arg(0);
    }
  }

  public function esatleta(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->esatleta;

    if($Num_Parametro>0){
      $this->esatleta=func_get_arg(0);
    }
  }

  public function tipo_atleta(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->tipo_atleta;

    if($Num_Parametro>0){
      $this->tipo_atleta=func_get_arg(0);
    }
  }

  public function disciplina(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->disciplina;

    if($Num_Parametro>0){
      $this->disciplina=func_get_arg(0);
    }
  }

  public function entrenador(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->entrenador;

    if($Num_Parametro>0){
      $this->entrenador=func_get_arg(0);
    }
  }

  public function institucion(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->institucion;

    if($Num_Parametro>0){
      $this->institucion=func_get_arg(0);
    }
  }

  public function posee_titulo(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->posee_titulo;

    if($Num_Parametro>0){
      $this->posee_titulo=func_get_arg(0);
    }
  }

  public function rif_universidad(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->rif_universidad;

    if($Num_Parametro>0){
      $this->rif_universidad=func_get_arg(0);
    }
  }

  public function titulo(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->titulo;

    if($Num_Parametro>0){
      $this->titulo=func_get_arg(0);
    }
  }

  public function cod_carrera(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->cod_carrera;

    if($Num_Parametro>0){
      $this->cod_carrera=func_get_arg(0);
    }
  }

  public function turno(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->turno;

    if($Num_Parametro>0){
      $this->turno=func_get_arg(0);
    }
  }

  public function Registrar(){
    $sql="INSERT INTO tpersonas (nacionalidad,cedula,nombres,apellidos,sexo,estado_civil,telefono_fijo,telefono_movil,cod_parroquia,email,fecha_nacimiento) 
    VALUES ('$this->nacionalidad','$this->cedula_estudiante','$this->nombre_estudiante','$this->apellido_estudiante','$this->sexo','$this->edocivil',
    '$this->tlf_fijo','$this->tlf_movil','$this->cod_parroquia','$this->email','$this->fecha_nacimiento');";
      $sql2="INSERT INTO tpre_inscripcion (cedula,fecha,pais_residencia,aniosresidencia,trabaja,dondetrabaja,tlf_trabajo,direcciontrabajo,
      cargo,antiguedad,discapacidad_visual,discapacidad_auditiva,discapacidad_motora,discapacidad_verbal) VALUES ('$this->cedula_estudiante',CURDATE(),
      '$this->pais_residencia','$this->aniosresidencia','$this->trabaja','$this->dondetrabaja','$this->tlf_trabajo','$this->direcciontrabajo',
      '$this->cargo','$this->antiguedad','$this->discapacidad_visual','$this->discapacidad_auditiva','$this->discapacidad_motora','$this->discapacidad_verbal');";
    if($this->mysql->Ejecutar($sql)!=null){
      if($this->mysql->Ejecutar($sql2)!=null)
        return true;
      else
        return false;
    }
  }

  public function InsertarDirecciones(){
    $sql="UPDATE tpersonas p JOIN tpre_inscripcion pi SET p.direccion='$this->direccionresidencia',pi.parroquia_temp='$this->cod_parroquia_temp',
    pi.direccion_temp='$this->direccion_temp',pi.etnia='$this->etnia' WHERE p.cedula = pi.cedula AND p.cedula = '$this->cedula_estudiante'";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else
      return false;
  }

  public function InsertarDatosPlantel(){
    $sql="UPDATE tpre_inscripcion SET plantel_edu='$this->plantel_edu',ciudad_plantel='$this->ciudad_plantel',dependencia_plantel='$this->dependencia_plantel',
    sistema_plantel='$this->sistema_plantel',anio_egreso='$this->anio_egreso',rama_plantel='$this->rama_plantel',prueba_act_acad='$this->prueba_act_acad',
    anio_paa='$this->anio_paa',nro_rusnieu='$this->nro_rusnieu',anio_rusnieu='$this->anio_rusnieu' 
    WHERE cedula = '$this->cedula_estudiante'";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else
      return false;
  }

  public function InsertarDatosIngreso(){
    $sql="UPDATE tpre_inscripcion SET modalidad_ingreso='$this->modalidad_ingreso',modalidad_estudio='$this->modalidad_estudio',esatleta='$this->esatleta',
    tipo_atleta='$this->tipo_atleta',disciplina='$this->disciplina',entrenador='$this->entrenador',institucion='$this->institucion',
    posee_titulo='$this->posee_titulo',rif_universidad='$this->rif_universidad',titulo='$this->titulo',
    cod_carrera='$this->cod_carrera',turno='$this->turno' 
    WHERE cedula = '$this->cedula_estudiante'";
    //echo $sql; die();
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else
      return false;
  }

  public function Comprobar(){
    $sql="SELECT p.cedula,CASE pi.estatus WHEN '1' THEN 'Preinscrito' WHEN '2' THEN 'Por Pruebas' 
    WHEN '3' THEN 'Seleccionado' WHEN '4' THEN 'No Seleccionado' ELSE 'Inscrito' END estatus 
    FROM tpersonas p 
    INNER JOIN tpre_inscripcion pi ON p.cedula = pi.cedula 
    WHERE pi.cedula='$this->cedula_estudiante' AND p.fecha_desactivacion IS NULL";
    $query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
      $tpersonas=$this->mysql->Respuesta($query);
      $this->cedula_estudiante($tpersonas['cedula']);
      $this->estatus($tpersonas['estatus']);
      return true;
    }
    else{
      return false;
    }
  }

  public function BuscarPaisResidencia($cedula){
    $sql="SELECT cedula,pais_residencia FROM tpre_inscripcion WHERE cedula='$cedula'";
    $query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
      $tpersonas=$this->mysql->Respuesta($query);
      $this->cedula_estudiante($tpersonas['cedula']);
      $this->pais_residencia($tpersonas['pais_residencia']);
      return true;
    }
    else{
      return false;
    }
  }

  public function BuscarEstados($filtro){
  $sql = "SELECT e.cod_estado id,e.nombre_estado name, '1' as lvl FROM tpais p 
  INNER JOIN testado e ON p.cod_pais = e.cod_pais 
  WHERE p.nombre_pais = '$filtro'
  ORDER BY e.nombre_estado ASC";
  $query = $this->mysql->Ejecutar($sql);
  while($Obj=$this->mysql->Respuesta_assoc($query)){
    $rows[]=array_map("html_entity_decode",$Obj);
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

  public function BuscarCiudades($filtro){
  $sql = "SELECT c.cod_ciudad id,c.nombre_ciudad name, '2' as lvl FROM testado e 
  INNER JOIN tciudad c ON e.cod_estado = c.cod_estado 
  WHERE e.nombre_estado = '$filtro'
  ORDER BY c.nombre_ciudad ASC";
  $query = $this->mysql->Ejecutar($sql);
  while($Obj=$this->mysql->Respuesta_assoc($query)){
    $rows[]=array_map("html_entity_decode",$Obj);
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

  public function BuscarMunicipios($filtro){
  $sql = "SELECT m.cod_municipio id,m.nombre_municipio name, '3' as lvl FROM tciudad c  
  INNER JOIN tmunicipio m ON m.cod_ciudad = c.cod_ciudad 
  WHERE c.nombre_ciudad = '$filtro'
  ORDER BY m.nombre_municipio ASC";
  $query = $this->mysql->Ejecutar($sql);
  while($Obj=$this->mysql->Respuesta_assoc($query)){
    $rows[]=array_map("html_entity_decode",$Obj);
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

  public function BuscarParroquias($filtro){
  $sql = "SELECT pr.cod_parroquia id,pr.nombre_parroquia name, '4' as lvl FROM tmunicipio m 
  INNER JOIN tparroquia pr ON m.cod_municipio = pr.cod_municipio 
  WHERE m.nombre_municipio = '$filtro'
  ORDER BY pr.nombre_parroquia ASC";
  $query = $this->mysql->Ejecutar($sql);
  while($Obj=$this->mysql->Respuesta_assoc($query)){
    $rows[]=array_map("html_entity_decode",$Obj);
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