<?php	
 require_once("class_bd.php");
 class Horario{
  private $cedula_profesor;
  private $codigo_dia;
  private $codigo_ambiente;
  private $codigo_lapso_academica;
  private $codigo_bloque_hora;
  private $descripcion;
  private $turno;
  private $sede;
  private $seccion;
  private $codigo_materia;
  
  //profesor
    private $cedula;
    function __construct(){
    	 
		 $this->objBD=new Conexion();
    
	}

//profesor
      public function cedula(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->cedula;
     
	 if($Num_Parametro>0){
	   $this->cedula=func_get_arg(0);
	 }
   }
   public function nombre(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->nombre;
     
	 if($Num_Parametro>0){
	   $this->nombre=func_get_arg(0);
	 }
   }
   
    public function apellido(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->apellido;
     
	 if($Num_Parametro>0){
	   $this->apellido=func_get_arg(0);
	 }
   }

	// Esta funcion devuelva el lapso actual. 
	 public function lapso_actual(){
	 	  $sql="SELECT DISTINCT cod_periodo, descripcion, date_format(fecha_inicio, '%d/%m/%Y') AS fi, date_format(fecha_fin,  '%d/%m/%Y' ) AS ff 
	 	  FROM tperiodo WHERE actual='1'";
	     $query=$this->objBD->Ejecutar($sql);
           $rows['lapso_actual']= array();
		   $i=-1;
           while($C=$this->objBD->Respuesta_assoc($query)) {
		     $i++;
            
             $rows['lapso_actual']['fecha_inicio'][$i]=$C['fi'];
             $rows['lapso_actual']['fecha_final'][$i]=$C['ff'];
             $rows['lapso_actual']['nombre_lapso_actual'][$i]=$C['descripcion'];
             $rows['lapso_actual']['cod_periodo'][$i]=$C['cod_periodo'];
            }
			   return $rows['lapso_actual'];
	      }
	      	// Esta funcion devuelva el lapso por codigo.
		   public function lapso_del_codigo($id){
       $sql="SELECT extract(year FROM lap_fecha_inicio) as AFI, extract(year FROM lap_fecha_fin) as AFFF,
		   extract(month from lap_fecha_inicio) as MFI,extract(month from lap_fecha_fin) as MFFF,
		   extract(day from lap_fecha_inicio) as DFI,
		    extract(day from lap_fecha_fin) as DFFF FROM tlapso_academico where cod_lapso_academico='".$id."'";
	     $query=$this->objBD->Ejecutar($sql);
           $rows['lapso_actual']= array();
		   $i=-1;
           if($C=$this->objBD->Respuesta($query)) {
            
             $rows['lapso_actual']['MFI']=$C['mfi'];
             $rows['lapso_actual']['MFFF']=$C['mfff'];
             $rows['lapso_actual']['AFI']=$C['afi'];
             $rows['lapso_actual']['AFFF']=$C['afff'];
             $rows['lapso_actual']['DFI']=$C['dfi'];
             $rows['lapso_actual']['DFFF']=$C['dfff'];
            }
			   return $rows['lapso_actual'];
	      }
	      	// Funcion para iniciar, fininalizar o cancelar una transaccion en la base de datos.
	public function Transaccion($value){
	 if($value=='iniciando') return $this->objBD->Incializar_Transaccion();
	 if($value=='cancelado') return $this->objBD->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->objBD->Finalizar_Transaccion();
	 }
  	// Funcion que devuelva los bloque por turno.	 
	public function bloque_hora($x){	    
	    if($x=="manana"){
		   $condicion="turno='0'";
		 }
		 if($x=="tarde"){
		   $condicion="turno='1'";
		 }
		 if($x=="noche"){
		  $condicion="turno='2'";
		 } 
		 if($x=="todos"){
		 $condicion='true';
		 }
		
		if($x=="manana-tarde"){
		  $condicion="turno='0' or turno='1'";
		 }
		
		if($x=="manana-noche"){
		  $condicion="turno='0' or turno='2'";
		 }
		 
		 if($x=="tarde-noche"){
		  $condicion="turno='1' or turno='2'";
		 }
	
	
 $sql="select turno as id_turno,cod_bloque_hora as id, time_format(hora_inicio,'%H:%i') as desde, 
    time_format(hora_fin,'%H:%i') as hasta from bloque_hora
	where $condicion order by turno,hora_inicio";
	$query=$this->objBD->Ejecutar($sql);
			   $R['hora']=Array();
			   $i=-1;
			   while($hora=$this->objBD->Respuesta($query)) {
			    $i++;
                $R['hora']['id'][$i]=$hora['id'];               
                $R['hora']['desde'][$i]=$hora['desde'];               
                $R['hora']['hasta'][$i]=$hora['hasta'];               
                $R['hora']['id_turno'][$i]=$hora['id_turno'];               
				}
				return $R['hora'];
	
	}
	

	public function codigo_dia(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_dia;
     
	 if($Num_Parametro>0){
	   $this->codigo_dia=trim(func_get_arg(0));
	 }
   }
   	public function seccion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->seccion;
     
	 if($Num_Parametro>0){
	   $this->seccion=trim(func_get_arg(0));
	 }
   }
      	public function codigo_materia(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_materia;
     
	 if($Num_Parametro>0){
	   $this->codigo_materia=trim(func_get_arg(0));
	 }
   }
   public function turno(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->turno;
     
	 if($Num_Parametro>0){
	   $this->turno=trim(func_get_arg(0));
	 }
   }
	public function descripcion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=trim(func_get_arg(0));
	 }
   }
   
   public function codigo_ambiente(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_ambiente;
     
	 if($Num_Parametro>0){
	   $this->codigo_ambiente=trim(func_get_arg(0));
	 }
   }
   
   public function cedula_profesor(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->cedula_profesor;
     
	 if($Num_Parametro>0){
	   $this->cedula_profesor=trim(func_get_arg(0));
	 }
   }
   
   public function codigo_lapso_academica(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_lapso_academica;
     
	 if($Num_Parametro>0){
	   $this->codigo_lapso_academica=trim(func_get_arg(0));
	 }
   }
    
	public function codigo_bloque_hora(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_bloque_hora;
     
	 if($Num_Parametro>0){
	   $this->codigo_bloque_hora=trim(func_get_arg(0));
	 }
   }
   /*
   Métodos público que permite registrar las horas administrativas de los docentes 
*/  

         public function Consultar_cedula(){
	   
                   $sql="SELECT p.nombres AS nombre, p.apellidos AS apellido, 
                   p.cedula AS cedula, p.direccion AS direccion FROM tpersonas AS p
                   INNER JOIN tpersonales AS tp ON p.cedula = tp.cedula
                   WHERE (tp.cedula =  '$this->cedula')";
	           $query=$this->objBD->Ejecutar($sql);
			   $i=-1;
			   $bool=false;
			   while($Profesor=$this->objBD->Respuesta($query)) {
			    $this->nombre($Profesor['nombre']);
			    $this->apellido($Profesor['apellido']);
			    $i++;
				$bool=true;
                }
				return $bool;
            }
            
  public function Registrar(){

    $sql="INSERT INTO thorario(dia,cod_bloque_hora,cod_ambiente,cod_horario_profesor)
          VALUES ('$this->codigo_dia','$this->codigo_bloque_hora','$this->codigo_ambiente',
          (SELECT cod_horario_profesor FROM thorario_profesor WHERE seccion='$this->seccion' 
          AND cod_personal='$this->cedula_profesor' and cod_materia='$this->codigo_materia'))";
   if($this->objBD->Ejecutar($sql)!=null)
	 return true;
	 else
	 return false;
   }
   
     public function Registrar_Horario_Profesor(){

    $sql="INSERT INTO thorario_profesor(cod_materia,seccion,cod_personal)
          VALUES ('$this->codigo_materia','$this->seccion','$this->cedula_profesor')";
   if($this->objBD->Ejecutar($sql)!=null)
	 return true;
	 else
	 return false;
   }
 
  public function Comprobar_existencia(){
	 $sql="select count(*) as valor from thorario h inner join thorario_profesor p 
	 on p.cod_horario_profesor=h.cod_horario_profesor where 
	 (h.cod_ambiente='$this->codigo_ambiente' and p.seccion='$this->seccion')";
	   $query=$this->objBD->Ejecutar($sql);
	   $res=$this->objBD->Respuesta($query);
	   if($res['valor']>0)
	 return true;
	 else
	 return false;
	}
	
	  public function Comprobar_horario_profesor(){
	 $sql="select count(*) as valor from thorario_profesor hp where 
	 (hp.cod_materia='$this->codigo_materia' and hp.seccion='$this->seccion' and hp.cod_personal='$this->cedula_profesor')";
	   $query=$this->objBD->Ejecutar($sql);
	   $res=$this->objBD->Respuesta($query);
	   if($res['valor']>0)
	 return true;
	 else
	 return false;
	}
	
