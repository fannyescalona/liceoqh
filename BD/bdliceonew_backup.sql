-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 27-01-2017 a las 16:58:59
-- Versión del servidor: 5.5.54-0+deb8u1
-- Versión de PHP: 5.6.29-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bdliceonew`
--

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`admin`@`localhost` FUNCTION `f_fecha_spanish`(v_fecha DATE,v_tipo int (3)) RETURNS varchar(50) CHARSET latin1
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
END$$

CREATE DEFINER=`admin`@`localhost` FUNCTION `initcap`(x VARCHAR(120) CHARSET utf8) RETURNS varchar(120) CHARSET utf8
    NO SQL
BEGIN
SET @str='';
SET @l_str='';
WHILE x REGEXP ' ' DO
SELECT SUBSTRING_INDEX(x, ' ', 1) INTO @l_str;
SELECT SUBSTRING(x, LOCATE(' ', x)+1) INTO x;
SELECT CONCAT(@str, ' ', CONCAT(UPPER(SUBSTRING(@l_str,1,1)),LOWER(SUBSTRING(@l_str,2)))) INTO @str;
END WHILE;
RETURN LTRIM(CONCAT(@str, ' ', CONCAT(UPPER(SUBSTRING(x,1,1)),LOWER(SUBSTRING(x,2)))));
END$$

CREATE DEFINER=`admin`@`localhost` FUNCTION `letras`(XNumero NUMERIC(20,2),  XMoneda VARCHAR(100)) RETURNS varchar(512) CHARSET latin1
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

        
        SET XlcCadena = ''; 
        SET XlnUnidades = XlnEntero MOD 10; 
        SET XlnEntero = FLOOR(XlnEntero/10); 
        SET XlnDecenas = XlnEntero MOD 10; 
        SET XlnEntero = FLOOR(XlnEntero/10); 
        SET XlnCentenas = XlnEntero MOD 10; 
        SET XlnEntero = FLOOR(XlnEntero/10); 

        
        SET XlcCadena = 
            CASE 
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
            END; 

        
        SET XlcCadena = 
            CASE 
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
            END; 

        
        SET XlcCadena = 
            CASE 
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
            END; 

        
        SET XlcCadena = 
            CASE 
                WHEN XlnTerna = 1 THEN XlcCadena 
                WHEN XlnTerna = 2 AND (XlnUnidades + XlnDecenas + XlnCentenas <> 0) THEN CONCAT(XlcCadena,  'MIL ') 
                WHEN XlnTerna = 3 AND (XlnUnidades + XlnDecenas + XlnCentenas <> 0) AND XlnUnidades = 1 AND XlnDecenas = 0 AND XlnCentenas = 0 THEN CONCAT(XlcCadena, 'MILLON ') 
                WHEN XlnTerna = 3 AND (XlnUnidades + XlnDecenas + XlnCentenas <> 0) AND NOT (XlnUnidades = 1 AND XlnDecenas = 0 AND XlnCentenas = 0) THEN CONCAT(XlcCadena, 'MILLONES ') 
                WHEN XlnTerna = 4 AND (XlnUnidades + XlnDecenas + XlnCentenas <> 0) THEN CONCAT(XlcCadena, 'MIL MILLONES ') 
                ELSE '' 
            END; 

        
        SET XlcRetorno = CONCAT(XlcCadena, XlcRetorno); 
        SET XlnTerna = XlnTerna + 1; 
    END WHILE; 

    IF XlnTerna = 1 THEN SET XlcRetorno = 'CERO'; END IF; 

SET Xresultado = CONCAT(RTRIM(XlcRetorno), ' CON ', LTRIM(XlnFraccion), '/100 ', XMoneda); 

RETURN Xresultado; 

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tambiente`
--

