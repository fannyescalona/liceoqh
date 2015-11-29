<?php
  require_once("../clases/class_bd.php");
  $mysql = new Conexion();
  $sql="SELECT p.cedula cedula, CONCAT(p.nombres,' ',p.apellidos) nomape, 
        CASE p.genero WHEN 'F' THEN 'FEMENINO' ELSE 'MASCULINO' END genero, 
        DATE_FORMAT(p.fecha_nacimiento,'%d/%m/%Y') fecha_nacimiento,
        p.codigo_dependencia dependencia, c.descripcion AS cargo,
        (CASE WHEN p.fecha_desactivacion IS NULL THEN  'Activo' ELSE 'Desactivado' END) AS estatus
        FROM tpersona p 
        INNER JOIN tcargo c ON p.codigo_cargo = c.codigo_cargo 
        WHERE p.esestudiante = 'N'";
  $query = $mysql->Ejecutar($sql);

  date_default_timezone_set('America/Caracas');

  /** Se agrega la libreria PHPExcel */
  require_once '../librerias/PHPExcel/PHPExcel.php';

  // Se crea el objeto PHPExcel
  $objPHPExcel = new PHPExcel();

  $tituloReporte = "Listado de Personas";
  $titulosColumnas = array('Cedula', 'Nombre Completo', 'Genero', 'Fecha de Nac.', 'Codigo de Dependencia', 'Cargo', 'Estatus');
  
  $objPHPExcel->setActiveSheetIndex(0)->mergeCells('A1:G1')->mergeCells('A2:G2');
          
  // Se agregan los titulos del reporte
  $objPHPExcel->setActiveSheetIndex(0)
        ->setCellValue('A1', $tituloReporte)
        ->setCellValue('A3', $titulosColumnas[0])
        ->setCellValue('B3', $titulosColumnas[1])
        ->setCellValue('C3', $titulosColumnas[2])
        ->setCellValue('D3', $titulosColumnas[3])
        ->setCellValue('E3', $titulosColumnas[4])
        ->setCellValue('F3', $titulosColumnas[5])
        ->setCellValue('G3', $titulosColumnas[6]);
  
  //Se agregan los datos de los alumnos
  $i = 5;
  while ($row = $mysql->Respuesta($query)){
    $objPHPExcel->setActiveSheetIndex(0)
    ->setCellValue('A'.$i, $row['cedula'])
    ->setCellValue('B'.$i, $row['nomape'])
    ->setCellValue('C'.$i, $row['genero'])
    ->setCellValue('D'.$i, $row['fecha_nacimiento'])
    ->setCellValue('E'.$i, $row['dependencia'])
    ->setCellValue('F'.$i, $row['cargo'])
    ->setCellValue('G'.$i, $row['estatus']);
    $i++;
  }
  
  $estiloTituloReporte = array(
      'font' => array(
          'name'      => 'Verdana',
          'bold'      => true,
          'italic'    => false,
            'strike'    => false,
            'size' =>16,
            'color'     => array('rgb' => '000000')
        ),

        'fill' => array(
      'type'  => PHPExcel_Style_Fill::FILL_SOLID,
      'color' => array('argb' => '969696')
    ),

        'borders' => array(
            'allborders' => array(
              'style' => PHPExcel_Style_Border::BORDER_NONE                    
            )
        ), 

        'alignment' =>  array(
          'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
          'vertical'   => PHPExcel_Style_Alignment::VERTICAL_CENTER,
          'rotation'   => 0,
          'wrap'       => TRUE
    )
    );

  $estiloTituloColumnas = array(
        'font' => array(
            'name'      => 'Arial',
            'bold'      => true,                          
            'color'     => array(
                'rgb' => 'FF0000'
            )
        ),

        'fill'  => array(
      'type' => PHPExcel_Style_Fill::FILL_SOLID,
      'rotation' => 90,
        'startcolor' => array(
            'rgb' => 'FAFAFA'
        )
    ),

        'borders' => array(
            'allborders' => array(
              'style' => PHPExcel_Style_Border::BORDER_NONE                   
            )
        ), 

    'alignment' =>  array(
          'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
          'vertical'   => PHPExcel_Style_Alignment::VERTICAL_CENTER,
          'wrap'          => TRUE
    )
  );
    
  $estiloInformacion = new PHPExcel_Style();
  $estiloInformacion->applyFromArray(
    array(

          'font' => array(
              'name'      => 'Arial',
              'bold'      => true,         
              'color'     => array('rgb' => '000000')
          ),

          'fill'  => array(
        'type'    => PHPExcel_Style_Fill::FILL_SOLID,
        'color'   => array('argb' => 'FFFFFF')
      ),

          'borders' => array(
              'allborders' => array(
                'style' => PHPExcel_Style_Border::BORDER_THIN                   
              )
          ),

          'alignment' =>  array(
          'horizontal' => PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
          'vertical'   => PHPExcel_Style_Alignment::VERTICAL_CENTER,
          'wrap'          => TRUE
    )
      )
  );
   
  $objPHPExcel->getActiveSheet()->getStyle('A1:G1')->applyFromArray($estiloTituloReporte);
  $objPHPExcel->getActiveSheet()->getStyle('A2:G2')->applyFromArray($estiloTituloReporte);
  $objPHPExcel->getActiveSheet()->getStyle('A3:G3')->applyFromArray($estiloTituloColumnas);   
  $objPHPExcel->getActiveSheet()->setSharedStyle($estiloInformacion, "A5:G".($i-1));
  $objPHPExcel->getActiveSheet()->getRowDimension('1')->setRowHeight(30);
      
  for($i = 'A'; $i <= 'F'; $i++){
    $objPHPExcel->setActiveSheetIndex(0)->getColumnDimension($i)->setAutoSize(TRUE);
  }
  
  // Se asigna el nombre a la hoja
  $objPHPExcel->getActiveSheet()->setTitle('Listado Persona');

  // Se activa la hoja para que sea la que se muestre cuando el archivo se abre
  $objPHPExcel->setActiveSheetIndex(0);
  // Inmovilizar paneles 
  //$objPHPExcel->getActiveSheet(0)->freezePane('A4');
  $objPHPExcel->getActiveSheet(0)->freezePaneByColumnAndRow(0,4);

  // Se manda el archivo al navegador web, con el nombre que se indica (Excel2007)
  header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
  header('Content-Disposition: attachment;filename="Listado Persona.xlsx"');
  header('Cache-Control: max-age=0');

  $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
  $objWriter->save('php://output');
  exit;

?>