public function Comprobar_existencia_horario_profesor(){
	 $sql="SELECT count(*) as valor FROM vhorario where 
	 cedula='$this->cedula_profesor' and periodo='$this->codigo_lapso_academica'";
	   $query=$this->objBD->Ejecutar($sql);
	   $res=$this->objBD->Respuesta($query);
	   if($res['valor']>0)
	 return true;
	 else
	 return false;
	}
	
	
	public function Comprobar_existencia_horario_seccion(){
	 $sql="SELECT count(*) as valor FROM vhorario where 
	 seccion='$this->seccion' and periodo='$this->codigo_lapso_academica'";
	   $query=$this->objBD->Ejecutar($sql);
	   $res=$this->objBD->Respuesta($query);
	   if($res['valor']>0)
	 return true;
	 else
	 return false;
	}
	
 	
	public function Consultar(){
	
	  $sql="SELECT * from vhorario
	 where (periodo='$this->codigo_lapso_academica' and cedula='$this->cedula_profesor')";
	           $R['hora']=Array();
			   $i=-1;
			   $query=$this->objBD->Ejecutar($sql);
			   while($hora=$this->objBD->Respuesta($query)) {
			    $i++;
                $R['hora']['dia'][$i]=$hora['dia'];               
                $R['hora']['hora'][$i]=$hora['cod_bloque_hora'];               
                $R['hora']['cedula'][$i]=$hora['cedula'];               
                $R['hora']['lapso'][$i]=$hora['periodo'];               
                $R['hora']['ambiente'][$i]=$hora['ambiente'];               
                $R['hora']['nombre_ambiente'][$i]=$hora['nombre_ambiente'];               
                $R['hora']['materia'][$i]=$hora['materia'];               
                $R['hora']['celda'][$i]=$hora['celda'];               
                $R['hora']['nombre_materia'][$i]=$hora['nombre_materia'];               
                
                $R['hora']['seccion'][$i]=$hora['seccion'];               

                $R['hora']['nombre'][$i]=$hora['nombre'];
                $R['hora']['apellido'][$i]=$hora['apellido'];  
				}
				return $R['hora'];
	}
	


	public function Consultar_H_SECCION(){
	
	  $sql="SELECT * from vhorario
	 where (periodo='$this->codigo_lapso_academica' and seccion='$this->seccion')";
	           $R['hora']=Array();
			   $i=-1;
			   $query=$this->objBD->Ejecutar($sql);
			   while($hora=$this->objBD->Respuesta($query)) {
			    $i++;
                $R['hora']['dia'][$i]=$hora['dia'];               
                $R['hora']['hora'][$i]=$hora['cod_bloque_hora'];               
                $R['hora']['cedula'][$i]=$hora['cedula'];               
                $R['hora']['lapso'][$i]=$hora['periodo'];               
                $R['hora']['ambiente'][$i]=$hora['ambiente'];               
                $R['hora']['nombre_ambiente'][$i]=$hora['nombre_ambiente'];               
                $R['hora']['materia'][$i]=$hora['materia'];               
                $R['hora']['celda'][$i]=$hora['celda'];               
                $R['hora']['nombre_materia'][$i]=$hora['nombre_materia'];               
                
                $R['hora']['seccion'][$i]=$hora['seccion'];               

                $R['hora']['nombre'][$i]=$hora['nombre'];
                $R['hora']['apellido'][$i]=$hora['apellido'];  
				}
				return $R['hora'];
	}

