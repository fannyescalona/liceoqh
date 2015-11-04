<?php
include_once("class.phpmailer.php");
include_once("class.smtp.php");

class SendMail{
	private $smtpauth;
	private $smtpsecure;
	private $host;
	private $port;
	private $username_mail;
	private $passwd_mail;
	private $from;
	private $fromname;
	private $to;
	private $toname;
	private $subject;
	private $message;
	private $attachment;

	public function __construct(){
		$this->smtpauth=true;
		$this->smtpsecure="ssl";
		$this->host="smtp.gmail.com";
		$this->port=465;
		$this->username_mail="st.udesur@gmail.com";//cambiar cuenta de correo.
		$this->passwd_mail="soport3c3idis5";//cambiar contraseña.
		$this->from="no-reply@gmail.com";//correo del remitente.
		$this->fromname=utf8_decode("Sistema de Inscripción UDSIH");//nombre a mostrar del remitente.
		$this->to=null;
		$this->toname=null;
		$this->subject=utf8_decode("Solicitud de Inscripción");//Asunto del correo.
		$this->message=null;
		$this->attachment=null;
	} 

	public function __destruct(){}

	public function from(){
	    $Num_Parametro=func_num_args();
	    if($Num_Parametro==0) return $this->from;

	    if($Num_Parametro>0){
	      $this->from=func_get_arg(0);
	    }
	}

	public function fromname(){
	    $Num_Parametro=func_num_args();
	    if($Num_Parametro==0) return $this->fromname;

	    if($Num_Parametro>0){
	      $this->fromname=func_get_arg(0);
	    }
	}

	public function to(){
	    $Num_Parametro=func_num_args();
	    if($Num_Parametro==0) return $this->to;

	    if($Num_Parametro>0){
	      $this->to=func_get_arg(0);
	    }
	}

	public function toname(){
	    $Num_Parametro=func_num_args();
	    if($Num_Parametro==0) return $this->toname;

	    if($Num_Parametro>0){
	      $this->toname=func_get_arg(0);
	    }
	}

	public function subject(){
	    $Num_Parametro=func_num_args();
	    if($Num_Parametro==0) return $this->subject;

	    if($Num_Parametro>0){
	      $this->subject=func_get_arg(0);
	    }
	}

	public function message(){
	    $Num_Parametro=func_num_args();
	    if($Num_Parametro==0) return $this->message;

	    if($Num_Parametro>0){
	      $this->message=func_get_arg(0);
	    }
	}

	public function attachment(){
	    $Num_Parametro=func_num_args();
	    if($Num_Parametro==0) return $this->attachment;

	    if($Num_Parametro>0){
	      $this->attachment=func_get_arg(0);
	    }
	}

	public function SendAMail(){
		//Especificamos los datos y configuración del servidor
		$mail = new PHPMailer();
		$mail->IsSMTP();
		$mail->SMTPAuth = $this->smtpauth;
		$mail->SMTPSecure = $this->smtpsecure;
		$mail->Host = $this->host;
		$mail->Port = $this->port;
		 
		//Nos autenticamos con nuestras credenciales en el servidor de correo 
		$mail->Username = $this->username_mail;
		$mail->Password = $this->passwd_mail;
		 
		//Agregamos la información que el correo requiere
		$mail->From = $this->from;
		$mail->FromName = $this->fromname;
		$mail->Subject = $this->subject;
		$mail->MsgHTML($this->message);
		if(!empty($this->attachment)){
			$mail->AddAttachment($this->attachment);
		}
		$mail->AddAddress(strtolower($this->to),strtolower($this->toname));
		$mail->IsHTML(true);
		 
		//Enviamos el correo electrónico
		if($mail->Send())
			return true;
		else 
			return false;
			echo "Error: " . $mail->ErrorInfo;
	}
}
?>
