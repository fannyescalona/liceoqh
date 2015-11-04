<?php

include 'securimage.php';

  $img = new Securimage();
  //$valid = $img->check($_POST['code']);

  if($valid == true) {
    echo "<center>Thanks, you entered the correct code.<br />Click <a href=\"{$_SERVER['PHP_SELF']}\">here</a> to go back.</center>";
  } else {
    echo "<center>Sorry, the code you entered was invalid.  <a href=\"javascript:history.go(-1)\">Go back</a> to try again.</center>";
  }
//Change some settings
$img->image_width = 280;
$img->image_height = 120;
$img->perturbation = 0.9;
$img->code_length = rand(5,6);
$img->image_bg_color = new Securimage_Color("#FFFFFF");
$img->use_transparent_text = true;
$img->text_transparency_percentage = 75; // 100 = completely transparent
$img->num_lines = 12;
$img->image_signature = 'Universidad Deportiva del Sur';
$color_captcha= array("#0000A0","#8B0000","#000000","#FFFF00");
$color=rand(0, 3);
$img->text_color = new Securimage_Color($color_captcha[$color]);
$color=rand(0, 3);
$img->line_color = new Securimage_Color($color_captcha[$color]);
$fondo=rand(3, 6);
$fondo=(String) $fondo;
$img->show('backgrounds/bg'.$fondo.'.jpg');
