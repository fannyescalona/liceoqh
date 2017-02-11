<?php
   require_once("class_bd.php");
class Usuario{
    private $user_name;
    private $password;
    private $cedula;
    private $rol;

 	function __construct(){
 		$this->mysql=new Conexion();
	}

 	public function __destruct(){}

 	public function Transaccion($value){
		if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
		if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
		if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	}
	
	public function user_name(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->user_name;

		if($Num_Parametro>0){
			$this->user_name=func_get_arg(0);
		}
	}
   
	public function password(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return  $this->password;

		if($Num_Parametro>0){
			$this->password=sha1(md5(func_get_arg(0)));
		}
	}

	public function cedula(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->cedula;

		if($Num_Parametro>0){
			$this->cedula=func_get_arg(0);
		}
	}

	public function rol(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->rol;

		if($Num_Parametro>0){
			$this->rol=func_get_arg(0);
		}
	}

   public function error(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->error;
     
	 if($Num_Parametro>0){
	   $this->error=func_get_arg(0);
	 }
   }
   
    public function Activar(){
		$sql="update tusuario set fecha_desactivacion=NULL where (nombre_usuario='$this->user_name');";
		if($this->mysql->Ejecutar($sql)!=null)
			return true;
		else
			return false;
	}

	public function Desactivar(){
		$sql="update tusuario set fecha_desactivacion=CURDATE() where (nombre_usuario='$this->user_name');";
		if($this->mysql->Ejecutar($sql)!=null)
			return true;
		else
			return false;
	}

	public function Cambiar_password(){
		$sqlx="update tcontrasena set estado=0 where (nombre_usuario='$this->user_name')";
		if($this->mysql->Ejecutar($sqlx)!=null){
			$sql="insert into tcontrasena (contrasena,nombre_usuario,estado) values ('$this->password','$this->user_name',1)";
			if($this->mysql->Ejecutar($sql)!=null)
				return true;
		    else{
		      	$this->error($this->mysql->Error());
		      	return false;
		    }
		}
		else{
	      	$this->error($this->mysql->Error());
	      	return false;
	    }
	}

	public function Actualizar($user,$pold,$pnew,$rnew){
    	$con=0;
    	$cpnew = count($pnew);
    	if(count($pold) == count($pnew)){
	    	for($i=0;$i<count($pnew);$i++){
				$sql1="UPDATE trespuesta_secreta SET pregunta = '".$pnew[$i]."',respuesta =  '".$rnew[$i]."' 
				WHERE nombre_usuario='$this->user_name' AND pregunta = '".$pold[$i]."'";
				if($this->mysql->Ejecutar($sql1)!=null)
					$con++;
				else
					$con--;
	    	}
    	}
    	else if(count($pold) < count($pnew)){
    		for($i=0;$i<count($pold);$i++){
				$sql1="UPDATE trespuesta_secreta SET pregunta = '".$pnew[$i]."',respuesta =  '".$rnew[$i]."' 
				WHERE nombre_usuario='$this->user_name' AND pregunta = '".$pold[$i]."'";
				if($this->mysql->Ejecutar($sql1)!=null)
					$con++;
				else
					$con--;
	    	}
	    	for ($j=$con;$j < count($pnew);$j++) { 
	    		$sql2="INSERT INTO trespuesta_secreta (nombre_usuario,pregunta,respuesta) 
	    		VALUES ('$this->user_name','".$pnew[$j]."','".$rnew[$j]."');";
	    		if($this->mysql->Ejecutar($sql2))
	    			$con++;
	    		else
	    			$con--;
	    	}
    	}
    	else{
    		for($i=0;$i<count($pnew);$i++){
				$sql1="UPDATE trespuesta_secreta SET pregunta = '".$pnew[$i]."',respuesta =  '".$rnew[$i]."' 
				WHERE nombre_usuario='$this->user_name' AND pregunta = '".$pold[$i]."'";
				if($this->mysql->Ejecutar($sql1)!=null)
					$con++;
				else
					$con--;
	    	}
	    	for ($k=$con;$k < count($pold);$k++) { 
	    		$sql2="DELETE FROM trespuesta_secreta WHERE nombre_usuario='$this->user_name' AND pregunta='".$pold[$k]."';";
	    		if($this->mysql->Ejecutar($sql2))
	    			$con++;
	    		else
	    			$con--;
	    	}
	    	$cpnew = count($pold);
    	}
    	if($con==$cpnew)
    		return true;
    	else
    		return false;
	}

	public function Actualizar2($user){
		$sql="UPDATE tusuario SET codigo_perfil='$this->rol' WHERE (nombre_usuario='$user')";
		if($this->mysql->Ejecutar($sql)!=null)
			return true;
		else
			return false;
	}

