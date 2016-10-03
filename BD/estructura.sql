--
--
-- create function f_fecha_spanish;
--

DROP FUNCTION IF EXISTS f_fecha_spanish;
DELIMITER //
CREATE FUNCTION f_fecha_spanish(v_fecha DATE,v_tipo int (3)) RETURNS varchar(50)
BEGIN
declare v_dia varchar(20);
declare v_mes varchar(20);
declare t_fecha varchar(60);
case v_tipo
  when 1 then
    case date_format(v_fecha,'%w')
      when 0 then
        set t_fecha = 'Domingo';
      when 1 then
        set t_fecha = 'Lunes';
      when 2 then
        set t_fecha = 'Martes';
      when 3 then
        set t_fecha = 'Miercoles';
      when 4 then
        set t_fecha = 'Jueves';
      when 5 then
        set t_fecha = 'Viernes';
      when 6 then
        set t_fecha = 'Sábado';
    end case;
  when 2 then
    case date_format(v_fecha,'%m')
      when '01' then
        set t_fecha = 'Enero';
      when '02' then
        set t_fecha = 'Febrero';
      when '03' then
        set t_fecha = 'Marzo';
      when '04' then
        set t_fecha = 'Abril';
      when '05' then
        set t_fecha = 'Mayo';
      when '06' then
        set t_fecha = 'Junio';
      when '07' then
        set t_fecha = 'Julio';
      when '08' then
        set t_fecha = 'Agosto';
      when '09' then
        set t_fecha = 'Septiembre';
      when '10' then
        set t_fecha = 'Octubre';
      when '11' then
        set t_fecha = 'Noviembre';
      when '12' then
        set t_fecha = 'Diciembre';
    end case;
  when 3 then
    case date_format(v_fecha,'%w')
      when 0 then
        set t_fecha = 'Domingo';
      when 1 then
        set t_fecha = 'Lunes';
      when 2 then
        set t_fecha = 'Martes';
      when 3 then
        set t_fecha = 'Miercoles';
      when 4 then
        set t_fecha = 'Jueves';
      when 5 then
        set t_fecha = 'Viernes';
      when 6 then
        set t_fecha = 'Sábado';
    end case;
    case date_format(v_fecha,'%m')
      when '01' then
        set t_fecha = concat(t_fecha,' ',day(v_fecha), ' de Enero del Año ',year(v_fecha));
      when '02' then
        set t_fecha = concat(t_fecha,' ',day(v_fecha), ' de Febrero del Año ',year(v_fecha));
      when '03' then
        set t_fecha = concat(t_fecha,' ',day(v_fecha), ' de Marzo del Año ',year(v_fecha));
      when '04' then
        set t_fecha = concat(t_fecha,' ',day(v_fecha), ' de Abril del Año ',year(v_fecha));
      when '05' then
        set t_fecha = concat(t_fecha,' ',day(v_fecha), ' de Mayo del Año ',year(v_fecha));
      when '06' then
        set t_fecha = concat(t_fecha,' ',day(v_fecha), ' de Junio del Año ',year(v_fecha));
      when '07' then
        set t_fecha = concat(t_fecha,' ',day(v_fecha), ' de Julio del Año ',year(v_fecha));
      when '08' then
        set t_fecha = concat(t_fecha,' ',day(v_fecha), ' de Agosto del Año ',year(v_fecha));
      when '09' then
        set t_fecha = concat(t_fecha,' ',day(v_fecha), ' de Septiembre del Año ',year(v_fecha));
      when '10' then
        set t_fecha = concat(t_fecha,' ',day(v_fecha), ' de Octubre del Año ',year(v_fecha));
      when '11' then
        set t_fecha = concat(t_fecha,' ',day(v_fecha), ' de Noviembre del Año ',year(v_fecha));
      when '12' then
        set t_fecha = concat(t_fecha,' ',day(v_fecha), ' de Diciembre del Año ',year(v_fecha));
    end case;
end case;
return t_fecha;
END //

--
--
-- create function letras;
--

DROP FUNCTION IF EXISTS letras;
CREATE FUNCTION letras(XNumero NUMERIC(20,2),  XMoneda VARCHAR(100)) RETURNS VARCHAR(512) 
DETERMINISTIC 

BEGIN 
DECLARE XlnEntero INT; 
DECLARE XlcRetorno VARCHAR(512); 
DECLARE XlnTerna INT; 
DECLARE XlcMiles VARCHAR(512); 
DECLARE XlcCadena VARCHAR(512); 
DECLARE XlnUnidades INT; 
DECLARE XlnDecenas INT; 
DECLARE XlnCentenas INT; 
DECLARE XlnFraccion INT; 
DECLARE Xresultado varchar(512); 

