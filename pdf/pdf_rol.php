<?php
  
      require_once("../librerias/fpdf/fpdf.php");
      $servicio=$_GET['serv'];
   session_start();
  class clsFpdf extends FPDF {
     var $widths;
      var $aligns;
   //Cabecera de página
    public function Header()
    {
     $this->Image("../images/UDS.jpg" , 10 ,15, 40 , 40, "JPG" ,$_SERVER['HTTP_HOST']."/udesur/vistas/");
      $this->Image("../images/cintillo.jpg" , 10 ,5, 270 , 8, "JPG" ,$_SERVER['HTTP_HOST']."/udesur/vistas/");
      $this->Ln(15);  
   $this->SetFont('Arial','B',12);  
  $this->Cell(0,6,"UNIVERSIDAD DEPORTIVA DEL SUR",0,1,"C");
    $this->Cell(0,6,"\"Sistema de Ingreso Estudiantes y Horarios\"",0,1,"C");
       $this->Ln(15); 
   $this->Cell(0,6,'LISTADO DE LOS ROLES O CARGOS',0,1,"C");
   $this->Ln(5);
    
    
     $this->SetFillColor(0,0,140); 
         $avnzar=85;
         $altura=7;
         $anchura=10;
         $color_fondo=false;
         $this->SetFont('Arial','B',10);
         //$this->Row(array("N°","Codigo","Perfil","Estatus"));
         $this->SetTextColor(0,0,0);
                $this->Cell($avnzar);
                $this->Cell($anchura*2,$altura,utf8_decode('CÓDIGO'),1,0,'L',$color_fondo); 
                $this->Cell($anchura*4,$altura,'NOMBRE DEL ROL',1,0,'L',$color_fondo); 
                $this->Cell($anchura*4,$altura,'ESTATUS',1,1,'L',$color_fondo); 
                $this->SetFont('Arial','',12);
                  $this->Cell($avnzar); 
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
      //$this->Cell(0,5,utf8_decode("Pagina ").$this->PageNo()."/{nb}",0,1,"C");
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
        $a=isset($this->aligns[$i]) ? $this->aligns[$i] : 'L';
        //Save the current position
        $x=$this->GetX();
        $y=$this->GetY();
        //Draw the border
        $this->Rect($x,$y,$w,$h);
        
        //Print the text
        if((count($data)-1)==$i && (strtolower($data[count($data)-1])=='desactivado'))        
        $this->SetTextColor(255, 0, 0);
        else 
        $this->SetTextColor(0, 0, 0);
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
   $lobjPdf->AddPage("L");
   $lobjPdf->AliasNbPages();

   $lobjPdf->SetFont("arial","B",8);
   
    $lobjPdf->SetFont('Arial','',12);
   //Table with 20 rows and 5 columns
      $lobjPdf->SetWidths(array(20,40,40,26));
    require_once("../clases/class_bd.php");
    $mysql=new Conexion();
    $sql="select *,
    (CASE WHEN fecha_desactivacion IS NULL THEN  'Activo' 
    ELSE 'Desactivado' END) AS estatus from trol";
  $i=-1;
  $data=$mysql->Ejecutar($sql);
    if($mysql->Total_Filas($data)!=0){
         $lobjPdf->SetFillColor(0,0,140); 
         $avnzar=85;
         $altura=7;
         $anchura=10;
         $color_fondo=false;
         $lobjPdf->SetFont('Arial','B',10);
         //$lobjPdf->Row(array("N°","Codigo","Perfil","Estatus"));
         $lobjPdf->SetTextColor(0,0,0);
         $lobjPdf->SetFont('Arial','',8);
         $lobjPdf->SetTextColor(0,0,0); 
         $xxxx=0;
         while($tperfil=$mysql->Respuesta($data)){
         $lobjPdf->Row(array(

        utf8_decode(ucwords(strtolower(@utf8_decode($tperfil['cod_rol'])))),
       utf8_decode(ucwords(strtolower(@utf8_decode($tperfil['nombre_rol'])))),
       utf8_decode(ucwords(strtolower(@utf8_decode($tperfil['estatus']))))));
          $lobjPdf->Cell($avnzar);         
         }
         
         $lobjPdf->Output('documento',"I");
         }else{
            echo "ERROR AL GENERAR ESTE REPORTE!";          
          }
?>