CREATE TABLE IF NOT EXISTS `tambiente` (
`codigo_ambiente` int(11) NOT NULL,
  `descripcion` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_ambiente` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '0',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tambiente`
--

INSERT INTO `tambiente` (`codigo_ambiente`, `descripcion`, `tipo_ambiente`, `fecha_desactivacion`) VALUES
(1, 'AULA 1', '1', NULL),
(2, 'AULA 2', '1', NULL),
(3, 'CANCHA MULTIPLE', '2', NULL),
(4, 'CIENCIAS DE LA NATURALEZA', '3', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tano_academico`
--

CREATE TABLE IF NOT EXISTS `tano_academico` (
`codigo_ano_academico` int(11) NOT NULL,
  `descripcion` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `cerrado` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasignacion_nota`
--

CREATE TABLE IF NOT EXISTS `tasignacion_nota` (
`codigo_asignacionnotas` int(11) NOT NULL,
  `codigo_plan_evaluacion` int(11) NOT NULL,
  `cedula_estudiante` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `notaobtenida` int(11) NOT NULL DEFAULT '0',
  `fecha_modificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tauditoria`
--

CREATE TABLE IF NOT EXISTS `tauditoria` (
`id` int(11) NOT NULL,
  `ip` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `so` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `navigador` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `usuario_base_de_datos` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `usuario_aplicacion` char(15) COLLATE utf8_spanish_ci NOT NULL,
  `query` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbloque_hora`
--

CREATE TABLE IF NOT EXISTS `tbloque_hora` (
`codigo_bloque_hora` int(11) NOT NULL,
  `descripcion` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `hora_academica` int(11) NOT NULL DEFAULT '0',
  `receso` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `turno` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'M',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbloque_hora`
--

INSERT INTO `tbloque_hora` (`codigo_bloque_hora`, `descripcion`, `hora_inicio`, `hora_fin`, `hora_academica`, `receso`, `turno`, `fecha_desactivacion`) VALUES
(1, 'DESAYUNO Y ACTO CIVICO', '07:00:00', '07:30:00', 0, 'Y', 'M', NULL),
(2, 'B-1', '07:30:00', '09:00:00', 2, 'N', 'M', NULL),
(3, 'RECESO', '09:00:00', '09:15:00', 0, 'Y', 'M', NULL),
(4, 'B-2', '09:15:00', '10:45:00', 2, 'N', 'M', NULL),
(5, 'RECESO', '10:45:00', '10:55:00', 0, 'Y', 'M', NULL),
(6, 'B-3', '10:55:00', '12:25:00', 2, 'N', 'T', NULL),
(7, 'ALMUERZO', '12:25:00', '13:25:00', 0, 'Y', 'T', NULL),
(8, 'B-4', '13:25:00', '14:55:00', 2, 'N', 'T', NULL),
(9, 'RECESO', '14:55:00', '15:05:00', 0, 'Y', 'T', NULL),
(10, 'B-5', '15:05:00', '16:35:00', 2, 'N', 'T', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcargo`
--

CREATE TABLE IF NOT EXISTS `tcargo` (
`codigo_cargo` int(15) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tcargo`
--

INSERT INTO `tcargo` (`codigo_cargo`, `descripcion`, `fecha_desactivacion`) VALUES
(1, 'OPERADOR DE SISTEMA', NULL),
(2, 'BIBLIOTECARIO', NULL),
(3, 'DIRECTOR(A)', NULL),
(4, 'DOCENTE', NULL),
(5, 'OBRERO', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tconfiguracion`
--

CREATE TABLE IF NOT EXISTS `tconfiguracion` (
`codigo_configuracion` int(11) NOT NULL,
  `descripcion` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `longitud_minclave` int(11) NOT NULL DEFAULT '6',
  `longitud_maxclave` int(11) NOT NULL DEFAULT '10',
  `cantidad_letrasmayusculas` int(11) NOT NULL DEFAULT '1',
  `cantidad_letrasminusculas` int(11) NOT NULL DEFAULT '1',
  `cantidad_caracteresespeciales` int(11) NOT NULL DEFAULT '1',
  `cantidad_numeros` int(11) NOT NULL DEFAULT '1',
  `dias_vigenciaclave` int(11) NOT NULL DEFAULT '365',
  `dias_inactividad` int(11) NOT NULL DEFAULT '999',
  `numero_ultimasclaves` int(11) NOT NULL DEFAULT '1',
  `dias_aviso` int(11) NOT NULL DEFAULT '1',
  `intentos_fallidos` int(11) NOT NULL DEFAULT '1',
  `maxsesion` int(11) NOT NULL DEFAULT '5',
  `numero_preguntas` int(11) NOT NULL DEFAULT '1',
  `numero_preguntasaresponder` int(11) NOT NULL DEFAULT '1',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tconfiguracion`
--

INSERT INTO `tconfiguracion` (`codigo_configuracion`, `descripcion`, `longitud_minclave`, `longitud_maxclave`, `cantidad_letrasmayusculas`, `cantidad_letrasminusculas`, `cantidad_caracteresespeciales`, `cantidad_numeros`, `dias_vigenciaclave`, `dias_inactividad`, `numero_ultimasclaves`, `dias_aviso`, `intentos_fallidos`, `maxsesion`, `numero_preguntas`, `numero_preguntasaresponder`, `fecha_desactivacion`) VALUES
(1, 'POR DEFECTO', 6, 10, 1, 1, 1, 1, 365, 9999999, 1, 10, 99999999, 5, 3, 2, NULL),
(2, 'DOCENTES', 4, 8, 0, 1, 0, 0, 180, 120, 3, 10, 5, 2, 3, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tconfiguracion_negocio`
--

CREATE TABLE IF NOT EXISTS `tconfiguracion_negocio` (
`codigo_configuracion_negocio` int(11) NOT NULL,
  `codigo_plantel` char(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `inscripcion_abierta` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Y',
  `carga_nota_abierta` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Y',
  `edad_maxima_primer_anio` int(11) DEFAULT '0',
  `nota_minima` float(10,2) NOT NULL DEFAULT '1.00',
  `nota_maxima` float(10,2) NOT NULL DEFAULT '20.00',
  `nota_aprobacion` float(10,2) NOT NULL DEFAULT '10.00',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcontrasena`
--

CREATE TABLE IF NOT EXISTS `tcontrasena` (
  `nombre_usuario` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '3' COMMENT '0 clave usado 1 usuario activo 2 caducidad de clave 3 usuario nuevo 4 usuario bloqueado',
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tcontrasena`
--

INSERT INTO `tcontrasena` (`nombre_usuario`, `contrasena`, `estado`, `fecha_modificacion`) VALUES
('V123456789', ',1f82ea75c5cc526729e2d581aeb3aeccfef4407e', 3, '2017-01-27 20:52:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcontrol_notas`
--

CREATE TABLE IF NOT EXISTS `tcontrol_notas` (
`codigo_controlnotas` int(11) NOT NULL,
  `codigo_msd` int(11) NOT NULL,
  `cedula_estudiante` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_lapso` int(11) NOT NULL,
  `notafinal` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testado`
--

CREATE TABLE IF NOT EXISTS `testado` (
`codigo_estado` int(11) NOT NULL,
  `descripcion` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_pais` int(11) NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `testado`
--

INSERT INTO `testado` (`codigo_estado`, `descripcion`, `codigo_pais`, `fecha_desactivacion`) VALUES
(1, 'AMAZONAS', 1, NULL),
(2, 'ANZOÁTEGUI', 1, NULL),
(3, 'APURE', 1, NULL),
(4, 'ARAGUA', 1, NULL),
(5, 'BARINAS', 1, NULL),
(6, 'BOLÍVAR', 1, NULL),
(7, 'CARABOBO', 1, NULL),
(8, 'COJEDES', 1, NULL),
(9, 'DELTA AMACURO', 1, NULL),
(10, 'FALCÓN', 1, NULL),
(11, 'GUÁRICO', 1, NULL),
(12, 'LARA', 1, NULL),
(13, 'MÉRIDA', 1, NULL),
(14, 'MIRANDA', 1, NULL),
(15, 'MONAGAS', 1, NULL),
(16, 'NUEVA ESPARTA', 1, NULL),
(17, 'PORTUGUESA', 1, NULL),
(18, 'SUCRE', 1, NULL),
(19, 'TÁCHIRA', 1, NULL),
(20, 'TRUJILLO', 1, NULL),
(21, 'VARGAS', 1, NULL),
(22, 'YARACUY', 1, NULL),
(23, 'ZULIA', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `thorario`
--

CREATE TABLE IF NOT EXISTS `thorario` (
`codigo_horario` int(11) NOT NULL,
  `dia` int(11) NOT NULL,
  `codigo_bloque_hora` int(11) NOT NULL,
  `codigo_ambiente` int(11) NOT NULL,
  `codigo_ano_academico` int(11) NOT NULL,
  `codigo_materia` char(7) COLLATE utf8_spanish_ci NOT NULL,
  `seccion` char(5) COLLATE utf8_spanish_ci NOT NULL,
  `cedula_docente` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tinscripcion`
--

CREATE TABLE IF NOT EXISTS `tinscripcion` (
`codigo_inscripcion` int(11) NOT NULL,
  `descripcion` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_cierre` date NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tlapso`
--

CREATE TABLE IF NOT EXISTS `tlapso` (
`codigo_lapso` int(11) NOT NULL,
  `descripcion` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `codigo_ano_academico` int(11) NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmateria`
--

CREATE TABLE IF NOT EXISTS `tmateria` (
  `codigo_materia` char(7) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `unidad_curricular` int(11) NOT NULL DEFAULT '0',
  `grado_escolar` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '1',
  `materia_compuesta` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `hora_academica` int(11) NOT NULL DEFAULT '0',
  `codigo_materia_padre` char(7) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmateria_seccion_docente`
--

CREATE TABLE IF NOT EXISTS `tmateria_seccion_docente` (
`codigo_msd` int(11) NOT NULL,
  `codigo_materia` char(7) COLLATE utf8_spanish_ci NOT NULL,
  `seccion` char(5) COLLATE utf8_spanish_ci NOT NULL,
  `cedula_docente` char(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmodulo`
--

CREATE TABLE IF NOT EXISTS `tmodulo` (
`codigo_modulo` int(11) NOT NULL,
  `descripcion` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `icono` varchar(200) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'icon-list-alt',
  `orden` int(11) NOT NULL DEFAULT '0',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tmodulo`
--

INSERT INTO `tmodulo` (`codigo_modulo`, `descripcion`, `icono`, `orden`, `fecha_desactivacion`) VALUES
(1, 'LOCALIDADES', 'icon-list', 1, NULL),
(2, 'GENERAL', 'icon-list', 2, NULL),
(3, 'EDUCACIÓN', 'icon-list-alt', 3, NULL),
(4, 'CONTROL DE NOTAS', 'icon-cog', 4, NULL),
(5, 'CONTROL DE HORARIOS', 'icon-cog', 4, NULL),
(6, 'INSCRIPCIONES', 'icon-cog', 5, NULL),
(7, 'REPORTE', 'icon-cog', 6, NULL),
(8, 'SEGURIDAD', 'icon-lock', 7, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmunicipio`
--

CREATE TABLE IF NOT EXISTS `tmunicipio` (
`codigo_municipio` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_estado` int(11) NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tmunicipio`
--

INSERT INTO `tmunicipio` (`codigo_municipio`, `descripcion`, `codigo_estado`, `fecha_desactivacion`) VALUES
(1, 'ALTO ORINOCO', 1, NULL),
(2, 'ATABAPO', 1, NULL),
(3, 'ATURES', 1, NULL),
(4, 'AUTANA', 1, NULL),
(5, 'MANAPIARE', 1, NULL),
(6, 'MANATIARES', 1, NULL),
(7, 'MAROA', 1, NULL),
(8, 'RIO NEGRO', 1, NULL),
(9, 'ANACO', 2, NULL),
(10, 'ARAGUA', 2, NULL),
(11, 'CARVAJAL', 2, NULL),
(12, 'DIEGO BAUTISTA URBANEJA', 2, NULL),
(13, 'FERNANDO PEÑALVER', 2, NULL),
(14, 'FRANCISCO DEL CARMEN CARVAJAL', 2, NULL),
(15, 'FREITES', 2, NULL),
(16, 'GENERAL SIR ARTHUR MCGREGOR', 2, NULL),
(17, 'GUANIPA', 2, NULL),
(18, 'GUANTA', 2, NULL),
(19, 'JOSE GREGORIO MONAGAS', 2, NULL),
(20, 'JUAN ANTONIO SOTILLO', 2, NULL),
(21, 'JUAN MANUEL CAJIGAL', 2, NULL),
(22, 'MANUEL EZEQUIEL BRUZUAL', 2, NULL),
(23, 'MCGREGOR', 2, NULL),
(24, 'MONAGAS', 2, NULL),
(25, 'PEDRO MARIA FREITES', 2, NULL),
(26, 'SAN JOSE DE GUANIPA', 2, NULL),
(27, 'SAN JUAN DE CAPISTRANO', 2, NULL),
(28, 'SANTA ANA', 2, NULL),
(29, 'ACHAGUAS', 3, NULL),
(30, 'BIRUACA', 3, NULL),
(31, 'MUÑOZ', 3, NULL),
(32, 'PEDRO CAMEJO', 3, NULL),
(33, 'SAN FERNANDO', 3, NULL),
(34, 'ATANASIO GIRARDOT', 4, NULL),
(35, 'CAMATAGUA', 4, NULL),
(36, 'FRANCISCO LINARES ALCANTARA', 4, NULL),
(37, 'JOSE ANGEL LAMAS', 4, NULL),
(38, 'JOSE RAFAEL REVENGA', 4, NULL),
(39, 'MARIO BRICEÑO IRAGORRY', 4, NULL),
(40, 'OCUMARE DE LA COSTA DE ORO', 4, NULL),
(41, 'SAN CASIMIRO', 4, NULL),
(42, 'SAN SEBASTIAN', 4, NULL),
(43, 'SANTIAGO MARIÑO', 4, NULL),
(44, 'SANTOS MICHELENA', 4, NULL),
(45, 'ALBERTO ARVELO TORREALBA', 5, NULL),
(46, 'ANTONIO JOSE DE SUCRE', 5, NULL),
(47, 'BARINAS', 5, NULL),
(48, 'CRUZ PAREDES', 5, NULL),
(49, 'OBISPOS', 5, NULL),
(50, 'PEDRAZA', 5, NULL),
(51, 'ROJAS', 5, NULL),
(52, 'SOSA', 5, NULL),
(53, 'ANGOSTURA (RAUL LEONI)', 6, NULL),
(54, 'CARONI', 6, NULL),
(55, 'CEDEÑO', 6, NULL),
(56, 'EL CALLAO', 6, NULL),
(57, 'GRAN SABANA', 6, NULL),
(58, 'HERES', 6, NULL),
(59, 'PADRE PEDRO CHEN', 6, NULL),
(60, 'RAUL LEON', 6, NULL),
(61, 'ROSCIO', 6, NULL),
(62, 'SIFONTES', 6, NULL),
(63, 'BEJUMA', 7, NULL),
(64, 'CARLOS ARVELO', 7, NULL),
(65, 'DIEGO IBARRA', 7, NULL),
(66, 'GUACARA', 7, NULL),
(67, 'JUAN JOSE MORA', 7, NULL),
(68, 'LOS GUAYOS', 7, NULL),
(69, 'MONTALBAN', 7, NULL),
(70, 'NAGUANAGUA', 7, NULL),
(71, 'PUERTO CABELLO', 7, NULL),
(72, 'SAN DIEGO', 7, NULL),
(73, 'SAN JOAQUIN', 7, NULL),
(74, 'VALENCIA', 7, NULL),
(75, 'ANZOATEGUI', 8, NULL),
(76, 'GIRARDOT', 8, NULL),
(77, 'LIMA BLANCO', 8, NULL),
(78, 'PAO DE SAN JUAN BAUTISTA', 8, NULL),
(79, 'RICAURTE', 8, NULL),
(80, 'ROMULO GALLEGOS', 8, NULL),
(81, 'SAN CARLOS', 8, NULL),
(82, 'TINACO', 8, NULL),
(83, 'TINAQUILLO', 8, NULL),
(84, 'ANTONIO DIAZ', 9, NULL),
(85, 'CASACOIMA', 9, NULL),
(86, 'PEDERNALES', 9, NULL),
(87, 'TUCUPITA', 9, NULL),
(88, 'BUCHIVACOA', 10, NULL),
(89, 'CACIQUE MANAURE', 10, NULL),
(90, 'CARIRUBANA', 10, NULL),
(91, 'COLINA', 10, NULL),
(92, 'DABAJURO', 10, NULL),
(93, 'DEMOCRACIA', 10, NULL),
(94, 'FALCON', 10, NULL),
(95, 'FEDERACION', 10, NULL),
(96, 'JACURA', 10, NULL),
(97, 'JOSE LAURENCIO SILVA', 10, NULL),
(98, 'LOS TAQUES', 10, NULL),
(99, 'MAUROA', 10, NULL),
(100, 'MONSEÑOR ITURRIZA', 10, NULL),
(101, 'PALMASOLA', 10, NULL),
(102, 'PETIT', 10, NULL),
(103, 'PIRITU', 10, NULL),
(104, 'SILVA', 10, NULL),
(105, 'TOCOPERO', 10, NULL),
(106, 'UNION', 10, NULL),
(107, 'URUMACO', 10, NULL),
(108, 'CAMAGUAN', 11, NULL),
(109, 'CHAGUARAMOS', 11, NULL),
(110, 'EL SOCORRO', 11, NULL),
(111, 'ESTERIOS DE CAMAGUAN', 11, NULL),
(112, 'JOSE FELIX RIBAS', 11, NULL),
(113, 'JOSE TADEO MONAGAS', 11, NULL),
(114, 'JUAN GERMAN ROSCIO', 11, NULL),
(115, 'JULIAN MELLADO', 11, NULL),
(116, 'LAS MERCEDES', 11, NULL),
(117, 'LEONARDO INFANTE', 11, NULL),
(118, 'ORTIZ', 11, NULL),
(119, 'PEDRO ZARAZA', 11, NULL),
(120, 'SAN GERONIMO DE GUAYABAL', 11, NULL),
(121, 'SAN JOSE DE GUARIBE', 11, NULL),
(122, 'SANTA MARIA DE IPIRE', 11, NULL),
(123, 'SEBASTIAN FRANCISCO DE MIRANDA', 11, NULL),
(124, 'CRESPO', 12, NULL),
(125, 'IRIBARREN', 12, NULL),
(126, 'JIMENEZ', 12, NULL),
(127, 'MORAN', 12, NULL),
(128, 'PALAVECINO', 12, NULL),
(129, 'SIMON PLANAS', 12, NULL),
(130, 'TORRES', 12, NULL),
(131, 'ALBERTO ADRIANI', 13, NULL),
(132, 'ANTONIO PINTO SALINAS', 13, NULL),
(133, 'ARICAGUA', 13, NULL),
(134, 'ARZOBISPO CHACON', 13, NULL),
(135, 'CAMPO ELIAS', 13, NULL),
(136, 'CARACCIOLO PARRA OLMEDO', 13, NULL),
(137, 'CARDENAL QUINTERO', 13, NULL),
(138, 'GUARAQUE', 13, NULL),
(139, 'JULIO CESAR SALAS', 13, NULL),
(140, 'JUSTO BRICEÑO', 13, NULL),
(141, 'OBISPO RAMOS DE LARA', 13, NULL),
(142, 'PADRE NOGUERA', 13, NULL),
(143, 'PUEBLO LLANO', 13, NULL),
(144, 'RANGEL', 13, NULL),
(145, 'RIVAS DAVILA', 13, NULL),
(146, 'SANTOS MARQUINA', 13, NULL),
(147, 'SANTOS MARTINA', 13, NULL),
(148, 'TOVAR', 13, NULL),
(149, 'TULIO FEBRES CORDERO', 13, NULL),
(150, 'ZEA', 13, NULL),
(151, 'ACEVEDO', 14, NULL),
(152, 'BARUTA', 14, NULL),
(153, 'BRION', 14, NULL),
(154, 'BUROZ', 14, NULL),
(155, 'CARRIZAL', 14, NULL),
(156, 'CHACAO', 14, NULL),
(157, 'CRISTOBAL ROJAS', 14, NULL),
(158, 'EL HATILLO', 14, NULL),
(159, 'GUAICAIPURO', 14, NULL),
(160, 'LANDER', 14, NULL),
(161, 'LOS SALIAS', 14, NULL),
(162, 'PAZ CASTILLO', 14, NULL),
(163, 'PEDRO GUAL', 14, NULL),
(164, 'PLAZA', 14, NULL),
(165, 'SOCRE', 14, NULL),
(166, 'ZAMORA', 14, NULL),
(167, 'ACOSTA', 15, NULL),
(168, 'AGUASAY', 15, NULL),
(169, 'CARIPE', 15, NULL),
(170, 'CARIPEL', 15, NULL),
(171, 'CEDEÑO', 15, NULL),
(172, 'EZEQUIEL ZAMORA', 15, NULL),
(173, 'MATURIN', 15, NULL),
(174, 'PIAR', 15, NULL),
(175, 'PUNCERES', 15, NULL),
(176, 'SANTA BARBARA', 15, NULL),
(177, 'SOTILLO', 15, NULL),
(178, 'URACOA', 15, NULL),
(179, 'ANTOLIN DEL CAMPO', 16, NULL),
(180, 'DIAZ', 16, NULL),
(181, 'GARCIA', 16, NULL),
(182, 'GOMEZ', 16, NULL),
(183, 'GRACIAS', 16, NULL),
(184, 'MANEIRO', 16, NULL),
(185, 'MARCANO', 16, NULL),
(186, 'MARIÑO', 16, NULL),
(187, 'PENINSULA DE MACANAO', 16, NULL),
(188, 'TUBORES', 16, NULL),
(189, 'VILLALBA', 16, NULL),
(190, 'AGUA BLANCA', 17, NULL),
(191, 'ARAURE', 17, NULL),
(192, 'ESTELLER', 17, NULL),
(193, 'GUANARE', 17, NULL),
(194, 'GUANARITO', 17, NULL),
(195, 'MONSEÑOR JOSE VICENTE DE UNDA', 17, NULL),
(196, 'OSPINO', 17, NULL),
(197, 'PAPELON', 17, NULL),
(198, 'SAN GENARO DE BOCONOITO', 17, NULL),
(199, 'SAN RAFAEL DE ONOTO', 17, NULL),
(200, 'SANTA ROSALIA', 17, NULL),
(201, 'TUREN', 17, NULL),
(202, 'ANDRES ELOY BLANCO', 18, NULL),
(203, 'ANDRES MATA', 18, NULL),
(204, 'ARISMENDI', 18, NULL),
(205, 'BENITEZ', 18, NULL),
(206, 'BERMUDEZ', 18, NULL),
(207, 'CAJIGAL', 18, NULL),
(208, 'CRUZ SALMERON ACOSTA', 18, NULL),
(209, 'MARIÑO', 18, NULL),
(210, 'MEJIA', 18, NULL),
(211, 'MONTES', 18, NULL),
(212, 'RIBERO', 18, NULL),
(213, 'VALDEZ', 18, NULL),
(214, 'ANTONIO ROMULO COSTA', 19, NULL),
(215, 'AYACUCHO', 19, NULL),
(216, 'CARDENAS', 19, NULL),
(217, 'CORDOVA', 19, NULL),
(218, 'FERNANDEZ FEO', 19, NULL),
(219, 'FRANCISCO DE MIRANDA', 19, NULL),
(220, 'GARCIA DE HEVIA', 19, NULL),
(221, 'GUASIMOS', 19, NULL),
(222, 'JAUREGUI', 19, NULL),
(223, 'JOSE MARIA VARGAS', 19, NULL),
(224, 'JUNIN', 19, NULL),
(225, 'LIBERTADOR', 19, NULL),
(226, 'LOBATERA', 19, NULL),
(227, 'MICHELENA', 19, NULL),
(228, 'PANAMERICANO', 19, NULL),
(229, 'PEDRO MARIA UREÑA', 19, NULL),
(230, 'RAFAEL URDANETA', 19, NULL),
(231, 'SAMUEL DARIO MALDONADO', 19, NULL),
(232, 'SAN CRISTOBAL', 19, NULL),
(233, 'SAN JUDAS TADEO', 19, NULL),
(234, 'SEBORUCO', 19, NULL),
(235, 'SIMON RODRIGUEZ', 19, NULL),
(236, 'TORBES', 19, NULL),
(237, 'URIBANTE', 19, NULL),
(238, 'ANDRES BELLO', 20, NULL),
(239, 'BOCONO', 20, NULL),
(240, 'CANDELARIA', 20, NULL),
(241, 'CARACHE', 20, NULL),
(242, 'ESCUQUE', 20, NULL),
(243, 'JOSE FELIPE MARQUEZ CAÑIZALEZ', 20, NULL),
(244, 'JUAN VICENTE CAMPOS ELIAS', 20, NULL),
(245, 'LA CEIBA', 20, NULL),
(246, 'MONTE CARMELO', 20, NULL),
(247, 'MOTATAN', 20, NULL),
(248, 'PAMPANITO', 20, NULL),
(249, 'RAFAEL RANGEL', 20, NULL),
(250, 'SAN RAFAEL DE CARVAJAL', 20, NULL),
(251, 'TRUJILLO', 20, NULL),
(252, 'URDANETA', 20, NULL),
(253, 'VALERA', 20, NULL),
(254, 'PEÑA', 21, NULL),
(255, 'VARGAS', 21, NULL),
(256, 'VEROES', 21, NULL),
(257, 'ARISTIDES BASTIDAS', 22, NULL),
(258, 'BOLIVAR', 22, NULL),
(259, 'BRUZUAL', 22, NULL),
(260, 'COCOROTE', 22, NULL),
(261, 'INDEPENDENCIA', 22, NULL),
(262, 'JOSE ANTONIO PAEZ', 22, NULL),
(263, 'JOSE JOAQUIN VEROES', 22, NULL),
(264, 'LA TRINIDAD', 22, NULL),
(265, 'MANUEL MONGE', 22, NULL),
(266, 'NIRGUA', 22, NULL),
(267, 'PEÑA', 22, NULL),
(268, 'SAN FELIPE', 22, NULL),
(269, 'URACHICHE', 22, NULL),
(270, 'ALMIRANTE PADILLA', 23, NULL),
(271, 'BARALT', 23, NULL),
(272, 'CABIMAS', 23, NULL),
(273, 'CATATUMBO', 23, NULL),
(274, 'COLON', 23, NULL),
(275, 'FRANCISCO JAVIER PULGAR', 23, NULL),
(276, 'JESUS ENRIQUE LOSADA', 23, NULL),
(277, 'JESUS MARIA SEMPRUN', 23, NULL),
(278, 'LA CAÑADA DE URDANETA', 23, NULL),
(279, 'LAGUNILLAS', 23, NULL),
(280, 'MACHIQUES DE PERIJA', 23, NULL),
(281, 'MARA', 23, NULL),
(282, 'MARACAIBO', 23, NULL),
(283, 'MIRANDA', 23, NULL),
(284, 'PAEZ', 23, NULL),
(285, 'ROSARIO DE PERIJA', 23, NULL),
(286, 'SAN FRANCISCO', 23, NULL),
(287, 'SANTA RITA', 23, NULL),
(288, 'SIMON BOLIVAR', 23, NULL),
(289, 'SUCRE', 23, NULL),
(290, 'VALMORE RODRIGUEZ', 23, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `topcion`
--

CREATE TABLE IF NOT EXISTS `topcion` (
`codigo_opcion` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `icono` varchar(200) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'icon-pencil',
  `orden` int(11) NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `topcion`
--

INSERT INTO `topcion` (`codigo_opcion`, `descripcion`, `icono`, `orden`, `fecha_desactivacion`) VALUES
(1, 'INSERTAR', 'icon-pencil', 1, NULL),
(2, 'ACTUALIZAR', 'icon-edit', 2, NULL),
(3, 'DESACTIVAR', 'icon-eye-close', 3, NULL),
(4, 'ACTIVAR', 'icon-eye-open', 4, NULL),
(5, 'CONSULTAR', 'icon-search', 5, NULL),
(6, 'CANCELAR', 'icon-remove', 6, NULL),
(7, 'LISTAR', 'icon-print', 7, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpais`
--

CREATE TABLE IF NOT EXISTS `tpais` (
`codigo_pais` int(11) NOT NULL,
  `descripcion` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tpais`
--

INSERT INTO `tpais` (`codigo_pais`, `descripcion`, `fecha_desactivacion`) VALUES
(1, 'VENEZUELA', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tparentesco`
--

CREATE TABLE IF NOT EXISTS `tparentesco` (
`codigo_parentesco` int(11) NOT NULL,
  `descripcion` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tparentesco`
--

INSERT INTO `tparentesco` (`codigo_parentesco`, `descripcion`, `fecha_desactivacion`) VALUES
(1, 'HERMANO', NULL),
(2, 'MADRE', NULL),
(3, 'PADRE', NULL),
(4, 'PRIMA', NULL),
(5, 'TIO', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tparroquia`
--

CREATE TABLE IF NOT EXISTS `tparroquia` (
`codigo_parroquia` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo_municipio` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=921 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tparroquia`
--

INSERT INTO `tparroquia` (`codigo_parroquia`, `descripcion`, `fecha_desactivacion`, `codigo_municipio`) VALUES
(1, 'ALTO ORINOCO', NULL, 2),
(2, 'HUACHAMACARE ACANAÑA', NULL, 2),
(3, 'MARAWAKA TOKY SHAMANAÑA', NULL, 2),
(4, 'MAVAKA MAVAKA', NULL, 2),
(5, 'SIERRA PARIMA PARIMABE', NULL, 2),
(6, 'CANAME GUARINUMA', NULL, 3),
(7, 'UCATA LAJA LISA', NULL, 3),
(8, 'YAPACANA MACURUCO', NULL, 3),
(9, 'FERNANDO GIRON TOVAR', NULL, 4),
(10, 'LUIS ALBERTO GOMEZ', NULL, 4),
(11, 'PAHUEÑA LIMON DE PARHUEÑA', NULL, 4),
(12, 'PLATANILLAL PLATANILLAL', NULL, 4),
(13, 'GUAYAPO', NULL, 5),
(14, 'MUNDUAPO', NULL, 5),
(15, 'SAMARIAPO', NULL, 5),
(16, 'SIPAPO', NULL, 5),
(17, 'ALTO VENTUARI', NULL, 6),
(18, 'BAJO VENTUARI', NULL, 6),
(19, 'MEDIO VENTUARI', NULL, 6),
(20, 'COMUNIDAD', NULL, 8),
(21, 'VICTORINO', NULL, 8),
(22, 'CASIQUIARE', NULL, 9),
(23, 'COCUY', NULL, 9),
(24, 'SAN CARLOS DE RIO NEGRO', NULL, 9),
(25, 'SOLANO', NULL, 9),
(26, 'ANACO', NULL, 10),
(27, 'ARAGUA DE BARCELONA', NULL, 11),
(28, 'LECHERIA', NULL, 13),
(29, 'VALLE DE GUANAPE', NULL, 15),
(30, 'CALATRAVA', NULL, 17),
(31, 'EL CHAPARRO', NULL, 17),
(32, 'TOMAS ALFARO', NULL, 17),
(33, 'CHORRERON', NULL, 19),
(34, 'GUANTA', NULL, 19),
(35, 'MAPIRE', NULL, 20),
(36, 'PIAR', NULL, 20),
(37, 'SAN DIEGO DE CABRUTICA', NULL, 20),
(38, 'SANTA CLARA', NULL, 20),
(39, 'POZUELOS', NULL, 21),
(40, 'PUERTO LA CRUZ', NULL, 21),
(41, 'ONOTO', NULL, 22),
(42, 'CLARINES', NULL, 23),
(43, 'GUANAPE', NULL, 23),
(44, 'SABANA DE UCHIRE', NULL, 23),
(45, 'CANTAURA', NULL, 26),
(46, 'URICA', NULL, 26),
(47, 'SAN JOSE DE GUANIPA', NULL, 27),
(48, 'BOCA DE CHAVEZ', NULL, 28),
(49, 'BOCA DE UCHIRE', NULL, 28),
(50, 'ACHAGUAS', NULL, 30),
(51, 'APURITO', NULL, 30),
(52, 'EL YAGUAL', NULL, 30),
(53, 'GUACHARA', NULL, 30),
(54, 'MUCURITAS', NULL, 30),
(55, 'QUESERAS DEL MEDIO', NULL, 30),
(56, 'BIRUACA', NULL, 31),
(57, 'CODAZZI', NULL, 33),
(58, 'CUNAVICHE', NULL, 33),
(59, 'SAN JUAN DE PAYARA', NULL, 33),
(60, 'PEÑALVER', NULL, 34),
(61, 'SAN RAFAEL DE ATAMAICA', NULL, 34),
(62, 'CHORONI', NULL, 35),
(63, 'JOAQUIN CRESPO', NULL, 35),
(64, 'JOSE CASANOVA GODOY', NULL, 35),
(65, 'LAS DELICIAS', NULL, 35),
(66, 'LOS TACARIGUA', NULL, 35),
(67, 'MADRE MARIA DE SAN JOSE', NULL, 35),
(68, 'PEDRO JOSE OVALLES', NULL, 35),
(69, 'CAMATAGUA', NULL, 36),
(70, 'CARMEN DE CURA', NULL, 36),
(71, 'MOSEÑOR FELICIANO GONZALEZ', NULL, 37),
(72, 'JOSE RAFAEL REVENGA', NULL, 39),
(73, 'OCUMARE DE LA COSTA', NULL, 41),
(74, 'GÜIRIPA', NULL, 42),
(75, 'OLLAS DE CARAMACATE', NULL, 42),
(76, 'SAN CASIMIRO', NULL, 42),
(77, 'VALLE MORIN', NULL, 42),
(78, 'SANTOS MICHELENA', NULL, 45),
(79, 'TIARA', NULL, 45),
(80, 'NICOLAS PULIDO', NULL, 47),
(81, 'TICOPORO', NULL, 47),
(82, 'ALBERTO ARVELO LARRIVA', NULL, 48),
(83, 'ALTO BARINAS', NULL, 48),
(84, 'BARINAS', NULL, 48),
(85, 'CORAZON DE JESUS', NULL, 48),
(86, 'DOMINGA ORTIZ DE PAEZ', NULL, 48),
(87, 'JUAN ANTONIO RODRIGUEZ DOMINGUEZ', NULL, 48),
(88, 'MANUEL PALACIO FAJARDO', NULL, 48),
(89, 'SAN SILVESTRE', NULL, 48),
(90, 'TORUMOS', NULL, 48),
(91, 'MAZPARRITO', NULL, 49),
(92, 'EL REAL', NULL, 50),
(93, 'GUASIMITOS', NULL, 50),
(94, 'LA LUZ', NULL, 50),
(95, 'OBISPOS', NULL, 50),
(96, 'CIUDAD BOLIVIA', NULL, 51),
(97, 'JOSE FELIX RIBAS', NULL, 51),
(98, 'JOSE IGNACIO BRICEÑO', NULL, 51),
(99, 'DOLORES', NULL, 52),
(100, 'PALACIO FAJARDO', NULL, 52),
(101, 'CIUDAD DE NUTRIAS', NULL, 53),
(102, 'EL REGALO', NULL, 53),
(103, 'PUERTO NUTRIAS', NULL, 53),
(104, 'BARCELONETA', NULL, 54),
(105, '5 DE JULIO', NULL, 55),
(106, 'CACHAMAY', NULL, 55),
(107, 'CHIRICA', NULL, 55),
(108, 'ONCE DE ABRIL', NULL, 55),
(109, 'POZO VERDE', NULL, 55),
(110, 'UNARE', NULL, 55),
(111, 'UNIVERSIDAD', NULL, 55),
(112, 'VISTA AL SOL', NULL, 55),
(113, 'YOCOIMA', NULL, 55),
(114, 'EL CALLAO', NULL, 57),
(115, 'GRAN SABANA', NULL, 58),
(116, 'IKABARU', NULL, 58),
(117, 'AGUA SALADA', NULL, 59),
(118, 'LA SABANITA', NULL, 59),
(119, 'MARHUANTA', NULL, 59),
(120, 'ORINOCO', NULL, 59),
(121, 'PANAPANA', NULL, 59),
(122, 'VISTA HERMOSA', NULL, 59),
(123, 'ROSCIO', NULL, 62),
(124, 'DALLA COSTA', NULL, 63),
(125, 'SIFONTES', NULL, 63),
(126, 'BEJUMA', NULL, 64),
(127, 'CANOABO', NULL, 64),
(128, 'SIMON BOLIVAR', NULL, 64),
(129, 'CARABOBO', NULL, 65),
(130, 'GÜIGÜE', NULL, 65),
(131, 'TACARIGUA', NULL, 65),
(132, 'AGUAS CALIENTES', NULL, 66),
(133, 'MARIARA', NULL, 66),
(134, 'CIUDAD ALIANZA', NULL, 67),
(135, 'GUACARA', NULL, 67),
(136, 'MORON', NULL, 68),
(137, 'YAGUA', NULL, 68),
(138, 'LOS GUAYOS', NULL, 69),
(139, 'NAGUANAGUA', NULL, 71),
(140, 'BARTOLOME SALOM', NULL, 72),
(141, 'BORBURATA', NULL, 72),
(142, 'DEMOCRACIA', NULL, 72),
(143, 'FRATERNIDAD', NULL, 72),
(144, 'GOAIGOAZA', NULL, 72),
(145, 'JUAN JOSE FLORES', NULL, 72),
(146, 'PATANEMO', NULL, 72),
(147, 'SAN DIEGO', NULL, 73),
(148, 'SAN JOAQUIN', NULL, 74),
(149, 'CANDELARIA', NULL, 75),
(150, 'MIGUEL PEÑA', NULL, 75),
(151, 'NEGRO PRIMERO', NULL, 75),
(152, 'SAN BLAS', NULL, 75),
(153, 'COJEDES', NULL, 76),
(154, 'JUAN DE MATA SUAREZ', NULL, 76),
(155, 'EL BAUL', NULL, 77),
(156, 'LA AGUADITA', NULL, 78),
(157, 'MACAPO', NULL, 78),
(158, 'EL PAO', NULL, 79),
(159, 'LIBERTAD DE COJEDES', NULL, 80),
(160, 'ELORZA', NULL, 81),
(161, 'JUAN ANGEL BRAVO', NULL, 82),
(162, 'SAN CARLOS DE AUSTRIA', NULL, 82),
(163, 'GENERAL EN JEFE JOSE LAURENCIO SILVA', NULL, 83),
(164, 'TINAQUILLO', NULL, 84),
(165, 'ALMIRANTE LUIS BRION', NULL, 85),
(166, 'CURIAPO', NULL, 85),
(167, 'FRANCISCO ANICETO LUGO', NULL, 85),
(168, 'MANUEL RENAUD', NULL, 85),
(169, 'PADRE BARRAL', NULL, 85),
(170, 'SANTOS DE ABELGAS', NULL, 85),
(171, 'CINCO DE JULIO', NULL, 86),
(172, 'IMATACA', NULL, 86),
(173, 'JUAN BAUTISTA ARISMENDI', NULL, 86),
(174, 'MANUEL PIAR', NULL, 86),
(175, 'LUIS BELTRAN PRIETO FIGUEROA', NULL, 87),
(176, 'PEDERNALES', NULL, 87),
(177, 'JOSE VIDAL MARCANO', NULL, 88),
(178, 'JUAN MILLAN', NULL, 88),
(179, 'LEONARDO RUIZ PINEDA', NULL, 88),
(180, 'MARISCAL ANTONIO JOSE DE SUCRE', NULL, 88),
(181, 'MONSEÑOR ARGIMIRO GARCIA', NULL, 88),
(182, 'SAN JOSE (DELTA AMACURO)', NULL, 88),
(183, 'SAN RAFAEL (DELTA AMACURO)', NULL, 88),
(184, 'VIRGEN DEL VALLE', NULL, 88),
(185, 'BARIRO', NULL, 89),
(186, 'BOROJO', NULL, 89),
(187, 'CAPATARIDA', NULL, 89),
(188, 'GUAJIRO', NULL, 89),
(189, 'SEQUE', NULL, 89),
(190, 'VALLE DE EROA', NULL, 89),
(191, 'CACIQUE MANAURE', NULL, 90),
(192, 'CARIRUBANA', NULL, 91),
(193, 'NORTE', NULL, 91),
(194, 'URBANA PUNTA CARDON', NULL, 91),
(195, 'ACURIGUA', NULL, 92),
(196, 'GUAIBACOA', NULL, 92),
(197, 'LA VELA DE CORO', NULL, 92),
(198, 'LAS CALDERAS', NULL, 92),
(199, 'MACORUCA', NULL, 92),
(200, 'DABAJURO', NULL, 93),
(201, 'AGUA CLARA', NULL, 94),
(202, 'AVARIA', NULL, 94),
(203, 'PEDREGAL', NULL, 94),
(204, 'PIEDRA GRANDE', NULL, 94),
(205, 'PURURECHE', NULL, 94),
(206, 'ADAURE', NULL, 95),
(207, 'ADICORA', NULL, 95),
(208, 'BARAIVED', NULL, 95),
(209, 'EL HATO', NULL, 95),
(210, 'EL VINCULO', NULL, 95),
(211, 'JADACAQUIVA', NULL, 95),
(212, 'MORUY', NULL, 95),
(213, 'AGUA LARGA', NULL, 96),
(214, 'CHURUGUARA', NULL, 96),
(215, 'EL PAUJI', NULL, 96),
(216, 'MAPARARI', NULL, 96),
(217, 'AGUA LINDA', NULL, 97),
(218, 'ARAURIMA', NULL, 97),
(219, 'JACURA', NULL, 97),
(220, 'BOCA DE AROA', NULL, 98),
(221, 'TUCACAS', NULL, 98),
(222, 'JUDIBANA', NULL, 99),
(223, 'LOS TAQUES', NULL, 99),
(224, 'CASIGUA', NULL, 100),
(225, 'MENE DE MAUROA', NULL, 100),
(226, 'SAN FELIX', NULL, 100),
(227, 'PALMASOLA', NULL, 102),
(228, 'CABURE', NULL, 103),
(229, 'COLINA', NULL, 103),
(230, 'CURIMAGUA', NULL, 103),
(231, 'PIRITU', NULL, 104),
(232, 'SAN JOSE DE LA COSTA', NULL, 104),
(233, 'TOCOPERO', NULL, 106),
(234, 'EL CHARAL', NULL, 107),
(235, 'LAS VEGAS DEL TUY', NULL, 107),
(236, 'SANTA CRUZ DE BUCARAL', NULL, 107),
(237, 'BRUZUAL', NULL, 108),
(238, 'URUMACO', NULL, 108),
(239, 'CAMAGUAN', NULL, 109),
(240, 'PUERTO MIRANDA', NULL, 109),
(241, 'UVERITO', NULL, 109),
(242, 'CASTOR NIEVES RIOS', NULL, 113),
(243, 'LAS GUACAMAYAS', NULL, 113),
(244, 'PAO DE ZARATE', NULL, 113),
(245, 'SAN RAFAEL DE LAYA', NULL, 113),
(246, 'TUCUPIDO', NULL, 113),
(247, 'ZUATA', NULL, 113),
(248, 'ALTAGRACIA DE ORITUCO', NULL, 114),
(249, 'LIBERTAD DE ORITUCO', NULL, 114),
(250, 'PASO REAL DE MACAIRA', NULL, 114),
(251, 'SAN FRANCISCO DE MACAIRA', NULL, 114),
(252, 'SAN FRANCISCO JAVIER DE LEZAMA', NULL, 114),
(253, 'SAN RAFAEL DE ORITUCO', NULL, 114),
(254, 'CANTACLARO', NULL, 115),
(255, 'PARAPARA', NULL, 115),
(256, 'SAN JUAN DE LOS MORROS', NULL, 115),
(257, 'EL SOMBRERO', NULL, 116),
(258, 'SOSA', NULL, 116),
(259, 'CABRUTA', NULL, 117),
(260, 'SANTA RITA DE MANAPIRE', NULL, 117),
(261, 'ESPINO', NULL, 118),
(262, 'VALLE DE LA PASCUA', NULL, 118),
(263, 'ORTIZ', NULL, 119),
(264, 'SAN FRANCISCO DE TIZNADOS', NULL, 119),
(265, 'SAN JOSE DE TIZNADOS', NULL, 119),
(266, 'SAN LORENZO DE TIZNADOS', NULL, 119),
(267, 'SAN JOSE DE UNARE', NULL, 120),
(268, 'ZARAZA', NULL, 120),
(269, 'CAZORLA', NULL, 121),
(270, 'GUAYABAL', NULL, 121),
(271, 'SAN JOSE DE GUARIBE', NULL, 122),
(272, 'ALTAMIRA', NULL, 123),
(273, 'SANTA MARIA DE IPIRE', NULL, 123),
(274, 'CAPITAL URBANA CALABOZO', NULL, 124),
(275, 'EL CALVARIO', NULL, 124),
(276, 'EL RASTRO', NULL, 124),
(277, 'GUARDATINAJAS', NULL, 124),
(278, 'FREITEZ', NULL, 125),
(279, 'JOSE MARIA BLANCO', NULL, 125),
(280, 'AGUEDO FELIPE ALVARADO', NULL, 126),
(281, 'EL CUJI', NULL, 126),
(282, 'JUAN DE VILLEGAS', NULL, 126),
(283, 'JUAREZ', NULL, 126),
(284, 'TAMACA', NULL, 126),
(285, 'CORONEL MARIANO PERAZA ', NULL, 127),
(286, 'CUARA', NULL, 127),
(287, 'DIEGO DE LOZADA', NULL, 127),
(288, 'JOSE BERNARDO DORANTE', NULL, 127),
(289, 'JUAN BAUTISTA RODRIGUEZ', NULL, 127),
(290, 'PARAISO DE SAN JOSE', NULL, 127),
(291, 'TINTORERO', NULL, 127),
(292, 'ANZOATEGUI', NULL, 128),
(293, 'GUARICO', NULL, 128),
(294, 'HILARIO LUNA Y LUNA', NULL, 128),
(295, 'HUMOCARO ALTO', NULL, 128),
(296, 'HUMOCARO BAJO', NULL, 128),
(297, 'MORAN', NULL, 128),
(298, 'AGUA VIVA', NULL, 129),
(299, 'CABUDARE', NULL, 129),
(300, 'JOSE GREGORIO BASTIDAS', NULL, 129),
(301, 'BURIA', NULL, 130),
(302, 'GUSTAVO VEGAS LEON', NULL, 130),
(303, 'SARARE', NULL, 130),
(304, 'ANTONIO DIAZ', NULL, 131),
(305, 'CAMACARO', NULL, 131),
(306, 'CASTAÑEDA', NULL, 131),
(307, 'CECILIO ZUBILLAGA', NULL, 131),
(308, 'EL BLANCO', NULL, 131),
(309, 'ESPINOZA DE LOS MONTEROS', NULL, 131),
(310, 'HERIBERTO ARROYO', NULL, 131),
(311, 'LARA', NULL, 131),
(312, 'LAS MERCEDES', NULL, 131),
(313, 'MANUEL MORILLO', NULL, 131),
(314, 'MONTAÑA VERDE', NULL, 131),
(315, 'MONTES DE OCA', NULL, 131),
(316, 'REYES VARGAS', NULL, 131),
(317, 'TORRES', NULL, 131),
(318, 'TRINIDAD SAMUEL', NULL, 131),
(319, 'GABRIEL PICON GONZALEZ', NULL, 132),
(320, 'HECTOR AMABLE MORA', NULL, 132),
(321, 'JOSE NUCETE SARDI', NULL, 132),
(322, 'PRESIDENTE BETANCOURT', NULL, 132),
(323, 'PRESIDENTE PAEZ', NULL, 132),
(324, 'PRESIDENTE ROMULO GALLEGOS', NULL, 132),
(325, 'PULIDO MENDEZ', NULL, 132),
(326, 'MESA BOLIVAR', NULL, 133),
(327, 'MESA DE LAS PALMAS', NULL, 133),
(328, 'SANTA CRUZ DE MORA', NULL, 133),
(329, 'CANAGUA', NULL, 135),
(330, 'CAPURI', NULL, 135),
(331, 'CHACANTA', NULL, 135),
(332, 'EL MOLINO', NULL, 135),
(333, 'GUAIMARAL', NULL, 135),
(334, 'MUCUCHACHI', NULL, 135),
(335, 'MUCUTUY', NULL, 135),
(336, 'ACEQUIAS', NULL, 136),
(337, 'FERNANDEZ PEÑA', NULL, 136),
(338, 'JAJI', NULL, 136),
(339, 'LA MESA', NULL, 136),
(340, 'MONTALBAN', NULL, 136),
(341, 'SAN JOSE DEL SUR', NULL, 136),
(342, 'FLORENCIO RAMIREZ', NULL, 137),
(343, 'TUCANI', NULL, 137),
(344, 'LAS PIEDRAS', NULL, 138),
(345, 'GUARAQUE', NULL, 139),
(346, 'MESA DE QUINTERO', NULL, 139),
(347, 'ARAPUEY', NULL, 140),
(348, 'PALMIRA', NULL, 140),
(349, 'SANTA MARIA DE CAPARO', NULL, 143),
(350, 'PUEBLO LLANO', NULL, 144),
(351, 'CACUTE', NULL, 145),
(352, 'LA TOMA', NULL, 145),
(353, 'MUCUCHIES', NULL, 145),
(354, 'MUCURUBA', NULL, 145),
(355, 'BAILADORES', NULL, 146),
(356, 'GERONIMO MALDONADO', NULL, 146),
(357, 'TABAY', NULL, 147),
(358, 'EL AMPARO', NULL, 149),
(359, 'EL LLANO', NULL, 149),
(360, 'TOVAR', NULL, 149),
(361, 'MARIA DE LA CONCEPCION PALACIOS BLANCO', NULL, 150),
(362, 'NUEVA BOLIVIA', NULL, 150),
(363, 'CAÑO EL TIGRE', NULL, 151),
(364, 'ZEA', NULL, 151),
(365, 'ARAGÜITA', NULL, 152),
(366, 'AREVALO GONZALEZ', NULL, 152),
(367, 'CAPAYA', NULL, 152),
(368, 'CAUCAGUA', NULL, 152),
(369, 'EL CAFE', NULL, 152),
(370, 'MARIZAPA', NULL, 152),
(371, 'PANAQUIRE', NULL, 152),
(372, 'RIBAS', NULL, 152),
(373, 'EL CAFETAL', NULL, 153),
(374, 'LAS MINAS', NULL, 153),
(375, 'NUESTRA SEÑORA DEL ROSARIO', NULL, 153),
(376, 'CURIEPE', NULL, 154),
(377, 'HIGUEROTE', NULL, 154),
(378, 'TACARIGUA DE BRION', NULL, 154),
(379, 'MAMPORAL', NULL, 155),
(380, 'CARRIZAL', NULL, 156),
(381, 'CHACAO', NULL, 157),
(382, 'CHARALLAVE', NULL, 158),
(383, 'LAS BRISAS', NULL, 158),
(384, 'EL HATILLO', NULL, 159),
(385, 'ALTAGRACIA DE LA MONTAÑA', NULL, 160),
(386, 'EL JARILLO', NULL, 160),
(387, 'LOS TEQUES', NULL, 160),
(388, 'PARACOTOS', NULL, 160),
(389, 'TACATA', NULL, 160),
(390, 'LA DEMOCRACIA', NULL, 161),
(391, 'OCUMARE DEL TUY', NULL, 161),
(392, 'SAN ANTONIO DE LOS ALTOS', NULL, 162),
(393, 'SANTA LUCIA DEL TUY', NULL, 163),
(394, 'CUPIRA', NULL, 164),
(395, 'MACHURUCUTO', NULL, 164),
(396, 'GUARENAS', NULL, 165),
(397, 'AUGUSTO MIJARES', NULL, 167),
(398, 'GUATIRE', NULL, 167),
(399, 'LA CIENAGA', NULL, 167),
(400, 'LA SOLEDAD', NULL, 167),
(401, 'MAGDALENO', NULL, 167),
(402, 'PUEBLO CUMAREBO', NULL, 167),
(403, 'PUERTO CUMAREBO', NULL, 167),
(404, 'SAN FRANCISCO DE ASIS', NULL, 167),
(405, 'VALLES DE TUCUTUNEMO', NULL, 167),
(406, 'ZAMORA', NULL, 167),
(407, 'ZAZARIDA', NULL, 167),
(408, 'CAPADARE', NULL, 168),
(409, 'SAN ANTONIO DE MATURIN', NULL, 168),
(410, 'SAN FRANCISCO DE MATURIN', NULL, 168),
(411, 'SAN JUAN DE LOS CAYOS', NULL, 168),
(412, 'AGUASAY', NULL, 169),
(413, 'CARIPE', NULL, 170),
(414, 'EL GUACHARO', NULL, 170),
(415, 'LA GUANOTA', NULL, 170),
(416, 'SABANA DE PIEDRA', NULL, 170),
(417, 'TERESEN', NULL, 170),
(418, 'EL TEJERO', NULL, 173),
(419, 'JOSE IGNACIO DEL PUMAR', NULL, 173),
(420, 'PEDRO BRICEÑO MENDEZ', NULL, 173),
(421, 'PUNTA DE MATA', NULL, 173),
(422, 'RAMON IGNACIO MENDEZ', NULL, 173),
(423, 'ALTO DE LOS GODOS', NULL, 174),
(424, 'BOQUERON', NULL, 174),
(425, 'EL COROZO', NULL, 174),
(426, 'EL FURRIAL', NULL, 174),
(427, 'JUSEPIN', NULL, 174),
(428, 'LA CRUZ', NULL, 174),
(429, 'LA PICA', NULL, 174),
(430, 'LAS COCUIZAS', NULL, 174),
(431, 'SAN SIMON', NULL, 174),
(432, 'SAN VICENTE', NULL, 174),
(433, 'APARICIO', NULL, 175),
(434, 'ARAGUA DE MATURIN', NULL, 175),
(435, 'CHAGUAMAL', NULL, 175),
(436, 'EL PINTO', NULL, 175),
(437, 'GUANAGUANA', NULL, 175),
(438, 'LA TOSCANA', NULL, 175),
(439, 'PEDRO COVA', NULL, 175),
(440, 'TAGUAYA', NULL, 175),
(441, 'CACHIPO', NULL, 176),
(442, 'QUIRIQUIRE', NULL, 176),
(443, 'BARRANCAS', NULL, 178),
(444, 'LOS BARRANCOS DE FAJARDO', NULL, 178),
(445, 'URACOA', NULL, 179),
(446, 'ANTOLIN DEL CAMPO', NULL, 180),
(447, 'ZABALA', NULL, 181),
(448, 'FRANCISCO FAJARDO', NULL, 182),
(449, 'GARCIA', NULL, 182),
(450, 'GUEVARA', NULL, 183),
(451, 'MATASIETE', NULL, 183),
(452, 'AGUIRRE', NULL, 185),
(453, 'MANEIRO', NULL, 185),
(454, 'ADRIAN', NULL, 186),
(455, 'JUAN GRIEGO', NULL, 186),
(456, 'BOCA DE RIO', NULL, 188),
(457, 'SAN FRANCISCO DE MACANAO', NULL, 188),
(458, 'LOS BALEALES', NULL, 189),
(459, 'TUBORES', NULL, 189),
(460, 'VICENTE FUENTES', NULL, 190),
(461, 'VILLALBA', NULL, 190),
(462, 'AGUA BLANCA', NULL, 191),
(463, 'ARAURE', NULL, 192),
(464, 'CAPITAL ARAURE', NULL, 192),
(465, 'RIO ACARIGUA', NULL, 192),
(466, 'CAPITAL ESTELLER', NULL, 193),
(467, 'UVERAL', NULL, 193),
(468, 'CORDOVA', NULL, 194),
(469, 'GUANARE', NULL, 194),
(470, 'SAN JOSE DE LA MONTAÑA', NULL, 194),
(471, 'SAN JOSE DE LA MONTAÑA', NULL, 194),
(472, 'SAN JUAN DE GUANAGUANARE', NULL, 194),
(473, 'VIRGEN DE COROMOTO', NULL, 194),
(474, 'VIRGEN DE LA COROMOTO', NULL, 194),
(475, 'DIVINA PASTORA', NULL, 195),
(476, 'GUANARITO', NULL, 195),
(477, 'TRINIDAD DE LA CAPILLA', NULL, 195),
(478, 'PEÑA BLANCA', NULL, 196),
(479, 'APARICION', NULL, 197),
(480, 'CAPITAL OSPINO', NULL, 197),
(481, 'LA ESTACION', NULL, 197),
(482, 'OSPINO', NULL, 197),
(483, 'CAÑO DELGADITO', NULL, 198),
(484, 'CAÑO DELGADITO', NULL, 198),
(485, 'PAPELON', NULL, 198),
(486, 'ANTOLIN TOVAR', NULL, 199),
(487, 'ANTOLIN TOVAR ANQUINO', NULL, 199),
(488, 'BOCONOITO', NULL, 199),
(489, 'SAN GENARO DE BOCONOITO', NULL, 199),
(490, 'SAN RAFAEL DE ONOTO', NULL, 200),
(491, 'SANTA FE', NULL, 200),
(492, 'THERMO MORALES', NULL, 200),
(493, 'THERMO MORLES', NULL, 200),
(494, 'EL PLAYON', NULL, 201),
(495, 'FLORIDA', NULL, 201),
(496, 'CANELONES', NULL, 202),
(497, 'SAN ISIDRO LABRADOR', NULL, 202),
(498, 'TUREN', NULL, 202),
(499, 'VILLA BRUZUAL', NULL, 202),
(500, 'EL CANTON', NULL, 203),
(501, 'MARIÑO', NULL, 203),
(502, 'PIO TAMAYO', NULL, 203),
(503, 'PUERTO VIVAS', NULL, 203),
(504, 'QUEBRADA HONDA DE GUACHE', NULL, 203),
(505, 'SANTA CRUZ DE GUACAS', NULL, 203),
(506, 'YACAMBU', NULL, 203),
(507, 'SAN JOSE DE AEROCUAR', NULL, 204),
(508, 'TAVERA ACOSTA', NULL, 204),
(509, 'ARISMENDI', NULL, 205),
(510, 'EL MORRO DE PUERTO SANTO', NULL, 205),
(511, 'GUADARRAMA', NULL, 205),
(512, 'PUERTO SANTO', NULL, 205),
(513, 'RIO CARIBE', NULL, 205),
(514, 'SAN JUAN DE LAS GALDONAS', NULL, 205),
(515, 'EL PILAR', NULL, 206),
(516, 'EL RINCON', NULL, 206),
(517, 'GENERAL FRANCISCO ANTONIO VAQUEZ', NULL, 206),
(518, 'GUARAUNOS', NULL, 206),
(519, 'TUNAPUICITO', NULL, 206),
(520, 'UNION', NULL, 206),
(521, 'MARACAPANA', NULL, 207),
(522, 'SANTA CATALINA', NULL, 207),
(523, 'SANTA ROSA', NULL, 207),
(524, 'EL PAUJIL', NULL, 208),
(525, 'YAGUARAPARO', NULL, 208),
(526, 'CHACOPATA', NULL, 209),
(527, 'CRUZ SALMERON ACOSTA', NULL, 209),
(528, 'MANICUARE', NULL, 209),
(529, 'MEJIA', NULL, 211),
(530, 'ARENAS', NULL, 212),
(531, 'ARICAGUA', NULL, 212),
(532, 'COGOLLAR', NULL, 212),
(533, 'CUMANACOA', NULL, 212),
(534, 'SAN FERNANDO', NULL, 212),
(535, 'SAN LORENZO', NULL, 212),
(536, 'CATUARO', NULL, 213),
(537, 'RENDON', NULL, 213),
(538, 'SAN CRUZ', NULL, 213),
(539, 'SANTA MARIA', NULL, 213),
(540, 'VILLA FRONTADO (MUELLE DE CARIACO)', NULL, 213),
(541, 'BIDEAU', NULL, 214),
(542, 'CRISTOBAL COLON', NULL, 214),
(543, 'GÜIRIA', NULL, 214),
(544, 'PUNTA DE PIEDRAS', NULL, 214),
(545, 'ANTONIO ROMULO COSTA', NULL, 215),
(546, 'RIVAS BERTI', NULL, 216),
(547, 'SAN PEDRO DEL RIO', NULL, 216),
(548, 'AMENODORO ANGEL LAMUS', NULL, 217),
(549, 'LA FLORIDA', NULL, 217),
(550, 'ALBERTO ADRIANI', NULL, 219),
(551, 'FERNANDEZ FEO', NULL, 219),
(552, 'SANTO DOMINGO', NULL, 219),
(553, 'ATAPIRIRE', NULL, 220),
(554, 'BOCA DEL PAO', NULL, 220),
(555, 'FRANCISCO DE MIRANDA', NULL, 220),
(556, 'PARIAGUAN', NULL, 220),
(557, 'BOCA DE GRITA', NULL, 221),
(558, 'GARCIA DE HEVIA', NULL, 221),
(559, 'GUASIMOS', NULL, 222),
(560, 'EMILIO CONSTANTINO GUERRERO', NULL, 223),
(561, 'JAUREGUI', NULL, 223),
(562, 'MONSEÑOR MIGUEL ANTONIO SALAS', NULL, 223),
(563, 'JOSE MARIA VARGAS', NULL, 224),
(564, 'BRAMON', NULL, 225),
(565, 'LA PETROLEA', NULL, 225),
(566, 'QUINIMARI', NULL, 225),
(567, '23 DE ENERO', NULL, 226),
(568, 'ALTAGRACIA', NULL, 226),
(569, 'ANTIMANO', NULL, 226),
(570, 'ANTONIO SPINETTI DINI', NULL, 226),
(571, 'ARIAS', NULL, 226),
(572, 'CARACCIOLO PARRA PEREZ', NULL, 226),
(573, 'CARICUAO', NULL, 226),
(574, 'CATEDRAL', NULL, 226),
(575, 'CHAGUARAMAS', NULL, 226),
(576, 'COCHE', NULL, 226),
(577, 'DOMINGO PEÑA', NULL, 226),
(578, 'DORADAS', NULL, 226),
(579, 'EL JUNQUITO', NULL, 226),
(580, 'EL MORRO', NULL, 226),
(581, 'EL PARAISO', NULL, 226),
(582, 'EL RECREO', NULL, 226),
(583, 'EL VALLE', NULL, 226),
(584, 'EMETERIO OCHOA', NULL, 226),
(585, 'GONZALO PICON FEBRES', NULL, 226),
(586, 'JACINTO PLAZA', NULL, 226),
(587, 'JUAN RODRIGUEZ SUAREZ', NULL, 226),
(588, 'LA CANDELARIA', NULL, 226),
(589, 'LA PASTORA', NULL, 226),
(590, 'LA VEGA', NULL, 226),
(591, 'LAS ALHUACAS', NULL, 226),
(592, 'LASSO DE LA VEGA', NULL, 226),
(593, 'LOS NEVADOS', NULL, 226),
(594, 'MACARAO', NULL, 226),
(595, 'MARIANO PICON SALAS', NULL, 226),
(596, 'MILLA', NULL, 226),
(597, 'OSUNA RODRIGUEZ', NULL, 226),
(598, 'PALO NEGRO', NULL, 226),
(599, 'SAGRARIO', NULL, 226),
(600, 'SAN AGUSTIN', NULL, 226),
(601, 'SAN BERNARDINO', NULL, 226),
(602, 'SAN JOAQUIN DE NAVAY', NULL, 226),
(603, 'SAN JOSE', NULL, 226),
(604, 'SAN JUAN', NULL, 226),
(605, 'SAN MARTIN DE PORRES', NULL, 226),
(606, 'SAN PEDRO', NULL, 226),
(607, 'SANTA ROSALIA', NULL, 226),
(608, 'SANTA TERESA', NULL, 226),
(609, 'SUCRE_CATIA', NULL, 226),
(610, 'TABASCA', NULL, 226),
(611, 'TEMBLADOR', NULL, 226),
(612, 'TOCUYITO', NULL, 226),
(613, 'TUNAPUY', NULL, 226),
(614, 'CONSTITUCION', NULL, 227),
(615, 'LOBATERA', NULL, 227),
(616, 'MICHELENA', NULL, 228),
(617, 'LA PALMITA', NULL, 229),
(618, 'PANAMERICANO', NULL, 229),
(619, 'DELICIAS', NULL, 231),
(620, 'PECAYA', NULL, 231),
(621, 'HERNANDEZ', NULL, 232),
(622, 'SAMUEL DARIO MALDONADO', NULL, 232),
(623, 'DR. FRANCISCO ROMERO LOBO', NULL, 233),
(624, 'LA CONCORDIA', NULL, 233),
(625, 'PEDRO MARIA MORANTES', NULL, 233),
(626, 'SAN JUAN BAUTISTA', NULL, 233),
(627, 'SAN SEBASTIAN', NULL, 233),
(628, 'SAN JUDAS TADEO', NULL, 234),
(629, 'SEBORUCO', NULL, 235),
(630, 'EDMUNDO BARRIOS', NULL, 236),
(631, 'MIGUEL OTERO SILVA', NULL, 236),
(632, 'TORBES', NULL, 237),
(633, 'CARDENAS', NULL, 238),
(634, 'JUAN PABLO PEÑALOSA', NULL, 238),
(635, 'POTOSI', NULL, 238),
(636, 'URIBANTE', NULL, 238),
(637, 'ARAGUANEY', NULL, 239),
(638, 'CUMBO', NULL, 239),
(639, 'EL JAGUITO', NULL, 239),
(640, 'LA AZULITA', NULL, 239),
(641, 'LA ESPERANZA', NULL, 239),
(642, 'SAN JOSE DE BARLOVENTO', NULL, 239),
(643, 'SANTA ISABEL', NULL, 239),
(644, 'AYACUCHO', NULL, 240),
(645, 'BOCONO', NULL, 240),
(646, 'BURBUSAY', NULL, 240),
(647, 'EL CARMEN', NULL, 240),
(648, 'GENERAL RIBAS', NULL, 240),
(649, 'GUARAMACAL', NULL, 240),
(650, 'MONSEÑOR JAUREGUI', NULL, 240),
(651, 'MOSQUEY', NULL, 240),
(652, 'RAFAEL RANGEL', NULL, 240),
(653, 'SAN MIGUEL', NULL, 240),
(654, 'VEGA DE GUARAMACAL', NULL, 240),
(655, 'BOLIVIA', NULL, 241),
(656, 'CARRILLO', NULL, 241),
(657, 'CEGARRA', NULL, 241),
(658, 'CHEJENDE', NULL, 241),
(659, 'MANUEL SALVADOR ULLOA', NULL, 241),
(660, 'CARACHE', NULL, 242),
(661, 'CUICAS', NULL, 242),
(662, 'PANAMERICANA', NULL, 242),
(663, 'SANTA CRUZ', NULL, 242),
(664, 'ESCUQUE', NULL, 243),
(665, 'LA UNION', NULL, 243),
(666, 'SABANA LIBRE', NULL, 243),
(667, 'ARNOLDO GABALDON', NULL, 245),
(668, 'EL PROGRESO', NULL, 246),
(669, 'LA CEIBA', NULL, 246),
(670, 'SANTA APOLONIA', NULL, 246),
(671, 'TRES DE FEBRERO', NULL, 246),
(672, 'BUENA VISTA', NULL, 247),
(673, 'MONTE CARMELO', NULL, 247),
(674, 'SANTA MARIA DEL HORCON', NULL, 247),
(675, 'EL BAÑO', NULL, 248),
(676, 'JALISCO', NULL, 248),
(677, 'MOTATAN', NULL, 248),
(678, 'PAMPANITO', NULL, 249),
(679, 'PAMPANITO II', NULL, 249),
(680, 'BETIJOQUE', NULL, 250),
(681, 'JOSE GREGORIO HERNANDEZ', NULL, 250),
(682, 'LA PUEBLITA', NULL, 250),
(683, 'LOS CEDROS', NULL, 250),
(684, 'ANTONIO NICOLAS BRICEÑO', NULL, 251),
(685, 'CAMPO ALEGRE', NULL, 251),
(686, 'CARVAJAL', NULL, 251),
(687, 'JOSE LEONARDO SUAREZ', NULL, 251),
(688, 'ANDRES LINARES', NULL, 252),
(689, 'CRISTOBAL MENDOZA', NULL, 252),
(690, 'CRUZ CARRILLO', NULL, 252),
(691, 'MATRIZ', NULL, 252),
(692, 'MONSEÑOR CARRILLO', NULL, 252),
(693, 'TRES ESQUINAS', NULL, 252),
(694, 'CABIMBU', NULL, 253),
(695, 'CUA', NULL, 253),
(696, 'JAJO', NULL, 253),
(697, 'LA MESA DE ESNUJAQUE', NULL, 253),
(698, 'LA QUEBRADA', NULL, 253),
(699, 'LAS PEÑITAS', NULL, 253),
(700, 'MOROTURO', NULL, 253),
(701, 'NUEVA CUA', NULL, 253),
(702, 'SAN FRANCISCO DE CARA', NULL, 253),
(703, 'SANTIAGO', NULL, 253),
(704, 'SIQUISIQUE', NULL, 253),
(705, 'TAGUAY', NULL, 253),
(706, 'TUÑAME', NULL, 253),
(707, 'URDANETA', NULL, 253),
(708, 'XAGUAS', NULL, 253),
(709, 'JUAN IGNACIO MONTILLA', NULL, 254),
(710, 'LA BEATRIZ', NULL, 254),
(711, 'LA PUERTA', NULL, 254),
(712, 'MENDOZA DEL VALLE DE MOMBOY', NULL, 254),
(713, 'MERCEDES DIAZ', NULL, 254),
(714, 'SAN LUIS', NULL, 254),
(715, 'CARABALLEDA', NULL, 256),
(716, 'CARAYACA', NULL, 256),
(717, 'CARLOS SOUBLETTE', NULL, 256),
(718, 'CARUAO CHUSPA', NULL, 256),
(719, 'CATIA LA MAR', NULL, 256),
(720, 'EL JUNKO', NULL, 256),
(721, 'LA GUAIRA', NULL, 256),
(722, 'MACUTO', NULL, 256),
(723, 'MAIQUETIA', NULL, 256),
(724, 'NAIGUATA', NULL, 256),
(725, 'URIMARE', NULL, 256),
(726, 'ARISTIDES BASTIDAS', NULL, 258),
(727, 'ALTAMIRA DE CACERES', NULL, 259),
(728, 'ARACUA', NULL, 259),
(729, 'BARINITAS', NULL, 259),
(730, 'CALDERAS', NULL, 259),
(731, 'CARIPITO', NULL, 259),
(732, 'CHEREGÜE', NULL, 259),
(733, 'GENERAL JUAN VICENTE GOMEZ', NULL, 259),
(734, 'GRANADOS', NULL, 259),
(735, 'ISAIAS MEDINA ANGARITA', NULL, 259),
(736, 'LA PEÑA', NULL, 259),
(737, 'PALOTAL', NULL, 259),
(738, 'SABANA GRANDE', NULL, 259),
(739, 'CAMPO ELIAS', NULL, 260),
(740, 'CHIVACOA', NULL, 260),
(741, 'COCOROTE', NULL, 261),
(742, 'CARTANAL', NULL, 262),
(743, 'INDEPENDENCIA', NULL, 262),
(744, 'JUAN GERMAN ROSCIO', NULL, 262),
(745, 'MAMO', NULL, 262),
(746, 'ROMAN CARDENAS', NULL, 262),
(747, 'SANTA TERESA DEL TUY', NULL, 262),
(748, 'SOLEDAD', NULL, 262),
(749, 'JOSE ANTONIO PAEZ', NULL, 263),
(750, 'EL GUAYABO', NULL, 264),
(751, 'FARRIAR', NULL, 264),
(752, 'LA TRINIDAD', NULL, 265),
(753, 'MANUEL MONGE', NULL, 266),
(754, 'NIRGUA', NULL, 267),
(755, 'SALOM', NULL, 267),
(756, 'TEMERLA', NULL, 267),
(757, 'ALBARICO', NULL, 269),
(758, 'SAN FELIPE', NULL, 269),
(759, 'SAN JAVIER', NULL, 269),
(760, 'URACHICHE', NULL, 270),
(761, 'ISLA DE TOAS', NULL, 271),
(762, 'MONAGAS', NULL, 271),
(763, 'GENERAL URDANETA', NULL, 272),
(764, 'LIBERTADOR', NULL, 272),
(765, 'MANUEL GUANIPA MATOS', NULL, 272),
(766, 'MARCELINO BRICEÑO', NULL, 272),
(767, 'PUEBLO NUEVO', NULL, 272),
(768, 'SAN TIMOTEO', NULL, 272),
(769, 'AMBROSIO', NULL, 273),
(770, 'ARISTIDES CALVANI', NULL, 273),
(771, 'CARMEN HERRERA', NULL, 273),
(772, 'GERMAN RIOS LINARES', NULL, 273),
(773, 'JORGE HERNANDEZ', NULL, 273),
(774, 'LA ROSA', NULL, 273),
(775, 'PUNTA GORDA', NULL, 273),
(776, 'ROMULO BETANCOURT', NULL, 273),
(777, 'SAN BENITO', NULL, 273),
(778, 'ENCONTRADOS', NULL, 274),
(779, 'UDON PEREZ', NULL, 274),
(780, 'MORALITO', NULL, 275),
(781, 'SAN CARLOS DEL ZULIA', NULL, 275),
(782, 'SANTA BARBARA', NULL, 275),
(783, 'SANTA CRUZ DEL ZULIA', NULL, 275),
(784, 'URRIBARRI', NULL, 275),
(785, 'CARLOS QUEVEDO', NULL, 276),
(786, 'FRANCISCO JAVIER PULGAR', NULL, 276),
(787, 'GUAMO-GAVILANES', NULL, 276),
(788, 'SIMON RODRIGUEZ', NULL, 276),
(789, 'JOSE RAMON YEPEZ', NULL, 277),
(790, 'LA CONCEPCION', NULL, 277),
(791, 'MARIANO PARRA LEON', NULL, 277),
(792, 'BARI', NULL, 278),
(793, 'JESUS MARIA SEMPRUN', NULL, 278),
(794, 'ALONSO DE OJEDA', NULL, 280),
(795, 'CAMPO LARA', NULL, 280),
(796, 'ELEAZAR LOPEZ CONTRERAS', NULL, 280),
(797, 'VENEZUELA', NULL, 280),
(798, 'BARTOLOME DE LAS CASAS', NULL, 281),
(799, 'LIBERTAD', NULL, 281),
(800, 'RIO NEGRO', NULL, 281),
(801, 'SAN JOSE DE PERIJA', NULL, 281),
(802, 'LA SIERRITA', NULL, 282),
(803, 'LAS PARCELAS', NULL, 282),
(804, 'LUIS DE VICENTE', NULL, 282),
(805, 'MONSEÑOR MARCOS SERGIO GODOY', NULL, 282),
(806, 'RICAURTE', NULL, 282),
(807, 'SAN RAFAEL', NULL, 282),
(808, 'TAMARE', NULL, 282),
(809, 'ANTONIO BORJAS ROMERO', NULL, 283),
(810, 'BOLIVAR', NULL, 283),
(811, 'CACIQUE MARA', NULL, 283),
(812, 'CARRACCIOLO PARRA PEREZ', NULL, 283),
(813, 'CECILIO ACOSTA', NULL, 283),
(814, 'CHIQUINQUIRA', NULL, 283),
(815, 'COQUIVACOA', NULL, 283),
(816, 'CRISTO DE ARANZA', NULL, 283),
(817, 'FRANCISCO EUGENIO BUSTAMANTE', NULL, 283),
(818, 'IDELFONZO VASQUEZ', NULL, 283),
(819, 'JUANA DE AVILA', NULL, 283),
(820, 'LUIS HURTADO HIGUERA', NULL, 283),
(821, 'MANUEL DAGNINO', NULL, 283),
(822, 'OLEGARIO VILLALOBOS', NULL, 283),
(823, 'RAUL LEONI', NULL, 283),
(824, 'SAN ISIDRO', NULL, 283),
(825, 'SANTA LUCIA', NULL, 283),
(826, 'VENANCIO PULGAR', NULL, 283),
(827, 'AGUA CALIENTE', NULL, 284),
(828, 'AGUA SANTA', NULL, 284),
(829, 'ANA MARIA CAMPOS', NULL, 284),
(830, 'ANDRES ELOY BLANCO', NULL, 284),
(831, 'EL CENIZO', NULL, 284),
(832, 'EL DIVIDIVE', NULL, 284),
(833, 'FARIA', NULL, 284),
(834, 'GUZMAN GUILLERMO', NULL, 284),
(835, 'LA VENTA', NULL, 284),
(836, 'MIRANDA', NULL, 284),
(837, 'MITARE', NULL, 284),
(838, 'PIÑANGO', NULL, 284),
(839, 'RIO SECO', NULL, 284),
(840, 'SABANETA', NULL, 284),
(841, 'SAN ANTONIO', NULL, 284),
(842, 'SAN GABRIEL', NULL, 284),
(843, 'TIMOTES', NULL, 284),
(844, 'VALERITA', NULL, 284),
(845, 'ACARIGUA', NULL, 285),
(846, 'ALTA GUAJIRA', NULL, 285),
(847, 'ARAMENDI', NULL, 285),
(848, 'EL GUAPO', NULL, 285),
(849, 'ELIAS SANCHEZ RUBIO', NULL, 285),
(850, 'GUAJIRA', NULL, 285),
(851, 'GUASDUALITO', NULL, 285),
(852, 'PAEZ', NULL, 285),
(853, 'PAPARO', NULL, 285),
(854, 'PAYARA', NULL, 285),
(855, 'PIMPINELA', NULL, 285),
(856, 'RAMON PERAZA', NULL, 285),
(857, 'RIO CHICO', NULL, 285),
(858, 'SAN CAMILO', NULL, 285),
(859, 'SAN FERNANDO DEL GUAPO', NULL, 285),
(860, 'SINAMAICA', NULL, 285),
(861, 'TACARIGUA DE LA LAGUNA', NULL, 285),
(862, 'DONALDO GARCIA', NULL, 286),
(863, 'EL ROSARIO', NULL, 286),
(864, 'SIXTO ZAMBRANO', NULL, 286),
(865, 'DOMITILA FLORES', NULL, 287),
(866, 'EL BAJO', NULL, 287),
(867, 'FRANCISCO OCHOA', NULL, 287),
(868, 'LOS CORTIJOS', NULL, 287),
(869, 'MARCIAL HERNANDEZ', NULL, 287),
(870, 'SAN FRANCISCO', NULL, 287),
(871, 'EL MENE', NULL, 288),
(872, 'JOSE CENOBIO URRIBARRI', NULL, 288),
(873, 'PEDRO LUCAS URRIBARRI', NULL, 288),
(874, 'SANTA RITA', NULL, 288),
(875, 'BERGATIN', NULL, 289),
(876, 'CAIGUA', NULL, 289),
(877, 'MANUEL MANRIQUE', NULL, 289),
(878, 'NARICUAL', NULL, 289),
(879, 'RAFAEL MARIA BARALT', NULL, 289),
(880, 'SAN ANTONIO DE YARE', NULL, 289),
(881, 'SAN CRSITOBAL', NULL, 289),
(882, 'SAN FRANCISCO DE YARE', NULL, 289),
(883, 'ARIPAO', NULL, 290),
(884, 'BELLA VISTA', NULL, 290),
(885, 'BISCUCUY', NULL, 290),
(886, 'BOBURES', NULL, 290),
(887, 'CAGUA', NULL, 290),
(888, 'CAUCAGÜITA', NULL, 290),
(889, 'CHIGUARA', NULL, 290),
(890, 'EL BATEY', NULL, 290),
(891, 'ESTANQUEZ', NULL, 290),
(892, 'FILAS DE MARICHE', NULL, 290),
(893, 'GIBRALTAR', NULL, 290),
(894, 'GRAN MARISCAL', NULL, 290),
(895, 'GUARATARO', NULL, 290),
(896, 'HERAS', NULL, 290),
(897, 'JUNIN', NULL, 290),
(898, 'LA DOLORITA', NULL, 290),
(899, 'LA TRAMPA', NULL, 290),
(900, 'LAGUNILLAS', NULL, 290),
(901, 'LAS MAJADAS', NULL, 290),
(902, 'LEONCIO MARTINEZ', NULL, 290),
(903, 'MOITACO', NULL, 290),
(904, 'MONSEÑOR ARTURO ALVAREZ', NULL, 290),
(905, 'PETARE', NULL, 290),
(906, 'PUEBLO NUEVO DEL SUR', NULL, 290),
(907, 'ROMULO GALLEGOS', NULL, 290),
(908, 'SABANA DE MENDOZA', NULL, 290),
(909, 'SAN JOSE DE SAGUAZ', NULL, 290),
(910, 'SAN PABLO', NULL, 290),
(911, 'SAN RAFAEL DE PALO ALZADO', NULL, 290),
(912, 'SANTA INES', NULL, 290),
(913, 'SUCRE', NULL, 290),
(914, 'UVENCIO ANTONIO VELASQUEZ', NULL, 290),
(915, 'VALENTIN VALIENTE', NULL, 290),
(916, 'VALMORE RODRIGUEZ', NULL, 290),
(917, 'VILLA ROSA', NULL, 290),
(918, 'LA VICTORIA', NULL, 290),
(919, 'RAFAEL URDANETA', NULL, 290),
(920, 'RAUL CUENCA', NULL, 290);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tperfil`
--

CREATE TABLE IF NOT EXISTS `tperfil` (
`codigo_perfil` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_configuracion` int(11) NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tperfil`
--

INSERT INTO `tperfil` (`codigo_perfil`, `descripcion`, `codigo_configuracion`, `fecha_desactivacion`) VALUES
(1, 'ADMINISTRADOR', 1, NULL),
(2, 'DOCENTE', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpersona`
--

CREATE TABLE IF NOT EXISTS `tpersona` (
  `cedula` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `nombres` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `genero` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'F',
  `fecha_nacimiento` date NOT NULL,
  `lugar_nacimiento` int(11) NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `telefono_habitacion` char(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono_movil` char(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `esestudiante` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `esrepresentante` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `espersonalinstitucion` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `fecha_ingreso` date DEFAULT NULL,
  `codigo_cargo` int(11) DEFAULT NULL,
  `codigo_dependencia` char(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo_dependencia_anterior` char(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `condicion_cargo` char(1) COLLATE utf8_spanish_ci DEFAULT 'C',
  `nivel_academico` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT '0',
  `codigo_plantel` char(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tpersona`
--

INSERT INTO `tpersona` (`cedula`, `nombres`, `apellidos`, `genero`, `fecha_nacimiento`, `lugar_nacimiento`, `direccion`, `telefono_habitacion`, `telefono_movil`, `email`, `esestudiante`, `esrepresentante`, `espersonalinstitucion`, `fecha_ingreso`, `codigo_cargo`, `codigo_dependencia`, `codigo_dependencia_anterior`, `condicion_cargo`, `nivel_academico`, `carga_horaria`, `codigo_plantel`, `fecha_desactivacion`) VALUES
('V123456789', 'USUARIO', 'ADMINISTRADOR', 'M', '0000-00-00', 1, 'SIN DIRECCIÓN', NULL, NULL, NULL, 'N', 'N', 'Y', NULL, 1, NULL, NULL, 'C', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tplantel`
--

CREATE TABLE IF NOT EXISTS `tplantel` (
  `codigo_plantel` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `telefono_habitacion` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `localidad` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo_municipio` int(11) NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tplantel`
--

INSERT INTO `tplantel` (`codigo_plantel`, `nombre`, `direccion`, `telefono_habitacion`, `localidad`, `email`, `codigo_municipio`, `fecha_desactivacion`) VALUES
('12345645343', 'LICEO BOLIVARIANO TOCUYANO', 'CENTRO "I" TOCUYANO', '02556345678', 'TOCUYANO', '', 191, NULL),
('1249834983H', 'AGUA BLANCA', 'MUNICIPIO AGUA BLANCA', '02558765645', 'AGUA BLANCA', '', 191, NULL),
('21345687654', 'LICEO BOLIVARIANO PIRITAL', 'CENTRO POBLADO PIRITAL', '02553456784', 'PIRITAL', '', 191, NULL),
('OD00741801', 'UNIDAD EDUCATIVA NACIONAL QUEBRADA HONDA', 'CALLE #3 CENTRO POBLADO "B" QUEBRADA HONDA', '02558084598', 'CENTRO OCCIDENTE', 'llbqh@hotmail.com', 191, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tplan_evaluacion`
--

CREATE TABLE IF NOT EXISTS `tplan_evaluacion` (
`codigo_plan_evaluacion` int(11) NOT NULL,
  `codigo_msd` int(11) NOT NULL,
  `codigo_lapso` int(11) NOT NULL,
  `descripcion` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `porcentaje` float(11,2) NOT NULL DEFAULT '0.00',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tproceso_inscripcion`
--

CREATE TABLE IF NOT EXISTS `tproceso_inscripcion` (
`codigo_procesoinscripcion` int(11) NOT NULL,
  `codigo_inscripcion` int(11) NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `codigo_ano_academico` int(11) NOT NULL,
  `cedula_docente` char(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cedula_estudiante` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `cedula_escolar` char(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo_canaima` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `peso` float NOT NULL DEFAULT '0',
  `estatura` float NOT NULL DEFAULT '0',
  `codigo_plantel` char(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `certificado_sextogrado` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `notascertificadas` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `cartabuenaconducta` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `fotoestudiante` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `fotorepresentante` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `fotocopia_ciestudiante` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `fotocopia_cirepresentante` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `fotocopia_pnestudiante` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `kitscomedor` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `becado` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `tipobeca` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `cedula_madre` char(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cedula_padre` char(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cedula_representante` char(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo_parentesco` int(11) DEFAULT NULL,
  `lugar_trabajo` int(11) DEFAULT NULL,
  `primerafi` date DEFAULT NULL,
  `seccion` char(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `proceso_completado` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trespuesta_secreta`
--

CREATE TABLE IF NOT EXISTS `trespuesta_secreta` (
`codigo_respuesta` int(11) NOT NULL,
  `nombre_usuario` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `pregunta` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `respuesta` varchar(60) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tseccion`
--

CREATE TABLE IF NOT EXISTS `tseccion` (
  `seccion` char(5) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `turno` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `capacidad_min` int(11) NOT NULL DEFAULT '5',
  `capacidad_max` int(11) NOT NULL DEFAULT '40',
  `grado_escolar` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '1',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tservicio`
--

CREATE TABLE IF NOT EXISTS `tservicio` (
`codigo_servicio` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden` decimal(10,0) DEFAULT '0',
  `codigo_modulo` int(11) NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tservicio`
--

INSERT INTO `tservicio` (`codigo_servicio`, `descripcion`, `url`, `orden`, `codigo_modulo`, `fecha_desactivacion`) VALUES
(1, 'PAÍS', 'PAIS', 1, 1, NULL),
(2, 'ESTADO', 'ESTADO', 2, 1, NULL),
(3, 'MUNICIPIO', 'MUNICIPIO', 3, 1, NULL),
(4, 'PARROQUIA', 'PARROQUIA', 4, 1, NULL),
(5, 'PLANTEL', 'PLANTEL', 1, 2, NULL),
(6, 'CARGO', 'CARGO', 2, 2, NULL),
(7, 'PERSONA', 'PERSONA', 3, 2, NULL),
(8, 'PARENTESCO', 'PARENTESCO', 4, 2, NULL),
(9, 'AÑO ACADÉMICO', 'ANO_ACADEMICO', 2, 3, NULL),
(10, 'AMBIENTE DE CLASES', 'AMBIENTE', 3, 3, NULL),
(11, 'LAPSO', 'LAPSO', 3, 3, NULL),
(12, 'MATERIA', 'MATERIA', 4, 3, NULL),
(13, 'SECCIÓN', 'SECCION', 6, 3, NULL),
(14, 'CERRAR AÑO ACADÉMICO', 'CERRAR_ANOACADEMICO', 7, 3, NULL),
(15, 'ESTUDIANTES', 'ESTUDIANTE', 7, 3, NULL),
(16, 'INSCRIPCIÓN', 'INSCRIPCION', 8, 3, NULL),
(17, 'PLAN DE EVALUACIÓN', 'PLANEVALUACION', 0, 4, NULL),
(18, 'ASIGNACIÓN DE NOTAS', 'ASIGNAR_NOTAS', 1, 4, NULL),
(19, 'BLOQUE DE HORA', 'BLOQUE_HORA', 1, 5, NULL),
(20, 'HORARIO', 'HORARIO', 2, 5, NULL),
(21, 'APLICAR NOTA FINAL', 'APLICAR_NOTAS', 3, 4, NULL),
(22, 'PROCESO DE INSCRIPCIÓN', 'PROCESO_INSCRIPCION', 1, 6, NULL),
(23, 'ASIGNACIÓN DE SECCIONES', 'ASIGNAR_SECCION', 10, 6, NULL),
(24, 'FICHA DE INSCRIPCIÓN', 'REP_FICHAINSCRIPCION', 1, 7, NULL),
(25, 'CONSTANCIA DE ESTUDIO', 'REP_CONSTANCIAESTUDIO', 2, 7, NULL),
(26, 'CARTA BUENA CONDUCTA', 'REP_CARTABUENACONDUCTA', 3, 7, NULL),
(27, 'HISTORIAL DEL PERSONAL ADMINISTRATIVO', 'REP_HISTORIALPERSONAL', 3, 7, NULL),
(28, 'ESTUDIANTES POR GRADO ESCOLAR', 'REP_ESTUDIANTESPORGRADO', 4, 7, NULL),
(29, 'ESTUDIANTES POR SECCIÓN', 'REP_ESTUDIANTESPORSECCION', 5, 7, NULL),
(30, 'ESTUDIANTES NUEVO INGRESO', 'REP_ESTUDIANTESNUEVOINGRESO', 6, 7, NULL),
(31, 'LISTADO DE DOCENTES', 'REP_DOCENTES', 7, 7, NULL),
(32, 'LISTADO DE DOCENTES POR MATERIA', 'REP_DOCENTESPORMATERIA', 8, 7, NULL),
(33, 'NOTAS CERTIFICADAS', 'REP_NOTASCERTIFICADAS', 9, 7, NULL),
(34, 'BOLETIN', 'REP_BOLETIN', 10, 7, NULL),
(35, 'REPORTE DE HORARIO', 'REP_HORARIO', 11, 7, NULL),
(36, 'PLANIFIACIÓN DE NOTAS', 'REP_PLANIFICACIONNOTAS', 12, 7, NULL),
(37, 'REPORTE DE NOTAS ASIGNADAS', 'REP_NOTASASIGNADAS', 14, 7, NULL),
(38, 'CONFIGURACIÓN DEL NEGOCIO', 'CONFIGURACION_NEGOCIO', 0, 8, NULL),
(39, 'MÓDULO', 'MODULO', 1, 8, NULL),
(40, 'SERVICIOS', 'SERVICIO', 2, 8, NULL),
(41, 'BOTONERA', 'BOTONES', 3, 8, NULL),
(42, 'CONFIGURACIÓN DEL PERFIL', 'CONFIGURACION', 4, 8, NULL),
(43, 'PERFIL', 'PERFILES', 5, 8, NULL),
(44, 'NUEVO USUARIO', 'NUEVOUSUARIO', 6, 8, NULL),
(45, 'MÍ PERFIL', 'PERFIL', 6, 8, NULL),
(46, 'CAMBIAR CONTRASEÑA', 'CAMBIARCONTRASENA', 7, 8, NULL),
(47, 'DESBLOQUEAR USUARIO', 'DESBLOQUEARUSUARIO', 10, 8, NULL),
(48, 'HISTÓRICO DE CAMBIOS', 'BITACORA', 11, 8, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tservicio_usuario_opcion`
--

CREATE TABLE IF NOT EXISTS `tservicio_usuario_opcion` (
  `codigo_opcion` int(11) DEFAULT NULL,
  `codigo_servicio` int(11) NOT NULL,
  `codigo_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tservicio_usuario_opcion`
--

INSERT INTO `tservicio_usuario_opcion` (`codigo_opcion`, `codigo_servicio`, `codigo_perfil`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1),
(1, 2, 1),
(2, 2, 1),
(3, 2, 1),
(4, 2, 1),
(5, 2, 1),
(6, 2, 1),
(7, 2, 1),
(1, 3, 1),
(2, 3, 1),
(3, 3, 1),
(4, 3, 1),
(5, 3, 1),
(6, 3, 1),
(7, 3, 1),
(1, 4, 1),
(2, 4, 1),
(3, 4, 1),
(4, 4, 1),
(5, 4, 1),
(6, 4, 1),
(7, 4, 1),
(1, 5, 1),
(2, 5, 1),
(3, 5, 1),
(4, 5, 1),
(5, 5, 1),
(6, 5, 1),
(7, 5, 1),
(1, 6, 1),
(2, 6, 1),
(3, 6, 1),
(4, 6, 1),
(5, 6, 1),
(6, 6, 1),
(7, 6, 1),
(1, 7, 1),
(2, 7, 1),
(3, 7, 1),
(4, 7, 1),
(5, 7, 1),
(6, 7, 1),
(7, 7, 1),
(1, 8, 1),
(2, 8, 1),
(3, 8, 1),
(4, 8, 1),
(5, 8, 1),
(6, 8, 1),
(7, 8, 1),
(1, 9, 1),
(2, 9, 1),
(3, 9, 1),
(4, 9, 1),
(5, 9, 1),
(6, 9, 1),
(7, 9, 1),
(1, 10, 1),
(2, 10, 1),
(3, 10, 1),
(4, 10, 1),
(5, 10, 1),
(6, 10, 1),
(7, 10, 1),
(1, 11, 1),
(2, 11, 1),
(3, 11, 1),
(4, 11, 1),
(5, 11, 1),
(6, 11, 1),
(7, 11, 1),
(1, 12, 1),
(2, 12, 1),
(3, 12, 1),
(4, 12, 1),
(5, 12, 1),
(6, 12, 1),
(7, 12, 1),
(1, 13, 1),
(2, 13, 1),
(3, 13, 1),
(4, 13, 1),
(5, 13, 1),
(6, 13, 1),
(7, 13, 1),
(NULL, 14, 1),
(1, 15, 1),
(2, 15, 1),
(3, 15, 1),
(4, 15, 1),
(5, 15, 1),
(6, 15, 1),
(7, 15, 1),
(1, 16, 1),
(2, 16, 1),
(3, 16, 1),
(4, 16, 1),
(5, 16, 1),
(6, 16, 1),
(7, 16, 1),
(1, 17, 1),
(2, 17, 1),
(3, 17, 1),
(4, 17, 1),
(5, 17, 1),
(6, 17, 1),
(7, 17, 1),
(NULL, 18, 1),
(1, 19, 1),
(2, 19, 1),
(3, 19, 1),
(4, 19, 1),
(5, 19, 1),
(6, 19, 1),
(7, 19, 1),
(NULL, 20, 1),
(NULL, 21, 1),
(1, 22, 1),
(2, 22, 1),
(3, 22, 1),
(4, 22, 1),
(5, 22, 1),
(6, 22, 1),
(7, 22, 1),
(NULL, 24, 1),
(NULL, 25, 1),
(NULL, 26, 1),
(NULL, 27, 1),
(NULL, 28, 1),
(NULL, 29, 1),
(NULL, 30, 1),
(NULL, 31, 1),
(NULL, 32, 1),
(NULL, 33, 1),
(NULL, 34, 1),
(NULL, 35, 1),
(NULL, 36, 1),
(NULL, 37, 1),
(2, 38, 1),
(1, 39, 1),
(2, 39, 1),
(3, 39, 1),
(4, 39, 1),
(5, 39, 1),
(6, 39, 1),
(7, 39, 1),
(1, 40, 1),
(2, 40, 1),
(3, 40, 1),
(4, 40, 1),
(5, 40, 1),
(6, 40, 1),
(7, 40, 1),
(1, 41, 1),
(2, 41, 1),
(3, 41, 1),
(4, 41, 1),
(5, 41, 1),
(6, 41, 1),
(7, 41, 1),
(1, 42, 1),
(2, 42, 1),
(3, 42, 1),
(4, 42, 1),
(5, 42, 1),
(6, 42, 1),
(7, 42, 1),
(1, 43, 1),
(2, 43, 1),
(3, 43, 1),
(4, 43, 1),
(5, 43, 1),
(6, 43, 1),
(7, 43, 1),
(1, 44, 1),
(7, 44, 1),
(2, 45, 1),
(NULL, 46, 1),
(NULL, 47, 1),
(NULL, 48, 1),
(2, 7, 2),
(5, 7, 2),
(7, 7, 2),
(1, 17, 2),
(2, 17, 2),
(3, 17, 2),
(4, 17, 2),
(5, 17, 2),
(6, 17, 2),
(7, 17, 2),
(NULL, 18, 2),
(1, 21, 2),
(2, 21, 2),
(3, 21, 2),
(4, 21, 2),
(5, 21, 2),
(6, 21, 2),
(7, 21, 2),
(NULL, 27, 2),
(NULL, 28, 2),
(NULL, 29, 2),
(NULL, 30, 2),
(5, 34, 2),
(2, 45, 2),
(2, 46, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tusuario`
--

CREATE TABLE IF NOT EXISTS `tusuario` (
  `nombre_usuario` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `cedula` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_perfil` int(11) NOT NULL,
  `intento_fallido` int(11) NOT NULL DEFAULT '0',
  `activar_caducidad` int(11) NOT NULL DEFAULT '1',
  `sesion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `sesion_abierta` int(11) NOT NULL DEFAULT '0',
  `fecha_ultimasesion` date DEFAULT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tusuario`
--

INSERT INTO `tusuario` (`nombre_usuario`, `cedula`, `codigo_perfil`, `intento_fallido`, `activar_caducidad`, `sesion`, `sesion_abierta`, `fecha_ultimasesion`, `fecha_desactivacion`) VALUES
('V123456789', 'V123456789', 1, 0, 1, NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vhorario`
--
CREATE TABLE IF NOT EXISTS `vhorario` (
`nombre` varchar(45)
,`apellido` varchar(45)
,`celda` varchar(23)
,`cedula` char(10)
,`dia` int(11)
,`codigo_bloque_hora` int(11)
,`materia` char(7)
,`profesor` char(10)
,`codigo_ambiente` int(11)
,`seccion` char(5)
,`codigo_ano_academico` int(11)
,`nombre_materia` varchar(100)
,`nombre_ambiente` varchar(60)
,`hora` varchar(17)
,`nombre_seccion` varchar(10)
,`maxhoras` bigint(11)
,`maxhoramateria` bigint(11)
,`hora_academica` bigint(11)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vmateria_seccion_horario`
--
CREATE TABLE IF NOT EXISTS `vmateria_seccion_horario` (
`seccion` char(5)
,`cantidad_materia_horario` bigint(21)
,`cantidad_materia_seccion` bigint(21)
);
-- --------------------------------------------------------

--
-- Estructura para la vista `vhorario`
--
DROP TABLE IF EXISTS `vhorario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `vhorario` AS select `pr`.`nombres` AS `nombre`,`pr`.`apellidos` AS `apellido`,concat(`h`.`codigo_bloque_hora`,'-',`h`.`dia`) AS `celda`,`pr`.`cedula` AS `cedula`,`h`.`dia` AS `dia`,`h`.`codigo_bloque_hora` AS `codigo_bloque_hora`,`h`.`codigo_materia` AS `materia`,`h`.`cedula_docente` AS `profesor`,`h`.`codigo_ambiente` AS `codigo_ambiente`,`h`.`seccion` AS `seccion`,`h`.`codigo_ano_academico` AS `codigo_ano_academico`,`tm`.`descripcion` AS `nombre_materia`,`ta`.`descripcion` AS `nombre_ambiente`,concat(`bh`.`hora_inicio`,'-',`bh`.`hora_fin`) AS `hora`,`s`.`descripcion` AS `nombre_seccion`,coalesce(`pr`.`carga_horaria`,0) AS `maxhoras`,coalesce(`tm`.`hora_academica`,0) AS `maxhoramateria`,coalesce(`bh`.`hora_academica`,0) AS `hora_academica` from (((((`thorario` `h` left join `tseccion` `s` on((`s`.`seccion` = `h`.`seccion`))) left join `tpersona` `pr` on((`pr`.`cedula` = `h`.`cedula_docente`))) left join `tmateria` `tm` on((`tm`.`codigo_materia` = `h`.`codigo_materia`))) left join `tambiente` `ta` on((`ta`.`codigo_ambiente` = `h`.`codigo_ambiente`))) left join `tbloque_hora` `bh` on((`bh`.`codigo_bloque_hora` = `h`.`codigo_bloque_hora`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vmateria_seccion_horario`
--
DROP TABLE IF EXISTS `vmateria_seccion_horario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`localhost` SQL SECURITY DEFINER VIEW `vmateria_seccion_horario` AS select `s`.`seccion` AS `seccion`,count(`h`.`codigo_materia`) AS `cantidad_materia_horario`,count(`msd`.`codigo_materia`) AS `cantidad_materia_seccion` from ((`tseccion` `s` left join `tmateria_seccion_docente` `msd` on((`s`.`seccion` = `msd`.`seccion`))) left join `thorario` `h` on((`h`.`seccion` = `s`.`seccion`))) group by `s`.`seccion`,`msd`.`codigo_materia`;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tambiente`
--
ALTER TABLE `tambiente`
 ADD PRIMARY KEY (`codigo_ambiente`);

--
-- Indices de la tabla `tano_academico`
--
ALTER TABLE `tano_academico`
 ADD PRIMARY KEY (`codigo_ano_academico`);

--
-- Indices de la tabla `tasignacion_nota`
--
ALTER TABLE `tasignacion_nota`
 ADD PRIMARY KEY (`codigo_asignacionnotas`), ADD KEY `fk_tasignacionnota_pe` (`codigo_plan_evaluacion`), ADD KEY `fk_tasignacionnota_estudiante` (`cedula_estudiante`);

--
-- Indices de la tabla `tauditoria`
--
ALTER TABLE `tauditoria`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbloque_hora`
--
ALTER TABLE `tbloque_hora`
 ADD PRIMARY KEY (`codigo_bloque_hora`);

--
-- Indices de la tabla `tcargo`
--
ALTER TABLE `tcargo`
 ADD PRIMARY KEY (`codigo_cargo`);

--
-- Indices de la tabla `tconfiguracion`
--
ALTER TABLE `tconfiguracion`
 ADD PRIMARY KEY (`codigo_configuracion`);

--
-- Indices de la tabla `tconfiguracion_negocio`
--
ALTER TABLE `tconfiguracion_negocio`
 ADD PRIMARY KEY (`codigo_configuracion_negocio`), ADD KEY `fk_config_negocio_plantel` (`codigo_plantel`);

--
-- Indices de la tabla `tcontrasena`
--
ALTER TABLE `tcontrasena`
 ADD PRIMARY KEY (`nombre_usuario`,`contrasena`);

--
-- Indices de la tabla `tcontrol_notas`
--
ALTER TABLE `tcontrol_notas`
 ADD PRIMARY KEY (`codigo_controlnotas`), ADD KEY `fk_tcontrolnotas_msd` (`codigo_msd`), ADD KEY `fk_tcontrolnotas_lapso` (`codigo_lapso`), ADD KEY `fk_tcontrolnotas_estudiante` (`cedula_estudiante`);

--
-- Indices de la tabla `testado`
--
ALTER TABLE `testado`
 ADD PRIMARY KEY (`codigo_estado`), ADD KEY `fk_testado_tpais` (`codigo_pais`);

--
-- Indices de la tabla `thorario`
--
ALTER TABLE `thorario`
 ADD PRIMARY KEY (`codigo_horario`), ADD KEY `fk_thorario_tbloque_hora` (`codigo_bloque_hora`), ADD KEY `fk_thorario_tambiente` (`codigo_ambiente`), ADD KEY `fk_thorario_tano_academico` (`codigo_ano_academico`), ADD KEY `fk_thorario_tmateria` (`codigo_materia`), ADD KEY `fk_thorario_tseccion` (`seccion`), ADD KEY `fk_thorario_tpersona` (`cedula_docente`);

--
-- Indices de la tabla `tinscripcion`
--
ALTER TABLE `tinscripcion`
 ADD PRIMARY KEY (`codigo_inscripcion`);

--
-- Indices de la tabla `tlapso`
--
ALTER TABLE `tlapso`
 ADD PRIMARY KEY (`codigo_lapso`), ADD KEY `fk_tlapso_tanoacademico` (`codigo_ano_academico`);

--
-- Indices de la tabla `tmateria`
--
ALTER TABLE `tmateria`
 ADD PRIMARY KEY (`codigo_materia`);

--
-- Indices de la tabla `tmateria_seccion_docente`
--
ALTER TABLE `tmateria_seccion_docente`
 ADD PRIMARY KEY (`codigo_msd`), ADD UNIQUE KEY `uk_msd` (`codigo_materia`,`seccion`,`cedula_docente`), ADD KEY `fk_tmateria_seccion_tseccion` (`seccion`), ADD KEY `fk_tmateria_seccion_tpersona` (`cedula_docente`);

--
-- Indices de la tabla `tmodulo`
--
ALTER TABLE `tmodulo`
 ADD PRIMARY KEY (`codigo_modulo`);

--
-- Indices de la tabla `tmunicipio`
--
ALTER TABLE `tmunicipio`
 ADD PRIMARY KEY (`codigo_municipio`), ADD KEY `fk_tmunicipio_testado` (`codigo_estado`);

--
-- Indices de la tabla `topcion`
--
ALTER TABLE `topcion`
 ADD PRIMARY KEY (`codigo_opcion`);

--
-- Indices de la tabla `tpais`
--
ALTER TABLE `tpais`
 ADD PRIMARY KEY (`codigo_pais`);

--
-- Indices de la tabla `tparentesco`
--
ALTER TABLE `tparentesco`
 ADD PRIMARY KEY (`codigo_parentesco`);

--
-- Indices de la tabla `tparroquia`
--
ALTER TABLE `tparroquia`
 ADD PRIMARY KEY (`codigo_parroquia`), ADD KEY `fk_tparroquia_tmunicipio` (`codigo_municipio`);

--
-- Indices de la tabla `tperfil`
--
ALTER TABLE `tperfil`
 ADD PRIMARY KEY (`codigo_perfil`), ADD KEY `fk_tperfil_tconfiguracion` (`codigo_configuracion`);

--
-- Indices de la tabla `tpersona`
--
ALTER TABLE `tpersona`
 ADD PRIMARY KEY (`cedula`), ADD KEY `fk_tpersona_tparroquia` (`lugar_nacimiento`), ADD KEY `fk_tpersona_tcargo` (`codigo_cargo`), ADD KEY `fk_tpersona_tplantel` (`codigo_plantel`);

--
-- Indices de la tabla `tplantel`
--
ALTER TABLE `tplantel`
 ADD PRIMARY KEY (`codigo_plantel`), ADD KEY `fk_tplantel_tmunicipio` (`codigo_municipio`);

--
-- Indices de la tabla `tplan_evaluacion`
--
ALTER TABLE `tplan_evaluacion`
 ADD PRIMARY KEY (`codigo_plan_evaluacion`), ADD UNIQUE KEY `uk_pe_msd_lapso` (`codigo_msd`,`codigo_lapso`), ADD KEY `fk_tplanevaluacion_lapso` (`codigo_lapso`);

--
-- Indices de la tabla `tproceso_inscripcion`
--
ALTER TABLE `tproceso_inscripcion`
 ADD PRIMARY KEY (`codigo_procesoinscripcion`), ADD KEY `fk_tpi_tinscrip` (`codigo_inscripcion`), ADD KEY `fk_tpi_taa` (`codigo_ano_academico`), ADD KEY `fk_tpi_tdocente` (`cedula_docente`), ADD KEY `fk_tpi_testudiante` (`cedula_estudiante`), ADD KEY `fk_tpi_tmadre` (`cedula_madre`), ADD KEY `fk_tpi_tpadre` (`cedula_padre`), ADD KEY `fk_tpi_trepresentante` (`cedula_representante`), ADD KEY `fk_tpi_tparentesco` (`codigo_parentesco`), ADD KEY `fk_tpi_tlugartrabajo` (`lugar_trabajo`), ADD KEY `fk_tpi_tseccion` (`seccion`), ADD KEY `fk_tpi_tplantel` (`codigo_plantel`);

--
-- Indices de la tabla `trespuesta_secreta`
--
ALTER TABLE `trespuesta_secreta`
 ADD PRIMARY KEY (`codigo_respuesta`), ADD KEY `trespuesta_secreta_usuario` (`nombre_usuario`);

--
-- Indices de la tabla `tseccion`
--
ALTER TABLE `tseccion`
 ADD PRIMARY KEY (`seccion`);

--
-- Indices de la tabla `tservicio`
--
ALTER TABLE `tservicio`
 ADD PRIMARY KEY (`codigo_servicio`), ADD UNIQUE KEY `url` (`url`), ADD KEY `tservicios_ibfk_1` (`codigo_modulo`);

--
-- Indices de la tabla `tservicio_usuario_opcion`
--
ALTER TABLE `tservicio_usuario_opcion`
 ADD KEY `fk_tservicio_usuario_opcion_topcion` (`codigo_opcion`), ADD KEY `fk_tservicio_usuario_opcion_tservicio` (`codigo_servicio`), ADD KEY `fk_tservicio_usuario_opcion_tperfil` (`codigo_perfil`);

--
-- Indices de la tabla `tusuario`
--
ALTER TABLE `tusuario`
 ADD PRIMARY KEY (`nombre_usuario`), ADD KEY `tusuario_ibfk_1` (`cedula`), ADD KEY `tusuario_ibfk_2` (`codigo_perfil`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tambiente`
--
ALTER TABLE `tambiente`
MODIFY `codigo_ambiente` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tano_academico`
--
ALTER TABLE `tano_academico`
MODIFY `codigo_ano_academico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tasignacion_nota`
--
ALTER TABLE `tasignacion_nota`
MODIFY `codigo_asignacionnotas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tauditoria`
--
ALTER TABLE `tauditoria`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbloque_hora`
--
ALTER TABLE `tbloque_hora`
MODIFY `codigo_bloque_hora` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `tcargo`
--
ALTER TABLE `tcargo`
MODIFY `codigo_cargo` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tconfiguracion`
--
ALTER TABLE `tconfiguracion`
MODIFY `codigo_configuracion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tconfiguracion_negocio`
--
ALTER TABLE `tconfiguracion_negocio`
MODIFY `codigo_configuracion_negocio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tcontrol_notas`
--
ALTER TABLE `tcontrol_notas`
MODIFY `codigo_controlnotas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `testado`
--
ALTER TABLE `testado`
MODIFY `codigo_estado` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `thorario`
--
ALTER TABLE `thorario`
MODIFY `codigo_horario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tinscripcion`
--
ALTER TABLE `tinscripcion`
MODIFY `codigo_inscripcion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tlapso`
--
ALTER TABLE `tlapso`
MODIFY `codigo_lapso` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tmateria_seccion_docente`
--
ALTER TABLE `tmateria_seccion_docente`
MODIFY `codigo_msd` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tmodulo`
--
ALTER TABLE `tmodulo`
MODIFY `codigo_modulo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `tmunicipio`
--
ALTER TABLE `tmunicipio`
MODIFY `codigo_municipio` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=291;
--
-- AUTO_INCREMENT de la tabla `topcion`
--
ALTER TABLE `topcion`
MODIFY `codigo_opcion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `tpais`
--
ALTER TABLE `tpais`
MODIFY `codigo_pais` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tparentesco`
--
ALTER TABLE `tparentesco`
MODIFY `codigo_parentesco` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tparroquia`
--
ALTER TABLE `tparroquia`
MODIFY `codigo_parroquia` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=921;
--
-- AUTO_INCREMENT de la tabla `tperfil`
--
ALTER TABLE `tperfil`
MODIFY `codigo_perfil` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tplan_evaluacion`
--
ALTER TABLE `tplan_evaluacion`
MODIFY `codigo_plan_evaluacion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tproceso_inscripcion`
--
ALTER TABLE `tproceso_inscripcion`
MODIFY `codigo_procesoinscripcion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `trespuesta_secreta`
--
ALTER TABLE `trespuesta_secreta`
MODIFY `codigo_respuesta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tservicio`
--
ALTER TABLE `tservicio`
MODIFY `codigo_servicio` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=49;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tasignacion_nota`
--
ALTER TABLE `tasignacion_nota`
ADD CONSTRAINT `fk_tasignacionnota_pe` FOREIGN KEY (`codigo_plan_evaluacion`) REFERENCES `tplan_evaluacion` (`codigo_plan_evaluacion`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tasignacionnota_estudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tconfiguracion_negocio`
--
ALTER TABLE `tconfiguracion_negocio`
ADD CONSTRAINT `fk_config_negocio_plantel` FOREIGN KEY (`codigo_plantel`) REFERENCES `tplantel` (`codigo_plantel`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `tcontrasena`
--
ALTER TABLE `tcontrasena`
ADD CONSTRAINT `tcontrasena_ibfk_1` FOREIGN KEY (`nombre_usuario`) REFERENCES `tusuario` (`nombre_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tcontrol_notas`
--
ALTER TABLE `tcontrol_notas`
ADD CONSTRAINT `fk_tcontrolnotas_msd` FOREIGN KEY (`codigo_msd`) REFERENCES `tmateria_seccion_docente` (`codigo_msd`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tcontrolnotas_lapso` FOREIGN KEY (`codigo_lapso`) REFERENCES `tlapso` (`codigo_lapso`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tcontrolnotas_estudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `testado`
--
ALTER TABLE `testado`
ADD CONSTRAINT `fk_testado_tpais` FOREIGN KEY (`codigo_pais`) REFERENCES `tpais` (`codigo_pais`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `thorario`
--
ALTER TABLE `thorario`
ADD CONSTRAINT `fk_thorario_tbloque_hora` FOREIGN KEY (`codigo_bloque_hora`) REFERENCES `tbloque_hora` (`codigo_bloque_hora`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_thorario_tambiente` FOREIGN KEY (`codigo_ambiente`) REFERENCES `tambiente` (`codigo_ambiente`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_thorario_tano_academico` FOREIGN KEY (`codigo_ano_academico`) REFERENCES `tano_academico` (`codigo_ano_academico`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_thorario_tmateria` FOREIGN KEY (`codigo_materia`) REFERENCES `tmateria` (`codigo_materia`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_thorario_tseccion` FOREIGN KEY (`seccion`) REFERENCES `tseccion` (`seccion`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_thorario_tpersona` FOREIGN KEY (`cedula_docente`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tlapso`
--
ALTER TABLE `tlapso`
ADD CONSTRAINT `fk_tlapso_tanoacademico` FOREIGN KEY (`codigo_ano_academico`) REFERENCES `tano_academico` (`codigo_ano_academico`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tmateria_seccion_docente`
--
ALTER TABLE `tmateria_seccion_docente`
ADD CONSTRAINT `fk_tmateria_seccion_tmateria` FOREIGN KEY (`codigo_materia`) REFERENCES `tmateria` (`codigo_materia`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tmateria_seccion_tseccion` FOREIGN KEY (`seccion`) REFERENCES `tseccion` (`seccion`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tmateria_seccion_tpersona` FOREIGN KEY (`cedula_docente`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tmunicipio`
--
ALTER TABLE `tmunicipio`
ADD CONSTRAINT `fk_tmunicipio_testado` FOREIGN KEY (`codigo_estado`) REFERENCES `testado` (`codigo_estado`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tparroquia`
--
ALTER TABLE `tparroquia`
ADD CONSTRAINT `fk_tparroquia_tmunicipio` FOREIGN KEY (`codigo_municipio`) REFERENCES `tmunicipio` (`codigo_municipio`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tperfil`
--
ALTER TABLE `tperfil`
ADD CONSTRAINT `fk_tperfil_tconfiguracion` FOREIGN KEY (`codigo_configuracion`) REFERENCES `tconfiguracion` (`codigo_configuracion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tpersona`
--
ALTER TABLE `tpersona`
ADD CONSTRAINT `fk_tpersona_tparroquia` FOREIGN KEY (`lugar_nacimiento`) REFERENCES `tparroquia` (`codigo_parroquia`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpersona_tcargo` FOREIGN KEY (`codigo_cargo`) REFERENCES `tcargo` (`codigo_cargo`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpersona_tplantel` FOREIGN KEY (`codigo_plantel`) REFERENCES `tplantel` (`codigo_plantel`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tplantel`
--
ALTER TABLE `tplantel`
ADD CONSTRAINT `fk_tplantel_tmunicipio` FOREIGN KEY (`codigo_municipio`) REFERENCES `tmunicipio` (`codigo_municipio`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tplan_evaluacion`
--
ALTER TABLE `tplan_evaluacion`
ADD CONSTRAINT `fk_tplanevaluacion_msd` FOREIGN KEY (`codigo_msd`) REFERENCES `tmateria_seccion_docente` (`codigo_msd`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tplanevaluacion_lapso` FOREIGN KEY (`codigo_lapso`) REFERENCES `tlapso` (`codigo_lapso`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tproceso_inscripcion`
--
ALTER TABLE `tproceso_inscripcion`
ADD CONSTRAINT `fk_tpi_tinscrip` FOREIGN KEY (`codigo_inscripcion`) REFERENCES `tinscripcion` (`codigo_inscripcion`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_taa` FOREIGN KEY (`codigo_ano_academico`) REFERENCES `tano_academico` (`codigo_ano_academico`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_tdocente` FOREIGN KEY (`cedula_docente`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_testudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_tmadre` FOREIGN KEY (`cedula_madre`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_tpadre` FOREIGN KEY (`cedula_padre`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_trepresentante` FOREIGN KEY (`cedula_representante`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_tparentesco` FOREIGN KEY (`codigo_parentesco`) REFERENCES `tparentesco` (`codigo_parentesco`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_tlugartrabajo` FOREIGN KEY (`lugar_trabajo`) REFERENCES `tparroquia` (`codigo_parroquia`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_tseccion` FOREIGN KEY (`seccion`) REFERENCES `tseccion` (`seccion`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_tplantel` FOREIGN KEY (`codigo_plantel`) REFERENCES `tplantel` (`codigo_plantel`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `trespuesta_secreta`
--
ALTER TABLE `trespuesta_secreta`
ADD CONSTRAINT `trespuesta_secreta_usuario` FOREIGN KEY (`nombre_usuario`) REFERENCES `tusuario` (`nombre_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tservicio`
--
ALTER TABLE `tservicio`
ADD CONSTRAINT `tservicios_ibfk_1` FOREIGN KEY (`codigo_modulo`) REFERENCES `tmodulo` (`codigo_modulo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tservicio_usuario_opcion`
--
ALTER TABLE `tservicio_usuario_opcion`
ADD CONSTRAINT `fk_tservicio_usuario_opcion_topcion` FOREIGN KEY (`codigo_opcion`) REFERENCES `topcion` (`codigo_opcion`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tservicio_usuario_opcion_tservicio` FOREIGN KEY (`codigo_servicio`) REFERENCES `tservicio` (`codigo_servicio`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tservicio_usuario_opcion_tperfil` FOREIGN KEY (`codigo_perfil`) REFERENCES `tperfil` (`codigo_perfil`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tusuario`
--
ALTER TABLE `tusuario`
ADD CONSTRAINT `tusuario_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
ADD CONSTRAINT `tusuario_ibfk_2` FOREIGN KEY (`codigo_perfil`) REFERENCES `tperfil` (`codigo_perfil`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
