<?php	
	require_once("class_bd.php");
	class horario{
		private $cedula_docente;
		private $dia;
		private $codigo_ambiente;
		private $codigo_ano_academico;
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

		// Esta funcion devuelva el lapso actual. 
		public function lapso_actual(){
			$sql="SELECT a.codigo_ano_academico,a.descripcion,
			DATE_FORMAT(MIN(l.fecha_inicio),'%d/%m/%Y') AS fi,DATE_FORMAT(MAX(l.fecha_fin),'%d/%m/%Y') AS ff
			FROM tano_academico a 
			INNER JOIN tlapso l ON a.codigo_ano_academico = l.codigo_ano_academico 
			WHERE a.fecha_desactivacion IS NULL AND l.fecha_desactivacion IS NULL AND a.cerrado = 'N' 
			GROUP BY a.codigo_ano_academico,a.descripcion";
			$query=$this->objBD->Ejecutar($sql);
			$rows['lapso_actual']= array();
			$i=-1;
			while($C=$this->objBD->Respuesta_assoc($query)) {
				$i++;
				$rows['lapso_actual']['codigo_ano_academico'][$i]=$C['codigo_ano_academico'];
				$rows['lapso_actual']['nombre_lapso_actual'][$i]=$C['descripcion'];
				$rows['lapso_actual']['fecha_inicio'][$i]=$C['fi'];
				$rows['lapso_actual']['fecha_final'][$i]=$C['ff'];
			}
			return $rows['lapso_actual'];
		}

		// Esta funcion devuelva el lapso por codigo.
		public function lapso_del_codigo($id){
			$sql="SELECT EXTRACT(year FROM MIN(l.fecha_inicio)) AS AFI, EXTRACT(year FROM MAX(l.fecha_fin)) AS AFF,
			EXTRACT(month from MIN(l.fecha_inicio)) AS MFI,EXTRACT(month from MAX(l.fecha_fin)) AS MFF,
			EXTRACT(day from MIN(l.fecha_inicio)) AS DFI,EXTRACT(day from MAX(l.fecha_fin)) AS DFF 
			FROM tano_academico a 
			INNER JOIN tlapso l ON a.codigo_ano_academico = l.codigo_ano_academico 
			WHERE a.fecha_desactivacion IS NULL AND l.fecha_desactivacion IS NULL AND a.codigo_ano_academico = ".$id." 
			GROUP BY a.codigo_ano_academico";
			$query=$this->objBD->Ejecutar($sql);
			$rows['lapso_actual']= array();
			$i=-1;
			if($C=$this->objBD->Respuesta($query)) {
				$rows['lapso_actual']['MFI']=$C['MFI'];
				$rows['lapso_actual']['MFF']=$C['MFF'];
				$rows['lapso_actual']['AFI']=$C['AFI'];
				$rows['lapso_actual']['AFF']=$C['AFF'];
				$rows['lapso_actual']['DFI']=$C['DFI'];
				$rows['lapso_actual']['DFF']=$C['DFF'];
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
			$condicion = "WHERE receso = 'N' "; 
			if($x=="manana"){
				$condicion.="AND turno='M'";
			}
			if($x=="tarde"){
				$condicion.="AND turno='T'";
			}
			if($x=="noche"){
				$condicion.="AND turno='N'";
			} 
			if($x=="todos"){
				$condicion.="AND true";
			}
			if($x=="manana-tarde"){
				$condicion.="AND (turno='M' or turno='T')";
			}
			if($x=="manana-noche"){
				$condicion.="AND (turno='M' or turno='N')";
			}
			if($x=="tarde-noche"){
				$condicion.="AND (turno='T' or turno='N')";
			}
			$sql="SELECT codigo_bloque_hora, descripcion, DATE_FORMAT(hora_inicio,'%h:%i %p') AS hora_inicio,
			DATE_FORMAT(hora_fin,'%h:%i %p') AS hora_fin,turno,hora_academica  
			FROM tbloque_hora 
			$condicion
			ORDER BY codigo_bloque_hora ASC,turno ASC,hora_inicio DESC,hora_fin DESC";
			$query=$this->objBD->Ejecutar($sql);
			$R['hora']=Array();
			$i=-1;
			while($hora=$this->objBD->Respuesta($query)){
				$i++;
				$R['hora']['id'][$i]=$hora['codigo_bloque_hora']; 
				$R['hora']['descripcion'][$i]=$hora['descripcion'];          
				$R['hora']['hora_inicio'][$i]=$hora['hora_inicio'];               
				$R['hora']['hora_fin'][$i]=$hora['hora_fin'];
				$R['hora']['hora_academica'][$i]=$hora['hora_academica'];         
				$R['hora']['id_turno'][$i]=$hora['turno'];               
			}
			return $R['hora'];
		}

		public function dia(){
			$Num_Parametro=func_num_args();
			if($Num_Parametro==0) return $this->dia;

			if($Num_Parametro>0){
				$this->dia=trim(func_get_arg(0));
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

		public function cedula_docente(){
			$Num_Parametro=func_num_args();
			if($Num_Parametro==0) return $this->cedula_docente;

			if($Num_Parametro>0){
				$this->cedula_docente=trim(func_get_arg(0));
			}
		}

		public function codigo_ano_academico(){
			$Num_Parametro=func_num_args();
			if($Num_Parametro==0) return $this->codigo_ano_academico;

			if($Num_Parametro>0){
				$this->codigo_ano_academico=trim(func_get_arg(0));
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
			$sql="SELECT p.nombres,p.apellidos 
			FROM tpersona p 
			INNER JOIN tcargo c ON p.codigo_cargo = c.codigo_cargo 
			WHERE p.cedula = '$this->cedula_docente' AND p.espersonalinstitucion = 'Y' AND c.descripcion LIKE '%DOCENTE%'";
			$query=$this->objBD->Ejecutar($sql);
			$i=-1;
			$bool=false;
			while($Profesor=$this->objBD->Respuesta($query)) {
				$this->nombres($Profesor['nombres']);
				$this->apellidos($Profesor['apellidos']);
				$i++;
				$bool=true;
			}
			return $bool;
		}

		public function Registrar($user){
			$sql="INSERT INTO thorario(dia,codigo_bloque_hora,codigo_ambiente,codigo_ano_academico,codigo_materia,seccion,cedula_docente)
			VALUES ('$this->dia','$this->codigo_bloque_hora','$this->codigo_ambiente','$this->codigo_ano_academico','$this->codigo_materia','$this->seccion','$this->cedula_docente')";
			if($this->objBD->Ejecutar($sql)!=null)
				return true;
			else
				return false;
		}

		public function Comprobar_existencia(){
			$sql="SELECT count(*) as valor FROM thorario 
			where (codigo_ambiente='$this->codigo_ambiente' and seccion='$this->seccion')";
			$query=$this->objBD->Ejecutar($sql);
			$res=$this->objBD->Respuesta($query);
			if($res['valor']>0)
				return true;
			else
				return false;
		}

		public function Comprobar_horario_profesor(){
			$sql="SELECT count(*) as valor FROM thorario 
			WHERE (codigo_materia='$this->codigo_materia' AND seccion='$this->seccion' AND cedula_docente='$this->cedula_docente')";
			$query=$this->objBD->Ejecutar($sql);
			$res=$this->objBD->Respuesta($query);
			if($res['valor']>0)
				return true;
			else
				return false;
		}

		public function Comprobar_existencia_horario_profesor(){
			$sql="SELECT count(*) as valor FROM vhorario 
			WHERE cedula='$this->cedula_docente' AND codigo_ano_academico='$this->codigo_ano_academico'";
			$query=$this->objBD->Ejecutar($sql);
			$res=$this->objBD->Respuesta($query);
			if($res['valor']>0)
				return true;
			else
				return false;
		}

		public function Comprobar_existencia_horario_seccion(){
			$sql="SELECT count(*) as valor FROM vhorario 
			WHERE seccion='$this->seccion' AND codigo_ano_academico='$this->codigo_ano_academico'";
			$query=$this->objBD->Ejecutar($sql);
			$res=$this->objBD->Respuesta($query);
			if($res['valor']>0)
				return true;
			else
				return false;
		}

		public function Consultar(){
			$sql="SELECT dia,hora,celda,codigo_bloque_hora,codigo_ano_academico,cedula,initcap(nombre) AS nombre,initcap(apellido) AS apellido,
			codigo_ambiente,initcap(nombre_ambiente) AS nombre_ambiente,materia,initcap(nombre_materia) AS nombre_materia,seccion,initcap(nombre_seccion) AS nombre_seccion 
			FROM vhorario
			WHERE (codigo_ano_academico='$this->codigo_ano_academico' AND cedula='$this->cedula_docente')";
			$R['hora']=Array();
			$i=-1;
			$query=$this->objBD->Ejecutar($sql);
			while($hora=$this->objBD->Respuesta($query)) {
				$i++;
				$R['hora']['dia'][$i]=$hora['dia'];
				$R['hora']['hora'][$i]=$hora['hora'];
				$R['hora']['celda'][$i]=$hora['celda'];
				$R['hora']['codigo_bloque_hora'][$i]=$hora['codigo_bloque_hora'];
				$R['hora']['codigo_ano_academico'][$i]=$hora['codigo_ano_academico'];
				$R['hora']['cedula'][$i]=$hora['cedula'];
				$R['hora']['nombre'][$i]=$hora['nombre'];
				$R['hora']['apellido'][$i]=$hora['apellido'];
				$R['hora']['codigo_ambiente'][$i]=$hora['codigo_ambiente'];
				$R['hora']['nombre_ambiente'][$i]=$hora['nombre_ambiente'];
				$R['hora']['materia'][$i]=$hora['materia'];
				$R['hora']['nombre_materia'][$i]=$hora['nombre_materia'];
				$R['hora']['seccion'][$i]=$hora['seccion'];
				$R['hora']['nombre_seccion'][$i]=$hora['nombre_seccion'];
			}
			return $R['hora'];
		}



		public function Consultar_H_SECCION(){
			$sql="SELECT dia,hora,celda,codigo_bloque_hora,codigo_ano_academico,cedula,initcap(nombre) AS nombre,initcap(apellido) AS apellido,
			codigo_ambiente,initcap(nombre_ambiente) AS nombre_ambiente,materia,initcap(nombre_materia) AS nombre_materia,seccion,initcap(nombre_seccion) AS nombre_seccion,
			UPPER(nombre_seccion) AS name_seccion 
			FROM vhorario
			WHERE (codigo_ano_academico='$this->codigo_ano_academico' AND seccion='$this->seccion')";
			$R['hora']=Array();
			$i=-1;
			$query=$this->objBD->Ejecutar($sql);
			while($hora=$this->objBD->Respuesta($query)) {
				$i++;
				$R['hora']['dia'][$i]=$hora['dia'];
				$R['hora']['hora'][$i]=$hora['hora'];
				$R['hora']['celda'][$i]=$hora['celda'];
				$R['hora']['codigo_bloque_hora'][$i]=$hora['codigo_bloque_hora'];
				$R['hora']['codigo_ano_academico'][$i]=$hora['codigo_ano_academico'];
				$R['hora']['cedula'][$i]=$hora['cedula'];
				$R['hora']['nombre'][$i]=$hora['nombre'];
				$R['hora']['apellido'][$i]=$hora['apellido'];
				$R['hora']['codigo_ambiente'][$i]=$hora['codigo_ambiente'];
				$R['hora']['nombre_ambiente'][$i]=$hora['nombre_ambiente'];
				$R['hora']['materia'][$i]=$hora['materia'];
				$R['hora']['nombre_materia'][$i]=$hora['nombre_materia'];
				$R['hora']['seccion'][$i]=$hora['seccion'];
				$R['hora']['nombre_seccion'][$i]=$hora['nombre_seccion']; 
				$R['hora']['name_seccion'][$i]=$hora['name_seccion']; 
			}
			return $R['hora'];
		}

		/*
		Método público que permite devolver el horario administrativo de todos los docentes
		*/  	
		public function Horario_completo(){
			$sql="SELECT DISTINCT CONCAT(p.nombres,' ',p.apellidos) AS Name, bh.hora_inicio AS hi, 
			bh.hora_fin AS hf,ha.celda 
			FROM tpersona AS p 
			INNER JOIN vhorario AS ha ON ha.cedula= p.cedula 
			INNER JOIN tbloque_hora AS bh ON bh.codigo_bloque_hora = ha.codigo_bloque_hora 
			WHERE ha.codigo_ano_academico='$this->codigo_ano_academico' 
			ORDER BY celda";
			$R['horario_completo']=Array();
			$i=-1;
			$query=$this->objBD->Ejecutar($sql);
				while($hora=$this->objBD->Respuesta($query)) {
				$i++;
				$R['horario_completo']['nombres'][$i]=$hora['Name'];               
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
			$condicion=" (bloque_hora.turno='M')";
			}
			if($x=="tarde"){
			$condicion=" (bloque_hora.turno='T')";
			}
			if($x=="noche"){
			$condicion=" (bloque_hora.turno='N')";
			} 
			if($x=="todos"){
			$condicion=' true ';
			}

			if($x=="manana-tarde"){
			$condicion=" (bloque_hora.turno='M' or bloque_hora.turno='T')";
			}

			if($x=="manana-noche"){
			$condicion=" (bloque_hora.turno='M' or bloque_hora.turno='N')";
			}

			if($x=="tarde-noche"){
			$condicion=" (bloque_hora.turno='T' or bloque_hora.turno='N')";
			}

			$sql="DELETE FROM thorario WHERE codigo_ambiente='$this->codigo_ambiente' and seccion='$this->seccion'";
			if($this->objBD->Ejecutar($sql)!=null)
				return true;
			else
				return false;
		}
		/*
		Métodos público para consultar el horario academico
		*/  
		public function Consultar_Horario_Academica(){
			$sql="SELECT * from vhorario WHERE cedula='$this->cedula_docente' AND codigo_ano_academico='$this->codigo_ano_academico'";
			$R['hora']=Array();
			$i=-1;
			$query=$this->objBD->Ejecutar($sql);
			while($hora=$this->objBD->Respuesta($query)) {
				$i++;
				$R['hora']['id_hora'][$i]=$hora['celda'];
				$R['hora']['uc'][$i]=$hora['codigo_materia'];
			}
			return $R['hora'];
		}
		/*
		Método público que permite saber cantidad de docentes que esta en los bloque de horas
		*/  
		public function cantidad_profesor_bloque($bloque){
			$sql="SELECT MAX(celda) AS total FROM vhorario
			WHERE codigo_ano_academico='$this->codigo_ano_academico' AND codigo_bloque_hora ='".$bloque."'";
			$query=$this->objBD->Ejecutar($sql);
			$hora=$this->objBD->Respuesta($query);
			return $hora['total'];
		}
		/*
		Método público que permite saber los nombres de los docentes que esta en los bloque de horas
		*/  
		public function nombrar_profesor_en_bloque($celda){
			$sql="SELECT DISTINCT ha.dia, bh.codigo_bloque_hora AS bloque,CONCAT(p.nombres,' ',p.apellidos) AS name, 
			bh.hora_inicio AS hi, bh.hora_fin AS hf,ha.celda
			FROM tpersona AS p 
			INNER JOIN vhorario AS ha ON ha.cedula = p.cedula 
			INNER JOIN tbloque_hora AS bh ON bh.codigo_bloque_hora=ha.codigo_bloque_hora 
			WHERE ha.codigo_ano_academico='$this->codigo_ano_academico' AND trim(ha.celda)='".trim($celda)."' 
			ORDER BY celda";
			$R['profesor']=Array();
			$i=-1;
			$query=$this->objBD->Ejecutar($sql);
			while($hora=$this->objBD->Respuesta($query)) {
				$i++;
				$R['profesor']['nombres'][$i]=@$hora['name'];                            
			}
			return $R['profesor'];
		}
		/*
		Método público que permite calcular el tamano que debe tener las celda en los 
		formulario para que los nombres de los docente no sale de la celda
		*/
		public function Tamano_celda(){
			$sql="SELECT MAX(LENGTH(nombre||' '||apellido)) AS tamano FROM vhorario";
			$query=$this->objBD->Ejecutar($sql);
			$hora=$this->objBD->Respuesta($query);
			return $hora['tamano'];
		}
		/*
		Método público que permite saber el horario academico y administravo de los docente durante un dia
		*/
		public function horario_de_hoy($turno,$dia,$hora){
			$sql="SELECT CONCAT(nombre,' ',apellido) AS fullname, materia AS codigo_materia, seccion, nombre_ambiente AS aula
			FROM vhorario
			WHERE (codigo_ano_academico = '$this->codigo_ano_academico' AND
			trim(lower(turno)) = trim(lower('$turno')) AND dia=trim('$dia') AND 
			trim(lower(codigo_bloque_hora)) = trim(lower('$hora')));";
			$i=-1;	  $R['profesor']=Array();
			$query=$this->objBD->Ejecutar($sql);
			while($hora=$this->objBD->Respuesta($query)){
				$i++;
				$R['profesor']['nombres'][$i]=$hora['fullname']; 
				$R['profesor']['codigo_materia'][$i]=$hora['codigo_materia']; 
				$R['profesor']['seccion'][$i]=$hora['seccion']; 
				$R['profesor']['aula'][$i]=$hora['aula']; 
			}
			return $R['profesor'];
		}

		/*
		Método público que devuelve la fecha del sistema, para los reportes
		*/
		public function FECHA_SISTEMA(){
			$sql="SELECT DATE_FORMAT(NOW(),'%d/%m/%Y') AS fecha, DATE_FORMAT(NOW(),'%h:%i %p') AS hora";
			$query=$this->objBD->Ejecutar($sql);
			$C=$this->objBD->Respuesta($query);
			$fecha_hora= $C['fecha']."   ".$C['hora'];
			return $fecha_hora;
		}

		public function Resultado_Json_de_Consulta($a,$b){
			$sql="SELECT * FROM vhorario where codigo_ambiente='$a' and codigo_ano_academico='$b'";
			$query=$this->objBD->Ejecutar($sql);
			$rows = array();
			while($Actividad=$this->objBD->Respuesta_assoc($query)) {
				$rows[] = $Actividad;
			}
			$json=json_encode($rows);
			return $json;
		}

		public function Resultado_Json_de_Consulta_Seccion($a,$c,$b){
			$sql="SELECT * FROM vhorario where 
			(codigo_ambiente='$a' and codigo_ano_academico='$b' and seccion='$c') OR (codigo_ano_academico='$b' and seccion='$c')";
			$query=$this->objBD->Ejecutar($sql);
			$rows = array();
			while($Actividad=$this->objBD->Respuesta_assoc($query)) {
				$rows[] = $Actividad;
			}
			$json=json_encode($rows);
			return $json;
		}

		public function Resultado_Json_de_Consulta_Validar_Profesor($a,$b,$c){
			$sql="SELECT * FROM vhorario where celda='$a' and codigo_ano_academico='$b' and profesor='$c'";
			$query=$this->objBD->Ejecutar($sql);
			$rows = array();
			while($Actividad=$this->objBD->Respuesta_assoc($query)) {
				$rows[] = $Actividad;
			}
			$json=json_encode($rows);
			return $json;
		}

		public function Resultado_Json_de_Consulta_Horas_Maximas($a,$b){
			$sql="SELECT SUM(h.hora_academica) AS asignado, MAX(p.carga_horaria)-SUM(h.hora_academica) AS libre, MAX(p.carga_horaria) AS total 
			FROM tpersona p 
			LEFT JOIN vhorario h ON p.cedula = h.profesor AND h.codigo_ano_academico = $a 
			WHERE p.cedula = '$b'";
			$query=$this->objBD->Ejecutar($sql);
			$rows = array();
			while($Actividad=$this->objBD->Respuesta_assoc($query)) {
				$rows[] = $Actividad;
			}
			$json=json_encode($rows);
			return $json;
		}

		public function Resultado_Json_de_Consulta_Horas_Materia_Maximas($a,$b){
			$sql="SELECT SUM(h.hora_academica) AS asignado, MAX(m.hora_academica)-SUM(h.hora_academica) AS libre, MAX(m.hora_academica) AS total 
			FROM tmateria m 
			LEFT JOIN vhorario h ON m.codigo_materia = h.materia AND h.codigo_ano_academico = $a 
			WHERE m.codigo_materia = '$b'";
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