SET XlnEntero = FLOOR(XNumero); 
SET XlnFraccion = (XNumero - XlnEntero) * 100; 
SET XlcRetorno = ''; 
SET XlnTerna = 1 ; 
    WHILE( XlnEntero > 0) DO 

        #Recorro terna por terna 
        SET XlcCadena = ''; 
        SET XlnUnidades = XlnEntero MOD 10; 
        SET XlnEntero = FLOOR(XlnEntero/10); 
        SET XlnDecenas = XlnEntero MOD 10; 
        SET XlnEntero = FLOOR(XlnEntero/10); 
        SET XlnCentenas = XlnEntero MOD 10; 
        SET XlnEntero = FLOOR(XlnEntero/10); 

        #Analizo las unidades 
        SET XlcCadena = 
            CASE # UNIDADES 
                WHEN XlnUnidades = 1 AND XlnTerna = 1 THEN CONCAT('UNO ', XlcCadena) 
                WHEN XlnUnidades = 1 AND XlnTerna <> 1 THEN CONCAT('UN ', XlcCadena) 
                WHEN XlnUnidades = 2 THEN CONCAT('DOS ', XlcCadena) 
                WHEN XlnUnidades = 3 THEN CONCAT('TRES ', XlcCadena) 
                WHEN XlnUnidades = 4 THEN CONCAT('CUATRO ', XlcCadena) 
                WHEN XlnUnidades = 5 THEN CONCAT('CINCO ', XlcCadena) 
                WHEN XlnUnidades = 6 THEN CONCAT('SEIS ', XlcCadena) 
                WHEN XlnUnidades = 7 THEN CONCAT('SIETE ', XlcCadena) 
                WHEN XlnUnidades = 8 THEN CONCAT('OCHO ', XlcCadena) 
                WHEN XlnUnidades = 9 THEN CONCAT('NUEVE ', XlcCadena) 
                ELSE XlcCadena 
            END; #UNIDADES 

        #Analizo las decenas 
        SET XlcCadena = 
            CASE #DECENAS 
                WHEN XlnDecenas = 1 THEN 
                    CASE XlnUnidades 
                        WHEN 0 THEN 'DIEZ ' 
                        WHEN 1 THEN 'ONCE ' 
                        WHEN 2 THEN 'DOCE ' 
                        WHEN 3 THEN 'TRECE ' 
                        WHEN 4 THEN 'CATORCE ' 
                        WHEN 5 THEN 'QUINCE' 
                        ELSE CONCAT('DIECI', XlcCadena) 
                    END 
                WHEN XlnDecenas = 2 AND XlnUnidades = 0 THEN CONCAT('VEINTE ', XlcCadena) 
                WHEN XlnDecenas = 2 AND XlnUnidades <> 0 THEN CONCAT('VEINTI', XlcCadena) 
                WHEN XlnDecenas = 3 AND XlnUnidades = 0 THEN CONCAT('TREINTA ', XlcCadena) 
                WHEN XlnDecenas = 3 AND XlnUnidades <> 0 THEN CONCAT('TREINTA Y ', XlcCadena) 
                WHEN XlnDecenas = 4 AND XlnUnidades = 0 THEN CONCAT('CUARENTA ', XlcCadena) 
                WHEN XlnDecenas = 4 AND XlnUnidades <> 0 THEN CONCAT('CUARENTA Y ', XlcCadena) 
                WHEN XlnDecenas = 5 AND XlnUnidades = 0 THEN CONCAT('CINCUENTA ', XlcCadena) 
                WHEN XlnDecenas = 5 AND XlnUnidades <> 0 THEN CONCAT('CINCUENTA Y ', XlcCadena) 
                WHEN XlnDecenas = 6 AND XlnUnidades = 0 THEN CONCAT('SESENTA ', XlcCadena) 
                WHEN XlnDecenas = 6 AND XlnUnidades <> 0 THEN CONCAT('SESENTA Y ', XlcCadena) 
                WHEN XlnDecenas = 7 AND XlnUnidades = 0 THEN CONCAT('SETENTA ', XlcCadena) 
                WHEN XlnDecenas = 7 AND XlnUnidades <> 0 THEN CONCAT('SETENTA Y ', XlcCadena) 
                WHEN XlnDecenas = 8 AND XlnUnidades = 0 THEN CONCAT('OCHENTA ', XlcCadena) 
                WHEN XlnDecenas = 8 AND XlnUnidades <> 0 THEN CONCAT('OCHENTA Y ', XlcCadena) 
                WHEN XlnDecenas = 9 AND XlnUnidades = 0 THEN CONCAT('NOVENTA ', XlcCadena) 
                WHEN XlnDecenas = 9 AND XlnUnidades <> 0 THEN CONCAT('NOVENTA Y ', XlcCadena) 
                ELSE XlcCadena 
            END; #DECENAS 

        # Analizo las centenas 
        SET XlcCadena = 
            CASE # CENTENAS 
                WHEN XlnCentenas = 1 AND XlnUnidades = 0 AND XlnDecenas = 0 THEN CONCAT('CIEN ', XlcCadena) 
                WHEN XlnCentenas = 1 AND NOT(XlnUnidades = 0 AND XlnDecenas = 0) THEN CONCAT('CIENTO ', XlcCadena) 
                WHEN XlnCentenas = 2 THEN CONCAT('DOSCIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 3 THEN CONCAT('TRESCIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 4 THEN CONCAT('CUATROCIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 5 THEN CONCAT('QUINIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 6 THEN CONCAT('SEISCIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 7 THEN CONCAT('SETECIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 8 THEN CONCAT('OCHOCIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 9 THEN CONCAT('NOVECIENTOS ', XlcCadena) 
                ELSE XlcCadena 
            END; #CENTENAS 

        # Analizo la terna 
        SET XlcCadena = 
            CASE # TERNA 
                WHEN XlnTerna = 1 THEN XlcCadena 
                WHEN XlnTerna = 2 AND (XlnUnidades + XlnDecenas + XlnCentenas <> 0) THEN CONCAT(XlcCadena,  'MIL ') 
                WHEN XlnTerna = 3 AND (XlnUnidades + XlnDecenas + XlnCentenas <> 0) AND XlnUnidades = 1 AND XlnDecenas = 0 AND XlnCentenas = 0 THEN CONCAT(XlcCadena, 'MILLON ') 
                WHEN XlnTerna = 3 AND (XlnUnidades + XlnDecenas + XlnCentenas <> 0) AND NOT (XlnUnidades = 1 AND XlnDecenas = 0 AND XlnCentenas = 0) THEN CONCAT(XlcCadena, 'MILLONES ') 
                WHEN XlnTerna = 4 AND (XlnUnidades + XlnDecenas + XlnCentenas <> 0) THEN CONCAT(XlcCadena, 'MIL MILLONES ') 
                ELSE '' 
            END; #TERNA 

        #Armo el retorno terna a terna 
        SET XlcRetorno = CONCAT(XlcCadena, XlcRetorno); 
        SET XlnTerna = XlnTerna + 1; 
    END WHILE; # WHILE 

    IF XlnTerna = 1 THEN SET XlcRetorno = 'CERO'; END IF; 

SET Xresultado = CONCAT(RTRIM(XlcRetorno), ' CON ', LTRIM(XlnFraccion), '/100 ', XMoneda); 

RETURN Xresultado; 

END
//

--
--
-- Table structure for table tconfiguracion_negocio
--

DROP TABLE IF EXISTS tconfiguracion_negocio;

CREATE TABLE tconfiguracion_negocio (
  codigo_configuracion_negocio int(11) NOT NULL AUTO_INCREMENT,
  inscripcion_abierta char(1) NOT NULL DEFAULT 'Y',
  carga_nota_abierta char(1) NOT NULL DEFAULT 'Y',
  edad_maxima_primer_anio int(11) DEFAULT 0,
  nota_minima float(10,2) NOT NULL DEFAULT 1,
  nota_maxima float(10,2) NOT NULL DEFAULT 20,
  nota_aprobacion float(10,2) NOT NULL DEFAULT 10,
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_configuracion_negocio)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
--
-- Table structure for table tano_academico
--

DROP TABLE IF EXISTS tano_academico;

CREATE TABLE tano_academico (
  codigo_ano_academico int(11) NOT NULL AUTO_INCREMENT,
  descripcion char(10) COLLATE utf8_spanish_ci NOT NULL,
  cerrado char(1) NOT NULL DEFAULT 'N',
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_ano_academico)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
--
-- Table structure for table tambiente
--

DROP TABLE IF EXISTS tambiente;

CREATE TABLE tambiente (
  codigo_ambiente int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  tipo_ambiente char(1) NOT NULL DEFAULT '0',
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_ambiente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
--
-- Table structure for table tbloque_hora
--

DROP TABLE IF EXISTS tbloque_hora;

CREATE TABLE tbloque_hora (
  codigo_bloque_hora int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(60) COLLATE utf8_spanish_ci,
  hora_inicio time NOT NULL,
  hora_fin time NOT NULL,
  receso char(1) NOT NULL DEFAULT 'N',
  turno char(1) NOT NULL DEFAULT 'M',
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_bloque_hora)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tmateria
--

DROP TABLE IF EXISTS tmateria;

CREATE TABLE tmateria (
  codigo_materia char(7) COLLATE utf8_spanish_ci NOT NULL,
  descripcion varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  unidad_curricular int(11) NOT NULL DEFAULT '0',
  grado_escolar char(1) NOT NULL DEFAULT '1',
  materia_compuesta char(1) NOT NULL DEFAULT 'N',
  hora_academica int(11) NOT NULL DEFAULT 0,
  codigo_materia_padre char(7) COLLATE utf8_spanish_ci NULL,
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_materia)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tseccion
--

DROP TABLE IF EXISTS tseccion;

CREATE TABLE tseccion (
  seccion char(5) COLLATE utf8_spanish_ci NOT NULL,
  descripcion varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  turno char(1) COLLATE utf8_spanish_ci NOT NULL,
  capacidad_min int(11) NOT NULL DEFAULT '5',
  capacidad_max int(11) NOT NULL DEFAULT '40',
  grado_escolar char(1) NOT NULL DEFAULT '1',
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (seccion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tpais
--

DROP TABLE IF EXISTS tpais;

CREATE TABLE tpais (
  codigo_pais int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  fecha_desactivacion varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (codigo_pais)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tparentesco
--

DROP TABLE IF EXISTS tparentesco;

CREATE TABLE tparentesco (
  codigo_parentesco int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  fecha_desactivacion varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (codigo_parentesco)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tinscripcion
--

DROP TABLE IF EXISTS tinscripcion;

CREATE TABLE tinscripcion (
  codigo_inscripcion int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(60) NOT NULL,
  fecha_inicio date NOT NULL,
  fecha_fin date NOT NULL,
  fecha_cierre date NOT NULL,
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_inscripcion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tcargo
--

DROP TABLE IF EXISTS tcargo;

CREATE TABLE tcargo (
  codigo_cargo int(15) NOT NULL AUTO_INCREMENT,
  descripcion varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_cargo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tauditoria
--

DROP TABLE IF EXISTS tauditoria;

CREATE TABLE tauditoria (
  id int(11) NOT NULL AUTO_INCREMENT,
  ip varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  so varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  navigador varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  usuario_base_de_datos varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  usuario_aplicacion char(15) COLLATE utf8_spanish_ci NOT NULL,
  query text COLLATE utf8_spanish_ci NOT NULL,
  fecha timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tmodulo
--

DROP TABLE IF EXISTS tmodulo;

CREATE TABLE tmodulo (
  codigo_modulo int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  icono varchar(200) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'icon-list-alt',
  orden int(11) NOT NULL DEFAULT 0,
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_modulo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table topcion
--

DROP TABLE IF EXISTS topcion;

CREATE TABLE topcion (
  codigo_opcion int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  icono varchar(200) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'icon-pencil',
  orden int(11) NOT NULL,
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_opcion)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tconfiguarion
--

CREATE TABLE IF NOT EXISTS tconfiguracion (
  codigo_configuracion int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  longitud_minclave int(11) NOT NULL DEFAULT '6',
  longitud_maxclave int(11) NOT NULL DEFAULT '10',
  cantidad_letrasmayusculas int(11) NOT NULL DEFAULT '1',
  cantidad_letrasminusculas int(11) NOT NULL DEFAULT '1',
  cantidad_caracteresespeciales int(11) NOT NULL DEFAULT '1',
  cantidad_numeros int(11) NOT NULL DEFAULT '1',
  dias_vigenciaclave int(11) NOT NULL DEFAULT '365',
  dias_inactividad int(11) NOT NULL DEFAULT '999',
  numero_ultimasclaves int(11) NOT NULL DEFAULT '1',
  dias_aviso int(11) NOT NULL DEFAULT '1',
  intentos_fallidos int(11) NOT NULL DEFAULT '1',
  maxsesion int(11) NOT NULL DEFAULT '5',
  numero_preguntas int(11) NOT NULL DEFAULT '1',
  numero_preguntasaresponder int(11) NOT NULL DEFAULT '1',
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_configuracion)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tperfil
--

DROP TABLE IF EXISTS tperfil;

CREATE TABLE tperfil (
  codigo_perfil int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  codigo_configuracion int(11) NOT NULL,
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_perfil),
  CONSTRAINT fk_tperfil_tconfiguracion FOREIGN KEY (codigo_configuracion) REFERENCES tconfiguracion (codigo_configuracion) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table testado
--

DROP TABLE IF EXISTS testado;

CREATE TABLE testado (
  codigo_estado int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  codigo_pais int(11) NOT NULL,
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_estado),
  CONSTRAINT fk_testado_tpais FOREIGN KEY (codigo_pais) REFERENCES tpais (codigo_pais) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tlapso
--

DROP TABLE IF EXISTS tlapso;

CREATE TABLE tlapso (
  codigo_lapso int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  fecha_inicio date NOT NULL,
  fecha_fin date NOT NULL,
  codigo_ano_academico int(11) NOT NULL,
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_lapso),
  CONSTRAINT fk_tlapso_tanoacademico FOREIGN KEY (codigo_ano_academico) REFERENCES tano_academico (codigo_ano_academico) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tservicio
--

DROP TABLE IF EXISTS tservicio;

CREATE TABLE tservicio (
  codigo_servicio int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  url varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  orden decimal(10,0) DEFAULT '0',
  codigo_modulo int(11) NOT NULL,
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_servicio),
  UNIQUE KEY url (url),
  CONSTRAINT tservicios_ibfk_1 FOREIGN KEY (codigo_modulo) REFERENCES tmodulo (codigo_modulo) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tmunicipio
--

DROP TABLE IF EXISTS tmunicipio;

CREATE TABLE tmunicipio (
  codigo_municipio int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  codigo_estado int(11) NOT NULL,
  fecha_desactivacion varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (codigo_municipio),
  CONSTRAINT fk_tmunicipio_testado FOREIGN KEY (codigo_estado) REFERENCES testado (codigo_estado) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tservicio_usuario_opcion
--

DROP TABLE IF EXISTS tservicio_usuario_opcion;

CREATE TABLE tservicio_usuario_opcion (
  codigo_opcion int(11) DEFAULT NULL,
  codigo_servicio int(11) NOT NULL,
  codigo_perfil int(11) NOT NULL,
  CONSTRAINT fk_tservicio_usuario_opcion_topcion FOREIGN KEY (codigo_opcion) REFERENCES topcion (codigo_opcion) ON UPDATE CASCADE,
  CONSTRAINT fk_tservicio_usuario_opcion_tservicio FOREIGN KEY (codigo_servicio) REFERENCES tservicio (codigo_servicio) ON UPDATE CASCADE,
  CONSTRAINT fk_tservicio_usuario_opcion_tperfil FOREIGN KEY (codigo_perfil) REFERENCES tperfil (codigo_perfil) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tparroquia
--

DROP TABLE IF EXISTS tparroquia;

CREATE TABLE tparroquia (
  codigo_parroquia int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  fecha_desactivacion varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  codigo_municipio int(11) NOT NULL,
  PRIMARY KEY (codigo_parroquia),
  CONSTRAINT fk_tparroquia_tmunicipio FOREIGN KEY (codigo_municipio) REFERENCES tmunicipio (codigo_municipio) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tplantel
--

DROP TABLE IF EXISTS tplantel;

CREATE TABLE tplantel (
  codigo_plantel char(11) NOT NULL,
  nombre varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  direccion varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  telefono_habitacion varchar(11) NOT NULL,
  localidad varchar(20),
  email varchar(150),
  codigo_municipio int(11) NOT NULL,
  fecha_desactivacion varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (codigo_plantel),
  CONSTRAINT fk_tplantel_tmunicipio FOREIGN KEY (codigo_municipio) REFERENCES tmunicipio (codigo_municipio) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tpersona
--

DROP TABLE IF EXISTS tpersona;

CREATE TABLE tpersona (
  cedula char(10) COLLATE utf8_spanish_ci NOT NULL,
  nombres varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  apellidos varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  genero char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'F',
  fecha_nacimiento date NOT NULL,
  lugar_nacimiento int(11) NOT NULL,
  direccion text COLLATE utf8_spanish_ci NOT NULL,
  telefono_habitacion char(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  telefono_movil char(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  email varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  esestudiante char(1) NOT NULL DEFAULT 'N',
  esrepresentante char(1) NOT NULL DEFAULT 'N',
  espersonalinstitucion char(1) NOT NULL DEFAULT 'N',
  fecha_ingreso date DEFAULT NULL,
  codigo_cargo int(11) DEFAULT NULL,
  codigo_dependencia char(10),
  codigo_dependencia_anterior char(10),
  condicion_cargo char(1) DEFAULT 'C',
  nivel_academico varchar(30) DEFAULT NULL,
  carga_horaria int(11) DEFAULT 0,
  codigo_plantel char(11) DEFAULT NULL,
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (cedula),
  CONSTRAINT fk_tpersona_tparroquia FOREIGN KEY (lugar_nacimiento) REFERENCES tparroquia (codigo_parroquia) ON UPDATE CASCADE,
  CONSTRAINT fk_tpersona_tcargo FOREIGN KEY (codigo_cargo) REFERENCES tcargo (codigo_cargo) ON UPDATE CASCADE,
  CONSTRAINT fk_tpersona_tplantel FOREIGN KEY (codigo_plantel) REFERENCES tplantel (codigo_plantel) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tmateria_seccion
--

DROP TABLE IF EXISTS tmateria_seccion_docente;

CREATE TABLE tmateria_seccion_docente (
  codigo_msd int(11) NOT NULL AUTO_INCREMENT,
  codigo_materia char(7) COLLATE utf8_spanish_ci NOT NULL,
  seccion char(5) COLLATE utf8_spanish_ci NOT NULL,
  cedula_docente char(10) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY(codigo_msd),
  CONSTRAINT fk_tmateria_seccion_tmateria FOREIGN KEY (codigo_materia) REFERENCES tmateria (codigo_materia) ON UPDATE CASCADE,
  CONSTRAINT fk_tmateria_seccion_tseccion FOREIGN KEY (seccion) REFERENCES tseccion (seccion) ON UPDATE CASCADE,
  CONSTRAINT fk_tmateria_seccion_tpersona FOREIGN KEY (cedula_docente) REFERENCES tpersona (cedula) ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table thorario_docente
--

DROP TABLE IF EXISTS thorario;

CREATE TABLE thorario (
  codigo_horario int(11) NOT NULL AUTO_INCREMENT,
  dia int(11) NOT NULL,
  codigo_bloque_hora int(11) NOT NULL,
  codigo_ambiente int(11) NOT NULL,
  codigo_ano_academico int(11) NOT NULL,
  codigo_materia char(7) COLLATE utf8_spanish_ci NOT NULL,
  seccion char(5) COLLATE utf8_spanish_ci NOT NULL,
  cedula_docente char(10) COLLATE utf8_spanish_ci NOT NULL,
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY(codigo_horario),
  CONSTRAINT fk_thorario_tbloque_hora FOREIGN KEY(codigo_bloque_hora) REFERENCES tbloque_hora (codigo_bloque_hora) ON UPDATE CASCADE,
  CONSTRAINT fk_thorario_tambiente FOREIGN KEY(codigo_ambiente) REFERENCES tambiente (codigo_ambiente) ON UPDATE CASCADE,
  CONSTRAINT fk_thorario_tano_academico FOREIGN KEY(codigo_ano_academico) REFERENCES tano_academico (codigo_ano_academico) ON UPDATE CASCADE,
  CONSTRAINT fk_thorario_tmateria FOREIGN KEY (codigo_materia) REFERENCES tmateria (codigo_materia) ON UPDATE CASCADE,
  CONSTRAINT fk_thorario_tseccion FOREIGN KEY (seccion) REFERENCES tseccion (seccion) ON UPDATE CASCADE,
  CONSTRAINT fk_thorario_tpersona FOREIGN KEY (cedula_docente) REFERENCES tpersona (cedula) ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tpre_inscripcion
--

DROP TABLE IF EXISTS tproceso_inscripcion; 

CREATE TABLE tproceso_inscripcion (
  codigo_procesoinscripcion int(11) NOT NULL AUTO_INCREMENT,
  codigo_inscripcion int(11) NOT NULL,
  fecha_inscripcion date NOT NULL,
  codigo_ano_academico int(11) NOT NULL,
  cedula_docente char(10) COLLATE utf8_spanish_ci NULL,
  cedula_estudiante char(10) COLLATE utf8_spanish_ci NOT NULL,
  cedula_escolar char(10) COLLATE utf8_spanish_ci NULL,
  codigo_canaima varchar(20) NULL,
  peso float NOT NULL DEFAULT 0,
  estatura float NOT NULL DEFAULT 0,
  codigo_plantel int(11),
  certificado_sextogrado char(1) NOT NULL DEFAULT 'N',
  notascertificadas char(1) NOT NULL DEFAULT 'N',
  cartabuenaconducta char(1) NOT NULL DEFAULT 'N',
  fotoestudiante char(1) NOT NULL DEFAULT 'N',
  fotorepresentante char(1) NOT NULL DEFAULT 'N',
  fotocopia_ciestudiante char(1) NOT NULL DEFAULT 'N',
  fotocopia_cirepresentante char(1) NOT NULL DEFAULT 'N',
  fotocopia_pnestudiante char(1) NOT NULL DEFAULT 'N',
  kitscomedor char(1) NOT NULL DEFAULT 'N',
  becado char(1) NOT NULL DEFAULT 'N',
  tipobeca char(1) NOT NULL DEFAULT 'N',
  cedula_madre char(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  cedula_padre char(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  cedula_representante char(10) COLLATE utf8_spanish_ci NULL,
  codigo_parentesco int(11) NULL,
  lugar_trabajo int(11) NULL,
  primerafi date NULL,
  seccion char(5) NULL,
  proceso_completado char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  estatus char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (codigo_procesoinscripcion),
  CONSTRAINT fk_tpi_tinscrip FOREIGN KEY (codigo_inscripcion) REFERENCES tinscripcion (codigo_inscripcion) ON UPDATE CASCADE,
  CONSTRAINT fk_tpi_taa FOREIGN KEY (codigo_ano_academico) REFERENCES tano_academico (codigo_ano_academico) ON UPDATE CASCADE,
  CONSTRAINT fk_tpi_tdocente FOREIGN KEY (cedula_docente) REFERENCES tpersona (cedula) ON UPDATE CASCADE,
  CONSTRAINT fk_tpi_testudiante FOREIGN KEY (cedula_estudiante) REFERENCES tpersona (cedula) ON UPDATE CASCADE,
  CONSTRAINT fk_tpi_tmadre FOREIGN KEY (cedula_madre) REFERENCES tpersona (cedula) ON UPDATE CASCADE,
  CONSTRAINT fk_tpi_tpadre FOREIGN KEY (cedula_padre) REFERENCES tpersona (cedula) ON UPDATE CASCADE,
  CONSTRAINT fk_tpi_trepresentante FOREIGN KEY (cedula_representante) REFERENCES tpersona (cedula) ON UPDATE CASCADE,
  CONSTRAINT fk_tpi_tparentesco FOREIGN KEY (codigo_parentesco) REFERENCES tparentesco (codigo_parentesco) ON UPDATE CASCADE,
  CONSTRAINT fk_tpi_tlugartrabajo FOREIGN KEY (lugar_trabajo) REFERENCES tparroquia (codigo_parroquia) ON UPDATE CASCADE,
  CONSTRAINT fk_tpi_tseccion FOREIGN KEY (seccion) REFERENCES tseccion (seccion) ON UPDATE CASCADE,
  CONSTRAINT fk_tpi_tplantel FOREIGN KEY (codigo_plantel) REFERENCES tplantel (codigo_plantel) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tusuario
--

DROP TABLE IF EXISTS tusuario;

CREATE TABLE tusuario (
  nombre_usuario char(10) COLLATE utf8_spanish_ci NOT NULL,
  cedula char(10) COLLATE utf8_spanish_ci NOT NULL,
  codigo_perfil int(11) NOT NULL,
  intento_fallido int(11) NOT NULL DEFAULT '0',
  activar_caducidad int(11) NOT NULL DEFAULT '1',
  sesion_abierta int(11) NOT NULL DEFAULT '0',
  fecha_ultimasesion date DEFAULT NULL,
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (nombre_usuario),
  CONSTRAINT tusuario_ibfk_1 FOREIGN KEY (cedula) REFERENCES tpersona (cedula) ON UPDATE CASCADE,
  CONSTRAINT tusuario_ibfk_2 FOREIGN KEY (codigo_perfil) REFERENCES tperfil (codigo_perfil) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table trespuesta_secreta
--

CREATE TABLE IF NOT EXISTS trespuesta_secreta (
  codigo_respuesta int(11) NOT NULL AUTO_INCREMENT,
  nombre_usuario char(10) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  pregunta varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  respuesta varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (codigo_respuesta),
  CONSTRAINT trespuesta_secreta_usuario FOREIGN KEY (nombre_usuario) REFERENCES tusuario (nombre_usuario) ON UPDATE CASCADE 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tplan_evaluacion
--

DROP TABLE IF EXISTS tplan_evaluacion;

CREATE TABLE tplan_evaluacion (
  codigo_plan_evaluacion int(11) NOT NULL AUTO_INCREMENT,
  codigo_msd int(11) NOT NULL, 
  codigo_lapso int(11) NOT NULL,
  descripcion varchar(60) NOT NULL,
  porcentaje float(11,2) NOT NULL DEFAULT 0.0,
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_plan_evaluacion),
  CONSTRAINT fk_tplanevaluacion_msd FOREIGN KEY(codigo_msd) REFERENCES tmateria_seccion_docente (codigo_msd) ON UPDATE CASCADE,
  CONSTRAINT fk_tplanevaluacion_lapso FOREIGN KEY(codigo_lapso) REFERENCES tlapso (codigo_lapso) ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tasignacion_notas
--

DROP TABLE IF EXISTS tasignacion_nota;

CREATE TABLE tasignacion_nota (
  codigo_asignacionnotas int(11) NOT NULL AUTO_INCREMENT,
  codigo_plan_evaluacion int(11) NOT NULL,
  cedula_estudiante char(10) NOT NULL,
  notaobtenida int(11) NOT NULL DEFAULT 0,
  fecha_modificacion date DEFAULT NULL,
  PRIMARY KEY(codigo_asignacionnotas),
  CONSTRAINT fk_tasignacionnota_pe FOREIGN KEY(codigo_plan_evaluacion) REFERENCES tplan_evaluacion (codigo_plan_evaluacion) ON UPDATE CASCADE,
  CONSTRAINT fk_tasignacionnota_estudiante FOREIGN KEY(cedula_estudiante) REFERENCES tpersona (cedula) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tcontrol_notas
--

DROP TABLE IF EXISTS tcontrol_notas;

CREATE TABLE tcontrol_notas (
  codigo_controlnotas int(11) NOT NULL AUTO_INCREMENT,
  codigo_msd int(11) NOT NULL,
  cedula_estudiante char(10) NOT NULL,
  codigo_lapso int(11) NOT NULL,
  notafinal int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY(codigo_controlnotas),
  CONSTRAINT fk_tcontrolnotas_msd FOREIGN KEY(codigo_msd) REFERENCES tmateria_seccion_docente (codigo_msd) ON UPDATE CASCADE,
  CONSTRAINT fk_tcontrolnotas_lapso FOREIGN KEY(codigo_lapso) REFERENCES tlapso (codigo_lapso) ON UPDATE CASCADE,
  CONSTRAINT fk_tcontrolnotas_estudiante FOREIGN KEY(cedula_estudiante) REFERENCES tpersona (cedula) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tcontrasena
--

DROP TABLE IF EXISTS tcontrasena;

CREATE TABLE tcontrasena (
  nombre_usuario char(10) COLLATE utf8_spanish_ci NOT NULL,
  contrasena varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  estado int(11) NOT NULL DEFAULT '3' COMMENT '0 clave usado 1 usuario activo 2 caducidad de clave 3 usuario nuevo 4 usuario bloqueado',
  fecha_modificacion timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT pk_contrasena PRIMARY KEY(nombre_usuario,contrasena),
  CONSTRAINT tcontrasena_ibfk_1 FOREIGN KEY (nombre_usuario) REFERENCES tusuario (nombre_usuario) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
--  View structure for vhorario
--

CREATE OR REPLACE VIEW vhorario AS 
  SELECT pr.nombres AS nombre,
  pr.apellidos AS apellido,
  CONCAT(h.codigo_bloque_hora,'-',h.dia) AS celda,
  pr.cedula AS cedula,
  h.dia,
  h.codigo_bloque_hora,
  h.codigo_materia AS materia,
  h.cedula_docente AS profesor,
  h.codigo_ambiente,
  h.seccion,
  h.codigo_ano_academico,
  tm.descripcion AS nombre_materia,
  ta.descripcion AS nombre_ambiente,
  CONCAT(bh.hora_inicio,'-',bh.hora_fin) AS hora,
  s.descripcion AS nombre_seccion, 
  COALESCE(pr.carga_horaria,0) AS maxhoras,
  COALESCE(tm.hora_academica,0) AS maxhoramateria,
  COALESCE(bh.hora_academica,0) AS hora_academica  
  FROM thorario h
  LEFT JOIN tseccion s ON s.seccion = h.seccion
  LEFT JOIN tpersona pr ON pr.cedula = h.cedula_docente
  LEFT JOIN tmateria tm ON tm.codigo_materia = h.codigo_materia
  LEFT JOIN tambiente ta ON ta.codigo_ambiente = h.codigo_ambiente
  LEFT JOIN tbloque_hora bh ON bh.codigo_bloque_hora = h.codigo_bloque_hora;

--
--  View structure for vmateria_seccion_horario
--

CREATE OR REPLACE VIEW vmateria_seccion_horario AS 
  SELECT s.seccion,
  count(h.codigo_materia) AS cantidad_materia_horario,
  count(msd.codigo_materia) AS cantidad_materia_seccion
  FROM tseccion s
  LEFT JOIN tmateria_seccion_docente msd ON s.seccion = msd.seccion
  LEFT JOIN thorario h ON h.seccion = s.seccion
  GROUP BY s.seccion, msd.codigo_materia;