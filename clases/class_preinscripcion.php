<?php
require_once("class_bd.php");
require_once("class_sendmail.php");
class PreInscripcion{
  private $cod_inscripcion; 
  private $estatus; 
  private $cod_preinscripcion; 
  private $cod_carrera;
  private $seccion;
  private $cedula;
  private $mysql; 
  private $mail;

  public function __construct(){
    $this->mysql=new Conexion();
    $this->mail=new SendMail();
  }

  public function __destruct(){}

  public function Transaccion($value){
    if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
    if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
    if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
  }

  public function cod_inscripcion(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->cod_inscripcion;

    if($Num_Parametro>0){
      $this->cod_inscripcion=func_get_arg(0);
    }
  }
  public function cod_preinscripcion(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->cod_preinscripcion;

    if($Num_Parametro>0){
      $this->cod_preinscripcion=func_get_arg(0);
    }
  }
  public function estatus(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->estatus;

    if($Num_Parametro>0){
      $this->estatus=func_get_arg(0);
    }
  }
  public function cedula(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->cedula;

    if($Num_Parametro>0){
      $this->cedula=func_get_arg(0);
    }
  }

  public function cod_carrera(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->cod_carrera;

    if($Num_Parametro>0){
      $this->cod_carrera=func_get_arg(0);
    }
  }

  public function seccion(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->seccion;

    if($Num_Parametro>0){
      $this->seccion=func_get_arg(0);
    }
  }

  public function Actualizar(){
    $sql="UPDATE tpre_inscripcion SET estatus = 2 WHERE cod_preinscripcion = '$this->cod_preinscripcion'";
    if($this->mysql->Ejecutar($sql)!=null){
      $sql2 = "SELECT CONCAT(p.nombres,' ',p.apellidos) nombre_destinatario, p.email,c.nombre_carrera carrera FROM tpersonas p 
      INNER JOIN tpre_inscripcion pi ON p.cedula = pi.cedula 
      INNER JOIN tcarrera c ON pi.cod_carrera = c.cod_carrera 
      WHERE p.email IS NOT NULL and pi.cod_preinscripcion = '$this->cod_preinscripcion'";
      $query = $this->mysql->Ejecutar($sql2);
      if($this->mysql->Total_Filas($query)!=0){
        $email=$this->mysql->Respuesta($query);
        $mensaje = "<h2>Hola Sr(a) ".$email['nombre_destinatario']."</h2> 
        <br /> 
        Nos complace notificarle que su solicitud de preinscripcion para la carrera \"".$email['carrera']."\"
        ha sido actualizada, por lo tanto su estatus se encuentra en \"Por Pruebas\".
        <br />
        Favor consultar su estatus en el sistema y esperar a que se le notifique cuando debe realizar las pruebas de admisión.
        ";
        $this->mail->to($email['email']);
        $this->mail->toname($email['nombre_destinatario']);
        $this->mail->message($mensaje);
        $this->mail->SendAMail();
        return true;
      }
      else
        return true;
    }else{
      return false;
    }
  }

  public function Seleccionar(){
    $sql="UPDATE tpre_inscripcion SET estatus = 3 WHERE cod_preinscripcion = '$this->cod_preinscripcion'";
    if($this->mysql->Ejecutar($sql)!=null){
      $sql2 = "SELECT CONCAT(p.nombres,' ',p.apellidos) nombre_destinatario, p.email,c.nombre_carrera carrera FROM tpersonas p 
      INNER JOIN tpre_inscripcion pi ON p.cedula = pi.cedula 
      INNER JOIN tcarrera c ON pi.cod_carrera = c.cod_carrera 
      WHERE p.email IS NOT NULL and pi.cod_preinscripcion = '$this->cod_preinscripcion'";
      $query = $this->mysql->Ejecutar($sql2);
      if($this->mysql->Total_Filas($query)!=0){
        $email=$this->mysql->Respuesta($query);
        $mensaje = "<h2>Hola Sr(a) ".$email['nombre_destinatario']."</h2> 
        <br /> 
        Nos complace notificarle que su solicitud de preinscripcion para la carrera \"".$email['carrera']."\"
        ha sido actualizada, por lo tanto su estatus se encuentra en \"Seleccionado\".
        <br />
        Favor consultar su estatus en el sistema y esperar a que se le notifique cuando debe presentar los recaudos para formalizar la inscripción.
        ";
        $this->mail->to($email['email']);
        $this->mail->toname($email['nombre_destinatario']);
        $this->mail->message($mensaje);
        $this->mail->SendAMail();
        return true;
      }
      else
        return true;
    }else{
      return false;
    }
  }

