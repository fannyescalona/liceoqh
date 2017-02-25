<?php
	@session_start();
	header ("Content-type: image/png");
	header("Cache-Control: no-cache, must-revalidate");
	header("Expires: Fri, 19 Jan 1994 05:00:00 GMT");
	header("Pragma: no-cache");	
	function obtenCaracterAleatorio($arreglo) {
        $clave_aleatoria = array_rand($arreglo, 1);	//obtén clave aleatoria
        return $arreglo[ $clave_aleatoria ];	//devolver ítem aleatorio
    }
	function obtenCaracterMd5($car) {
        $md5Car = md5($car.Time());	//Codificar el carácter y el tiempo POSIX (timestamp) en md5
        $Mayus = mt_rand(0,1);
        if($Mayus==0) //utilizamos esta variable de control para pasar el caracter a mayuscula o minuscula
        	$arrCar = str_split(strtoupper($md5Car));	
        else
        	$arrCar = str_split(strtolower($md5Car));	
        $carToken = obtenCaracterAleatorio($arrCar);	//obtén un ítem aleatoriamente
        return $carToken;
    }
	function obtenToken($longitud) {
        //crear alfabeto
        $mayus = "ABCDEFGHIJKMNPQRSTUVWXYZ";
        $mayusculas = str_split($mayus);	//Convertir a array
        //crear array de numeros 0-9
        $numeros = range(0,9);
        //revolver arrays
        shuffle($mayusculas);
        shuffle($numeros);
        //Unir arrays
        $arregloTotal = array_merge($mayusculas,$numeros);
        $newToken = "";
        for($i=0;$i<$longitud;$i++) {
            $miCar = obtenCaracterAleatorio($arregloTotal);
            $newToken .= obtenCaracterMd5($miCar);
        }
        return $newToken;
    }
    $cantLetras = 5;
    $tokenCaptcha = obtenToken($cantLetras);
    $_SESSION["captcha"] = md5($tokenCaptcha);
	$imagenCaptcha = imagecreatefrompng("images/captcha.png");
	$infoImagen = getimagesize("images/captcha.png");

	$ColorTexto = imagecolorallocate($imagenCaptcha, 0, 136, 150);
	$colorLineas = imagecolorallocate($imagenCaptcha, 15, 100, 110);
	
	putenv('GDFONTPATH=' . dirname(__FILE__));
	$font="images/comic.ttf";
	imagettftext($imagenCaptcha, 30, 0, 100, 40, $ColorTexto, $font, $tokenCaptcha);

	$cantLineas = 15;
	for($i=0;$i<$cantLineas;$i++){
		$x1 = mt_rand(0, $infoImagen[0]);
		$x2 = mt_rand(0, $infoImagen[0]);
		imageline($imagenCaptcha, $x1, 0, $x2, $infoImagen[1], $colorLineas);
	}
	imagepng($imagenCaptcha);
	imagedestroy($imagenCaptcha);
?>

