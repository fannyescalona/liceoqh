<?php
require_once('class_bd.php');

class Auditoria_Proceso 
{
	private $nro_registro;
	private $nombre_usuario;
	private $proceso;
	private $parametro_valor;
    private $mysql; 
	public function __construct()
	{
		$this->nro_registro=null;
		$this->nombre_usuario=null;
		$this->proceso=null;
		$this->parametro_valor=null;
		$this->mysql=new Conexion();
	}

	public function __destruct(){}

	public function Transaccion($value){
		if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
		if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
		if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	}

	public function nro_registro(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->nro_registro;

		if($Num_Parametro>0)
			$this->nro_registro=func_get_arg(0);
	}

	public function nombre_usuario(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->nombre_usuario;

		if($Num_Parametro>0)
			$this->nombre_usuario=func_get_arg(0);
	}

	public function proceso(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->proceso;

		if($Num_Parametro>0)
			$this->proceso=func_get_arg(0);
	}

	public function parametro_valor(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->parametro_valor;

		if($Num_Parametro>0)
			$this->parametro_valor=func_get_arg(0);
	}
   
	public function error(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->error;

		if($Num_Parametro>0)
			$this->error=func_get_arg(0);
	}   

	public function Registrar(){
		$sql="INSERT INTO tauditoria_proceso (nombre_usuario,proceso,parametro_valor) values ('$this->nombre_usuario','$this->proceso','$this->parametro_valor');";
		if($this->mysql->Ejecutar($sql)!=null)
			return true;
		else{
			$this->error($this->mysql->Error());
			return false;
		}
	}

	public function Obtener_Nro_Registro(){
		$sql="SELECT LPAD(id,10,'0') AS nro_registro FROM tauditoria_proceso WHERE nombre_usuario='$this->nombre_usuario' AND proceso = '$this->proceso' AND parametro_valor = '$this->parametro_valor' ORDER BY fecha DESC LIMIT 1";
		$query=$this->mysql->Ejecutar($sql);
	    if($this->mysql->Total_Filas($query)!=0){
			$tauditoria_proceso=$this->mysql->Respuesta($query);
			$this->nro_registro($tauditoria_proceso['nro_registro']);
			return true;
	    }
		else{
			$this->error($this->mysql->Error());
			return false;
		}
	}
}
?>