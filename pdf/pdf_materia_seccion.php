<?php
      require_once("../librerias/fpdf/fpdf.php");

   session_start();
	class clsFpdf extends FPDF {
	   var $widths;
      var $aligns;
	 //Cabecera de página
		public function Header()
		{
				           $this->SetFont('Arial','',8);	
            $this->Cell(130);	  $this->Cell(60,8,date("d/m/y H:i:s"),0,1,'R',false);	
            				           $this->SetFont('Arial','',10);	
       $this->Image("../images/UDS.jpg" , 10 ,5, 40 , 40, "JPG" ,$_SERVER['HTTP_HOST']."/udesur/vistas");
	    $this->Ln(2);	
	           $this->SetFont('Arial','',10);	
	    $this->Cell(0,6,utf8_decode("REPÚBLICA BOLIVARIANA DE VENEZUELA"),0,1,"C");
		 $this->Cell(0,6,utf8_decode("MINISTERIO DEL PODER POPULAR PARA LA EDUCACIÓN SUPERIOR"),0,1,"C");
		 	           $this->SetFont('Arial','B',10);	
		 $this->Cell(0,6,utf8_decode("UNIVERSIDAD DEPORTIVA DEL SUR"),0,1,"C");
		 	           $this->SetFont('Arial','',10);	
		 		 		 $this->Cell(0,6,utf8_decode("SECRETARÍA GENERAL"),0,1,"C");
		 		 		 $this->SetFont('Arial','B',10);	
		 		 		 		 $this->Cell(0,6,utf8_decode("DIRECCIÓN DE CONTROL DE ESTUDIOS"),0,1,"C");
       $this->SetFont('Arial','B',12);	
       $this->Ln(2);
       $this->Cell(0,6,utf8_decode("LISTADO DE MATERIAS POR SECCIÓN"),0,1,"C");
       $this->SetLineWidth(1.5); 
       $this->SetDrawColor(200, 200, 200);
       $this->Line(15, 70, 195, 70); 
       $this->SetDrawColor(0, 0, 0);
     }

		//Pie de página
	public function Footer()
		{
			//Posición: a 2 cm del final
			$this->SetY(-20);
			//Arial italic 8
			  $this->SetFont("Arial","I",8);
			//Dirección
			//Número de página
			
						   $this->AliasNbPages();
			   $this->Cell(0,5,utf8_decode("Pagina ").$this->PageNo()."/{nb}",0,1,"C");
			   $this->SetFont('Arial','',13);
	         $this->SetFillColor(240,240,240);
            $this->SetTextColor(200, 200, 200);			
		    	$this->Cell(0,5,utf8_decode("______________________________________________________________________________________________________________"),0,1,"C",false);
			   $this->SetFont('Arial','',9);
				$this->SetTextColor(0,0,0);			
            $this->Cell(254);
            $this->Cell(25,8,utf8_decode('Página ').$this->PageNo()."/{nb}",0,1,'C',true);
			//Fecha
       
		   //setlocale(LC_ALL,"es_VE.UTF8");
		   $this->Ln(-7);
			  $this->SetFont("Arial","I",6);
    	    $avanzar=23;
      $this->Cell($avanzar);	
      $uni="Universidad Deportiva del Sur. Consolidando el Sistema Bolivariano del Deporte.";
      $dir="Dirección: Vía Manrique, Av. Universidad, Km. 2 (Villa Deportiva), San Carlos Estado Cojedes,República Bolivariana de Venezuela.";
      $tel="Teléfono: (+58) 0258-4330349 (Control de Estudio), 4331518 (Rectorado)";
    	$this->Cell(130,4,utf8_decode($uni),0,1,"L");
    	$this->Cell($avanzar);	
    	$this->Cell(130,4,utf8_decode($dir),0,1,"L");
    	$this->Cell($avanzar);	
    	$this->Cell(130,4,utf8_decode($tel),0,1,"L");
		
		}
		
		function SetWidths($w)
{
    //Set the array of column widths
    $this->widths=$w;
}

function SetAligns($a)
{
    //Set the array of column alignments
    $this->aligns=$a;
}
 
function Row($data)
{
    //Calculate the height of the row
    $nb=0;
    for($i=0;$i<count($data);$i++)
        $nb=max($nb,$this->NbLines($this->widths[$i],$data[$i]));
    $h=5*$nb;
    //Issue a page break first if needed
    $this->CheckPageBreak($h);
    //Draw the cells of the row
    for($i=0;$i<count($data);$i++)
    {
        $w=$this->widths[$i];
        $a=isset($this->aligns[$i]) ? $this->aligns[$i] : 'C';
        //Save the current position
        $x=$this->GetX();
        $y=$this->GetY();
        //Draw the border
        $this->Rect($x,$y,$w,$h);
        /*
        //Print the text
        if((count($data)-1)==$i && (strtolower($data[count($data)-1])=='desactivado'))        
        $this->SetTextColor(255, 0, 0);
        else 
        $this->SetTextColor(0, 0, 0);
        */
        $this->MultiCell($w,5,$data[$i],0,$a);
        //Put the position to the right of the cell
        $this->SetXY($x+$w,$y);
    }
    //Go to the next line
    $this->Ln($h);
}

function CheckPageBreak($h)
{
    //If the height h would cause an overflow, add a new page immediately
    if($this->GetY()+$h>$this->PageBreakTrigger)
        $this->AddPage($this->CurOrientation);
}

function NbLines($w,$txt)
{
    //Computes the number of lines a MultiCell of width w will take
    $cw=&$this->CurrentFont['cw'];
    if($w==0)
        $w=$this->w-$this->rMargin-$this->x;
    $wmax=($w-2*$this->cMargin)*1000/$this->FontSize;
    $s=str_replace("\r",'',$txt);
    $nb=strlen($s);
    if($nb>0 and $s[$nb-1]=="\n")
        $nb--;
    $sep=-1;
    $i=0;
    $j=0;
    $l=0;
    $nl=1;
    while($i<$nb)
    {
        $c=$s[$i];
        if($c=="\n")
        {
            $i++;
            $sep=-1;
            $j=$i;
            $l=0;
            $nl++;
            continue;
        }
        if($c==' ')
            $sep=$i;
        $l+=$cw[$c];
        if($l>$wmax)
        {
            if($sep==-1)
            {
                if($i==$j)
                    $i++;
            }
            else
                $i=$sep+1;
            $sep=-1;
            $j=$i;
            $l=0;
            $nl++;
        }
        else
            $i++;
    }
    return $nl;
}
		}
		//generar el listado 
		setlocale(LC_ALL,"es_VE.UTF8");
   $lobjPdf=new clsFpdf();
   $lobjPdf->AliasNbPages();
  require_once("../clases/class_bd.php");
  $mysql=new Conexion();
  $sql="SELECT s.seccion, s.nombre_seccion, s.capacidad_min, s.capacidad_max 
        FROM tseccion s
        WHERE s.seccion BETWEEN '".$_POST['seccion_desde']."' AND '".$_POST['seccion_hasta']."'";
  $i=-1;
  $data=$mysql->Ejecutar($sql);
  $var=0;
  $ind=-1;
  $arr=array();
    if($mysql->Total_Filas($data)!=0){
     while($sacar_datos=$mysql->Respuesta($data)) {
      $ind++;
        $arr['seccion'][$ind]=$sacar_datos['seccion'];
        $arr['nombre_seccion'][$ind]=$sacar_datos['nombre_seccion'];
        $arr['capacidad_min'][$ind]=$sacar_datos['capacidad_min'];
        $arr['capacidad_max'][$ind]=$sacar_datos['capacidad_max'];
    }

      for($i=0;$i<count( $arr['seccion']);$i++){
   $lobjPdf->AddPage();
      $lobjPdf->SetFont('Arial','B',12);  
       $lobjPdf->Ln(13);
      
      // $lobjPdf->Line(205, 60, 50, 60);
       $lobjPdf->SetFont("arial","B",12);
   //Table with 20 rows and 5 columns
     $lobjPdf->SetWidths(array(96,17,17,40,25));
    	   $lobjPdf->SetFillColor(0,0,140); 
         $avanzar=35;
         $altura= 5;
    	   $anchura=5;
    	   $color_fondo=false;
    	   $lobjPdf->SetFont('Arial','B',8);

    	   $lobjPdf->Cell($avanzar);
    	   $lobjPdf->SetFont('Arial','B',10);

         //$lobjPdf->Row(array(,"SEM","UC",utf8_decode('CONDICIÓN REPITENCIA'),utf8_decode("SECCIÓN")));
    	   $AL=5.5;
    	   $lobjPdf->SetTextColor(0,0,0);
    	   $lobjPdf->SetFont('Arial','',8);
    	   $lobjPdf->Cell(35,$AL,utf8_decode('CÓDIGO SECCIÓN'),0,0);    
    	   $lobjPdf->Cell(35,$AL,utf8_decode('SECCIÓN'),0,0);    
    	   $lobjPdf->Cell(35,$AL,utf8_decode('CAP. MÁXIMA'),0,0);    
    	   $lobjPdf->Cell(35,$AL,utf8_decode('CAP. MÍNIMA'),0,1);  
    	   $lobjPdf->SetFont('Arial','B',8);
         $lobjPdf->Cell($avanzar);
    	   $lobjPdf->Cell(35,$AL,utf8_decode($arr['seccion'][$i]),0,0);    
    	   $lobjPdf->Cell(35,$AL,utf8_decode($arr['nombre_seccion'][$i]),0,0);    
    	   $lobjPdf->Cell(35,$AL,utf8_decode($arr['capacidad_min'][$i]),0,0);    
    	   $lobjPdf->Cell(35,$AL,utf8_decode($arr['capacidad_max'][$i]),0,1);  
    	   
     	   $lobjPdf->Ln(5);
    	   $lobjPdf->SetLineWidth(0.7); 
    	   $lobjPdf->SetFont('Arial','',8);
    	   $lobjPdf->Cell($avanzar);    
    	   $lobjPdf->Row(array(utf8_decode('UNIDAD CURRICULAR'),utf8_decode('UND CRÉDITO')));
    	   $lobjPdf->SetTextColor(0,0,0);
    	   $lobjPdf->SetFont('Arial','',8);
    	   $lobjPdf->SetTextColor(0,0,0); 
    	   $lobjPdf->SetWidths(array(16,80,17,17,40,25));

         $sqlx="SELECT ms.cod_materia,INITCAP(LOWER(m.nombre_materia)) nombre_materia,m.unidad_curricular 
         FROM tmateria_seccion ms 
         INNER JOIN tmateria m ON ms.cod_materia = m.cod_materia 
         WHERE ms.seccion = '".$arr['seccion'][$i]."'"; 

        $query=$mysql->Ejecutar($sqlx);
        $UC=0;
         while($obj=$mysql->Respuesta($query)) {
          $UC++;
         $lobjPdf->Cell($avanzar);
         empty($obj['cod_materia'])? $ni=" " : $ni=$obj['cod_materia'];
         $lobjPdf->Row(array($ni,
         utf8_decode(ucwords(strtolower($obj['nombre_materia']))),
         utf8_decode(ucwords(strtolower(@utf8_decode($obj['unidad_curricular']))))));
         }
          $lobjPdf->Ln(5);

         $lobjPdf->Cell($avanzar);
        $lobjPdf->Cell(100,$AL,utf8_decode('TOTAL UNIDADES CURRICULARES: '.$UC),0,1);  
        $UC=0;

         
         }
         $lobjPdf->Output("documento","I");
       }else{
            echo "ERROR AL GENERAR ESTE REPORTE!";         	
         	}