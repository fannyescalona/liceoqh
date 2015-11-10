<?php
   require_once("class_bd.php");
class Usuario{
     private $user_name;
     private $password;
     private $cedula;
     private $rol;
     private $p1;
     private $r1;
     private $p2;
     private $r2;

 function __construct(){
    	 
		 $this->mysql=new Conexion();
    
	}
	public function user_name(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->user_name;
     
	 if($Num_Parametro>0){
	   $this->user_name=func_get_arg(0);
	 }
   }
   public function pregunta_uno(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->p1;
     
	 if($Num_Parametro>0){
	   $this->p1=func_get_arg(0);
	 }
   }
   public function pregunta_dos(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->p2;
     
	 if($Num_Parametro>0){
	   $this->p2=func_get_arg(0);
	 }
   }
   public function respuesta_uno(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->r1;
     
	 if($Num_Parametro>0){
	   $this->r1=func_get_arg(0);
	 }
   }
     public function respuesta_dos(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->r2;
     
	 if($Num_Parametro>0){
	   $this->r2=func_get_arg(0);
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
   $this->mysql->Ejecutar($sqlx);
  $sql="insert into tcontrasena (contrasena,nombre_usuario,estado)values('$this->password','$this->user_name',1)";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
     public function Actualizar($user){
    $sql="UPDATE tusuario SET 
	nombre_usuario='$this->user_name',
	pregunta_1 =  '$this->p1',
	respuesta_1 =  '$this->r1',
	pregunta_2 =  '$this->p2',
	respuesta_2=  '$this->r2' WHERE (nombre_usuario='$user')";
    if($this->mysql->Ejecutar($sql)!=null)
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
   
   	public function Desactivar_clave(){
	     $sql="SELECT intento_fallido from tusuario where ((nombre_usuario='$this->user_name') AND (intento_fallido>2))";
	     $sql_action="UPDATE tcontrasena set estado=2 where (nombre_usuario='$this->user_name' and estado=1) ";
        $query=$this->mysql->Ejecutar($sql);
           if($this->mysql->Total_Filas($query)>0){
           	        $query=$this->mysql->Ejecutar($sql_action);
   	               return true;
   	               }
	        else{
	                  return false;
	            }
}	
   
   	public function Intento_Fallido($bool){
     if($bool==true){
	     $sql="update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario='$this->user_name')";
	    }else{ 
	    $sql="update tusuario set intento_fallido=0 where (nombre_usuario='$this->user_name')";
	    }
	if($this->mysql->Ejecutar($sql)!=null){
	return true;
	}else
	return false;
	}	
	
	public function Buscar(){
	$sql="SELECT estado,concat(p.nombres,' ',p.apellidos) as fullname_user, 
	( CASE 
	WHEN (NOW() - INTERVAL 180 DAY) < pas.fecha_modificacion THEN  '0'
	ELSE '1' END) AS caducidad,    
	rol.descripcion AS perfil,rol.codigo_perfil as codigo_perfil, 
	u.nombre_usuario AS name, pas.contrasena AS contrasena, 
	u.cedula as cedula,
	u.pregunta_1 as p1,
	u.pregunta_2 as p2,
	u.respuesta_1 as r1,
	u.activar_caducidad,
	u.respuesta_2 as r2
	FROM tpersona AS p INNER JOIN tusuario AS u ON u.cedula = p.cedula
	INNER JOIN tperfil AS rol ON rol.codigo_perfil = u.codigo_perfil
	INNER JOIN tcontrasena as pas on pas.nombre_usuario=u.nombre_usuario 
	where (u.nombre_usuario='$this->user_name' 
	and pas.contrasena='$this->password' and pas.estado<>0 and u.fecha_desactivacion is null) order by pas.fecha_modificacion desc limit 1";
   $query=$this->mysql->Ejecutar($sql);
   if($this->mysql->Total_Filas($query)>0)
   	   return $this->mysql->Respuesta($query);
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
   $sql="SELECT concat(p.nombres,' ',p.apellidos) as fullname_user, rol.descripcion AS perfil, 
	u.nombre_usuario AS name,
	u.cedula as cedula,
	u.pregunta_1 as p1,
	u.pregunta_2 as p2,
	u.respuesta_1 as r1,
	u.respuesta_2 as r2
FROM tpersona AS p INNER JOIN tusuario AS u ON u.cedula = p.cedula
INNER JOIN tperfil AS rol ON rol.codigo_perfil = u.codigo_perfil
where (u.nombre_usuario='$this->user_name' and u.fecha_desactivacion is null)";
   $query=$this->mysql->Ejecutar($sql);
   if($this->mysql->Total_Filas($query)>0)
   	   return $this->mysql->Respuesta($query);
	   else
	   return null;

}
	public function Buscar_2(){
    $sql="SELECT rol.codigo_perfil AS perfil, 
	u.nombre_usuario ,( CASE 
        WHEN u.fecha_desactivacion IS NULL THEN  'Activo'
        ELSE 'Desactivado' END) AS estatus_usuario
FROM tusuario AS u inner join tperfil as rol  ON u.codigo_perfil = rol.codigo_perfil
where (u.nombre_usuario='$this->user_name')";
   $query=$this->mysql->Ejecutar($sql);
   if($this->mysql->Total_Filas($query)>0)
   	   return $this->mysql->Respuesta($query);
	   else
	   return null;

}

}
?>