/*
   Método público que permite devolver el horario administrativo de todos los docentes
*/  	
	public function Horario_completo(){
	$sql="SELECT DISTINCT ( p.per_nombres||' '||p.per_apellidos) AS Name, bh.blohor_hora_inicio AS hi, 
	 bh.blohor_hora_fin AS hf,(ha.hor_cod_bloque_hora||'-'||ha.hor_cod_dia) AS celda
FROM tpersona AS p
INNER JOIN tpersonal AS pl ON pl.cedulapersona = p.cedula
INNER JOIN thorario_administrativa AS ha ON ha.cedula= pl.cedula
INNER JOIN tbloque_hora AS bh ON bh.cod_bloque_hora = ha.cod_bloque_hora
WHERE (
ha.cod_lapso_academico='$this->codigo_lapso_academica'
)
ORDER BY celda";
	           $R['horario_completo']=Array();
			   $i=-1;
			   $query=$this->objBD->Ejecutar($sql);
			   while($hora=$this->objBD->Respuesta($query)) {
			    $i++;
                $R['horario_completo']['nombre'][$i]=$hora['Name'];               
                $R['horario_completo']['celda'][$i]=$hora['celda'];               
				}
				return $R['horario_completo'];
	
	}
	
	/*
   Método público para eliminar una hora administrativa en la base de datos, eso ayudar en la actualizacion logica del registo 
   ya que posteriormente se vuelve a registrar en la base de datos
*/  
   public function Quitar_hora($x){
   if($x=="manana"){
		   $condicion=" (bloque_hora.turno='0')";
		 }
		 
		 if($x=="tarde"){
		   $condicion=" (bloque_hora.turno='1')";
		 }
		 if($x=="noche"){
		  $condicion=" (bloque_hora.turno='2')";
		 } 
		 if($x=="todos"){
		 $condicion=' true ';
		 }
		
		if($x=="manana-tarde"){
		  $condicion=" (bloque_hora.turno='0' or bloque_hora.turno='1')";
		 }
		
		if($x=="manana-noche"){
		  $condicion=" (bloque_hora.turno='0' or bloque_hora.turno='2')";
		 }
		 
		 if($x=="tarde-noche"){
		  $condicion=" (bloque_hora.turno='1' or bloque_hora.turno='2')";
		  }
  
  $sql="DELETE FROM thorario WHERE cod_ambiente='$this->codigo_ambiente' and cod_horario_profesor IN 
 (SELECT cod_horario_profesor FROM thorario_profesor WHERE seccion='$this->seccion')";
   if($this->objBD->Ejecutar($sql)!=null)
	 return true;
	 else
	 return false;
   }
   /*
   Métodos público para consultar el horario academico
*/  
   public function Consultar_Horario_Academica(){
  $sql="SELECT * from vhorario WHERE cedula='$this->cedula_profesor' 
AND periodo='$this->codigo_lapso_academica'";
            $R['hora']=Array();
			   $i=-1;
			   $query=$this->objBD->Ejecutar($sql);
			   while($hora=$this->objBD->Respuesta($query)) {
			    $i++;
                $R['hora']['id_hora'][$i]=$hora['celda'];                            
                $R['hora']['uc'][$i]=$hora['materia'];                            

				}
				return $R['hora'];
   }
   /*
   Método público que permite saber cantidad de docentes que esta en los bloque de horas
*/  
      public function cantidad_profesor_bloque($bloque){
	   $sql="SELECT MAX(total_celda ) AS total FROM vhorario
	  WHERE (lapso='$this->codigo_lapso_academica' and trim(bloque) =trim('".$bloque."') and 
	  trim(ciudad)=
	  (select sed_zona from tsede where lower(trim(cod_sede))=lower(trim('$this->sede'))) 
	  and trim(pnf)=trim('$this->pnf'));";
	  $query=$this->objBD->Ejecutar($sql);
      $hora=$this->objBD->Respuesta($query);
	  return $hora['total'];
	  }
	   /*
         Método público que permite saber los nombre de los docentes que esta en los bloque de horas
    */  
	  public function nombrar_profesor_en_bloque($celda){
      $sql="SELECT DISTINCT ha.cod_dia, bh.cod_bloque_hora AS bloque,(p.per_nombres||' '||p.per_apellidos) 
	  AS name, bh.blohor_hora_inicio AS hi, bh.blohor_hora_fin AS hf,(ha.cod_bloque_hora||'-'||ha.cod_dia) AS celda
	  FROM tpersona AS p
	  INNER JOIN tpersonal AS pl ON pl.cedulapersona = p.cedula
	  INNER JOIN tdetalle_personal_sede AS tps ON tps.cedula = pl.cedula
	  INNER JOIN thorario_administrativa AS ha ON ha.cedula = pl.cedula
	  INNER JOIN tbloque_hora AS bh ON bh.cod_bloque_hora=ha.cod_bloque_hora
	  WHERE (tps.cod_sede='$this->sede' AND ha.cod_lapso_academico='$this->codigo_lapso_academica' AND 
	  trim((ha.cod_bloque_hora||'-'||ha.cod_dia))='".trim($celda)."')
	  ORDER BY celda;";
	  $R['profesor']=Array();
			   $i=-1;
			   $query=$this->objBD->Ejecutar($sql);
			   while($hora=$this->objBD->Respuesta($query)) {
			    $i++;
              $R['profesor']['nombre'][$i]=@$hora['name'];                            
				}
				return $R['profesor'];
	  }
	     /*
   Método público que permite calcular el tamano que debe tener las celda en los 
   formulario para que los nombre de los docente no sale de la celda
    */
	  public function Tamano_celda(){
	  $sql="SELECT MAX( LENGTH(Name)) AS tamano FROM vhorario";
	   $query=$this->objBD->Ejecutar($sql);
      $hora=$this->objBD->Respuesta($query);
	  return $hora['tamano'];
	  }
	     /*
   Método público que permite saber el horario academico y administravo de los docente durante un dia
*/
	  public function horario_de_hoy($turno,$dia,$hora){
	  $sql="SELECT fullname, materia, seccion, aula
	  FROM vhorario_por_dia WHERE (
	  trim(lower(sede))  =  trim(lower('$this->sede')) AND 
	  trim(lower(lapso)) =  trim(lower('$this->codigo_lapso_academica')) AND 
	  trim(lower(pnf))   =  trim(lower('$this->pnf')) AND 
	  trim(lower(turno)) =  trim(lower('$turno')) AND 
	    dia=trim('$dia') AND 
	  trim(lower(cod_bloque_hora)) = trim(lower('$hora')));";
	  $i=-1;	  $R['profesor']=Array();
			   $query=$this->objBD->Ejecutar($sql);
			   while($hora=$this->objBD->Respuesta($query)) {
			    $i++;
                $R['profesor']['nombre'][$i]=$hora['fullname'];                            
                $R['profesor']['materia'][$i]=$hora['materia'];                            
                $R['profesor']['seccion'][$i]=$hora['seccion'];                            
                $R['profesor']['aula'][$i]=$hora['aula'];                            
				}
				return $R['profesor'];
	  }
	  
	     /*
   Método público que devuelve la fecha del sistema, para los reportes
*/
	    public function FECHA_SISTEMA(){
	  $sql="select date_format(now(),'%d/%m/%Y') as fecha, time_format(now(),'%H:%i:%s') as hora";
	   $query=$this->objBD->Ejecutar($sql);
       $C=$this->objBD->Respuesta($query);
       $fecha_hora= $C['fecha']."   ".$C['hora'];
	   return $fecha_hora;
   
	  }
	public function Resultado_Json_de_Consulta($a,$b){
    $sql="SELECT * FROM vhorario where ambiente='$a' and periodo='$b'";
	$query=$this->objBD->Ejecutar($sql);
    $rows = array();
    while($Actividad=$this->objBD->Respuesta_assoc($query)) {
    $rows[] = $Actividad;
   }
    $json=json_encode($rows);
	return $json;
   }
   
   	public function Resultado_Json_de_Consulta_Seccion($a,$c,$b){
    $sql="SELECT * FROM vhorario where ambiente='$a' and periodo='$b' and seccion='$c'";
	$query=$this->objBD->Ejecutar($sql);
    $rows = array();
    while($Actividad=$this->objBD->Respuesta_assoc($query)) {
    $rows[] = $Actividad;
   }
    $json=json_encode($rows);
	return $json;
   }
   
   public function Resultado_Json_de_Consulta_Validar_Profesor($a,$b,$c){
    $sql="SELECT * FROM vhorario where celda='$a' and periodo='$b' and profesor='$c'";
	$query=$this->objBD->Ejecutar($sql);
    $rows = array();
    while($Actividad=$this->objBD->Respuesta_assoc($query)) {
    $rows[] = $Actividad;
   }
    $json=json_encode($rows);
	return $json;
   }
	public function Actualizar(){}
	public function Desactivar(){}
	public function Activar(){}
 }
?>