	public function Registrar(){
		$sqlx="insert into tusuario (cedula,nombre_usuario,codigo_perfil) values('$this->cedula','$this->cedula','$this->rol')";
		if($this->mysql->Ejecutar($sqlx)!=null){
			$sql="insert into tcontrasena (estado,nombre_usuario,contrasena) values(3,'$this->cedula','$this->password')";
			$this->mysql->Ejecutar($sql);
			return true;
		}
		else
			return false;
	}
 
	public function Buscar_ultimas_3_clave(){
		$sql="SELECT contrasena from tcontrasena 
		WHERE nombre_usuario='$this->user_name' order by fecha_modificacion desc limit 3";
		$ABC=false;
		$query=$this->mysql->Ejecutar($sql);
		while($a=$this->mysql->Respuesta($query)){
			if($a['contrasena']==$this->password)
				$ABC=true;
		}
		return $ABC;
	}
 
	public function Desactivar_Caducidad_de_clave(){
		$sql="UPDATE tusuario SET activar_caducidad=0 WHERE TRUE;"; 
		$this->mysql->Ejecutar($sql);
	}
 	  
	public function Activar_Caducidad_de_clave($a,$bool){
		if($bool==true){ 	  
			if(!empty($a[0])){ 	         
				foreach($a as $b =>$c){
					$sql="UPDATE tusuario SET activar_caducidad=1 WHERE nombre_usuario='$c'";
					$this->mysql->Ejecutar($sql);  
				}
			}
		}
	}
   
	public function Intento_Fallido($bool){
		if($bool==true){
			$sql="update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario='$this->user_name')";
		}else{
			$sql="update tusuario set intento_fallido=0 where (nombre_usuario='$this->user_name')";
		}
		if($this->mysql->Ejecutar($sql)!=null)
			return true;
		else
			return false;
	}
   
	public function Administrar_Sesion($bool,$sesion){
		if($bool==true){
			$sql="update tusuario set sesion='$sesion',sesion_abierta=(sesion_abierta+1),fecha_ultimasesion = CURDATE() where (nombre_usuario='$this->user_name')";
		}else{
			$sql="update tusuario set sesion_abierta=(CASE WHEN sesion_abierta = 0 THEN 0 ELSE sesion_abierta-1 END) where (nombre_usuario='$this->user_name')";
		}
		if($this->mysql->Ejecutar($sql)!=null)
			return true;
		else
			return false;
	}
   
	public function Reset_Sesion(){
		$sql="update tusuario set sesion_abierta=0 where (nombre_usuario='$this->user_name')";
		if($this->mysql->Ejecutar($sql)!=null)
			return true;
		else
			return false;
	}

	public function Bloquear_Usuario(){
		$sql="SELECT u.intento_fallido FROM tusuario u 
		INNER JOIN tperfil p ON u.codigo_perfil = p.codigo_perfil 
		INNER JOIN tconfiguracion c ON p.codigo_configuracion = c.codigo_configuracion 
		WHERE u.nombre_usuario='$this->user_name' AND u.intento_fallido >= c.intentos_fallidos";
		$sql_action="UPDATE tcontrasena set estado=4 where nombre_usuario='$this->user_name' and estado=1";
		$query=$this->mysql->Ejecutar($sql);
		if($this->mysql->Total_Filas($query)>0){
			$query=$this->mysql->Ejecutar($sql_action);
			return true;
		}
		else 
			return false;
	}

	public function Bloquear_Por_Inactividad(){
		$sql="UPDATE tcontrasena c JOIN tusuario u SET c.estado=4,u.fecha_ultimasesion=NULL WHERE c.nombre_usuario=u.nombre_usuario AND c.nombre_usuario='$this->user_name' AND c.estado=1";
		if($this->mysql->Ejecutar($sql)!=null)
			return true;
		else
			return false;
	}

