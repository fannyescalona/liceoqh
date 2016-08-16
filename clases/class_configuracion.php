<?php
 require_once("class_bd.php");
 class Configuracion
 {
    private $codigo_configuracion; 
    private $descripcion;
	private $longitud_minclave; 
	private $longitud_maxclave; 
	private $cantidad_letrasmayusculas; 
	private $cantidad_letrasminusculas; 
	private $cantidad_caracteresespeciales; 
	private $cantidad_numeros; 
	private $dias_vigenciaclave; 
	private $numero_ultimasclaves;
	private $dias_aviso; 
	private $intentos_fallidos; 
	private $numero_preguntas; 
	private $numero_preguntasaresponder; 
    private $fecha_desactivacion; 
    private $error;
    private $mysql; 
	 
	public function __construct(){
		$this->descripcion=null;
		$this->codigo_configuracion=null;
		$this->longitud_minclave=null;
		$this->longitud_maxclave=null;
		$this->cantidad_letrasmayusculas=null;
		$this->cantidad_letrasminusculas=null;
		$this->cantidad_caracteresespeciales=null;
		$this->cantidad_numeros=null;
		$this->dias_vigenciaclave=null;
		$this->numero_ultimasclaves=null;
		$this->dias_aviso=null;
		$this->intentos_fallidos=null;
		$this->numero_preguntas=null;
		$this->numero_preguntasaresponder=null;
		$this->error=null;
		$this->mysql=new Conexion();
	}
   
 public function __destruct(){}

 public function Transaccion($value){
	 if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
	 if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
	 if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	 }

   public function codigo_configuracion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->codigo_configuracion;
     
	 if($Num_Parametro>0){
	   $this->codigo_configuracion=func_get_arg(0);
	 }
   }

   public function estatus_configuracion(){
      $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->estatus_configuracion;
     
	 if($Num_Parametro>0){
	   $this->estatus_configuracion=func_get_arg(0);
	 }
   }
   
   public function descripcion(){
   $Num_Parametro=func_num_args();
	 if($Num_Parametro==0) return $this->descripcion;
     
	 if($Num_Parametro>0){
	   $this->descripcion=func_get_arg(0);
	 }
   }

    public function longitud_minclave(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->longitud_minclave;

		if($Num_Parametro>0){
			$this->longitud_minclave=func_get_arg(0);
		}
    }

    public function longitud_maxclave(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->longitud_maxclave;

		if($Num_Parametro>0){
			$this->longitud_maxclave=func_get_arg(0);
		}
    }

    public function cantidad_letrasmayusculas(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->cantidad_letrasmayusculas;

		if($Num_Parametro>0){
			$this->cantidad_letrasmayusculas=func_get_arg(0);
		}
    }

    public function cantidad_letrasminusculas(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->cantidad_letrasminusculas;

		if($Num_Parametro>0){
			$this->cantidad_letrasminusculas=func_get_arg(0);
		}
    }

    public function cantidad_caracteresespeciales(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->cantidad_caracteresespeciales;

		if($Num_Parametro>0){
			$this->cantidad_caracteresespeciales=func_get_arg(0);
		}
    }

    public function cantidad_numeros(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->cantidad_numeros;

		if($Num_Parametro>0){
			$this->cantidad_numeros=func_get_arg(0);
		}
    }

    public function dias_vigenciaclave(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->dias_vigenciaclave;

		if($Num_Parametro>0){
			$this->dias_vigenciaclave=func_get_arg(0);
		}
    }

    public function numero_ultimasclaves(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->numero_ultimasclaves;

		if($Num_Parametro>0){
			$this->numero_ultimasclaves=func_get_arg(0);
		}
    }

    public function dias_aviso(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->dias_aviso;

		if($Num_Parametro>0){
			$this->dias_aviso=func_get_arg(0);
		}
    }

    public function intentos_fallidos(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->intentos_fallidos;

		if($Num_Parametro>0){
			$this->intentos_fallidos=func_get_arg(0);
		}
    }

    public function numero_preguntas(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->numero_preguntas;

		if($Num_Parametro>0){
			$this->numero_preguntas=func_get_arg(0);
		}
    }

    public function numero_preguntasaresponder(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->numero_preguntasaresponder;

		if($Num_Parametro>0){
			$this->numero_preguntasaresponder=func_get_arg(0);
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

   public function Registrar(){
    $sql="INSERT INTO tconfiguracion (descripcion,longitud_minclave,longitud_maxclave,cantidad_letrasmayusculas,cantidad_letrasminusculas,
	cantidad_caracteresespeciales,cantidad_numeros,dias_vigenciaclave,numero_ultimasclaves,dias_aviso,intentos_fallidos,numero_preguntas,numero_preguntasaresponder) VALUES 
	('$this->descripcion',$this->longitud_minclave,$this->longitud_maxclave,$this->cantidad_letrasmayusculas,$this->cantidad_letrasminusculas
	,$this->cantidad_caracteresespeciales,$this->cantidad_numeros,$this->dias_vigenciaclave,$this->numero_ultimasclaves,$this->dias_aviso
	,$this->intentos_fallidos,$this->numero_preguntas,$this->numero_preguntasaresponder)";
    if($this->mysql->Ejecutar($sql)!=null)
		return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
     public function Activar(){
    $sql="update tconfiguracion set fecha_desactivacion=NULL where (codigo_configuracion='$this->codigo_configuracion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
    public function Desactivar(){
    $sql="update tconfiguracion set fecha_desactivacion=CURDATE() where (codigo_configuracion='$this->codigo_configuracion');";
    if($this->mysql->Ejecutar($sql)!=null)
	return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
    public function Actualizar(){
    $sql="UPDATE tconfiguracion SET descripcion='$this->descripcion',longitud_minclave=$this->longitud_minclave
	,longitud_maxclave=$this->longitud_maxclave,cantidad_letrasmayusculas=$this->cantidad_letrasmayusculas
	,cantidad_letrasminusculas=$this->cantidad_letrasminusculas,cantidad_caracteresespeciales=$this->cantidad_caracteresespeciales
	,cantidad_numeros=$this->cantidad_numeros,dias_vigenciaclave=$this->dias_vigenciaclave,numero_ultimasclaves=$this->numero_ultimasclaves
	,dias_aviso=$this->dias_aviso,intentos_fallidos=$this->intentos_fallidos,numero_preguntas=$this->numero_preguntas
	,numero_preguntasaresponder=$this->numero_preguntasaresponder  
	WHERE codigo_configuracion='$this->codigo_configuracion'";
    if($this->mysql->Ejecutar($sql)!=null)
		return true;
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   
   public function Consultar(){
    $sql="select *,(CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' ELSE 'Desactivado' END) AS estatus_configuracion from tconfiguracion where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
		$tconfiguracion=$this->mysql->Respuesta($query);
		$this->codigo_configuracion($tconfiguracion['codigo_configuracion']);
		$this->descripcion($tconfiguracion['descripcion']);
	   	$this->longitud_minclave($tconfiguracion['longitud_minclave']);
		$this->longitud_maxclave($tconfiguracion['longitud_maxclave']);
		$this->cantidad_letrasmayusculas($tconfiguracion['cantidad_letrasmayusculas']);
		$this->cantidad_letrasminusculas($tconfiguracion['cantidad_letrasminusculas']);
	   	$this->cantidad_numeros($tconfiguracion['cantidad_numeros']);
		$this->cantidad_caracteresespeciales($tconfiguracion['cantidad_caracteresespeciales']);
		$this->dias_vigenciaclave($tconfiguracion['dias_vigenciaclave']);
		$this->dias_aviso($tconfiguracion['dias_aviso']);
	   	$this->numero_ultimasclaves($tconfiguracion['numero_ultimasclaves']);
		$this->intentos_fallidos($tconfiguracion['intentos_fallidos']);
		$this->numero_preguntas($tconfiguracion['numero_preguntas']);
		$this->numero_preguntasaresponder($tconfiguracion['numero_preguntasaresponder']);
	   	$this->estatus_configuracion($tconfiguracion['estatus_configuracion']);
		$this->fecha_desactivacion($tconfiguracion['fecha_desactivacion']);
		return true;
	}
	else{
		$this->error($this->mysql->Error());
		return false;
	}
   }
   public function Comprobar(){
    $sql="select * from tconfiguracion where descripcion='$this->descripcion'";
	$query=$this->mysql->Ejecutar($sql);
    if($this->mysql->Total_Filas($query)!=0){
	$tconfiguracion=$this->mysql->Respuesta($query);
	$this->codigo_configuracion($tconfiguracion['codigo_configuracion']);
	$this->descripcion($tconfiguracion['descripcion']);
	$this->fecha_desactivacion($tconfiguracion['fecha_desactivacion']);
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