  public function Inscribir(){
    $sql="INSERT INTO tproceso_inscripcion (cod_inscripcion,cod_preinscripcion,cod_carrera,cedula,estatus,fecha_inscripcion) SELECT cod_inscripcion,cod_preinscripcion,cod_carrera,cedula,'C',CURDATE() 
    FROM tpre_inscripcion p,tinscripcion i WHERE i.fecha_cierre >= CURDATE() AND i.fecha_desactivacion IS NULL AND p.cod_preinscripcion = '$this->cod_preinscripcion'";
    if($this->mysql->Ejecutar($sql)!=null){
      $sql1 = "UPDATE tpre_inscripcion SET estatus = '5' WHERE cod_preinscripcion = '$this->cod_preinscripcion'";
      if($this->mysql->Ejecutar($sql1)!=null){
        $sql2="INSERT INTO tpersonales (cod_personal,cedula,cod_rol) SELECT CONCAT(SUBSTRING(nombre_rol,1,2),(SELECT cedula from tpre_inscripcion WHERE cod_preinscripcion='$this->cod_preinscripcion')) cod_personal,
(SELECT cedula from tpre_inscripcion WHERE cod_preinscripcion='$this->cod_preinscripcion') cedula,cod_rol FROM trol WHERE UPPER(nombre_rol) LIKE '%ESTUDIANTE%'";
        if($this->mysql->Ejecutar($sql2)!=null){
          $sql3="INSERT INTO tinscrito_seccion (cod_personal,seccion) SELECT per.cod_personal,'$this->seccion' FROM tpersonales per INNER JOIN tpre_inscripcion pi ON pi.cedula = per.cedula WHERE pi.cod_preinscripcion = '$this->cod_preinscripcion'";
          if($this->mysql->Ejecutar($sql3)!=null){
            $sql4 = "SELECT CONCAT(p.nombres,' ',p.apellidos) nombre_destinatario, p.email,c.nombre_carrera carrera FROM tpersonas p 
            INNER JOIN tpre_inscripcion pi ON p.cedula = pi.cedula 
            INNER JOIN tcarrera c ON pi.cod_carrera = c.cod_carrera 
            WHERE p.email IS NOT NULL and pi.cod_preinscripcion = '$this->cod_preinscripcion'";
            $query = $this->mysql->Ejecutar($sql4);
            if($this->mysql->Total_Filas($query)!=0){
              $email=$this->mysql->Respuesta($query);
              $mensaje = "<h2>Hola Sr(a) ".$email['nombre_destinatario']."</h2> 
              <br /> 
              Nos complace notificarle que su solicitud de preinscripcion para la carrera \"".$email['carrera']."\"
              ha sido aceptada, por lo tanto ya se encuentra inscrito(a).
              <br />
              Favor consultar su estatus en el sistema y esperar a que se le notifique del horario de clases.
              ";
              $this->mail->to($email['email']);
              $this->mail->toname($email['nombre_destinatario']);
              $this->mail->message($mensaje);
              $this->mail->SendAMail();
              return true;
            }
            else
              return true;
          }else
            return false;
        }else
          return false;
      }
      else
        return false;
    }
    else
      return false;
  }

  public function BuscarInfo($cedula){
    //Funcion InitCap() sirve para colocar la primera letra de un texto que tenga mas de 4 letras en mayuscula. 
    //Función personalizada.
    $sql="SELECT CASE pa.nombre_pais WHEN 'VENEZUELA' THEN CONCAT('V-',p.cedula) ELSE CONCAT('E-',p.cedula) END cedula,INITCAP(LOWER(CONCAT(p.nombres,' ',p.apellidos))) nombre_completo,
    DATE_FORMAT(p.fecha_nacimiento,'%d/%m/%Y') fecha_nacimiento,LOWER(p.email) email,CASE p.sexo WHEN 'F' THEN 'Femenino' ELSE 'Masculino' END sexo,
    CASE p.estado_civil WHEN 'S' THEN 'Soltero(a)' WHEN 'C' THEN 'Casado(a)' WHEN 'D' THEN 'Divorciado(a)' ELSE 'Viudo(a)' END edocivil,
    p.telefono_movil,p.telefono_fijo,INITCAP(LOWER(p.direccion)) direccionhab,INITCAP(LOWER(pi.direccion_temp)) direccionresid,
    CASE pi.modalidad_ingreso WHEN 1 THEN 'Prueba de Selección Interna' WHEN 2 THEN 'Atletas de Alta Competencia' WHEN 3 THEN 'Convenio Fundayacucho' WHEN 4 THEN 'Asignados CNU-OPSU' ELSE 'Ninguno' END modalidad_ingreso,
    CASE pi.modalidad_estudio WHEN 1 THEN 'Educación a Distancia' WHEN 2 THEN 'Especialidades Sin Maestrias' ELSE 'Presencial' END modalidad_estudio,
    CASE pi.turno WHEN 'M' THEN 'Mañana' WHEN 'T' THEN 'Tarde' ELSE 'Noche' END turno,car.nombre_carrera carrera
    from tpersonas p 
    inner join tpais pa ON p.nacionalidad=pa.cod_pais 
    inner join tpre_inscripcion pi on p.cedula = pi.cedula 
    inner join tcarrera car on pi.cod_carrera = car.cod_carrera 
    where p.cedula = '$cedula'";
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