	public function Buscar($pw){
		$clauseWHERE = "WHERE TRIM(u.nombre_usuario)=TRIM('$this->user_name') AND pas.estado<>0 AND u.fecha_desactivacion IS NULL ";
		if($pw)
			$clauseWHERE .= " AND pas.contrasena='$this->password'";
	    $sql="SELECT pas.estado AS estado,
	    CONCAT(p.nombres,' ',p.apellidos) as fullname_user, 
	    (CASE WHEN (NOW() - INTERVAL conf.dias_vigenciaclave DAY) < pas.fecha_modificacion THEN '0' ELSE '1' END) AS caducidad,
	    pf.descripcion AS perfil,pf.codigo_perfil, 
		u.nombre_usuario AS name, pas.contrasena,
		u.cedula AS cedula,
		rs.pregunta AS preguntas,
		rs.respuesta AS respuestas,
		u.activar_caducidad,
	    conf.dias_aviso,
	    conf.numero_preguntas,
	    conf.numero_preguntasaresponder,
	    conf.dias_vigenciaclave,
	    u.sesion,
	    u.sesion_abierta, 
	    conf.maxsesion,
	    DATEDIFF(NOW(),COALESCE(u.fecha_ultimasesion,NOW())) AS dias_ultimasesion,
	    conf.dias_inactividad 
		FROM tpersona AS p 
		INNER JOIN tusuario AS u ON u.cedula = p.cedula
		INNER JOIN tperfil AS pf ON pf.codigo_perfil = u.codigo_perfil 
		INNER JOIN tconfiguracion AS conf ON pf.codigo_configuracion = conf.codigo_configuracion 
		INNER JOIN tcontrasena AS pas ON pas.nombre_usuario=u.nombre_usuario
		LEFT JOIN trespuesta_secreta AS rs ON u.nombre_usuario = rs.nombre_usuario 
		$clauseWHERE 
		ORDER BY pas.fecha_modificacion DESC";
		$query=$this->mysql->Ejecutar($sql);
		while($Obj[]=$this->mysql->Respuesta_assoc($query))
			$rows=$Obj;
		if(!empty($rows))
	   		return $rows;
		else
		   return null;
	}

	public function Consultar_personal(){
		$sql="SELECT * from tpersona where cedula='$this->cedula' AND espersonalinstitucion='Y'";
		$query=$this->mysql->Ejecutar($sql);
		if($this->mysql->Total_Filas($query)>0)
			return true;
		else
			return false;
	}

	public function Buscar_1(){
		$sql="SELECT concat(p.nombres,' ',p.apellidos) as fullname_user, 
		u.codigo_perfil,
		pf.descripcion AS perfil, 
		u.nombre_usuario AS name,
		c.contrasena AS password,
		u.cedula as cedula,
		rs.pregunta as preguntas,
		rs.respuesta as respuestas,
		c.estado as estado_clave,
	    conf.numero_preguntas,
	    conf.numero_preguntasaresponder 
		FROM tpersona AS p 
		INNER JOIN tusuario AS u ON u.cedula = p.cedula 
		INNER JOIN tcontrasena c ON u.nombre_usuario = c.nombre_usuario AND c.estado <> 0
		INNER JOIN tperfil AS pf ON pf.codigo_perfil = u.codigo_perfil 
		INNER JOIN tconfiguracion AS conf ON pf.codigo_configuracion = conf.codigo_configuracion 
		LEFT JOIN trespuesta_secreta rs ON u.nombre_usuario = rs.nombre_usuario 
		WHERE u.nombre_usuario='$this->user_name' and u.fecha_desactivacion IS NULL 
		ORDER BY RAND()";
		$query=$this->mysql->Ejecutar($sql);
		while($Obj[]=$this->mysql->Respuesta_assoc($query))
			$rows=$Obj;
		if(!empty($rows))
	   		return $rows;
		else
		   return null;
	}

	public function Buscar_2(){
		$sql="SELECT rol.codigo_perfil AS perfil, u.nombre_usuario ,
		(CASE WHEN u.fecha_desactivacion IS NULL THEN  'Activo'ELSE 'Desactivado' END) AS estatus_usuario
		FROM tusuario AS u inner join tperfil as rol  ON u.codigo_perfil = rol.codigo_perfil
		where (u.nombre_usuario='$this->user_name')";
		$query=$this->mysql->Ejecutar($sql);
		if($this->mysql->Total_Filas($query)>0)
			return $this->mysql->Respuesta($query);
		else
			return null;
	}

	public function DesbloquearUsuario(){
		$sql="UPDATE tcontrasena SET estado=1 WHERE nombre_usuario='$this->user_name' AND estado = 4";
		if($this->mysql->Ejecutar($sql)!=null){
			return true;
		}else
			return false;
	}

	public function CompletarDatos($user,$pnew,$rnew){
    	$con=0;
    	$error="";
    	for($i=0;$i<count($pnew);$i++){
			$sql1="INSERT INTO trespuesta_secreta (nombre_usuario,pregunta,respuesta)
			VALUES ('$this->user_name','".$pnew[$i]."','".$rnew[$i]."')";
			if($this->mysql->Ejecutar($sql1)!=null)
				$con++;
			else{
				$error.=$this->mysql->Error().";<br>";
				$con--;
		    }
    	}
    	if(!empty($error))
			$this->error($error);
    	if($con==count($pnew))
    		return true;
    	else
    		return false;
	}
}
?>