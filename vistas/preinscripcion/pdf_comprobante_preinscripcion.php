<?php
  
      require_once("../../librerias/fpdf/fpdf.php");
      @$servicio=$_GET['serv'];
   session_start();
  class clsFpdf extends FPDF {
     var $widths;
      var $aligns;
   //Cabecera de página
    public function Header()
    {
  
      $this->Image("../../images/UDS.jpg" , 10 ,15, 40 , 40, "JPG" ,$_SERVER['HTTP_HOST']."/udesur/");
      $this->Image("../../images/cintillo.jpg" , 10 ,5, 270 , 8, "JPG" ,$_SERVER['HTTP_HOST']."/udesur/");
      $this->Ln(5);  
      $this->SetFont('Arial','B',10); 
    $this->Cell(0,6,utf8_decode("REPÚBLICA BOLIVARIANA DE VENEZUELA"),0,1,"C");
    $this->Cell(0,6,utf8_decode("MINISTERIO DEL PODER POPULAR PARA LA EDUCACIÓN UNIVERSITARIA"),0,1,"C");
    $this->Cell(0,6,utf8_decode("UNIVERSIDAD DEPORTIVA DEL SUR"),0,1,"C");
    $this->Cell(0,6,utf8_decode("SECRETARÍA GENERAL"),0,1,"C");
    $this->Cell(0,6,utf8_decode("DIRECCIÓN DE INGRESO Y PERMANENCIA"),0,1,"C");
   $this->Ln(20);
     $this->SetFillColor(0,71,171); 
         $avnzar=40;
         $altura=7;
         $anchura=10;
         $color_fondo=true;
         $this->SetFont('Arial','B',16);
         //$this->Row(array("N°","Codigo","Perfil","Estatus"));
         $this->SetTextColor(255,255,255);
                $this->Cell($avnzar);
          //$lobjPdf->Cell($anchura*2,$altura,utf8_decode('N°'),1,0,'T',$color_fondo); 
      $this->Cell($anchura*20,$altura,utf8_decode('PROCESO DE INGRESO'),1,1,'C',$color_fondo); 
      $this->Cell($avnzar);
      $this->Ln(0);
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

    function primera_mayuscula($cadena){
      $cadena=mb_convert_case($cadena, MB_CASE_TITLE, "utf8");
      return($cadena);
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
  require_once("../../clases/class_bd.php");
  $mysql=new Conexion();
    $sql="SELECT pi.cedula,CONCAT(p.nombres,' ',p.apellidos) nombre_completo,CASE p.sexo WHEN 'F' THEN 'FEMENINO' ELSE 'MASCULINO' END sexo,
    p.telefono_movil,p.telefono_fijo,pa.nombre_pais pais,p.email,p.direccion,c.nombre_ciudad ciudad,
    CASE pi.modalidad_ingreso WHEN 1 THEN 'Prueba de Selección Interna' WHEN 2 THEN 'Atletas de Alta Competencia' WHEN 3 THEN 'Convenio Fundayacucho' WHEN 4 THEN 'Asignados CNU-OPSU' ELSE 'Ninguno' END modalidad_ingreso,
    CASE pi.modalidad_estudio WHEN 1 THEN 'Educación a Distancia' WHEN 2 THEN 'Especialidades Sin Maestrias' ELSE 'Presencial' END modalidad_estudio,
    extract(year from pi.fecha) anio,car.nombre_carrera 
    from tpersonas p 
    inner join tpre_inscripcion pi on p.cedula = pi.cedula 
    inner join tparroquia par on p.cod_parroquia = par.cod_parroquia 
    inner join tmunicipio m on par.cod_municipio = m.cod_municipio 
    inner join tciudad c on m.cod_ciudad = c.cod_ciudad 
    inner join tpais pa on p.nacionalidad = pa.cod_pais 
    inner join tcarrera car on pi.cod_carrera = car.cod_carrera 
    where p.cedula = '".$_GET['cedula']."'";
   $i=-1;
  $data=$mysql->Ejecutar($sql);
    if($mysql->Total_Filas($data)!=0){
         $lobjPdf->SetFillColor(0,0,140); 
         $avnzar=40;
         $altura=7;
         $anchura=10;
         $color_fondo=false;
         $lobjPdf->SetFont('Arial','B',10);
         //$lobjPdf->Row(array("N°","Codigo","Perfil","Estatus"));
         $lobjPdf->SetTextColor(0,0,0);
         $lobjPdf->SetTextColor(0,0,0); 
         $xxxx=0;
         while($tperfil=$mysql->Respuesta($data)){
          $lobjPdf->Cell($avnzar);
          $lobjPdf->SetFont('Arial','B',12);
          $lobjPdf->Cell($anchura*8,$altura,@utf8_decode('Cédula:'),1,0,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','',12);
          $lobjPdf->Cell($anchura*12,$altura,@utf8_decode($tperfil['cedula']),1,1,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','B',12);
          $lobjPdf->Cell($avnzar);
          $lobjPdf->Cell($anchura*8,$altura,@utf8_decode('Nombre Completo:'),1,0,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','',12);
          $lobjPdf->Cell($anchura*12,$altura,@utf8_decode(primera_mayuscula($tperfil['nombre_completo'])),1,1,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','B',12);
          $lobjPdf->Cell($avnzar);
          $lobjPdf->Cell($anchura*8,$altura,@utf8_decode('Sexo:'),1,0,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','',12);
          $lobjPdf->Cell($anchura*12,$altura,@utf8_decode(primera_mayuscula($tperfil['sexo'])),1,1,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','B',12);
          $lobjPdf->Cell($avnzar);
          $lobjPdf->Cell($anchura*8,$altura,@utf8_decode('Teléfono Móvil:'),1,0,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','',12);
          $lobjPdf->Cell($anchura*12,$altura,@utf8_decode($tperfil['telefono_movil']),1,1,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','B',12);
          $lobjPdf->Cell($avnzar);
          $lobjPdf->Cell($anchura*8,$altura,@utf8_decode('Teléfono Fijo:'),1,0,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','',12);
          $lobjPdf->Cell($anchura*12,$altura,@utf8_decode($tperfil['telefono_fijo']),1,1,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','B',12);
          $lobjPdf->Cell($avnzar);
          $lobjPdf->Cell($anchura*8,$altura,@utf8_decode('Nacionalidad:'),1,0,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','',12);
          $lobjPdf->Cell($anchura*12,$altura,@utf8_decode(primera_mayuscula($tperfil['pais'])),1,1,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','B',12);
          $lobjPdf->Cell($avnzar);
          $lobjPdf->Cell($anchura*8,$altura,@utf8_decode('Correo Electrónico:'),1,0,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','',12);
          $lobjPdf->Cell($anchura*12,$altura,@utf8_decode(strtolower($tperfil['email'])),1,1,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','B',12);
          $lobjPdf->Cell($avnzar);
          $lobjPdf->Cell($anchura*8,$altura,@utf8_decode('Dirección:'),1,0,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','',12);
          $lobjPdf->Cell($anchura*12,$altura,@utf8_decode(primera_mayuscula($tperfil['direccion'])),1,1,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','B',12);
          $lobjPdf->Cell($avnzar);
          $lobjPdf->Cell($anchura*8,$altura,@utf8_decode('Ciudad:'),1,0,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','',12);
          $lobjPdf->Cell($anchura*12,$altura,@utf8_decode(primera_mayuscula($tperfil['ciudad'])),1,1,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','B',12);
          $lobjPdf->Cell($avnzar);
          $lobjPdf->Cell($anchura*8,$altura,@utf8_decode('Modalidad de Ingreso:'),1,0,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','',12);
          $lobjPdf->Cell($anchura*12,$altura,@utf8_decode(primera_mayuscula($tperfil['modalidad_ingreso'])),1,1,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','B',12);
          $lobjPdf->Cell($avnzar);
          $lobjPdf->Cell($anchura*8,$altura,@utf8_decode('Modalidad de Estudios:'),1,0,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','',12);
          $lobjPdf->Cell($anchura*12,$altura,@utf8_decode(primera_mayuscula($tperfil['modalidad_estudio'])),1,1,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','B',12);
          $lobjPdf->Cell($avnzar);
          $lobjPdf->Cell($anchura*8,$altura,@utf8_decode('Año Proceso de Ingreso:'),1,0,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','',12);
          $lobjPdf->Cell($anchura*12,$altura,@utf8_decode($tperfil['anio']),1,1,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','B',12);
          $lobjPdf->Cell($avnzar);
          $lobjPdf->Cell($anchura*8,$altura,@utf8_decode('Programa:'),1,0,'L',$color_fondo);
          $lobjPdf->SetFont('Arial','',12);
          $lobjPdf->Cell($anchura*12,$altura,@utf8_decode(primera_mayuscula($tperfil['nombre_carrera'])),1,1,'L',$color_fondo);
         }
         $lobjPdf->Ln(5);
         $lobjPdf->Cell($avnzar);
         $lobjPdf->SetFont('Arial','BI',10);
         $lobjPdf->Cell($anchura,$altura,@utf8_decode('Importante:'),0,0,'L',$color_fondo);
         $lobjPdf->SetFont('Arial','I',10);
         $lobjPdf->Cell($avnzar*0.25);
         $lobjPdf->Cell($anchura*20,$altura,@utf8_decode('Este documento es de carácter informativo por lo cual no garantiza el ingreso a la institución. Debe guardar esta '),0,1,'L',$color_fondo);
         $lobjPdf->Cell($avnzar*1.7);
         $lobjPdf->Cell($anchura*20,$altura,@utf8_decode('planilla para presentarla posteriormente y formalizar su inscripción si resulta seleccionado.'),0,1,'L',$color_fondo);
         $lobjPdf->Output('documento',"I");
         }else{
            echo "ERROR AL GENERAR ESTE REPORTE!";          
          }
?>