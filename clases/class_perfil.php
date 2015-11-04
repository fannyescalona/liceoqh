<?php
 require_once("class_bd.php");
 class Perfil
 {
     private $codigo_perfil; 
     private $url_servicios; 
     private $codigo_servicio; 
     private $codigo_modulo; 
     private $codigo_opcion; 
     private $descripcion; 
     private $fecha_desactivacion; 
     private $estatus_perfil; 
     private $mysql; 
	 
   public function __construct(){
     $this->descripcion=null;
     $this->codigo_perfil=null;
	 $this->mysql=new Conexion();
   }
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_perfil(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_perfil;
     
	 if($Num_Parametro>0){
	   $this->codigo_perfil=func_get_arg(0);
	 }
   }
   
      public function estatus_perfil(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_perfil;
     
	 if($Num_Parametro>0){
	   $this->estatus_perfil=func_get_arg(0);
	 }
   }
      public function codigo_servicio(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_servicio;
     
	 if($Num_Parametro>0){
	   $this->codigo_servicio=func_get_arg(0);
	 }
   }
      public function url_servicios(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->url_servicios;
     
	 if($Num_Parametro>0){
	   $this->url_servicios=func_get_arg(0);
	 }
   }
       public function codigo_opcion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_opcion;
     
	 if($Num_Parametro>0){
	   $this->codigo_opcion=func_get_arg(0);
	 }
   }
   
   public function codigo_modulo(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_modulo;
     
	 if($Num_Parametro>0){
	   $this->codigo_modulo=func_get_arg(0);
	 }
   }
   
   public function descripcion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
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
    $sql="insert into tperfil (descripcion) values ('$this->descripcion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
     public function Activar(){
    $sql="update tperfil set fecha_desactivacion=NULL where (codigo_perfil='$this->codigo_perfil');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
    public function Desactivar(){
    $sql="update tperfil set fecha_desactivacion=CURDATE() where (codigo_perfil='$this->codigo_perfil');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
    public function Actualizar(){
    $sql="update tperfil set descripcion='$this->descripcion' where (codigo_perfil='$this->codigo_perfil');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
   
   public function Consultar(){
     $sql="select *,( CASE 
        WHEN fecha_desactivacion IS NULL THEN  'Activo'
        ELSE 'Desactivado' END) AS estatus_perfil from tperfil where 
        descripcion='$this->descripcion' and fecha_desactivacion is null";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tperfil=$this->mysql->Respuesta($query);
	$this->codigo_perfil($tperfil['codigo_perfil']);
	$this->descripcion($tperfil['descripcion']);
   $this->estatus_perfil($tperfil['estatus_perfil']);
	$this->fecha_desactivacion($tperfil['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
   

   public function ELIMINAR_OPCION_SERVICIO_PERFIL(){
    $sql="DELETE FROM tservicio_usuario_opcion where (codigo_perfil='$this->codigo_perfil');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   } 
   
   public function INSERTAR_OPCION_SERVICIO_PERFIL(){
    $sql1="SELECT * FROM tservicio_usuario_opcion WHERE codigo_perfil='$this->codigo_perfil' 
    AND codigo_servicio='$this->codigo_servicio' AND codigo_opcion='$this->codigo_opcion'";
    $sql="INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES 
    ('$this->codigo_perfil','$this->codigo_servicio','$this->codigo_opcion')";
    $query=$this->mysql->Ejecutar($sql1);
    if($this->mysql->Total_Filas($query)==0){
      if($this->mysql->Ejecutar($sql)!=null)
        return true;
      else
        return false;
    }else{
      return false;
    }
   }
     
       public function INSERTAR_SERVICIO_PERFIL(){
    $sql="INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES 
    ('$this->codigo_perfil','$this->codigo_servicio',NULL)";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else
	return false;
   }
      public function Consultar_SERVICIOS(){
   $sql="select * from tservicio_usuario_opcion tsuo 
    inner join tperfil tper on tper.codigo_perfil=tsuo.codigo_perfil 
    inner join tservicio tser on tser.codigo_servicio=tsuo.codigo_servicio 
    where tper.codigo_perfil='$this->codigo_perfil' and tser.codigo_servicio='$this->codigo_servicio' 
    and tser.fecha_desactivacion is null and tper.fecha_desactivacion is null";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	   return true;
	  }
	   else{
	    return false;
	    }
   }
         public function Consultar_OPCIONES(){
    $sql="select * from tservicio_usuario_opcion tsuo 
    inner join tperfil tper on tper.codigo_perfil=tsuo.codigo_perfil 
    inner join tservicio tser on tser.codigo_servicio=tsuo.codigo_servicio
    inner join topcion topc on topc.codigo_opcion=tsuo.codigo_opcion 
    where topc.codigo_opcion='$this->codigo_opcion' and 
    tper.codigo_perfil='$this->codigo_perfil' and 
    tser.codigo_servicio='$this->codigo_servicio' 
    and tser.fecha_desactivacion is null and tper.fecha_desactivacion is null 
    and topc.fecha_desactivacion is null"; 
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	   return true;
	  }
	   else{
	    return false;
	    }
   }
   
      public function IMPRIMIR_MODULOS(){
    $sql="SELECT tmod.codigo_modulo, LOWER(tmod.descripcion) nombre_modulo,tmod.icono, 
    CASE tmod.icono WHEN 'icon-home' THEN '1' WHEN 'icon-list' THEN '2' WHEN 'icon-list-alt' THEN '3' 
    WHEN 'icon-cog' THEN '4' WHEN 'icon-lock' THEN '5' ELSE '6' END 
    FROM tmodulo tmod WHERE tmod.codigo_modulo 
    IN ( SELECT tser.codigo_modulo FROM tservicio tser WHERE tser.codigo_modulo = tmod.codigo_modulo 
    AND tser.codigo_servicio IN ( SELECT tsuo.codigo_servicio FROM tservicio_usuario_opcion tsuo
    WHERE tsuo.codigo_perfil =  '$this->codigo_perfil')) AND tmod.fecha_desactivacion is null 
    ORDER BY 4,LOWER(tmod.descripcion) ASC";
    $x=array();
    $i=0;
	$query=$this->mysql->Ejecutar($sql);
   while($a=$this->mysql->Respuesta($query)){
   	$x[$i]['nombre_modulo']=$a['nombre_modulo'];
   	$x[$i]['codigo_modulo']=$a['codigo_modulo'];
   	$x[$i]['icono']=$a['icono'];
      $i++;     
     }
     return $x;    
 }
  
  
  public function IMPRIMIR_SERVICIOS_OBSOLETO(){
     $sql="SELECT tser.codigo_servicio, LOWER(tser.descripcion) nombre_servicios 
     FROM tservicio tser WHERE tser.codigo_modulo = '$this->codigo_modulo' 
    AND tser.codigo_servicio IN ( SELECT tsuo.codigo_servicio FROM tservicio_usuario_opcion tsuo
    WHERE tsuo.codigo_perfil =  '$this->codigo_perfil')";
	 $x=array();
    $i=0;
	$query=$this->mysql->Ejecutar($sql);
   while($a=$this->mysql->Respuesta($query)){
   	$x[$i]['nombre_servicios']=$a['nombre_servicios'];
   	$x[$i]['codigo_servicio']=$a['codigo_servicio'];
   	$x[$i]['url']=$a['url'];
      $i++;     
     }
     return $x;     
   }
   
    public function IMPRIMIR_SERVICIOS(){
     $sql="SELECT tser.codigo_servicio, LOWER(tser.descripcion) nombre_servicios,url
     FROM tservicio tser WHERE tser.codigo_modulo = '$this->codigo_modulo' 
    AND tser.codigo_servicio IN ( SELECT tsuo.codigo_servicio FROM tservicio_usuario_opcion tsuo
    WHERE tsuo.codigo_perfil =  '$this->codigo_perfil')
    ORDER BY tser.orden,tser.codigo_servicio ASC";
	 $x=array();
    $i=0;
	$query=$this->mysql->Ejecutar($sql);
   while($a=$this->mysql->Respuesta($query)){
   	$x[$i]['nombre_servicios']=$a['nombre_servicios'];
   	$x[$i]['codigo_servicio']=$a['codigo_servicio'];
   	$x[$i]['url']=$a['url'];
      $i++;     
     }
     return $x;     
   }
   
      public function IMPRIMIR_SERVICIOS_USUARIO(){
          $sql="SELECT url FROM tservicio tser 
            WHERE tser.codigo_servicio IN (
                  SELECT tsuo.codigo_servicio FROM tservicio_usuario_opcion tsuo 
                  WHERE tsuo.codigo_perfil =  '$this->codigo_perfil') order by descripcion";
	         $x=array();
            $i=0;
	$query=$this->mysql->Ejecutar($sql);
   while($a=$this->mysql->Respuesta($query)){
   	$x[$i]=$a['url'];
      $i++;     
     }
     return $x;     
   }   
   
   
    public function IMPRIMIR_OPCIONES(){
    $sql="SELECT LOWER(descripcion) nombre_opciones,orden,( CASE 
        WHEN fecha_desactivacion IS NULL THEN  'Activo'
        ELSE 'Desactivado' END) AS estatus FROM topcion topc WHERE topc.codigo_opcion IN 
           ( SELECT tsuo.codigo_opcion FROM tservicio_usuario_opcion tsuo
    WHERE tsuo.codigo_perfil =  '$this->codigo_perfil' and codigo_servicio in (SELECT codigo_servicio from tservicio where 
    url='$this->url_servicios')
    )";

		 $x=array();
    $i=0;
	$query=$this->mysql->Ejecutar($sql);
   while($a=$this->mysql->Respuesta($query)){
   	$x[$i]['nombre_opciones']=$a['nombre_opciones'];
   	$x[$i]['orden']=$a['orden'];
   	$x[$i]['estatus']=$a['estatus'];
      $i++;     
     }
     return $x;   
   }
   
   
   public function Comprobar(){
    $sql="select * from tperfil where descripcion='$this->descripcion'";

	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tperfil=$this->mysql->Respuesta($query);
	$this->codigo_perfil($tperfil['codigo_perfil']);
	$this->descripcion($tperfil['descripcion']);
	$this->fecha_desactivacion($tperfil['fecha_desactivacion']);
	return true;
	}
	else{
	return false;
	}
   }
}
?>
