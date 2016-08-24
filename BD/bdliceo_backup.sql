-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 21-08-2016 a las 17:01:20
-- Versión del servidor: 5.5.49-0+deb8u1
-- Versión de PHP: 5.6.22-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bdliceo`
--
DROP DATABASE `bdliceo`;
CREATE DATABASE IF NOT EXISTS `bdliceo` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `bdliceo`;

DELIMITER $$
--
-- Funciones
--
DROP FUNCTION IF EXISTS `f_fecha_spanish`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `f_fecha_spanish`(`v_fecha` DATE, `v_tipo` INT(3)) RETURNS varchar(50) CHARSET utf8
    NO SQL
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

DROP FUNCTION IF EXISTS `initcap`$$
CREATE DEFINER=`admin`@`%` FUNCTION `initcap`(`x` VARCHAR(120) CHARSET utf8) RETURNS varchar(120) CHARSET utf8
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

DROP FUNCTION IF EXISTS `letras`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `letras`(`XNumero` FLOAT(20), `XMoneda` VARCHAR(100) CHARSET utf8) RETURNS varchar(512) CHARSET utf8
    NO SQL
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

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tambiente`
--

DROP TABLE IF EXISTS `tambiente`;
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
(3, 'CIENCIAS DE LA NATURALEZA', '3', NULL),
(4, 'CANCHA MULTIPLE', '2', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tano_academico`
--

DROP TABLE IF EXISTS `tano_academico`;
CREATE TABLE IF NOT EXISTS `tano_academico` (
`codigo_ano_academico` int(11) NOT NULL,
  `descripcion` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `cerrado` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tano_academico`
--

INSERT INTO `tano_academico` (`codigo_ano_academico`, `descripcion`, `cerrado`, `fecha_desactivacion`) VALUES
(1, '2015-2016', 'N', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tauditoria`
--

DROP TABLE IF EXISTS `tauditoria`;
CREATE TABLE IF NOT EXISTS `tauditoria` (
`id` int(11) NOT NULL,
  `ip` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `so` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `navigador` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `usuario_base_de_datos` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `usuario_aplicacion` char(15) COLLATE utf8_spanish_ci NOT NULL,
  `query` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3436 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tauditoria`
--

INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(1, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-09 20:18:54'),
(2, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tcontrasena set estado=0 where (nombre_usuario=''V123456789'')', '2016-01-09 20:19:05'),
(3, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tcontrasena (contrasena,nombre_usuario,estado)values(''791acae9d7efbefc2b489747af71cc2f6870554d'',''V123456789'',1)', '2016-01-09 20:19:05'),
(4, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-09 20:19:19'),
(5, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''root'')', '2016-01-14 14:24:00'),
(6, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tcontrasena set estado=0 where (nombre_usuario=''V123456789'')', '2016-01-14 14:24:57'),
(7, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tcontrasena (contrasena,nombre_usuario,estado)values(''bcd5c3e4b7e24e1ec1c57a32ea101a2c114dc364'',''V123456789'',1)', '2016-01-14 14:24:57'),
(8, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2016-01-14 14:25:18'),
(9, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''root'')', '2016-01-14 14:25:30'),
(10, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tcontrasena set estado=0 where (nombre_usuario=''V123456789'')', '2016-01-14 14:29:02'),
(11, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tcontrasena (contrasena,nombre_usuario,estado)values(''47923b00e914a6343c38d79f78b45959fc4049e9'',''V123456789'',1)', '2016-01-14 14:29:02'),
(12, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-14 14:29:22'),
(13, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''LARA'',''1'');', '2016-01-14 14:39:13'),
(14, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''COLOMBIA'');', '2016-01-14 15:17:15'),
(15, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''AMAZONAS'',''1'');', '2016-01-14 15:18:19'),
(16, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''AGUA BLANCA'',''1'');', '2016-01-14 15:19:04'),
(17, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tplantel (codigo_plantel,nombre,direccion,telefono_habitacion,localidad,codigo_municipio,email) VALUES (''1249834983H8'',''AGUA BLANCA'',''MUNICIPIO AGUA BLANCA'',''02558765645'',''AGUA BLANCA'',''2'','''');', '2016-01-14 15:26:51'),
(18, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,espersonalinstitucion,fecha_ingreso,codigo_cargo,codigo_dependencia,codigo_dependencia_anterior,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V111111111'',''KARINA'',''PEÑA'',''F'',STR_TO_DATE(''14/01/2000'',''%d/%m/%Y''),''1'',''ACARIGUA'',''02556777777'',''04246747474'','''',''N'',''N'',''Y'',STR_TO_DATE(''19/01/2006'',''%d/%m/%Y''),1,''2G22738237'','''',''F'',''T.S.U.'',''49'',''1249834983H'');', '2016-01-14 15:31:28'),
(19, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''1'',''MATEMATICA'',''4'',''1'');', '2016-01-14 15:35:20'),
(20, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''2'',''MATEMATICA'',''4'',''1'');', '2016-01-14 15:35:38'),
(21, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tseccion (seccion,descripcion,turno,grado_escolar,capacidad_min,capacidad_max) values (''1'',''PRIMERO A'',''M'',''1'',''10'',''40'');', '2016-01-14 15:37:25'),
(22, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tmateria_seccion_docente WHERE (seccion=''1'');', '2016-01-14 15:37:25'),
(23, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tseccion (seccion,descripcion,turno,grado_escolar,capacidad_min,capacidad_max) values (''2'',''A'',''M'',''1'',''40'',''10'');', '2016-01-14 15:38:34'),
(25, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-14 16:40:53'),
(26, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-14 20:21:19'),
(27, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-14 22:09:50'),
(28, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparentesco (descripcion) values (''TIO'');', '2016-01-14 22:20:36'),
(30, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-14 22:32:43'),
(31, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tano_academico (descripcion) values (''2015-2016'');', '2016-01-14 23:39:39'),
(32, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tlapso (descripcion,fecha_inicio,fecha_fin,codigo_ano_academico) values (''1ER LAPSO'',STR_TO_DATE(''14/09/2015'',''%d/%m/%Y''),STR_TO_DATE(''11/12/2015'',''%d/%m/%Y''),''1'');', '2016-01-14 23:40:24'),
(33, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tlapso (descripcion,fecha_inicio,fecha_fin,codigo_ano_academico) values (''2DO LAPSO'',STR_TO_DATE(''11/01/2016'',''%d/%m/%Y''),STR_TO_DATE(''25/03/2016'',''%d/%m/%Y''),''1'');', '2016-01-14 23:40:52'),
(34, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tlapso (descripcion,fecha_inicio,fecha_fin,codigo_ano_academico) values (''3ER LAPSO'',STR_TO_DATE(''11/04/2016'',''%d/%m/%Y''),STR_TO_DATE(''15/07/2016'',''%d/%m/%Y''),''1'');', '2016-01-14 23:41:16'),
(35, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''CAST001'',''CASTELLANOS'',''23'',''1'');', '2016-01-14 23:45:10'),
(36, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''CAST002'',''CASTELLANOS'',''23'',''2'');', '2016-01-14 23:45:40'),
(37, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set codigo_materia=''2'',descripcion=''MATEMATICA'',unidad_curricular=''4'',grado_escolar=''2'' where (codigo_materia=''2'');', '2016-01-14 23:45:58'),
(38, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tcargo (descripcion) values (''DOCENTE'');', '2016-01-14 23:47:05'),
(39, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tcargo (descripcion) values (''DIRECTOR(A)'');', '2016-01-14 23:47:23'),
(40, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,espersonalinstitucion,fecha_ingreso,codigo_cargo,codigo_dependencia,codigo_dependencia_anterior,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V121212121'',''JOSE'',''LOPEZ'',''M'',STR_TO_DATE(''20/06/1995'',''%d/%m/%Y''),''1'',''N/A'',''02553453242'',''04142345234'','''',''N'',''N'',''Y'',STR_TO_DATE(''21/07/2009'',''%d/%m/%Y''),2,''0234324232'','''',''F'',''LCDO(A).'',''23'',''1249834983H'');', '2016-01-14 23:49:14'),
(41, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,espersonalinstitucion,fecha_ingreso,codigo_cargo,codigo_dependencia,codigo_dependencia_anterior,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V13131313'',''MARIA'',''CONTRERAS'',''F'',STR_TO_DATE(''11/05/1994'',''%d/%m/%Y''),''1'',''N/A'',''02562345234'',''04143454352'','''',''N'',''Y'',''Y'',STR_TO_DATE(''18/01/2011'',''%d/%m/%Y''),2,''3452344234'','''',''F'',''T.S.U.'',''34'',''1249834983H'');', '2016-01-14 23:51:27'),
(42, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparentesco (descripcion) values (''PADRE'');', '2016-01-14 23:52:11'),
(43, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparentesco (descripcion) values (''MADRE'');', '2016-01-14 23:52:14'),
(44, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparentesco (descripcion) values (''HERMANO'');', '2016-01-14 23:52:19'),
(45, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparentesco (descripcion) values (''PRIMA'');', '2016-01-14 23:52:23'),
(46, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set seccion=''2'',descripcion=''A'',turno=''M'',grado_escolar=''1'', capacidad_min=''40'',capacidad_max=''10'' where (seccion=''2'');', '2016-01-14 23:55:09'),
(47, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set seccion=''2'',descripcion=''A'',turno=''M'',grado_escolar=''1'', capacidad_min=''40'',capacidad_max=''50'' where (seccion=''2'');', '2016-01-14 23:56:33'),
(48, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set seccion=''2'',descripcion=''A'',turno=''M'',grado_escolar=''1'', capacidad_min=''40'',capacidad_max=''50'' where (seccion=''2'');', '2016-01-14 23:57:50'),
(49, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set seccion=''1'',descripcion=''PRIMERO A'',turno=''M'',grado_escolar=''1'', capacidad_min=''10'',capacidad_max=''30'' where (seccion=''1'');', '2016-01-14 23:58:03'),
(50, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tseccion (seccion,descripcion,turno,grado_escolar,capacidad_min,capacidad_max) values (''SECCB'',''SECCION B'',''T'',''2'',''20'',''35'');', '2016-01-15 00:00:31'),
(51, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tmateria_seccion_docente WHERE (seccion=''SECCB'');', '2016-01-15 00:00:32'),
(52, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tmateria_seccion_docente(seccion,codigo_materia,cedula_docente) VALUES (''SECCB'',''CAST002'',''V121212121''),(''SECCB'',''2'',''V13131313'');', '2016-01-15 00:00:32'),
(53, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tinscripcion (descripcion,fecha_inicio,fecha_fin,fecha_cierre) values (''PERÍODO 2015-2016'',STR_TO_DATE(''27/07/2015'',''%d/%m/%Y''),\n    STR_TO_DATE(''28/08/2015'',''%d/%m/%Y''),STR_TO_DATE(''30/01/2016'',''%d/%m/%Y''));', '2016-01-15 00:10:42'),
(54, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmodulo set descripcion=''REPORTE'',icono=''icon-cog'',orden=''6'' where (codigo_modulo=''5'');', '2016-01-15 00:14:45'),
(55, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmodulo set descripcion=''INSCRIPCIONES'',icono=''icon-cog'',orden=''5'' where (codigo_modulo=''7'');', '2016-01-15 00:15:08'),
(56, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmodulo set descripcion=''SEGURIDAD'',icono=''icon-lock'',orden=''7'' where (codigo_modulo=''6'');', '2016-01-15 00:15:28'),
(57, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,fecha_ingreso,codigo_cargo,codigo_dependencia,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V252132343'',''JOSE'',''LOPEZ'',''M'',STR_TO_DATE(''13/01/2004'',''%d/%m/%Y''),''1'',''N/A'',''02554564532'','''','''',''Y'',''N'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);', '2016-01-15 00:27:57'),
(58, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tproceso_inscripcion (codigo_inscripcion,fecha_inscripcion,codigo_ano_academico,cedula_estudiante,cedula_escolar,codigo_canaima,peso,estatura,codigo_plantel,primerafi) VALUES ((SELECT MAX(codigo_inscripcion) FROM tinscripcion WHERE fecha_desactivacion IS NULL),CURDATE(),(SELECT MAX(codigo_ano_academico) FROM tano_academico WHERE fecha_desactivacion IS NULL),''V252132343'','''','''',''35.5'',''135'',''NULL'',CURDATE());', '2016-01-15 00:27:57'),
(59, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tpersona SET nombres=''JOSE'',apellidos=''LOPEZ'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''20/06/1995'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''N/A'',telefono_habitacion=''02553453242'',telefono_movil=''04142345234'',email='''',esestudiante=''N'',esrepresentante=''N'',espersonalinstitucion=''Y'',codigo_cargo=2,fecha_ingreso=STR_TO_DATE(''21/07/2009'',''%d/%m/%Y''),codigo_dependencia=''0234324232'',codigo_dependencia_anterior='''',condicion_cargo=''F'',nivel_academico=''LCDO(A).'',carga_horaria=''23'',codigo_plantel=''1249834983H'' WHERE cedula=''V121212121'';', '2016-01-15 00:29:07'),
(60, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_padre=''V121212121'' WHERE cedula_estudiante=''V252132343'';', '2016-01-15 00:29:07'),
(61, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET certificado_sextogrado=''Y'',notascertificadas=''Y'',cartabuenaconducta=''Y'',fotoestudiante=''Y'',fotorepresentante=''Y'',fotocopia_ciestudiante=''Y'',fotocopia_cirepresentante=''Y'',fotocopia_pnestudiante=''Y'',kitscomedor=''Y'',becado=''Y'',tipobeca=''H'' WHERE cedula_estudiante = ''V252132343''', '2016-01-15 00:29:38'),
(62, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tpersona SET nombres=''JOSE'',apellidos=''LOPEZ'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''20/06/1995'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''N/A'',telefono_habitacion=''02553453242'',telefono_movil=''04142345234'',email='''',esestudiante=''N'',esrepresentante=''N'',espersonalinstitucion=''Y'',codigo_cargo=2,fecha_ingreso=STR_TO_DATE(''21/07/2009'',''%d/%m/%Y''),codigo_dependencia=''0234324232'',codigo_dependencia_anterior='''',condicion_cargo=''F'',nivel_academico=''LCDO(A).'',carga_horaria=''23'',codigo_plantel=''1249834983H'' WHERE cedula=''V121212121'';', '2016-01-15 00:30:40'),
(63, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_docente=''V13131313'',cedula_representante=''V121212121'',codigo_parentesco=''2'',lugar_trabajo=''1'',proceso_completado=''Y''WHERE cedula_estudiante=''V252132343'';', '2016-01-15 00:30:40'),
(64, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET seccion=''SECCB_SECCION B'' WHERE cedula_estudiante = ''V252132343''', '2016-01-15 01:11:25'),
(65, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,espersonalinstitucion,fecha_ingreso,codigo_cargo,codigo_dependencia,codigo_dependencia_anterior,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V092123123'',''LAURA'',''JIMENEZ'',''F'',STR_TO_DATE(''18/01/1994'',''%d/%m/%Y''),''1'',''N/A'',''02553453234'',''04142353234'','''',''N'',''N'',''Y'',STR_TO_DATE(''14/01/2009'',''%d/%m/%Y''),3,''234234324'','''',''F'',''LCDO(A).'',''23'',''1249834983H'');', '2016-01-15 01:15:42'),
(66, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tusuario (cedula,nombre_usuario,codigo_perfil) values(''V13131313'',''V13131313'',''1'')', '2016-01-15 01:25:23'),
(67, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tcontrasena (estado,nombre_usuario,contrasena) values(3,''V13131313'',''1f82ea75c5cc526729e2d581aeb3aeccfef4407e'')', '2016-01-15 01:25:23'),
(68, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V13131313'')', '2016-01-15 01:25:50'),
(69, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'update tcontrasena set estado=0 where (nombre_usuario=''V13131313'')', '2016-01-15 01:26:08'),
(70, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'insert into tcontrasena (contrasena,nombre_usuario,estado)values(''791acae9d7efbefc2b489747af71cc2f6870554d'',''V13131313'',1)', '2016-01-15 01:26:08'),
(71, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'UPDATE tusuario SET \r\n  nombre_usuario=''V13131313'',\r\n pregunta_1 =  ''P1'',\r\n respuesta_1 =  ''R1'',\r\n  pregunta_2 =  ''P2'',\r\n respuesta_2=  ''R2'' WHERE (nombre_usuario=''V13131313'')', '2016-01-15 01:26:08'),
(72, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'update tperfil set descripcion=''ADMINISTRADOR'' where (codigo_perfil=''1'');', '2016-01-15 01:27:29'),
(73, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''1'');', '2016-01-15 01:27:29'),
(74, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-15 01:27:29'),
(75, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''1'')', '2016-01-15 01:27:29'),
(76, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''2'')', '2016-01-15 01:27:29'),
(77, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''3'')', '2016-01-15 01:27:29'),
(78, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''4'')', '2016-01-15 01:27:29'),
(79, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''5'')', '2016-01-15 01:27:30'),
(80, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''6'')', '2016-01-15 01:27:30'),
(81, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''7'')', '2016-01-15 01:27:30'),
(82, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-15 01:27:30'),
(83, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''1'')', '2016-01-15 01:27:30'),
(84, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''2'')', '2016-01-15 01:27:30'),
(85, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''3'')', '2016-01-15 01:27:30'),
(86, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''4'')', '2016-01-15 01:27:30'),
(87, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''5'')', '2016-01-15 01:27:30'),
(88, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''6'')', '2016-01-15 01:27:30'),
(89, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''7'')', '2016-01-15 01:27:30'),
(90, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-15 01:27:30'),
(91, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''1'')', '2016-01-15 01:27:31'),
(92, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''2'')', '2016-01-15 01:27:31'),
(93, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''3'')', '2016-01-15 01:27:31'),
(94, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''4'')', '2016-01-15 01:27:31'),
(95, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''5'')', '2016-01-15 01:27:31'),
(96, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''6'')', '2016-01-15 01:27:31'),
(97, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''7'')', '2016-01-15 01:27:31'),
(98, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-15 01:27:31'),
(99, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''1'')', '2016-01-15 01:27:31'),
(100, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''2'')', '2016-01-15 01:27:31'),
(101, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''3'')', '2016-01-15 01:27:31'),
(102, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''4'')', '2016-01-15 01:27:31'),
(103, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''5'')', '2016-01-15 01:27:32'),
(104, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''6'')', '2016-01-15 01:27:32'),
(105, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''7'')', '2016-01-15 01:27:32'),
(106, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-15 01:27:32'),
(107, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''1'')', '2016-01-15 01:27:32'),
(108, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''2'')', '2016-01-15 01:27:32'),
(109, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''3'')', '2016-01-15 01:27:32'),
(110, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''4'')', '2016-01-15 01:27:32'),
(111, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''5'')', '2016-01-15 01:27:32'),
(112, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''6'')', '2016-01-15 01:27:32'),
(113, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''7'')', '2016-01-15 01:27:32'),
(114, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-15 01:27:33'),
(115, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''1'')', '2016-01-15 01:27:33'),
(116, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''2'')', '2016-01-15 01:27:33'),
(117, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''3'')', '2016-01-15 01:27:33'),
(118, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''4'')', '2016-01-15 01:27:33'),
(119, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''5'')', '2016-01-15 01:27:33'),
(120, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''6'')', '2016-01-15 01:27:33'),
(121, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''7'')', '2016-01-15 01:27:33'),
(122, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-15 01:27:33'),
(123, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''1'')', '2016-01-15 01:27:33'),
(124, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''2'')', '2016-01-15 01:27:33'),
(125, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''3'')', '2016-01-15 01:27:33'),
(126, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''4'')', '2016-01-15 01:27:34'),
(127, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''5'')', '2016-01-15 01:27:34'),
(128, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''6'')', '2016-01-15 01:27:34'),
(129, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''7'')', '2016-01-15 01:27:34'),
(130, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-15 01:27:34'),
(131, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''1'')', '2016-01-15 01:27:34'),
(132, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''2'')', '2016-01-15 01:27:34'),
(133, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''3'')', '2016-01-15 01:27:34'),
(134, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''4'')', '2016-01-15 01:27:34'),
(135, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''5'')', '2016-01-15 01:27:34'),
(136, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''6'')', '2016-01-15 01:27:34'),
(137, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''7'')', '2016-01-15 01:27:35'),
(138, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-15 01:27:35'),
(139, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''1'')', '2016-01-15 01:27:35'),
(140, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''2'')', '2016-01-15 01:27:35'),
(141, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''3'')', '2016-01-15 01:27:35'),
(142, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''4'')', '2016-01-15 01:27:35'),
(143, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''5'')', '2016-01-15 01:27:35'),
(144, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''6'')', '2016-01-15 01:27:35'),
(145, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''7'')', '2016-01-15 01:27:35'),
(146, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-15 01:27:35'),
(147, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''1'')', '2016-01-15 01:27:35'),
(148, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''2'')', '2016-01-15 01:27:35'),
(149, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''3'')', '2016-01-15 01:27:35'),
(150, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''4'')', '2016-01-15 01:27:36'),
(151, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''5'')', '2016-01-15 01:27:36'),
(152, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''6'')', '2016-01-15 01:27:36'),
(153, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''7'')', '2016-01-15 01:27:36'),
(154, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-15 01:27:36'),
(155, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''1'')', '2016-01-15 01:27:36'),
(156, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''2'')', '2016-01-15 01:27:36'),
(157, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''3'')', '2016-01-15 01:27:36'),
(158, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''4'')', '2016-01-15 01:27:36'),
(159, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''5'')', '2016-01-15 01:27:36'),
(160, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''6'')', '2016-01-15 01:27:36'),
(161, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''7'')', '2016-01-15 01:27:36'),
(162, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-15 01:27:36'),
(163, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''1'')', '2016-01-15 01:27:37'),
(164, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''2'')', '2016-01-15 01:27:37'),
(165, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''3'')', '2016-01-15 01:27:37'),
(166, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''4'')', '2016-01-15 01:27:37'),
(167, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''5'')', '2016-01-15 01:27:37'),
(168, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''6'')', '2016-01-15 01:27:37'),
(169, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''7'')', '2016-01-15 01:27:37'),
(170, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-15 01:27:37'),
(171, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''1'')', '2016-01-15 01:27:37'),
(172, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''2'')', '2016-01-15 01:27:37'),
(173, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''3'')', '2016-01-15 01:27:38'),
(174, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''4'')', '2016-01-15 01:27:38'),
(175, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''5'')', '2016-01-15 01:27:38'),
(176, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''6'')', '2016-01-15 01:27:38'),
(177, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''7'')', '2016-01-15 01:27:38'),
(178, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-15 01:27:38'),
(179, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''1'')', '2016-01-15 01:27:38'),
(180, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''2'')', '2016-01-15 01:27:38'),
(181, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''3'')', '2016-01-15 01:27:38'),
(182, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''4'')', '2016-01-15 01:27:38'),
(183, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''5'')', '2016-01-15 01:27:38'),
(184, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''6'')', '2016-01-15 01:27:38'),
(185, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''7'')', '2016-01-15 01:27:39'),
(186, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-15 01:27:39'),
(187, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''1'')', '2016-01-15 01:27:39'),
(188, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''2'')', '2016-01-15 01:27:39'),
(189, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''3'')', '2016-01-15 01:27:39'),
(190, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''4'')', '2016-01-15 01:27:39'),
(191, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''5'')', '2016-01-15 01:27:39'),
(192, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''6'')', '2016-01-15 01:27:39'),
(193, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''7'')', '2016-01-15 01:27:40'),
(194, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-15 01:27:40'),
(195, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''1'')', '2016-01-15 01:27:40'),
(196, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''2'')', '2016-01-15 01:27:40'),
(197, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''3'')', '2016-01-15 01:27:40'),
(198, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''4'')', '2016-01-15 01:27:40'),
(199, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''5'')', '2016-01-15 01:27:40'),
(200, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''6'')', '2016-01-15 01:27:40'),
(201, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''7'')', '2016-01-15 01:27:40'),
(202, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-15 01:27:40'),
(203, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''1'')', '2016-01-15 01:27:41'),
(204, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''2'')', '2016-01-15 01:27:41'),
(205, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''3'')', '2016-01-15 01:27:41'),
(206, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''4'')', '2016-01-15 01:27:41'),
(207, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''5'')', '2016-01-15 01:27:41'),
(208, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''6'')', '2016-01-15 01:27:41'),
(209, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''7'')', '2016-01-15 01:27:41'),
(210, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-15 01:27:41'),
(211, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''1'')', '2016-01-15 01:27:41'),
(212, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''2'')', '2016-01-15 01:27:41'),
(213, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''3'')', '2016-01-15 01:27:41'),
(214, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''4'')', '2016-01-15 01:27:42'),
(215, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''5'')', '2016-01-15 01:27:42'),
(216, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''6'')', '2016-01-15 01:27:42'),
(217, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''7'')', '2016-01-15 01:27:42'),
(218, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-15 01:27:42'),
(219, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''1'')', '2016-01-15 01:27:42'),
(220, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''2'')', '2016-01-15 01:27:42'),
(221, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''3'')', '2016-01-15 01:27:42');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(222, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''4'')', '2016-01-15 01:27:42'),
(223, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''5'')', '2016-01-15 01:27:42'),
(224, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''6'')', '2016-01-15 01:27:42'),
(225, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''7'')', '2016-01-15 01:27:42'),
(226, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-15 01:27:42'),
(227, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''1'')', '2016-01-15 01:27:43'),
(228, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''2'')', '2016-01-15 01:27:43'),
(229, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''3'')', '2016-01-15 01:27:43'),
(230, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''4'')', '2016-01-15 01:27:43'),
(231, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''5'')', '2016-01-15 01:27:43'),
(232, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''6'')', '2016-01-15 01:27:43'),
(233, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''7'')', '2016-01-15 01:27:43'),
(234, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-15 01:27:43'),
(235, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''1'')', '2016-01-15 01:27:43'),
(236, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''2'')', '2016-01-15 01:27:43'),
(237, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''3'')', '2016-01-15 01:27:43'),
(238, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''4'')', '2016-01-15 01:27:43'),
(239, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''5'')', '2016-01-15 01:27:44'),
(240, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''6'')', '2016-01-15 01:27:44'),
(241, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''7'')', '2016-01-15 01:27:44'),
(242, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-15 01:27:44'),
(243, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''1'')', '2016-01-15 01:27:44'),
(244, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''2'')', '2016-01-15 01:27:44'),
(245, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''3'')', '2016-01-15 01:27:44'),
(246, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''4'')', '2016-01-15 01:27:44'),
(247, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''5'')', '2016-01-15 01:27:44'),
(248, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''6'')', '2016-01-15 01:27:44'),
(249, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''7'')', '2016-01-15 01:27:44'),
(250, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-15 01:27:45'),
(251, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''1'')', '2016-01-15 01:27:45'),
(252, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''2'')', '2016-01-15 01:27:45'),
(253, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''3'')', '2016-01-15 01:27:45'),
(254, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''4'')', '2016-01-15 01:27:45'),
(255, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''5'')', '2016-01-15 01:27:45'),
(256, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''6'')', '2016-01-15 01:27:45'),
(257, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''7'')', '2016-01-15 01:27:45'),
(258, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-15 01:27:45'),
(259, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''1'')', '2016-01-15 01:27:45'),
(260, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''2'')', '2016-01-15 01:27:45'),
(261, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''3'')', '2016-01-15 01:27:45'),
(262, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''4'')', '2016-01-15 01:27:45'),
(263, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''5'')', '2016-01-15 01:27:46'),
(264, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''6'')', '2016-01-15 01:27:46'),
(265, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''7'')', '2016-01-15 01:27:46'),
(266, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-15 01:27:46'),
(267, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''1'')', '2016-01-15 01:27:46'),
(268, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''2'')', '2016-01-15 01:27:46'),
(269, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''3'')', '2016-01-15 01:27:46'),
(270, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''4'')', '2016-01-15 01:27:46'),
(271, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''5'')', '2016-01-15 01:27:46'),
(272, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''6'')', '2016-01-15 01:27:46'),
(273, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''7'')', '2016-01-15 01:27:46'),
(274, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-15 01:27:46'),
(275, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''1'')', '2016-01-15 01:27:47'),
(276, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''2'')', '2016-01-15 01:27:47'),
(277, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''3'')', '2016-01-15 01:27:47'),
(278, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''4'')', '2016-01-15 01:27:47'),
(279, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''5'')', '2016-01-15 01:27:47'),
(280, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''6'')', '2016-01-15 01:27:47'),
(281, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''7'')', '2016-01-15 01:27:47'),
(282, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-15 01:27:47'),
(283, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''1'')', '2016-01-15 01:27:47'),
(284, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''2'')', '2016-01-15 01:27:47'),
(285, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''3'')', '2016-01-15 01:27:47'),
(286, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''4'')', '2016-01-15 01:27:47'),
(287, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''5'')', '2016-01-15 01:27:48'),
(288, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''6'')', '2016-01-15 01:27:48'),
(289, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''7'')', '2016-01-15 01:27:48'),
(290, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-15 01:27:48'),
(291, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''1'')', '2016-01-15 01:27:48'),
(292, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''2'')', '2016-01-15 01:27:48'),
(293, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''3'')', '2016-01-15 01:27:48'),
(294, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''4'')', '2016-01-15 01:27:48'),
(295, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''5'')', '2016-01-15 01:27:48'),
(296, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''6'')', '2016-01-15 01:27:48'),
(297, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''7'')', '2016-01-15 01:27:48'),
(298, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-15 01:27:48'),
(299, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''1'')', '2016-01-15 01:27:49'),
(300, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''2'')', '2016-01-15 01:27:49'),
(301, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''3'')', '2016-01-15 01:27:49'),
(302, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''4'')', '2016-01-15 01:27:49'),
(303, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''5'')', '2016-01-15 01:27:49'),
(304, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''6'')', '2016-01-15 01:27:49'),
(305, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''7'')', '2016-01-15 01:27:49'),
(306, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-15 01:27:49'),
(307, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''1'')', '2016-01-15 01:27:49'),
(308, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''5'')', '2016-01-15 01:27:49'),
(309, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''6'')', '2016-01-15 01:27:49'),
(310, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''7'')', '2016-01-15 01:27:49'),
(311, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-15 01:27:49'),
(312, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',''2'')', '2016-01-15 01:27:50'),
(313, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-15 01:27:50'),
(314, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',''2'')', '2016-01-15 01:27:50'),
(315, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-15 01:27:50'),
(316, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''1'')', '2016-01-15 01:27:50'),
(317, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''2'')', '2016-01-15 01:27:50'),
(318, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''3'')', '2016-01-15 01:27:50'),
(319, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''4'')', '2016-01-15 01:27:51'),
(320, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''5'')', '2016-01-15 01:27:51'),
(321, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''6'')', '2016-01-15 01:27:51'),
(322, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''7'')', '2016-01-15 01:27:51'),
(323, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-15 01:27:51'),
(324, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''1'')', '2016-01-15 01:27:51'),
(325, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''2'')', '2016-01-15 01:27:51'),
(326, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''3'')', '2016-01-15 01:27:51'),
(327, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''4'')', '2016-01-15 01:27:51'),
(328, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''5'')', '2016-01-15 01:27:51'),
(329, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''6'')', '2016-01-15 01:27:51'),
(330, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''7'')', '2016-01-15 01:27:51'),
(331, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-15 01:27:52'),
(332, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''1'')', '2016-01-15 01:27:52'),
(333, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''2'')', '2016-01-15 01:27:52'),
(334, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''3'')', '2016-01-15 01:27:52'),
(335, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''4'')', '2016-01-15 01:27:52'),
(336, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''5'')', '2016-01-15 01:27:52'),
(337, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''6'')', '2016-01-15 01:27:52'),
(338, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''7'')', '2016-01-15 01:27:52'),
(339, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-15 01:27:52'),
(340, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-15 01:27:52'),
(341, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-15 01:27:52'),
(342, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-15 01:27:52'),
(343, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-15 01:27:52'),
(344, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-15 01:27:52'),
(345, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-15 01:27:53'),
(346, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-15 01:27:53'),
(347, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-15 01:27:53'),
(348, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-15 01:27:53'),
(349, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-15 01:27:53'),
(350, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-15 01:27:53'),
(351, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-15 01:27:53'),
(352, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-15 01:27:53'),
(353, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-15 01:27:53'),
(354, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-15 01:27:53'),
(355, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-15 01:27:53'),
(356, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-15 01:27:53'),
(357, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-15 01:27:53'),
(358, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-15 01:27:54'),
(359, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-15 01:27:54'),
(360, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-15 01:27:54'),
(361, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-15 01:27:54'),
(362, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-15 01:27:54'),
(363, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-15 01:27:54'),
(364, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-15 01:27:54'),
(365, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-15 01:27:54'),
(366, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-15 01:27:54'),
(367, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-15 01:27:54'),
(368, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-15 01:27:54'),
(369, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-15 01:27:54'),
(370, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-15 01:27:55'),
(371, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-15 01:27:55'),
(372, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-15 01:27:55'),
(373, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-15 01:27:55'),
(374, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-15 01:27:55'),
(375, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-15 01:27:55'),
(376, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-15 01:27:55'),
(377, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-15 01:27:55'),
(378, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-15 01:27:55'),
(379, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-15 01:27:55'),
(380, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-15 01:27:55'),
(381, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-15 01:27:55'),
(382, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-15 01:27:55'),
(383, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-15 01:27:55'),
(384, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-15 01:27:56'),
(385, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-15 01:27:56'),
(386, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-15 01:27:56'),
(387, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-15 01:27:56'),
(388, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-15 01:27:56'),
(389, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-15 01:27:56'),
(390, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-15 01:27:56'),
(391, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-15 01:27:56'),
(392, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-15 01:27:56'),
(393, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-15 01:27:56'),
(394, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-15 01:27:56'),
(395, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-15 01:27:56'),
(396, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-15 01:27:57'),
(397, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-15 01:27:57'),
(398, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-15 01:27:57'),
(399, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-15 01:27:57'),
(400, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-15 01:27:57'),
(401, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-15 01:27:57'),
(402, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-15 01:27:57'),
(403, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-15 01:27:57'),
(404, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-15 01:27:57'),
(405, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-15 01:27:57'),
(406, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-15 01:27:57'),
(407, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-15 01:27:57'),
(408, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-15 01:27:57'),
(409, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-15 01:27:58'),
(410, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-15 01:27:58'),
(411, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-15 01:27:58'),
(412, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-15 01:27:58'),
(413, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-15 01:27:58'),
(414, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-15 01:27:58'),
(415, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-15 01:27:58'),
(416, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-15 01:27:58'),
(417, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-15 01:27:58'),
(418, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-15 01:27:58'),
(419, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-15 01:27:58'),
(420, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-15 01:27:58'),
(421, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-15 01:27:58'),
(422, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-15 01:27:59'),
(423, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-15 01:27:59'),
(424, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-15 01:27:59'),
(425, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-15 01:27:59'),
(426, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-15 01:27:59'),
(427, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-15 01:27:59'),
(428, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-15 01:27:59'),
(429, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-15 01:27:59'),
(430, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-15 01:27:59'),
(431, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-15 01:27:59'),
(432, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-15 01:28:00'),
(433, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-15 01:28:00'),
(434, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-15 01:28:00'),
(435, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-15 01:28:00'),
(436, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-15 01:28:00'),
(437, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-15 01:28:00'),
(438, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-15 01:28:00'),
(439, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-15 01:28:00'),
(440, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-15 01:28:00'),
(441, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-15 01:28:00'),
(442, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-15 01:28:00'),
(443, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-15 01:28:01'),
(444, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-15 01:28:01'),
(445, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-15 01:28:01'),
(446, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-15 01:28:01'),
(447, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-15 01:28:01'),
(448, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-15 01:28:01'),
(449, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-15 01:28:01'),
(450, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-15 01:28:01'),
(451, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-15 01:28:01'),
(452, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-15 01:28:01'),
(453, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-15 01:28:02'),
(454, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-15 01:28:02'),
(455, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-15 01:28:02'),
(456, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-15 01:28:02'),
(457, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-15 01:28:02'),
(458, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-15 01:28:02');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(459, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-15 01:28:02'),
(460, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-15 01:28:02'),
(461, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-15 01:28:02'),
(462, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-15 01:28:02'),
(463, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-15 01:28:02'),
(464, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-15 01:28:02'),
(465, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-15 01:28:02'),
(466, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-15 01:28:03'),
(467, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-15 01:28:03'),
(468, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-15 01:28:03'),
(469, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-15 01:28:03'),
(470, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-15 01:28:03'),
(471, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-15 01:28:03'),
(472, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-15 01:28:03'),
(473, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-15 01:28:03'),
(474, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-15 01:28:03'),
(475, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-15 01:28:03'),
(476, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-15 01:28:04'),
(477, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-15 01:28:04'),
(478, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-15 01:28:04'),
(479, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-15 01:28:04'),
(480, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-15 01:28:04'),
(481, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-15 01:28:04'),
(482, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-15 01:28:04'),
(483, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-15 01:28:04'),
(484, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-15 01:28:04'),
(485, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-15 01:28:04'),
(486, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-15 01:28:04'),
(487, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-15 01:28:05'),
(488, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-15 01:28:05'),
(489, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-15 01:28:05'),
(490, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-15 01:28:05'),
(491, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-15 01:28:05'),
(492, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-15 01:28:05'),
(493, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-15 01:28:05'),
(494, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-15 01:28:05'),
(495, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-15 01:28:05'),
(496, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-15 01:28:05'),
(497, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-15 01:28:05'),
(498, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-15 01:28:05'),
(499, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-15 01:28:05'),
(500, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-15 01:28:06'),
(501, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-15 01:28:06'),
(502, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-15 01:28:06'),
(503, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-15 01:28:06'),
(504, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-15 01:28:06'),
(505, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-15 01:28:06'),
(506, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-15 01:28:06'),
(507, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-15 01:28:06'),
(508, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-15 01:28:06'),
(509, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-15 01:28:06'),
(510, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-15 01:28:06'),
(511, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-15 01:28:07'),
(512, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-15 01:28:07'),
(513, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-15 01:28:07'),
(514, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-15 01:28:07'),
(515, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-15 01:28:07'),
(516, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-15 01:28:07'),
(517, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-15 01:28:07'),
(518, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-15 01:28:07'),
(519, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-15 01:28:07'),
(520, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-15 01:28:07'),
(521, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-15 01:28:07'),
(522, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-15 01:28:08'),
(523, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-15 01:28:08'),
(524, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-15 01:28:08'),
(525, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-15 01:28:08'),
(526, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-15 01:28:08'),
(527, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-15 01:28:08'),
(528, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-15 01:28:08'),
(529, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-15 01:28:08'),
(530, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-15 01:28:08'),
(531, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-15 01:28:08'),
(532, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-15 01:28:08'),
(533, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-15 01:28:08'),
(534, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-15 01:28:08'),
(535, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-15 01:28:08'),
(536, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-15 01:28:09'),
(537, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-15 01:28:09'),
(538, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-15 01:28:09'),
(539, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-15 01:28:09'),
(540, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-15 01:28:09'),
(541, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-15 01:28:09'),
(542, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-15 01:28:09'),
(543, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-15 01:28:09'),
(544, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-15 01:28:09'),
(545, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-15 01:28:09'),
(546, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-15 01:28:09'),
(547, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-15 01:28:10'),
(548, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-15 01:28:10'),
(549, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'insert into tperfil (descripcion) values (''DOCENTE'');', '2016-01-15 01:29:57'),
(550, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil='''');', '2016-01-15 01:29:57'),
(551, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'DELETE FROM tcontrol_notas WHERE codigo_msd=2 AND cedula_estudiante=''V252132343'' AND codigo_lapso=2;', '2016-01-15 01:31:00'),
(552, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'INSERT INTO tcontrol_notas (codigo_msd,cedula_estudiante,codigo_lapso,notafinal) VALUES (2,''V252132343'',2,12);', '2016-01-15 01:31:00'),
(553, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'insert into tusuario (cedula,nombre_usuario,codigo_perfil) values(''V121212121'',''V121212121'',''2'')', '2016-01-15 01:33:16'),
(554, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V13131313', 'insert into tcontrasena (estado,nombre_usuario,contrasena) values(3,''V121212121'',''1f82ea75c5cc526729e2d581aeb3aeccfef4407e'')', '2016-01-15 01:33:16'),
(555, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V121212121', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V121212121'')', '2016-01-15 01:33:31'),
(556, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2016-01-15 01:34:17'),
(557, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2016-01-15 01:34:32'),
(558, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-15 01:34:46'),
(559, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tperfil set descripcion=''DOCENTE'' where (codigo_perfil=''2'');', '2016-01-15 01:35:53'),
(560, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''2'');', '2016-01-15 01:35:53'),
(561, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-15 01:35:53'),
(562, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',''2'')', '2016-01-15 01:35:53'),
(563, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-15 01:35:53'),
(564, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-15 01:35:53'),
(565, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-15 01:35:53'),
(566, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-15 01:35:53'),
(567, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-15 01:35:53'),
(568, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',''2'')', '2016-01-15 01:35:53'),
(569, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-15 01:35:53'),
(570, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',''2'')', '2016-01-15 01:35:54'),
(571, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-15 01:35:54'),
(572, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-15 01:35:54'),
(573, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-15 01:35:54'),
(574, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-15 01:35:54'),
(575, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-15 01:35:54'),
(576, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-15 01:35:54'),
(577, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-15 01:35:54'),
(578, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-15 01:35:54'),
(579, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-15 01:35:54'),
(580, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-15 01:35:54'),
(581, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-15 01:35:54'),
(582, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-15 01:35:55'),
(583, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-15 01:35:55'),
(584, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-15 01:35:55'),
(585, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-15 01:35:55'),
(586, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-15 01:35:55'),
(587, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-15 01:35:55'),
(588, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-15 01:35:55'),
(589, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-15 01:35:55'),
(590, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-15 01:35:55'),
(591, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-15 01:35:55'),
(592, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-15 01:35:55'),
(593, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-15 01:35:55'),
(594, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-15 01:35:55'),
(595, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-15 01:35:55'),
(596, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-15 01:35:56'),
(597, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-15 01:35:56'),
(598, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-15 01:35:56'),
(599, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-15 01:35:56'),
(600, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-15 01:35:56'),
(601, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-15 01:35:56'),
(602, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-15 01:35:56'),
(603, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-15 01:35:56'),
(604, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-15 01:35:56'),
(605, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-15 01:35:56'),
(606, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-15 01:35:56'),
(607, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-15 01:35:56'),
(608, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-15 01:35:57'),
(609, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-15 01:35:57'),
(610, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-15 01:35:57'),
(611, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-15 01:35:57'),
(612, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-15 01:35:57'),
(613, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tperfil set descripcion=''DOCENTE'' where (codigo_perfil=''2'');', '2016-01-15 01:39:06'),
(614, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''2'');', '2016-01-15 01:39:06'),
(615, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-15 01:39:06'),
(616, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',''2'')', '2016-01-15 01:39:06'),
(617, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-15 01:39:06'),
(618, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-15 01:39:06'),
(619, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-15 01:39:06'),
(620, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-15 01:39:06'),
(621, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-15 01:39:06'),
(622, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',''2'')', '2016-01-15 01:39:06'),
(623, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-15 01:39:06'),
(624, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',''2'')', '2016-01-15 01:39:06'),
(625, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-15 01:39:06'),
(626, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-15 01:39:07'),
(627, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-15 01:39:07'),
(628, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-15 01:39:07'),
(629, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-15 01:39:07'),
(630, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-15 01:39:07'),
(631, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-15 01:39:07'),
(632, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-15 01:39:07'),
(633, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-15 01:39:07'),
(634, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-15 01:39:07'),
(635, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-15 01:39:07'),
(636, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-15 01:39:07'),
(637, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-15 01:39:08'),
(638, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-15 01:39:08'),
(639, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-15 01:39:08'),
(640, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-15 01:39:08'),
(641, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-15 01:39:08'),
(642, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-15 01:39:08'),
(643, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-15 01:39:08'),
(644, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-15 01:39:08'),
(645, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-15 01:39:08'),
(646, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-15 01:39:08'),
(647, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-15 01:39:08'),
(648, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-15 01:39:08'),
(649, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-15 01:39:08'),
(650, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-15 01:39:08'),
(651, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-15 01:39:09'),
(652, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-15 01:39:09'),
(653, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-15 01:39:09'),
(654, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-15 01:39:09'),
(655, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-15 01:39:09'),
(656, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-15 01:39:09'),
(657, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-15 01:39:09'),
(658, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-15 01:39:09'),
(659, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-15 01:39:09'),
(660, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-15 01:39:09'),
(661, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-15 01:39:09'),
(662, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-15 01:39:09'),
(663, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-15 01:39:09'),
(664, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-15 01:39:10'),
(665, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-15 01:39:10'),
(666, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-15 01:39:10'),
(667, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V131313131'')', '2016-01-15 01:39:50'),
(668, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V13131313'')', '2016-01-15 01:40:03'),
(669, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-15 01:40:18'),
(670, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V121212121', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V121212121'')', '2016-01-15 01:40:44'),
(671, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V121212121', 'update tcontrasena set estado=0 where (nombre_usuario=''V121212121'')', '2016-01-15 01:41:06'),
(672, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V121212121', 'insert into tcontrasena (contrasena,nombre_usuario,estado)values(''791acae9d7efbefc2b489747af71cc2f6870554d'',''V121212121'',1)', '2016-01-15 01:41:06'),
(673, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V121212121', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V121212121'')', '2016-01-15 01:41:25'),
(674, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V121212121', 'UPDATE tusuario SET \r\n  nombre_usuario=''V121212121'',\r\n  pregunta_1 =  ''P1'',\r\n respuesta_1 =  ''R1'',\r\n  pregunta_2 =  ''P2'',\r\n respuesta_2=  ''R2'' WHERE (nombre_usuario=''V121212121'')', '2016-01-15 01:42:07'),
(675, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-15 03:10:38'),
(676, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V13131313'')', '2016-01-15 03:11:32'),
(677, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2016-01-15 03:11:55'),
(678, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-15 03:12:12'),
(679, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-15 12:42:39'),
(680, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-15 12:43:31'),
(681, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2016-01-15 14:20:41'),
(682, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-15 14:20:57'),
(683, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tplantel (codigo_plantel,nombre,direccion,telefono_habitacion,localidad,codigo_municipio,email) VALUES (''21345687654'',''LICEO BOLIVARIANO PIRITAL'',''CENTRO POBLADO PIRITAL'',''02553456784'',''PIRITAL'',''2'','''');', '2016-01-15 14:26:44'),
(684, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tplantel (codigo_plantel,nombre,direccion,telefono_habitacion,localidad,codigo_municipio,email) VALUES (''123456453434'',''LICEO BOLIVARIANO TOCUYANO'',''CENTRO "I" TOCUYANO'',''02556345678'',''TOCUYANO'',''2'','''');', '2016-01-15 14:29:36'),
(685, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set seccion=''2'',descripcion=''SEGUNDO A'',turno=''M'',grado_escolar=''1'', capacidad_min=''40'',capacidad_max=''50'' where (seccion=''2'');', '2016-01-15 14:32:25'),
(686, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,fecha_ingreso,codigo_cargo,codigo_dependencia,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V1111'',''LAURA'',''JIMENEZ'',''F'',STR_TO_DATE(''20/01/2000'',''%d/%m/%Y''),''1'',''ACARIGUA'',''02554564532'','''',''laura_maria_jimenez@hotmail.com'',''Y'',''N'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);', '2016-01-15 15:07:47'),
(687, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tproceso_inscripcion (codigo_inscripcion,fecha_inscripcion,codigo_ano_academico,cedula_estudiante,cedula_escolar,codigo_canaima,peso,estatura,codigo_plantel,primerafi) VALUES ((SELECT MAX(codigo_inscripcion) FROM tinscripcion WHERE fecha_desactivacion IS NULL),CURDATE(),(SELECT MAX(codigo_ano_academico) FROM tano_academico WHERE fecha_desactivacion IS NULL),''V1111'','''','''',''50'',''156'',''12345645343'',CURDATE());', '2016-01-15 15:07:47'),
(689, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,fecha_ingreso,codigo_cargo,codigo_dependencia,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V25347014'',''ANYELIS'',''SALAZ'',''F'',STR_TO_DATE(''30/01/2002'',''%d/%m/%Y''),''1'',''ACARIGUA'',''02554564532'','''',''anyelisalazar@hotmail.com'',''Y'',''N'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);', '2016-01-15 15:28:32'),
(690, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tproceso_inscripcion (codigo_inscripcion,fecha_inscripcion,codigo_ano_academico,cedula_estudiante,cedula_escolar,codigo_canaima,peso,estatura,codigo_plantel,primerafi) VALUES ((SELECT MAX(codigo_inscripcion) FROM tinscripcion WHERE fecha_desactivacion IS NULL),CURDATE(),(SELECT MAX(codigo_ano_academico) FROM tano_academico WHERE fecha_desactivacion IS NULL),''V25347014'','''','''',''50'',''165'',''12345645343'',CURDATE());', '2016-01-15 15:28:32');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(693, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,fecha_ingreso,codigo_cargo,codigo_dependencia,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V24935226'',''OSCARY'',''SOTO'',''F'',STR_TO_DATE(''05/01/2006'',''%d/%m/%Y''),''1'',''ACARIGUA'',''02556363333'','''',''oscarysoto@hotmail.com'',''Y'',''N'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);', '2016-01-15 15:50:39'),
(694, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tproceso_inscripcion (codigo_inscripcion,fecha_inscripcion,codigo_ano_academico,cedula_estudiante,cedula_escolar,codigo_canaima,peso,estatura,codigo_plantel,primerafi) VALUES ((SELECT MAX(codigo_inscripcion) FROM tinscripcion WHERE fecha_desactivacion IS NULL),CURDATE(),(SELECT MAX(codigo_ano_academico) FROM tano_academico WHERE fecha_desactivacion IS NULL),''V24935226'','''','''',''50'',''162'',''12345645343'',CURDATE());', '2016-01-15 15:50:39'),
(695, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,fecha_ingreso,codigo_cargo,codigo_dependencia,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V25347013'',''ANYELISMER'',''PERZ'',''F'',STR_TO_DATE(''19/01/2005'',''%d/%m/%Y''),''1'',''ACARIGUA'',''02556373737'','''',''anyelismer@hotmail.com'',''Y'',''N'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);', '2016-01-15 15:57:48'),
(696, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tproceso_inscripcion (codigo_inscripcion,fecha_inscripcion,codigo_ano_academico,cedula_estudiante,cedula_escolar,codigo_canaima,peso,estatura,codigo_plantel,primerafi) VALUES ((SELECT MAX(codigo_inscripcion) FROM tinscripcion WHERE fecha_desactivacion IS NULL),CURDATE(),(SELECT MAX(codigo_ano_academico) FROM tano_academico WHERE fecha_desactivacion IS NULL),''V25347013'','''','''',''55'',''163'',''1249834983H'',CURDATE());', '2016-01-15 15:57:48'),
(698, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2016-01-15 16:02:15'),
(699, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V13131313'')', '2016-01-15 16:02:45'),
(700, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'UPDATE tcontrasena set estado=2 where (nombre_usuario=''V13131313'' and estado=1) ', '2016-01-15 16:02:45'),
(701, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-15 16:03:15'),
(702, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tperfil set descripcion=''ADMINISTRADOR'' where (codigo_perfil=''1'');', '2016-01-15 16:18:28'),
(703, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''1'');', '2016-01-15 16:18:28'),
(704, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-15 16:18:28'),
(705, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''1'')', '2016-01-15 16:18:28'),
(706, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''2'')', '2016-01-15 16:18:28'),
(707, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''3'')', '2016-01-15 16:18:28'),
(708, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''4'')', '2016-01-15 16:18:28'),
(709, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''5'')', '2016-01-15 16:18:28'),
(710, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''6'')', '2016-01-15 16:18:28'),
(711, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''7'')', '2016-01-15 16:18:28'),
(712, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-15 16:18:28'),
(713, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''1'')', '2016-01-15 16:18:28'),
(714, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''2'')', '2016-01-15 16:18:28'),
(715, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''3'')', '2016-01-15 16:18:28'),
(716, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''4'')', '2016-01-15 16:18:29'),
(717, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''5'')', '2016-01-15 16:18:29'),
(718, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''6'')', '2016-01-15 16:18:29'),
(719, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''7'')', '2016-01-15 16:18:29'),
(720, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-15 16:18:29'),
(721, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''1'')', '2016-01-15 16:18:29'),
(722, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''2'')', '2016-01-15 16:18:29'),
(723, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''3'')', '2016-01-15 16:18:29'),
(724, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''4'')', '2016-01-15 16:18:29'),
(725, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''5'')', '2016-01-15 16:18:29'),
(726, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''6'')', '2016-01-15 16:18:29'),
(727, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''7'')', '2016-01-15 16:18:29'),
(728, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-15 16:18:30'),
(729, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''1'')', '2016-01-15 16:18:30'),
(730, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''2'')', '2016-01-15 16:18:30'),
(731, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''3'')', '2016-01-15 16:18:30'),
(732, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''4'')', '2016-01-15 16:18:30'),
(733, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''5'')', '2016-01-15 16:18:30'),
(734, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''6'')', '2016-01-15 16:18:30'),
(735, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''7'')', '2016-01-15 16:18:30'),
(736, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-15 16:18:30'),
(737, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''1'')', '2016-01-15 16:18:30'),
(738, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''2'')', '2016-01-15 16:18:30'),
(739, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''3'')', '2016-01-15 16:18:30'),
(740, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''4'')', '2016-01-15 16:18:31'),
(741, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''5'')', '2016-01-15 16:18:31'),
(742, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''6'')', '2016-01-15 16:18:31'),
(743, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''7'')', '2016-01-15 16:18:31'),
(744, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-15 16:18:31'),
(745, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''1'')', '2016-01-15 16:18:31'),
(746, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''2'')', '2016-01-15 16:18:31'),
(747, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''3'')', '2016-01-15 16:18:31'),
(748, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''4'')', '2016-01-15 16:18:31'),
(749, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''5'')', '2016-01-15 16:18:31'),
(750, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''6'')', '2016-01-15 16:18:31'),
(751, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''7'')', '2016-01-15 16:18:31'),
(752, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-15 16:18:31'),
(753, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''1'')', '2016-01-15 16:18:32'),
(754, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''2'')', '2016-01-15 16:18:32'),
(755, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''3'')', '2016-01-15 16:18:32'),
(756, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''4'')', '2016-01-15 16:18:32'),
(757, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''5'')', '2016-01-15 16:18:32'),
(758, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''6'')', '2016-01-15 16:18:32'),
(759, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''7'')', '2016-01-15 16:18:32'),
(760, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-15 16:18:32'),
(761, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''1'')', '2016-01-15 16:18:32'),
(762, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''2'')', '2016-01-15 16:18:32'),
(763, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''3'')', '2016-01-15 16:18:32'),
(764, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''4'')', '2016-01-15 16:18:32'),
(765, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''5'')', '2016-01-15 16:18:32'),
(766, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''6'')', '2016-01-15 16:18:33'),
(767, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''7'')', '2016-01-15 16:18:33'),
(768, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-15 16:18:33'),
(769, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''1'')', '2016-01-15 16:18:33'),
(770, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''2'')', '2016-01-15 16:18:33'),
(771, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''3'')', '2016-01-15 16:18:33'),
(772, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''4'')', '2016-01-15 16:18:33'),
(773, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''5'')', '2016-01-15 16:18:33'),
(774, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''6'')', '2016-01-15 16:18:33'),
(775, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''7'')', '2016-01-15 16:18:33'),
(776, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-15 16:18:33'),
(777, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''1'')', '2016-01-15 16:18:34'),
(778, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''2'')', '2016-01-15 16:18:34'),
(779, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''3'')', '2016-01-15 16:18:34'),
(780, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''4'')', '2016-01-15 16:18:34'),
(781, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''5'')', '2016-01-15 16:18:34'),
(782, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''6'')', '2016-01-15 16:18:34'),
(783, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''7'')', '2016-01-15 16:18:34'),
(784, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-15 16:18:34'),
(785, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''1'')', '2016-01-15 16:18:34'),
(786, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''2'')', '2016-01-15 16:18:34'),
(787, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''3'')', '2016-01-15 16:18:34'),
(788, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''4'')', '2016-01-15 16:18:34'),
(789, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''5'')', '2016-01-15 16:18:34'),
(790, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''6'')', '2016-01-15 16:18:34'),
(791, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''7'')', '2016-01-15 16:18:34'),
(792, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-15 16:18:35'),
(793, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''1'')', '2016-01-15 16:18:35'),
(794, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''2'')', '2016-01-15 16:18:35'),
(795, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''3'')', '2016-01-15 16:18:35'),
(796, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''4'')', '2016-01-15 16:18:35'),
(797, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''5'')', '2016-01-15 16:18:35'),
(798, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''6'')', '2016-01-15 16:18:35'),
(799, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''7'')', '2016-01-15 16:18:35'),
(800, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-15 16:18:35'),
(801, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''1'')', '2016-01-15 16:18:35'),
(802, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''2'')', '2016-01-15 16:18:35'),
(803, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''3'')', '2016-01-15 16:18:35'),
(804, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''4'')', '2016-01-15 16:18:36'),
(805, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''5'')', '2016-01-15 16:18:36'),
(806, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''6'')', '2016-01-15 16:18:36'),
(807, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''7'')', '2016-01-15 16:18:36'),
(808, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-15 16:18:36'),
(809, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''1'')', '2016-01-15 16:18:36'),
(810, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''2'')', '2016-01-15 16:18:36'),
(811, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''3'')', '2016-01-15 16:18:36'),
(812, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''4'')', '2016-01-15 16:18:36'),
(813, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''5'')', '2016-01-15 16:18:36'),
(814, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''6'')', '2016-01-15 16:18:36'),
(815, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''7'')', '2016-01-15 16:18:36'),
(816, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-15 16:18:37'),
(817, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''1'')', '2016-01-15 16:18:37'),
(818, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''2'')', '2016-01-15 16:18:37'),
(819, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''3'')', '2016-01-15 16:18:37'),
(820, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''4'')', '2016-01-15 16:18:37'),
(821, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''5'')', '2016-01-15 16:18:37'),
(822, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''6'')', '2016-01-15 16:18:37'),
(823, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''7'')', '2016-01-15 16:18:37'),
(824, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-15 16:18:37'),
(825, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''1'')', '2016-01-15 16:18:37'),
(826, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''2'')', '2016-01-15 16:18:37'),
(827, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''3'')', '2016-01-15 16:18:37'),
(828, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''4'')', '2016-01-15 16:18:37'),
(829, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''5'')', '2016-01-15 16:18:37'),
(830, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''6'')', '2016-01-15 16:18:38'),
(831, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''7'')', '2016-01-15 16:18:38'),
(832, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-15 16:18:38'),
(833, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''1'')', '2016-01-15 16:18:38'),
(834, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''2'')', '2016-01-15 16:18:38'),
(835, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''3'')', '2016-01-15 16:18:38'),
(836, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''4'')', '2016-01-15 16:18:38'),
(837, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''5'')', '2016-01-15 16:18:38'),
(838, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''6'')', '2016-01-15 16:18:39'),
(839, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''7'')', '2016-01-15 16:18:39'),
(840, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-15 16:18:39'),
(841, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''1'')', '2016-01-15 16:18:39'),
(842, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''2'')', '2016-01-15 16:18:39'),
(843, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''3'')', '2016-01-15 16:18:39'),
(844, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''4'')', '2016-01-15 16:18:39'),
(845, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''5'')', '2016-01-15 16:18:39'),
(846, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''6'')', '2016-01-15 16:18:39'),
(847, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''7'')', '2016-01-15 16:18:39'),
(848, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-15 16:18:39'),
(849, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''1'')', '2016-01-15 16:18:40'),
(850, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''2'')', '2016-01-15 16:18:40'),
(851, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''3'')', '2016-01-15 16:18:40'),
(852, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''4'')', '2016-01-15 16:18:40'),
(853, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''5'')', '2016-01-15 16:18:40'),
(854, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''6'')', '2016-01-15 16:18:40'),
(855, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''7'')', '2016-01-15 16:18:40'),
(856, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-15 16:18:40'),
(857, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''1'')', '2016-01-15 16:18:40'),
(858, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''2'')', '2016-01-15 16:18:40'),
(859, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''3'')', '2016-01-15 16:18:40'),
(860, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''4'')', '2016-01-15 16:18:40'),
(861, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''5'')', '2016-01-15 16:18:40'),
(862, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''6'')', '2016-01-15 16:18:40'),
(863, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''7'')', '2016-01-15 16:18:41'),
(864, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-15 16:18:41'),
(865, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''1'')', '2016-01-15 16:18:41'),
(866, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''2'')', '2016-01-15 16:18:41'),
(867, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''3'')', '2016-01-15 16:18:41'),
(868, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''4'')', '2016-01-15 16:18:41'),
(869, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''5'')', '2016-01-15 16:18:41'),
(870, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''6'')', '2016-01-15 16:18:41'),
(871, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''7'')', '2016-01-15 16:18:41'),
(872, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-15 16:18:41'),
(873, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''1'')', '2016-01-15 16:18:41'),
(874, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''2'')', '2016-01-15 16:18:41'),
(875, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''3'')', '2016-01-15 16:18:41'),
(876, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''4'')', '2016-01-15 16:18:41'),
(877, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''5'')', '2016-01-15 16:18:42'),
(878, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''6'')', '2016-01-15 16:18:42'),
(879, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''7'')', '2016-01-15 16:18:42'),
(880, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-15 16:18:42'),
(881, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''1'')', '2016-01-15 16:18:42'),
(882, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''2'')', '2016-01-15 16:18:42'),
(883, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''3'')', '2016-01-15 16:18:42'),
(884, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''4'')', '2016-01-15 16:18:42'),
(885, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''5'')', '2016-01-15 16:18:42'),
(886, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''6'')', '2016-01-15 16:18:42'),
(887, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''7'')', '2016-01-15 16:18:42'),
(888, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-15 16:18:43'),
(889, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''1'')', '2016-01-15 16:18:43'),
(890, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''2'')', '2016-01-15 16:18:43'),
(891, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''3'')', '2016-01-15 16:18:43'),
(892, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''4'')', '2016-01-15 16:18:43'),
(893, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''5'')', '2016-01-15 16:18:43'),
(894, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''6'')', '2016-01-15 16:18:43'),
(895, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''7'')', '2016-01-15 16:18:43'),
(896, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-15 16:18:43'),
(897, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''1'')', '2016-01-15 16:18:43'),
(898, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''2'')', '2016-01-15 16:18:43'),
(899, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''3'')', '2016-01-15 16:18:43'),
(900, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''4'')', '2016-01-15 16:18:43'),
(901, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''5'')', '2016-01-15 16:18:43'),
(902, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''6'')', '2016-01-15 16:18:44'),
(903, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''7'')', '2016-01-15 16:18:44'),
(904, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-15 16:18:44'),
(905, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''1'')', '2016-01-15 16:18:44'),
(906, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''2'')', '2016-01-15 16:18:44'),
(907, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''3'')', '2016-01-15 16:18:44'),
(908, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''4'')', '2016-01-15 16:18:44'),
(909, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''5'')', '2016-01-15 16:18:44'),
(910, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''6'')', '2016-01-15 16:18:44'),
(911, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''7'')', '2016-01-15 16:18:44'),
(912, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-15 16:18:44'),
(913, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''1'')', '2016-01-15 16:18:44'),
(914, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''2'')', '2016-01-15 16:18:44'),
(915, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''3'')', '2016-01-15 16:18:44'),
(916, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''4'')', '2016-01-15 16:18:45'),
(917, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''5'')', '2016-01-15 16:18:45'),
(918, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''6'')', '2016-01-15 16:18:45'),
(919, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''7'')', '2016-01-15 16:18:45'),
(920, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-15 16:18:45'),
(921, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''1'')', '2016-01-15 16:18:45'),
(922, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''2'')', '2016-01-15 16:18:45'),
(923, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''3'')', '2016-01-15 16:18:45');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(924, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''4'')', '2016-01-15 16:18:45'),
(925, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''5'')', '2016-01-15 16:18:45'),
(926, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''6'')', '2016-01-15 16:18:45'),
(927, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''7'')', '2016-01-15 16:18:45'),
(928, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-15 16:18:46'),
(929, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''1'')', '2016-01-15 16:18:46'),
(930, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''2'')', '2016-01-15 16:18:46'),
(931, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''3'')', '2016-01-15 16:18:46'),
(932, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''4'')', '2016-01-15 16:18:46'),
(933, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''5'')', '2016-01-15 16:18:46'),
(934, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''6'')', '2016-01-15 16:18:46'),
(935, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''7'')', '2016-01-15 16:18:46'),
(936, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-15 16:18:46'),
(937, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''1'')', '2016-01-15 16:18:46'),
(938, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''5'')', '2016-01-15 16:18:46'),
(939, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''6'')', '2016-01-15 16:18:46'),
(940, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''7'')', '2016-01-15 16:18:46'),
(941, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-15 16:18:46'),
(942, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',''2'')', '2016-01-15 16:18:47'),
(943, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-15 16:18:47'),
(944, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',''2'')', '2016-01-15 16:18:47'),
(945, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-15 16:18:47'),
(946, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''1'')', '2016-01-15 16:18:47'),
(947, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''2'')', '2016-01-15 16:18:47'),
(948, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''3'')', '2016-01-15 16:18:47'),
(949, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''4'')', '2016-01-15 16:18:47'),
(950, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''5'')', '2016-01-15 16:18:47'),
(951, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''6'')', '2016-01-15 16:18:47'),
(952, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''7'')', '2016-01-15 16:18:47'),
(953, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-15 16:18:47'),
(954, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''1'')', '2016-01-15 16:18:47'),
(955, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''2'')', '2016-01-15 16:18:47'),
(956, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''3'')', '2016-01-15 16:18:48'),
(957, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''4'')', '2016-01-15 16:18:48'),
(958, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''5'')', '2016-01-15 16:18:48'),
(959, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''6'')', '2016-01-15 16:18:48'),
(960, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''7'')', '2016-01-15 16:18:48'),
(961, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-15 16:18:48'),
(962, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''1'')', '2016-01-15 16:18:48'),
(963, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''2'')', '2016-01-15 16:18:48'),
(964, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''3'')', '2016-01-15 16:18:48'),
(965, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''4'')', '2016-01-15 16:18:49'),
(966, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''5'')', '2016-01-15 16:18:49'),
(967, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''6'')', '2016-01-15 16:18:49'),
(968, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''7'')', '2016-01-15 16:18:49'),
(969, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-15 16:18:49'),
(970, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-15 16:18:49'),
(971, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-15 16:18:49'),
(972, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-15 16:18:49'),
(973, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-15 16:18:49'),
(974, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-15 16:18:49'),
(975, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-15 16:18:49'),
(976, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-15 16:18:49'),
(977, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-15 16:18:50'),
(978, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-15 16:18:50'),
(979, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-15 16:18:50'),
(980, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-15 16:18:50'),
(981, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-15 16:18:50'),
(982, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-15 16:18:50'),
(983, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-15 16:18:50'),
(984, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-15 16:18:50'),
(985, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-15 16:18:50'),
(986, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-15 16:18:50'),
(987, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-15 16:18:50'),
(988, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-15 16:18:50'),
(989, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-15 16:18:50'),
(990, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-15 16:18:50'),
(991, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-15 16:18:51'),
(992, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-15 16:18:51'),
(993, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-15 16:18:51'),
(994, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-15 16:18:51'),
(995, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-15 16:18:51'),
(996, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-15 16:18:51'),
(997, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-15 16:18:51'),
(998, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-15 16:18:51'),
(999, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-15 16:18:51'),
(1000, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-15 16:18:51'),
(1001, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-15 16:18:51'),
(1002, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-15 16:18:52'),
(1003, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-15 16:18:52'),
(1004, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-15 16:18:52'),
(1005, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-15 16:18:52'),
(1006, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-15 16:18:52'),
(1007, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-15 16:18:52'),
(1008, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-15 16:18:52'),
(1009, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-15 16:18:52'),
(1010, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-15 16:18:52'),
(1011, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-15 16:18:52'),
(1012, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-15 16:18:52'),
(1013, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-15 16:18:52'),
(1014, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-15 16:18:52'),
(1015, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-15 16:18:53'),
(1016, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-15 16:18:53'),
(1017, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-15 16:18:53'),
(1018, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-15 16:18:53'),
(1019, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-15 16:18:53'),
(1020, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-15 16:18:53'),
(1021, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-15 16:18:53'),
(1022, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-15 16:18:53'),
(1023, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-15 16:18:53'),
(1024, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-15 16:18:53'),
(1025, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-15 16:18:53'),
(1026, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-15 16:18:53'),
(1027, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-15 16:18:53'),
(1028, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-15 16:18:53'),
(1029, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-15 16:18:54'),
(1030, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-15 16:18:54'),
(1031, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-15 16:18:54'),
(1032, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-15 16:18:54'),
(1033, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-15 16:18:54'),
(1034, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-15 16:18:54'),
(1035, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-15 16:18:54'),
(1036, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-15 16:18:54'),
(1037, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-15 16:18:54'),
(1038, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-15 16:18:54'),
(1039, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-15 16:18:54'),
(1040, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-15 16:18:55'),
(1041, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-15 16:18:55'),
(1042, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-15 16:18:55'),
(1043, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-15 16:18:55'),
(1044, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-15 16:18:55'),
(1045, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-15 16:18:55'),
(1046, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-15 16:18:55'),
(1047, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-15 16:18:55'),
(1048, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-15 16:18:55'),
(1049, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-15 16:18:55'),
(1050, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-15 16:18:55'),
(1051, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-15 16:18:55'),
(1052, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-15 16:18:55'),
(1053, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-15 16:18:56'),
(1054, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-15 16:18:56'),
(1055, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-15 16:18:56'),
(1056, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-15 16:18:56'),
(1057, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-15 16:18:56'),
(1058, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-15 16:18:56'),
(1059, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-15 16:18:56'),
(1060, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-15 16:18:56'),
(1061, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-15 16:18:56'),
(1062, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-15 16:18:56'),
(1063, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-15 16:18:56'),
(1064, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-15 16:18:56'),
(1065, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-15 16:18:56'),
(1066, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-15 16:18:56'),
(1067, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-15 16:18:57'),
(1068, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-15 16:18:57'),
(1069, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-15 16:18:57'),
(1070, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-15 16:18:57'),
(1071, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-15 16:18:57'),
(1072, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-15 16:18:57'),
(1073, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-15 16:18:57'),
(1074, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-15 16:18:57'),
(1075, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-15 16:18:57'),
(1076, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-15 16:18:57'),
(1077, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-15 16:18:57'),
(1078, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-15 16:18:58'),
(1079, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-15 16:18:58'),
(1080, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-15 16:18:58'),
(1081, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-15 16:18:58'),
(1082, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-15 16:18:58'),
(1083, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-15 16:18:58'),
(1084, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-15 16:18:58'),
(1085, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-15 16:18:58'),
(1086, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-15 16:18:58'),
(1087, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-15 16:18:59'),
(1088, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-15 16:18:59'),
(1089, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-15 16:18:59'),
(1090, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-15 16:18:59'),
(1091, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-15 16:18:59'),
(1092, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-15 16:18:59'),
(1093, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-15 16:18:59'),
(1094, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-15 16:18:59'),
(1095, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-15 16:18:59'),
(1096, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-15 16:18:59'),
(1097, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-15 16:19:00'),
(1098, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-15 16:19:00'),
(1099, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-15 16:19:00'),
(1100, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-15 16:19:00'),
(1101, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-15 16:19:00'),
(1102, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-15 16:19:00'),
(1103, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-15 16:19:00'),
(1104, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-15 16:19:00'),
(1105, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-15 16:19:00'),
(1106, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-15 16:19:00'),
(1107, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-15 16:19:00'),
(1108, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-15 16:19:00'),
(1109, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-15 16:19:00'),
(1110, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-15 16:19:01'),
(1111, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-15 16:19:01'),
(1112, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-15 16:19:01'),
(1113, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-15 16:19:01'),
(1114, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-15 16:19:01'),
(1115, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-15 16:19:01'),
(1116, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-15 16:19:01'),
(1117, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-15 16:19:01'),
(1118, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-15 16:19:01'),
(1119, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-15 16:19:01'),
(1120, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-15 16:19:01'),
(1121, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-15 16:19:01'),
(1122, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-15 16:19:02'),
(1123, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-15 16:19:02'),
(1124, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-15 16:19:02'),
(1125, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-15 16:19:02'),
(1126, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-15 16:19:02'),
(1127, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-15 16:19:02'),
(1128, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-15 16:19:02'),
(1129, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-15 16:19:02'),
(1130, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-15 16:19:02'),
(1131, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-15 16:19:02'),
(1132, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-15 16:19:02'),
(1133, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-15 16:19:02'),
(1134, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-15 16:19:02'),
(1135, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-15 16:19:02'),
(1136, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-15 16:19:03'),
(1137, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-15 16:19:03'),
(1138, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-15 16:19:03'),
(1139, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-15 16:19:03'),
(1140, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-15 16:19:03'),
(1141, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-15 16:19:03'),
(1142, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-15 16:19:03'),
(1143, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-15 16:19:03'),
(1144, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-15 16:19:03'),
(1145, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-15 16:19:03'),
(1146, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-15 16:19:03'),
(1147, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-15 16:19:03'),
(1148, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-15 16:19:04'),
(1149, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-15 16:19:04'),
(1150, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-15 16:19:04'),
(1151, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-15 16:19:04'),
(1152, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-15 16:19:04'),
(1153, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-15 16:19:04'),
(1154, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-15 16:19:04'),
(1155, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-15 16:19:04'),
(1156, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-15 16:19:04'),
(1157, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-15 16:19:04'),
(1158, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-15 16:19:04');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(1159, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-15 16:19:05'),
(1160, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-15 16:19:05'),
(1161, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-15 16:19:05'),
(1162, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-15 16:19:05'),
(1163, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-15 16:19:05'),
(1164, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-15 16:19:05'),
(1165, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-15 16:19:05'),
(1166, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-15 16:19:05'),
(1167, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-15 16:19:05'),
(1168, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-15 16:19:05'),
(1169, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-15 16:19:05'),
(1170, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-15 16:19:05'),
(1171, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-15 16:19:05'),
(1172, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-15 16:19:06'),
(1173, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-15 16:19:06'),
(1174, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-15 16:19:06'),
(1175, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-15 16:19:06'),
(1176, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-15 16:19:06'),
(1177, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-15 16:19:06'),
(1178, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-15 16:19:06'),
(1179, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''123456789'')', '2016-01-15 19:00:06'),
(1180, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''123456789'')', '2016-01-15 19:00:16'),
(1181, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2016-01-17 17:47:35'),
(1182, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2016-01-17 17:47:50'),
(1183, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tcontrasena set estado=0 where (nombre_usuario=''V123456789'')', '2016-01-17 17:49:42'),
(1184, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tcontrasena (contrasena,nombre_usuario,estado)values(''7e199bc85c0fdded08fe2bc5375527e89d1e9f6d'',''V123456789'',1)', '2016-01-17 17:49:42'),
(1185, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-17 17:49:54'),
(1186, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-17 17:49:54'),
(1187, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,fecha_ingreso,codigo_cargo,codigo_dependencia,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V2341'',''JAVIER'',''MARTIN'',''M'',STR_TO_DATE(''03/01/2001'',''%d/%m/%Y''),''1'',''N/A'',''02554565325'',''04143452332'','''',''N'',''Y'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);', '2016-01-17 17:55:34'),
(1188, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tpersona SET nombres=''JAVIER'',apellidos=''MARTIN'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''03/01/2001'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''N/A'',telefono_habitacion=''02554565325'',telefono_movil=''04143452332'',email='''',esestudiante=''N'',esrepresentante=''Y'' WHERE cedula=''V23413455'';', '2016-01-17 17:56:11'),
(1189, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,fecha_ingreso,codigo_cargo,codigo_dependencia,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V12312312'',''JAVIER JR'',''MARTIN'',''M'',STR_TO_DATE(''21/01/2004'',''%d/%m/%Y''),''1'',''N/A'',''02552343423'','''','''',''Y'',''N'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);', '2016-01-17 18:10:29'),
(1190, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tproceso_inscripcion (codigo_inscripcion,fecha_inscripcion,codigo_ano_academico,cedula_estudiante,cedula_escolar,codigo_canaima,peso,estatura,codigo_plantel,primerafi) VALUES ((SELECT MAX(codigo_inscripcion) FROM tinscripcion WHERE fecha_desactivacion IS NULL),CURDATE(),(SELECT MAX(codigo_ano_academico) FROM tano_academico WHERE fecha_desactivacion IS NULL),''V12312312'','''',''124321VS123123'',''123.4'',''123'',''12345645343'',CURDATE());', '2016-01-17 18:10:29'),
(1191, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET certificado_sextogrado=''N'',notascertificadas=''N'',cartabuenaconducta=''N'',fotoestudiante=''N'',fotorepresentante=''N'',fotocopia_ciestudiante=''N'',fotocopia_cirepresentante=''N'',fotocopia_pnestudiante=''N'',kitscomedor=''N'',becado=''N'',tipobeca=''0'' WHERE cedula_estudiante = ''V12312312''', '2016-01-17 18:49:43'),
(1192, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET certificado_sextogrado=''Y'',notascertificadas=''Y'',cartabuenaconducta=''Y'',fotoestudiante=''Y'',fotorepresentante=''Y'',fotocopia_ciestudiante=''Y'',fotocopia_cirepresentante=''Y'',fotocopia_pnestudiante=''Y'',kitscomedor=''Y'',becado=''N'',tipobeca=''0'' WHERE cedula_estudiante = ''V12312312''', '2016-01-17 18:50:19'),
(1193, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tpersona SET nombres=''JAVIER'',apellidos=''MARTIN'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''03/01/2001'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''N/A'',telefono_habitacion=''02554565325'',telefono_movil=''04143452332'',email='''',esestudiante=''N'',esrepresentante=''Y'' WHERE cedula=''V23411212'';', '2016-01-17 18:53:41'),
(1194, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tpersona SET nombres=''JAVIER JR'',apellidos=''MARTIN'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''21/01/2004'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''N/A'',telefono_habitacion=''02552343423'',telefono_movil='''',email='''',esestudiante=''Y'',esrepresentante=''N'' WHERE cedula=''V12312312'';', '2016-01-17 18:57:54'),
(1195, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_escolar='''',codigo_canaima=''124321VS123123'',peso=123.4,estatura=''123'',codigo_plantel=''21345687654'' WHERE cedula_estudiante =''V12312312'';', '2016-01-17 18:57:54'),
(1196, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tpersona SET nombres=''JAVIER JR'',apellidos=''MARTIN'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''21/01/2004'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''NO APLICA'',telefono_habitacion=''02552343423'',telefono_movil='''',email='''',esestudiante=''Y'',esrepresentante=''N'' WHERE cedula=''V12312312'';', '2016-01-17 18:59:35'),
(1197, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_escolar='''',codigo_canaima=''124321VS123123'',peso=123.4,estatura=''123'',codigo_plantel=''21345687654'' WHERE cedula_estudiante =''V12312312'';', '2016-01-17 18:59:35'),
(1199, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tpersona SET nombres=''JAVIER JR'',apellidos=''MARTIN'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''21/01/2004'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''N/A'',telefono_habitacion=''02552343423'',telefono_movil='''',email='''',esestudiante=''Y'',esrepresentante=''N'' WHERE cedula=''V12312312'';', '2016-01-17 19:03:52'),
(1200, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_escolar='''',codigo_canaima=''124321VS123123'',peso=123.4,estatura=''123'',codigo_plantel=''21345687654'' WHERE cedula_estudiante =''V12312312'';', '2016-01-17 19:03:52'),
(1201, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tpersona SET nombres=''JAVIER JR'',apellidos=''MARTIN'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''21/01/2004'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''N/A'',telefono_habitacion=''02552343423'',telefono_movil='''',email='''',esestudiante=''Y'',esrepresentante=''N'' WHERE cedula=''V12312312'';', '2016-01-17 19:04:51'),
(1202, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_escolar='''',codigo_canaima=''124321VS123123'',peso=123.4,estatura=''123'',codigo_plantel=''12345645343'' WHERE cedula_estudiante =''V12312312'';', '2016-01-17 19:04:51'),
(1203, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tpersona SET nombres=''JAVIER JR'',apellidos=''MARTIN'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''21/01/2004'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''N/A'',telefono_habitacion=''02552343423'',telefono_movil='''',email='''',esestudiante=''Y'',esrepresentante=''N'' WHERE cedula=''V12312312'';', '2016-01-17 19:08:32'),
(1204, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_escolar='''',codigo_canaima=''124321VS123123'',peso=123.4,estatura=''123'',codigo_plantel=''1249834983H'' WHERE cedula_estudiante =''V12312312'';', '2016-01-17 19:08:32'),
(1205, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tpersona SET cedula=''V23411212'',nombres=''JAVIER'',apellidos=''MARTIN'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''03/01/2001'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''N/A'',telefono_habitacion=''02554565325'',telefono_movil=''04143452332'',email='''',esestudiante=''N'',esrepresentante=''Y'' WHERE cedula=''V2341'';', '2016-01-17 19:20:06'),
(1206, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,fecha_ingreso,codigo_cargo,codigo_dependencia,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V105463555'',''OSCAR'',''SOTO'',''M'',STR_TO_DATE(''09/01/1980'',''%d/%m/%Y''),''1'',''ACARIGUA'',''02554567845'',''04242345678'',''oscar@hotmail.com'',''N'',''Y'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);', '2016-01-17 19:29:59'),
(1207, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_padre=''V105463555'' WHERE cedula_estudiante=''V24935226'';', '2016-01-17 19:29:59'),
(1208, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET certificado_sextogrado=''Y'',notascertificadas=''N'',cartabuenaconducta=''Y'',fotoestudiante=''N'',fotorepresentante=''Y'',fotocopia_ciestudiante=''N'',fotocopia_cirepresentante=''N'',fotocopia_pnestudiante=''Y'',kitscomedor=''N'',becado=''N'',tipobeca=''N'' WHERE cedula_estudiante = ''V24935226''', '2016-01-17 19:30:16'),
(1209, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,fecha_ingreso,codigo_cargo,codigo_dependencia,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V30484143'',''DANIEL'',''RODRIGUEZ'',''M'',STR_TO_DATE(''03/03/2002'',''%d/%m/%Y''),''1'',''ACARIGUA'',''02554564532'','''',''daniel@hotmail.com'',''Y'',''N'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);', '2016-01-17 19:49:47'),
(1210, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tproceso_inscripcion (codigo_inscripcion,fecha_inscripcion,codigo_ano_academico,cedula_estudiante,cedula_escolar,codigo_canaima,peso,estatura,codigo_plantel,primerafi) VALUES ((SELECT MAX(codigo_inscripcion) FROM tinscripcion WHERE fecha_desactivacion IS NULL),CURDATE(),(SELECT MAX(codigo_ano_academico) FROM tano_academico WHERE fecha_desactivacion IS NULL),''V30484143'','''','''',''50'',''160'',''1249834983H'',CURDATE());', '2016-01-17 19:49:47'),
(1211, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,fecha_ingreso,codigo_cargo,codigo_dependencia,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V17946809'',''MILAGROS'',''HENRIQUEZ'',''F'',STR_TO_DATE(''19/06/1992'',''%d/%m/%Y''),''1'',''CASERIO MARATAN'','''',''04161258603'','''',''N'',''Y'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);', '2016-01-17 20:01:31'),
(1212, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_madre=''V17946809'' WHERE cedula_estudiante=''V30484143'';', '2016-01-17 20:01:31'),
(1213, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET certificado_sextogrado=''Y'',notascertificadas=''Y'',cartabuenaconducta=''Y'',fotoestudiante=''N'',fotorepresentante=''Y'',fotocopia_ciestudiante=''Y'',fotocopia_cirepresentante=''N'',fotocopia_pnestudiante=''N'',kitscomedor=''N'',becado=''N'',tipobeca=''N'' WHERE cedula_estudiante = ''V30484143''', '2016-01-17 20:02:01'),
(1214, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tpersona SET cedula=''V17946809'',nombres=''MILAGROS'',apellidos=''HENRIQUEZ'',genero=''F'',fecha_nacimiento=STR_TO_DATE(''19/06/1992'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''CASERIO MARATAN'',telefono_habitacion='''',telefono_movil=''04161258603'',email='''',esestudiante=''N'',esrepresentante=''Y'' WHERE cedula='''';', '2016-01-17 20:17:11'),
(1215, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_docente=''V121212121'',cedula_representante=''V17946809'',codigo_parentesco=''3'',lugar_trabajo=''1'',proceso_completado=''Y''WHERE cedula_estudiante=''V30484143'';', '2016-01-17 20:17:11'),
(1216, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V121212121', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V121212121'')', '2016-01-17 20:18:37'),
(1217, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-17 20:18:57'),
(1218, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tperfil set descripcion=''DOCENTE'' where (codigo_perfil=''2'');', '2016-01-17 20:19:57'),
(1219, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''2'');', '2016-01-17 20:19:58'),
(1220, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-17 20:19:58'),
(1221, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',''2'')', '2016-01-17 20:19:58'),
(1222, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',''5'')', '2016-01-17 20:19:58'),
(1223, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',''7'')', '2016-01-17 20:19:58'),
(1224, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-17 20:19:58'),
(1225, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-17 20:19:58'),
(1226, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-17 20:19:58'),
(1227, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-17 20:19:58'),
(1228, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-17 20:19:58'),
(1229, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-17 20:19:58'),
(1230, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',''2'')', '2016-01-17 20:19:59'),
(1231, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-17 20:19:59'),
(1232, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',''2'')', '2016-01-17 20:19:59'),
(1233, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-17 20:19:59'),
(1234, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-17 20:19:59'),
(1235, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-17 20:19:59'),
(1236, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-17 20:19:59'),
(1237, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-17 20:19:59'),
(1238, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-17 20:19:59'),
(1239, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-17 20:19:59'),
(1240, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-17 20:19:59'),
(1241, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-17 20:19:59'),
(1242, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-17 20:19:59'),
(1243, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-17 20:19:59'),
(1244, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-17 20:19:59'),
(1245, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-17 20:20:00'),
(1246, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-17 20:20:00'),
(1247, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-17 20:20:00'),
(1248, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-17 20:20:00'),
(1249, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-17 20:20:00'),
(1250, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-17 20:20:00'),
(1251, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-17 20:20:00'),
(1252, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-17 20:20:00'),
(1253, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-17 20:20:00'),
(1254, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-17 20:20:00'),
(1255, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-17 20:20:00'),
(1256, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-17 20:20:00'),
(1257, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-17 20:20:00'),
(1258, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-17 20:20:01'),
(1259, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-17 20:20:01'),
(1260, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-17 20:20:01'),
(1261, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-17 20:20:01'),
(1262, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-17 20:20:01'),
(1263, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-17 20:20:01'),
(1264, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-17 20:20:01'),
(1265, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-17 20:20:01'),
(1266, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-17 20:20:01'),
(1267, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-17 20:20:01'),
(1268, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-17 20:20:01'),
(1269, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-17 20:20:02'),
(1270, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-17 20:20:02'),
(1271, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-17 20:20:02'),
(1272, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-17 20:20:02'),
(1273, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-17 20:20:02'),
(1274, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-17 20:20:02'),
(1275, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-17 20:20:02'),
(1276, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-17 20:20:02'),
(1277, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-17 20:20:02'),
(1278, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-17 20:20:02'),
(1279, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-17 20:20:02'),
(1280, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-17 20:20:02'),
(1281, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tperfil set descripcion=''DOCENTE'' where (codigo_perfil=''2'');', '2016-01-17 20:20:02'),
(1282, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''2'');', '2016-01-17 20:20:02'),
(1283, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-17 20:20:03'),
(1284, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',''2'')', '2016-01-17 20:20:03'),
(1285, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',''5'')', '2016-01-17 20:20:03'),
(1286, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',''7'')', '2016-01-17 20:20:03'),
(1287, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-17 20:20:03'),
(1288, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-17 20:20:03'),
(1289, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-17 20:20:03'),
(1290, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-17 20:20:03'),
(1291, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-17 20:20:03'),
(1292, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-17 20:20:03'),
(1293, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',''2'')', '2016-01-17 20:20:03'),
(1294, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-17 20:20:03'),
(1295, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',''2'')', '2016-01-17 20:20:04'),
(1296, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-17 20:20:04'),
(1297, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-17 20:20:04'),
(1298, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-17 20:20:04'),
(1299, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-17 20:20:04'),
(1300, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-17 20:20:04'),
(1301, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-17 20:20:04'),
(1302, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-17 20:20:04'),
(1303, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-17 20:20:04'),
(1304, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-17 20:20:04'),
(1305, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-17 20:20:04'),
(1306, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-17 20:20:04'),
(1307, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-17 20:20:05'),
(1308, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-17 20:20:05'),
(1309, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-17 20:20:05'),
(1310, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-17 20:20:05'),
(1311, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-17 20:20:05'),
(1312, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-17 20:20:05'),
(1313, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-17 20:20:05'),
(1314, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-17 20:20:05'),
(1315, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-17 20:20:05'),
(1316, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-17 20:20:05'),
(1317, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-17 20:20:05'),
(1318, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-17 20:20:05'),
(1319, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-17 20:20:05'),
(1320, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-17 20:20:05'),
(1321, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-17 20:20:06'),
(1322, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-17 20:20:06'),
(1323, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-17 20:20:06'),
(1324, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-17 20:20:06'),
(1325, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-17 20:20:06'),
(1326, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-17 20:20:06'),
(1327, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-17 20:20:06'),
(1328, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-17 20:20:06'),
(1329, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-17 20:20:06'),
(1330, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-17 20:20:06'),
(1331, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-17 20:20:06'),
(1332, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-17 20:20:07'),
(1333, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-17 20:20:07'),
(1334, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-17 20:20:07'),
(1335, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-17 20:20:07'),
(1336, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-17 20:20:07'),
(1337, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-17 20:20:07'),
(1338, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-17 20:20:07'),
(1339, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-17 20:20:07'),
(1340, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-17 20:20:07'),
(1341, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-17 20:20:07'),
(1342, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-17 20:20:07'),
(1343, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-17 20:20:07'),
(1344, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V121212121', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V121212121'')', '2016-01-17 20:20:20'),
(1345, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V121212121', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V121212121'')', '2016-01-17 20:49:56'),
(1346, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V121212121', 'DELETE FROM tcontrol_notas WHERE codigo_msd=1 AND cedula_estudiante=''V252132343'' AND codigo_lapso=2;', '2016-01-17 20:54:19'),
(1347, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V121212121', 'INSERT INTO tcontrol_notas (codigo_msd,cedula_estudiante,codigo_lapso,notafinal) VALUES (1,''V252132343'',2,1);', '2016-01-17 20:54:19'),
(1348, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V121212121', 'DELETE FROM tcontrol_notas WHERE codigo_msd=1 AND cedula_estudiante=''V252132343'' AND codigo_lapso=2;', '2016-01-17 20:56:10'),
(1349, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V121212121', 'INSERT INTO tcontrol_notas (codigo_msd,cedula_estudiante,codigo_lapso,notafinal) VALUES (1,''V252132343'',2,0);', '2016-01-17 20:56:11'),
(1350, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V121212121', 'DELETE FROM tcontrol_notas WHERE codigo_msd=1 AND cedula_estudiante=''V252132343'' AND codigo_lapso=2;', '2016-01-17 20:56:50'),
(1351, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V121212121', 'INSERT INTO tcontrol_notas (codigo_msd,cedula_estudiante,codigo_lapso,notafinal) VALUES (1,''V252132343'',2,12);', '2016-01-17 20:56:50'),
(1352, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-17 21:01:24'),
(1353, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,fecha_ingreso,codigo_cargo,codigo_dependencia,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V30363014'',''MARIA ALEJANDRA'',''CASTRO BALZA'',''F'',STR_TO_DATE(''28/01/1999'',''%d/%m/%Y''),''1'',''ACARIGUA'',''02554564532'','''',''mariab@hotmail.com'',''Y'',''N'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);', '2016-01-17 21:06:28'),
(1354, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tproceso_inscripcion (codigo_inscripcion,fecha_inscripcion,codigo_ano_academico,cedula_estudiante,cedula_escolar,codigo_canaima,peso,estatura,codigo_plantel,primerafi) VALUES ((SELECT MAX(codigo_inscripcion) FROM tinscripcion WHERE fecha_desactivacion IS NULL),CURDATE(),(SELECT MAX(codigo_ano_academico) FROM tano_academico WHERE fecha_desactivacion IS NULL),''V30363014'','''','''',''50'',''158'',''12345645343'',CURDATE());', '2016-01-17 21:06:28'),
(1355, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,fecha_ingreso,codigo_cargo,codigo_dependencia,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V16292131'',''SARAHY'',''BALZA'',''F'',STR_TO_DATE(''09/01/1988'',''%d/%m/%Y''),''1'',''ACARIGUA'',''02552132134'',''04261996982'',''baslza@hotmail.com'',''N'',''Y'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);', '2016-01-17 21:09:32'),
(1356, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_madre=''V16292131'' WHERE cedula_estudiante=''V30363014'';', '2016-01-17 21:09:32'),
(1357, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,fecha_ingreso,codigo_cargo,codigo_dependencia,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V115678456'',''MANUEL'',''CASTRO'',''M'',STR_TO_DATE(''20/04/1984'',''%d/%m/%Y''),''1'',''PAEZ'','''','''','''',''N'',''Y'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);', '2016-01-17 21:09:32'),
(1358, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_padre=''V115678456'' WHERE cedula_estudiante=''V30363014'';', '2016-01-17 21:09:32'),
(1359, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET certificado_sextogrado=''N'',notascertificadas=''N'',cartabuenaconducta=''Y'',fotoestudiante=''Y'',fotorepresentante=''Y'',fotocopia_ciestudiante=''N'',fotocopia_cirepresentante=''N'',fotocopia_pnestudiante=''Y'',kitscomedor=''N'',becado=''N'',tipobeca=''N'' WHERE cedula_estudiante = ''V30363014''', '2016-01-17 21:09:42'),
(1361, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tpersona SET cedula=''V115678456'',nombres=''MANUEL'',apellidos=''CASTRO'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''20/04/1984'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''PAEZ'',telefono_habitacion='''',telefono_movil='''',email='''',esestudiante=''N'',esrepresentante=''Y'' WHERE cedula='''';', '2016-01-17 21:11:20');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(1362, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_docente=''V121212121'',cedula_representante=''V115678456'',codigo_parentesco=''2'',lugar_trabajo=''1'',proceso_completado=''Y''WHERE cedula_estudiante=''V30363014'';', '2016-01-17 21:11:20'),
(1363, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'UPDATE tpersona SET cedula=''V115678456'',nombres=''MANUEL'',apellidos=''CASTRO'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''20/04/1984'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''PAEZ'',telefono_habitacion='''',telefono_movil='''',email='''',esestudiante=''N'',esrepresentante=''Y'' WHERE cedula='''';', '2016-01-17 21:48:22'),
(1364, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'UPDATE tproceso_inscripcion SET cedula_docente=''V121212121'',cedula_representante=''V115678456'',codigo_parentesco=''2'',lugar_trabajo=''1'',proceso_completado=''Y''WHERE cedula_estudiante=''V30363014'';', '2016-01-17 21:48:22'),
(1365, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-17 21:48:38'),
(1366, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tpersona SET cedula=''V115678456'',nombres=''MANUEL'',apellidos=''CASTRO'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''20/04/1984'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''PAEZ'',telefono_habitacion='''',telefono_movil='''',email='''',esestudiante=''N'',esrepresentante=''Y'' WHERE cedula='''';', '2016-01-17 21:49:01'),
(1367, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_docente=''V121212121'',cedula_representante=''V115678456'',codigo_parentesco=''2'',lugar_trabajo=''1'',proceso_completado=''Y''WHERE cedula_estudiante=''V30363014'';', '2016-01-17 21:49:01'),
(1368, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''ARGENTINA'');', '2016-01-17 23:59:26'),
(1369, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''CHILE'');', '2016-01-17 23:59:35'),
(1370, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''CHINA'');', '2016-01-17 23:59:39'),
(1371, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''PERU'');', '2016-01-18 00:00:05'),
(1372, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''BOLIVIA'');', '2016-01-18 00:00:13'),
(1373, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''PORTUGAL'');', '2016-01-18 00:00:19'),
(1374, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''BRASIL'');', '2016-01-18 00:01:53'),
(1375, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''ALEMANIA'');', '2016-01-18 00:04:07'),
(1376, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''COSTA RICA'');', '2016-01-18 00:04:13'),
(1377, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''AUSTRIA'');', '2016-01-18 00:04:33'),
(1378, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''PUERTO RICO'');', '2016-01-18 00:04:38'),
(1379, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''CROACIA'');', '2016-01-18 00:04:50'),
(1380, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''GUATEMALA'');', '2016-01-18 00:04:56'),
(1381, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''ESPAÑA'');', '2016-01-18 00:05:32'),
(1382, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''JAMAICA'');', '2016-01-18 00:05:37'),
(1383, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''SUDAFRICA'');', '2016-01-18 00:05:52'),
(1384, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''JAPON'');', '2016-01-18 00:05:56'),
(1385, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''GRECIA'');', '2016-01-18 00:06:11'),
(1386, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''MEXICO'');', '2016-01-18 00:06:55'),
(1387, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''PANAMA'');', '2016-01-18 00:06:59'),
(1388, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''DINAMARCA'');', '2016-01-18 00:07:03'),
(1389, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''CANADA'');', '2016-01-18 00:07:10'),
(1390, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''AUSTRALIA'');', '2016-01-18 00:07:14'),
(1391, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''BELJICA'');', '2016-01-18 00:07:28'),
(1392, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''BELGICA'');', '2016-01-18 00:07:38'),
(1393, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''ITALIA'');', '2016-01-18 00:07:43'),
(1394, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''PARAGUAI'');', '2016-01-18 00:07:57'),
(1395, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''URUGUAY'');', '2016-01-18 00:08:07'),
(1396, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''SUIZA'');', '2016-01-18 00:08:18'),
(1397, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''ANZOATEGUI'',''1'');', '2016-01-18 00:10:25'),
(1398, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''APURE'',''1'');', '2016-01-18 00:10:33'),
(1399, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''ARAGUA'',''1'');', '2016-01-18 00:10:42'),
(1400, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''BOLIVAR'',''1'');', '2016-01-18 00:10:54'),
(1401, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''CARABOBO'',''1'');', '2016-01-18 00:11:03'),
(1402, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''COJEDES'',''1'');', '2016-01-18 00:11:14'),
(1403, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''DELTAMACURO'',''1'');', '2016-01-18 00:11:26'),
(1404, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''MERIDA'',''1'');', '2016-01-18 00:11:35'),
(1405, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''DISTRITO CAPITAL'',''1'');', '2016-01-18 00:11:46'),
(1406, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''FALCON'',''1'');', '2016-01-18 00:12:47'),
(1407, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''GUARICO'',''1'');', '2016-01-18 00:13:02'),
(1408, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''MIRANDA'',''1'');', '2016-01-18 00:13:14'),
(1409, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''MONAGAS'',''1'');', '2016-01-18 00:13:22'),
(1410, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''NUEVA ESPARTA'',''5'');', '2016-01-18 00:13:36'),
(1411, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''NUEVA ESPARTA'',''1'');', '2016-01-18 00:14:28'),
(1412, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''TACHIRA'',''1'');', '2016-01-18 00:14:42'),
(1413, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''TRUJILLO'',''1'');', '2016-01-18 00:15:03'),
(1414, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''VARGAS'',''1'');', '2016-01-18 00:17:27'),
(1415, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''YARACUI'',''1'');', '2016-01-18 00:17:43'),
(1416, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update testado set descripcion=''YARACUY'',codigo_pais=''1'' where (codigo_estado=''22'');', '2016-01-18 00:18:12'),
(1417, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''ZULIA'',''1'');', '2016-01-18 00:18:29'),
(1418, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update testado set fecha_desactivacion=CURDATE() where (codigo_estado=''17'');', '2016-01-18 00:19:16'),
(1419, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update testado set descripcion=''BARINAS'',codigo_pais=''1'' where (codigo_estado=''17'');', '2016-01-18 00:20:36'),
(1420, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update testado set fecha_desactivacion=NULL where (codigo_estado=''17'');', '2016-01-18 00:20:49'),
(1421, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tcargo (descripcion) values (''BIBLIOTECARIO'');', '2016-01-18 00:31:38'),
(1422, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tcargo (descripcion) values (''OBRERO'');', '2016-01-18 00:31:44'),
(1423, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAN RAFAEL DE ONOTO'',''1'');', '2016-01-18 00:33:21'),
(1424, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ESTELLER'',''1'');', '2016-01-18 00:33:51'),
(1425, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SANTA ROSALIA'',''1'');', '2016-01-18 00:36:07'),
(1426, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PIRITU'',''1'');', '2016-01-18 00:36:36'),
(1427, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''TUREN'',''1'');', '2016-01-18 00:38:16'),
(1428, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ARAURE'',''1'');', '2016-01-18 00:38:40'),
(1429, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SUCRE'',''1'');', '2016-01-18 00:40:01'),
(1430, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''GUANARE'',''1'');', '2016-01-18 00:43:11'),
(1431, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''GUANARITO'',''1'');', '2016-01-18 00:44:05'),
(1432, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MONSEÑOR JOSE VICENTE DE UNDA'',''1'');', '2016-01-18 00:44:33'),
(1433, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''OSPINO'',''1'');', '2016-01-18 00:44:41'),
(1434, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PAPALON'',''1'');', '2016-01-18 00:44:52'),
(1435, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''EL PLAYON'',''1'');', '2016-01-18 00:45:29'),
(1436, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmunicipio set descripcion=''PAPELON'',codigo_estado=''1'' where (codigo_municipio=''14'');', '2016-01-18 00:46:04'),
(1437, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAN GENARO DE BOCONOITO'',''1'');', '2016-01-18 00:46:26'),
(1438, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''PAYARA'',''1'');', '2016-01-18 00:57:29'),
(1439, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''PIMPINELA'',''1'');', '2016-01-18 00:57:52'),
(1440, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''RAMON PERAZA'',''1'');', '2016-01-18 01:06:37'),
(1441, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-18 01:55:19'),
(1442, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update testado set descripcion=''DELTA MACURO'',codigo_pais=''1'' where (codigo_estado=''10'');', '2016-01-18 02:16:21'),
(1443, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''AGUA BLANCA'',''2'');', '2016-01-18 02:17:11'),
(1444, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''ARAURE'',''8'');', '2016-01-18 02:17:26'),
(1445, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''RIO ACARIGUA'',''8'');', '2016-01-18 02:17:59'),
(1446, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''PIRITU'',''4'');', '2016-01-18 02:18:27'),
(1447, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''UVERAL'',''4'');', '2016-01-18 02:18:52'),
(1448, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''CORDOVA'',''10'');', '2016-01-18 02:19:14'),
(1449, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''GUANARE'',''10'');', '2016-01-18 02:19:21'),
(1450, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''SAN JOSE DE LA MONTAÑA'',''10'');', '2016-01-18 02:19:40'),
(1451, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''SAN JUAN DE GUANAGUANARE'',''10'');', '2016-01-18 02:20:07'),
(1452, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''VIRGEN DE COROMOTO'',''10'');', '2016-01-18 02:20:20'),
(1453, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''GUANARITO'',''11'');', '2016-01-18 02:21:05'),
(1454, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''TRINIDAD DE LA CAPILLA'',''11'');', '2016-01-18 02:21:18'),
(1455, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''DIVINA PASTORA'',''11'');', '2016-01-18 02:22:51'),
(1456, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''PEÑA BLANCA'',''12'');', '2016-01-18 02:23:02'),
(1457, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''APARICION'',''13'');', '2016-01-18 02:23:23'),
(1458, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''LA ESTACION'',''13'');', '2016-01-18 02:23:31'),
(1459, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''OSPINO'',''13'');', '2016-01-18 02:23:37'),
(1460, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''CAÑO DELGADITO'',''14'');', '2016-01-18 02:24:05'),
(1461, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''PAPELON'',''14'');', '2016-01-18 02:24:15'),
(1462, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''BOCONOITO'',''16'');', '2016-01-18 02:25:01'),
(1463, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''ANTOLIN TOVAR ANQUINO'',''16'');', '2016-01-18 02:25:33'),
(1464, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''SANTA FE'',''3'');', '2016-01-18 02:25:46'),
(1465, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''SAN RAFAEL DE ONOTO'',''3'');', '2016-01-18 02:26:00'),
(1466, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''THERMO MORALES'',''3'');', '2016-01-18 02:26:19'),
(1467, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''FLORIDA'',''5'');', '2016-01-18 02:26:33'),
(1468, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''EL PLAYON'',''5'');', '2016-01-18 02:26:53'),
(1469, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''BISCUCUY'',''9'');', '2016-01-18 02:27:07'),
(1470, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''CONCEPCION'',''9'');', '2016-01-18 02:30:35'),
(1471, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''SAN JOSE DE SAGUAZ'',''9'');', '2016-01-18 02:31:04'),
(1472, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''SAN RAFAEL DE PALO ALZADO'',''9'');', '2016-01-18 02:31:44'),
(1473, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''UVENCIO ANTONIO VELASQUEZ'',''9'');', '2016-01-18 02:32:10'),
(1474, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''VILLA ROSA'',''9'');', '2016-01-18 02:34:01'),
(1475, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''VILLA BRUZUAL'',''7'');', '2016-01-18 02:34:17'),
(1476, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''CANELONES'',''6'');', '2016-01-18 02:34:31'),
(1477, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tparroquia set descripcion=''CANELONES'',codigo_municipio=''7'' where (codigo_parroquia=''38'');', '2016-01-18 02:34:39'),
(1478, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''SANTA CRUZ'',''7'');', '2016-01-18 02:35:09'),
(1479, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''SAN ISIDRO LABRADOR'',''7'');', '2016-01-18 02:35:33'),
(1480, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ALTO ORINOCO'',''3'');', '2016-01-18 02:42:06'),
(1481, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ATABAPO'',''3'');', '2016-01-18 02:42:34'),
(1482, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ATURES'',''3'');', '2016-01-18 02:42:45'),
(1483, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''AUTANA'',''3'');', '2016-01-18 02:42:55'),
(1484, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MANATIARES'',''3'');', '2016-01-18 02:43:15'),
(1485, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MAROA'',''3'');', '2016-01-18 02:43:26'),
(1486, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''RIO NEGRO'',''3'');', '2016-01-18 02:43:34'),
(1487, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ANACO'',''4'');', '2016-01-18 02:45:51'),
(1488, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ARAGUA'',''4'');', '2016-01-18 02:46:05'),
(1489, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BOLIVAR'',''4'');', '2016-01-18 02:46:13'),
(1490, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BRUZUAL'',''4'');', '2016-01-18 02:47:48'),
(1491, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CAJIGAL'',''4'');', '2016-01-18 02:47:56'),
(1492, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CARVAJAL'',''4'');', '2016-01-18 02:48:13'),
(1493, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''DIEGO BAUTISTA URBANEJA'',''4'');', '2016-01-18 02:48:35'),
(1494, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''FREITES'',''4'');', '2016-01-18 02:48:49'),
(1495, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''GUANIPA'',''4'');', '2016-01-18 02:48:59'),
(1496, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''GUANTA'',''4'');', '2016-01-18 02:50:08'),
(1497, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''INDEPENDENCIA'',''4'');', '2016-01-18 02:50:21'),
(1498, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LIBERTAD'',''4'');', '2016-01-18 02:50:28'),
(1499, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MCGREGOR'',''4'');', '2016-01-18 02:51:01'),
(1500, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MIRANDA'',''4'');', '2016-01-18 02:51:13'),
(1501, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MONAGAS'',''4'');', '2016-01-18 02:51:22'),
(1502, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PEÑALVER'',''4'');', '2016-01-18 02:52:32'),
(1503, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PIRITU'',''4'');', '2016-01-18 02:52:40'),
(1504, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAN JUAN DE CAPISTRANO'',''4'');', '2016-01-18 02:52:53'),
(1505, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SANTA ANA'',''4'');', '2016-01-18 02:52:59'),
(1506, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SIMON RODRIGUEZ'',''4'');', '2016-01-18 02:53:10'),
(1507, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SOTILLO'',''4'');', '2016-01-18 02:53:24'),
(1508, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ACHAGUAS'',''5'');', '2016-01-18 02:55:51'),
(1509, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BIRUACA'',''5'');', '2016-01-18 02:56:12'),
(1510, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MUÑOZ'',''5'');', '2016-01-18 02:56:26'),
(1511, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PEDRO CAMEJO'',''5'');', '2016-01-18 02:56:42'),
(1512, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ROMULO GALLEGOS'',''5'');', '2016-01-18 02:56:58'),
(1513, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAN FERNANDO'',''5'');', '2016-01-18 02:57:24'),
(1514, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PAEZ'',''5'');', '2016-01-18 02:57:55'),
(1515, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BOLIVAR'',''6'');', '2016-01-18 02:58:07'),
(1516, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CAMATAGUA'',''6'');', '2016-01-18 02:58:34'),
(1517, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''FRANCISCO LINARES ALCANTARA'',''6'');', '2016-01-18 02:59:25'),
(1518, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''GIRARDOT'',''6'');', '2016-01-18 03:00:13'),
(1519, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JOSE ANGEL LAMAS'',''6'');', '2016-01-18 03:00:27'),
(1520, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JOSE FELIX RIBAS'',''6'');', '2016-01-18 03:00:49'),
(1521, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JOSE RAFAEL REVENGA'',''6'');', '2016-01-18 03:01:04'),
(1522, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LIBERTADOR'',''6'');', '2016-01-18 03:01:51'),
(1523, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MARIO BRICEÑO IRAGORRY'',''6'');', '2016-01-18 03:02:13'),
(1524, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''OCUMARE DE LA COSTA DE ORO'',''6'');', '2016-01-18 03:02:33'),
(1525, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAN CASIMIRO'',''6'');', '2016-01-18 03:02:48'),
(1526, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAN SEBASTIAN'',''6'');', '2016-01-18 03:03:15'),
(1527, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SANTIAGO MARIÑO'',''6'');', '2016-01-18 03:03:39'),
(1528, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SANTOS MICHELENA'',''6'');', '2016-01-18 03:03:52'),
(1529, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SUCRE'',''6'');', '2016-01-18 03:04:00'),
(1530, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''TOVAR'',''6'');', '2016-01-18 03:04:06'),
(1531, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''URDANETA'',''6'');', '2016-01-18 03:04:17'),
(1532, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ZAMORA'',''6'');', '2016-01-18 03:04:27'),
(1533, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ALBERTO ARVELO TORREALBA'',''17'');', '2016-01-18 03:05:32'),
(1534, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ANDRES ELOI BLANCO'',''17'');', '2016-01-18 03:05:49'),
(1535, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmunicipio set descripcion=''ANDRES ELOY BLANCO'',codigo_estado=''17'' where (codigo_municipio=''71'');', '2016-01-18 03:06:09'),
(1536, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ANTONIO JOSE DE SUCRE'',''17'');', '2016-01-18 03:06:42'),
(1537, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ARISMENDI'',''17'');', '2016-01-18 03:07:00'),
(1538, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BARINAS'',''17'');', '2016-01-18 03:07:09'),
(1539, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BOLIVAR'',''17'');', '2016-01-18 03:07:19'),
(1540, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CRUZ PAREDES'',''17'');', '2016-01-18 03:07:34'),
(1541, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''EZEQUIEL ZAMORA'',''17'');', '2016-01-18 03:08:03'),
(1542, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''OBISPOS'',''17'');', '2016-01-18 03:08:20'),
(1543, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PEDRAZA'',''17'');', '2016-01-18 03:10:02'),
(1544, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ROJAS'',''17'');', '2016-01-18 03:10:11'),
(1545, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SOSA'',''17'');', '2016-01-18 03:10:24'),
(1546, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CARONI'',''7'');', '2016-01-18 03:10:45'),
(1547, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CEDEÑO'',''7'');', '2016-01-18 03:11:31'),
(1548, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''EL CALLAO'',''17'');', '2016-01-18 03:11:41'),
(1549, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''GRAN SABANA'',''7'');', '2016-01-18 03:12:00'),
(1550, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''HERES'',''7'');', '2016-01-18 03:12:10'),
(1551, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PIAR'',''7'');', '2016-01-18 03:12:31'),
(1552, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''RAUL LEON'',''7'');', '2016-01-18 03:12:43'),
(1553, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ROSCIO'',''7'');', '2016-01-18 03:12:57'),
(1554, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SIFONTES'',''7'');', '2016-01-18 03:13:54'),
(1555, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SUCRE'',''7'');', '2016-01-18 03:14:04'),
(1556, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PADRE PEDRO CHEN'',''7'');', '2016-01-18 03:14:18'),
(1557, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BEJUMA'',''8'');', '2016-01-18 03:16:15'),
(1558, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CARLOS ARVELO'',''8'');', '2016-01-18 03:16:33'),
(1559, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''DIEGO IBARRA'',''8'');', '2016-01-18 03:17:42'),
(1560, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''GUACARA'',''8'');', '2016-01-18 03:17:53'),
(1561, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JUAN JOSE MORA'',''8'');', '2016-01-18 03:18:05'),
(1562, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LIBERTADOR'',''8'');', '2016-01-18 03:18:18'),
(1563, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LOS GUAYOS'',''8'');', '2016-01-18 03:18:38'),
(1564, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MIRANDA'',''8'');', '2016-01-18 03:18:51'),
(1565, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MONTALBAN'',''8'');', '2016-01-18 03:19:02'),
(1566, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''NAGUANAGUA'',''8'');', '2016-01-18 03:19:12'),
(1567, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PUERTO CABELLO'',''8'');', '2016-01-18 03:19:23'),
(1568, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAN DIEGO'',''8'');', '2016-01-18 03:20:59'),
(1569, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAN JOAQUIN'',''8'');', '2016-01-18 03:21:17'),
(1570, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''VALENCIA'',''8'');', '2016-01-18 03:21:25'),
(1571, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ANZOATEGUI'',''9'');', '2016-01-18 03:21:52'),
(1572, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''FALCON'',''9'');', '2016-01-18 03:22:01'),
(1573, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''GIRARDOT'',''9'');', '2016-01-18 03:22:21'),
(1574, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LIMA BLANCO'',''9'');', '2016-01-18 03:22:32'),
(1575, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PAO DE SAN JUAN BAUTISTA'',''9'');', '2016-01-18 03:22:49'),
(1576, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''RICAURTE'',''9'');', '2016-01-18 03:23:00'),
(1577, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ROMULO'',''9'');', '2016-01-18 03:23:14'),
(1578, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ANTONIO DIAZ'',''10'');', '2016-01-18 03:23:37'),
(1579, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CASACOIMA'',''10'');', '2016-01-18 03:23:52'),
(1580, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PEDERNALES'',''10'');', '2016-01-18 03:24:03'),
(1581, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''TUCUPITA'',''10'');', '2016-01-18 03:24:14'),
(1582, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ACOSTA'',''13'');', '2016-01-18 03:26:09'),
(1583, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BOLIVAR'',''13'');', '2016-01-18 03:26:28'),
(1584, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BUCHIVACOA'',''13'');', '2016-01-18 03:27:18'),
(1585, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CACIQUE MANAURE'',''13'');', '2016-01-18 03:27:35'),
(1586, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CARIRUBANA'',''13'');', '2016-01-18 03:28:14'),
(1587, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''COLINA'',''13'');', '2016-01-18 03:31:12'),
(1588, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''DABAJURO'',''13'');', '2016-01-18 03:31:25'),
(1589, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''DEMOCRACIA'',''13'');', '2016-01-18 03:31:33'),
(1590, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''FALCON'',''13'');', '2016-01-18 03:31:51'),
(1591, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''FEDERACION'',''13'');', '2016-01-18 03:32:14'),
(1592, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JACURA'',''13'');', '2016-01-18 03:32:30'),
(1593, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LOS TAQUES'',''13'');', '2016-01-18 03:34:13'),
(1594, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MAUROA'',''13'');', '2016-01-18 03:34:34'),
(1595, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MIRANDA'',''13'');', '2016-01-18 03:34:45'),
(1596, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MONSEÑOR ITURRIZA'',''13'');', '2016-01-18 03:35:11'),
(1597, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PALMASOLA'',''13'');', '2016-01-18 03:35:33'),
(1598, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PETIT'',''13'');', '2016-01-18 03:35:59'),
(1599, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PIRITU'',''13'');', '2016-01-18 03:36:08'),
(1600, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAN FRANCISCO'',''13'');', '2016-01-18 03:36:22'),
(1601, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SILVA'',''13'');', '2016-01-18 03:36:29'),
(1602, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SUCRE'',''13'');', '2016-01-18 03:36:35'),
(1603, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''TOCOPERO'',''13'');', '2016-01-18 03:36:54'),
(1604, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''UNION'',''13'');', '2016-01-18 03:37:03'),
(1605, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''URUMACO'',''13'');', '2016-01-18 03:37:13'),
(1606, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ZAMORA'',''13'');', '2016-01-18 03:37:27'),
(1607, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ESTERIOS DE CAMAGUAN'',''14'');', '2016-01-18 04:18:02'),
(1608, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CHAGUARAMOS'',''14'');', '2016-01-18 04:18:10'),
(1609, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''EL SOCORRO'',''14'');', '2016-01-18 04:18:31'),
(1610, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''FRANCISCO DE MIRANDA'',''14'');', '2016-01-18 04:18:48'),
(1611, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JOSE FELIX RIBAS'',''14'');', '2016-01-18 04:19:08'),
(1612, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JOSE TADEO MONAGAS'',''14'');', '2016-01-18 04:19:24'),
(1613, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JUAN GERMAN ROSCIO'',''14'');', '2016-01-18 04:19:50'),
(1614, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JULIAN MELLADO'',''14'');', '2016-01-18 04:20:04'),
(1615, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LAS MERCEDES'',''14'');', '2016-01-18 04:20:12'),
(1616, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LEONARDO INFANTE'',''14'');', '2016-01-18 04:20:25'),
(1617, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PEDRO ZARAZA'',''14'');', '2016-01-18 04:20:40'),
(1618, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ORTIZ'',''14'');', '2016-01-18 04:20:48'),
(1619, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAN GERONIMO DE GUAYABAL'',''14'');', '2016-01-18 04:21:06'),
(1620, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAN JOSE DE GUARIBA'',''14'');', '2016-01-18 04:21:18'),
(1621, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SANTA MARIA DE IPIRE'',''14'');', '2016-01-18 04:21:36'),
(1622, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ANDRES ELOY BLANCO'',''2'');', '2016-01-18 04:21:56'),
(1623, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CRESPO'',''2'');', '2016-01-18 04:22:03'),
(1624, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''IRIBARREN'',''2'');', '2016-01-18 04:22:48'),
(1625, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JIMENEZ'',''2'');', '2016-01-18 04:23:06'),
(1626, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MORAN'',''2'');', '2016-01-18 04:23:15'),
(1627, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PALAVECINO'',''2'');', '2016-01-18 04:23:32'),
(1628, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SIMON PLANAS'',''2'');', '2016-01-18 04:23:43'),
(1629, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''TORRES'',''2'');', '2016-01-18 04:23:54');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(1630, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''URDANETA'',''2'');', '2016-01-18 04:24:02'),
(1631, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ALBERTO ADRIANI'',''11'');', '2016-01-18 04:24:44'),
(1632, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ANDRES BELLO'',''11'');', '2016-01-18 04:24:58'),
(1633, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ANTONIO PINTO SALINAS'',''11'');', '2016-01-18 04:25:12'),
(1634, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ARICAGUA'',''11'');', '2016-01-18 04:25:21'),
(1635, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ARZOBISPO CHACON'',''11'');', '2016-01-18 04:25:49'),
(1636, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CAMPO ELIAS'',''11'');', '2016-01-18 04:26:01'),
(1637, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CARACCIOLO PARRA OLMEDO'',''11'');', '2016-01-18 04:26:57'),
(1638, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CARDENAL QUITERO'',''11'');', '2016-01-18 04:27:07'),
(1639, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''GUARAQUE'',''11'');', '2016-01-18 04:27:23'),
(1640, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JULIO CESAR SALAS'',''11'');', '2016-01-18 04:27:31'),
(1641, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JUSTO BRICEÑO'',''11'');', '2016-01-18 04:28:39'),
(1642, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LIBERTADOR'',''11'');', '2016-01-18 04:28:47'),
(1643, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MIRANDA'',''11'');', '2016-01-18 04:29:03'),
(1644, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''OBISPO RAMOS DE LARA'',''11'');', '2016-01-18 04:29:19'),
(1645, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PADRE NOGUERA'',''11'');', '2016-01-18 04:29:37'),
(1646, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PUEBLO LLANO'',''11'');', '2016-01-18 04:29:45'),
(1647, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''RANGEL'',''11'');', '2016-01-18 04:29:56'),
(1648, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''RIBAS DAVILA'',''11'');', '2016-01-18 04:30:15'),
(1649, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SANTOS MARTINA'',''11'');', '2016-01-18 04:30:26'),
(1650, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SUCRE'',''11'');', '2016-01-18 04:30:39'),
(1651, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''TOVAR'',''11'');', '2016-01-18 04:30:49'),
(1652, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''TULIO FEBRES CORDERO'',''11'');', '2016-01-18 04:31:08'),
(1653, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ZEA'',''11'');', '2016-01-18 04:31:19'),
(1654, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ASEVEDO'',''15'');', '2016-01-18 04:32:24'),
(1655, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ANDRES BELLO'',''15'');', '2016-01-18 04:32:30'),
(1656, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BARUTA'',''15'');', '2016-01-18 04:32:40'),
(1657, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BRION'',''15'');', '2016-01-18 04:32:46'),
(1658, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BUROZ'',''15'');', '2016-01-18 04:33:10'),
(1659, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CARIZAL'',''15'');', '2016-01-18 04:33:17'),
(1660, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CHACAO'',''15'');', '2016-01-18 04:33:23'),
(1661, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CRISTOBAL ROJAS'',''15'');', '2016-01-18 04:33:35'),
(1662, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''EL ATILLO'',''15'');', '2016-01-18 04:33:46'),
(1663, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''GUAICAIPURO'',''15'');', '2016-01-18 04:34:07'),
(1664, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''INDEPENDENCIA'',''15'');', '2016-01-18 04:34:15'),
(1665, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LANDER'',''15'');', '2016-01-18 04:34:26'),
(1666, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LOS SALIAS'',''15'');', '2016-01-18 04:34:45'),
(1667, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PAEZ'',''15'');', '2016-01-18 04:34:52'),
(1668, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PAZ CASTILLO'',''15'');', '2016-01-18 04:35:01'),
(1669, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PEDRO GUAL'',''15'');', '2016-01-18 04:35:15'),
(1670, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PLAZA'',''15'');', '2016-01-18 04:37:19'),
(1671, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SIMON BOLIVAR'',''15'');', '2016-01-18 04:37:33'),
(1672, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SOCRE'',''15'');', '2016-01-18 04:37:43'),
(1673, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''URDANETA'',''15'');', '2016-01-18 04:37:50'),
(1674, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ZAMORA'',''15'');', '2016-01-18 04:38:10'),
(1675, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ACOSTA'',''16'');', '2016-01-18 04:38:56'),
(1676, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''AGUASAY'',''16'');', '2016-01-18 04:39:21'),
(1677, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BOLIVAR'',''16'');', '2016-01-18 04:39:52'),
(1678, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CARIPEL'',''16'');', '2016-01-18 04:40:02'),
(1679, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CEDEÑO'',''16'');', '2016-01-18 04:40:12'),
(1680, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''EZEQUIEL ZAMORA'',''16'');', '2016-01-18 04:40:20'),
(1681, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LIBERTADOR'',''16'');', '2016-01-18 04:40:30'),
(1682, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MATURIN'',''16'');', '2016-01-18 04:40:38'),
(1683, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PIAR'',''16'');', '2016-01-18 04:41:08'),
(1684, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PUNCERES'',''16'');', '2016-01-18 04:41:24'),
(1685, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SANTA BARBARA'',''16'');', '2016-01-18 04:41:34'),
(1686, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SOTILLO'',''16'');', '2016-01-18 04:41:47'),
(1687, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''URACOA'',''16'');', '2016-01-18 04:42:03'),
(1688, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ANTOLIN DEL CAMPO'',''18'');', '2016-01-18 04:42:34'),
(1689, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ARISMENDI'',''18'');', '2016-01-18 04:42:49'),
(1690, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''DIAZ'',''18'');', '2016-01-18 04:43:58'),
(1691, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''GRACIAS'',''18'');', '2016-01-18 04:44:09'),
(1692, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''GOMEZ'',''18'');', '2016-01-18 04:44:15'),
(1693, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MANEIRO'',''18'');', '2016-01-18 04:44:25'),
(1694, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MARCANO'',''18'');', '2016-01-18 04:44:31'),
(1695, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MARIÑO'',''18'');', '2016-01-18 04:44:37'),
(1696, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PENINSULA DE MACANAO'',''18'');', '2016-01-18 04:44:52'),
(1697, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''TUBORES'',''18'');', '2016-01-18 04:45:08'),
(1698, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''VILLAIBA'',''18'');', '2016-01-18 04:45:59'),
(1699, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmunicipio set fecha_desactivacion=CURDATE() where (codigo_municipio=''6'');', '2016-01-18 04:51:05'),
(1700, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmunicipio set fecha_desactivacion=CURDATE() where (codigo_municipio=''15'');', '2016-01-18 04:52:14'),
(1701, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmunicipio set fecha_desactivacion=NULL where (codigo_municipio=''6'');', '2016-01-18 04:53:08'),
(1702, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''SUCRE'',''1'');', '2016-01-18 04:54:56'),
(1703, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmunicipio set descripcion=''ANDRES ELOY BLANCO'',codigo_estado=''24'' where (codigo_municipio=''6'');', '2016-01-18 04:55:40'),
(1704, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmunicipio set descripcion=''ANDRES MATA'',codigo_estado=''24'' where (codigo_municipio=''4'');', '2016-01-18 04:56:31'),
(1705, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ARISMENDI'',''24'');', '2016-01-18 04:57:28'),
(1706, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BENITEZ'',''24'');', '2016-01-18 04:57:52'),
(1707, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BERMUDEZ'',''24'');', '2016-01-18 04:58:26'),
(1708, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BOLIVAR'',''24'');', '2016-01-18 04:58:34'),
(1709, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CAJIGAL'',''24'');', '2016-01-18 04:58:50'),
(1710, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CRUZ SALMERON ACOSTA'',''24'');', '2016-01-18 04:59:05'),
(1711, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LIBERTADOR'',''24'');', '2016-01-18 04:59:15'),
(1712, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MARIÑO'',''24'');', '2016-01-18 04:59:22'),
(1713, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MEJIA'',''24'');', '2016-01-18 04:59:34'),
(1714, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MONTES'',''24'');', '2016-01-18 04:59:44'),
(1715, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''RIBERO'',''24'');', '2016-01-18 04:59:57'),
(1716, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SUCRE'',''24'');', '2016-01-18 05:00:07'),
(1717, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''VALDEZ'',''24'');', '2016-01-18 05:00:17'),
(1718, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ANDRES BELLO'',''19'');', '2016-01-18 05:00:36'),
(1719, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ANTONIO ROMULO COSTA'',''19'');', '2016-01-18 05:00:51'),
(1720, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''AYACUCHO'',''19'');', '2016-01-18 05:01:05'),
(1721, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BOLIVAR'',''19'');', '2016-01-18 05:01:12'),
(1722, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CARDENAS'',''19'');', '2016-01-18 05:01:28'),
(1723, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CORDOVA'',''19'');', '2016-01-18 05:01:35'),
(1724, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''FERNANDEZ FEO'',''19'');', '2016-01-18 05:01:50'),
(1725, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''FRANCISCO DE MIRANDA'',''19'');', '2016-01-18 05:01:58'),
(1726, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''GARCIA DE HEVIA'',''19'');', '2016-01-18 05:02:10'),
(1727, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''GUASIMOS'',''19'');', '2016-01-18 05:02:21'),
(1728, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''INDEPENDENCIA'',''19'');', '2016-01-18 05:02:28'),
(1729, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JAUREGUI'',''19'');', '2016-01-18 05:02:41'),
(1730, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JOSE MARIA VARGAS'',''19'');', '2016-01-18 05:02:53'),
(1731, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JUNIN'',''19'');', '2016-01-18 05:03:02'),
(1732, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LIBERTAD'',''19'');', '2016-01-18 05:03:10'),
(1733, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LIBERTADOR'',''19'');', '2016-01-18 05:03:19'),
(1734, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LOBATERA'',''19'');', '2016-01-18 05:04:01'),
(1735, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MICHELENA'',''19'');', '2016-01-18 05:04:17'),
(1736, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PANAMERICANO'',''19'');', '2016-01-18 05:04:34'),
(1737, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PEDRO MARIA UREÑA'',''19'');', '2016-01-18 05:04:50'),
(1738, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAMUEL DARIO MALDONADO'',''19'');', '2016-01-18 05:05:10'),
(1739, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAN CRISTOBAL'',''19'');', '2016-01-18 05:05:22'),
(1740, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SEBORUCO'',''19'');', '2016-01-18 05:05:32'),
(1741, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SIMON RODRIGUEZ'',''19'');', '2016-01-18 05:05:44'),
(1742, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SUCRE'',''19'');', '2016-01-18 05:05:54'),
(1743, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''TORBES'',''19'');', '2016-01-18 05:06:12'),
(1744, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''URIBANTE'',''19'');', '2016-01-18 05:06:41'),
(1745, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAN JUDAS TADEO'',''19'');', '2016-01-18 05:06:55'),
(1746, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''RAFAEL URDANETA'',''19'');', '2016-01-18 05:08:20'),
(1747, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ANDRES BELLO'',''20'');', '2016-01-18 05:08:52'),
(1748, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BOCONO'',''20'');', '2016-01-18 05:09:03'),
(1749, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BOLIVAR'',''20'');', '2016-01-18 05:09:10'),
(1750, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CANDELARIA'',''20'');', '2016-01-18 05:09:20'),
(1751, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CARACHE'',''20'');', '2016-01-18 05:09:34'),
(1752, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ESCUQUE'',''20'');', '2016-01-18 05:09:59'),
(1753, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JOSE FELIPE MARQUEZ CAÑIZALEZ'',''20'');', '2016-01-18 05:10:46'),
(1754, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JUAN VICENTE CAMPOS ELIAS'',''20'');', '2016-01-18 05:11:06'),
(1755, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LA CEIBA'',''20'');', '2016-01-18 05:11:24'),
(1756, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MIRANDA'',''20'');', '2016-01-18 05:11:31'),
(1757, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MONTE CARMELO'',''20'');', '2016-01-18 05:11:46'),
(1758, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MOTATAN'',''20'');', '2016-01-18 05:12:04'),
(1759, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PAMPAN'',''20'');', '2016-01-18 05:12:18'),
(1760, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PAMPANITO'',''20'');', '2016-01-18 05:12:27'),
(1761, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''RAFAEL RANGEL'',''20'');', '2016-01-18 05:12:40'),
(1762, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAN RAFAEL DE CARVAJAL'',''20'');', '2016-01-18 05:13:01'),
(1763, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SUCRE'',''20'');', '2016-01-18 05:13:13'),
(1764, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''TRUJILLO'',''20'');', '2016-01-18 05:13:22'),
(1765, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''URDANETA'',''20'');', '2016-01-18 05:13:33'),
(1766, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''VALERA'',''20'');', '2016-01-18 05:13:46'),
(1767, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''VARGAS'',''21'');', '2016-01-18 05:14:17'),
(1768, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ARISTIDES BASTIDAS'',''21'');', '2016-01-18 05:14:42'),
(1769, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BOLIVAR'',''21'');', '2016-01-18 05:14:49'),
(1770, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BRUZUAL'',''21'');', '2016-01-18 05:15:04'),
(1771, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''COCOROTE'',''21'');', '2016-01-18 05:15:19'),
(1772, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''INDEPENDENCIA'',''21'');', '2016-01-18 05:15:25'),
(1773, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JOSE ANTONIO PAEZ'',''21'');', '2016-01-18 05:15:43'),
(1774, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LA TRINIDAD'',''21'');', '2016-01-18 05:15:53'),
(1775, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MANUEL MONGE'',''21'');', '2016-01-18 05:16:24'),
(1776, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''NIRGUA'',''21'');', '2016-01-18 05:16:37'),
(1777, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PEÑA'',''21'');', '2016-01-18 05:16:46'),
(1778, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAN FELIPE'',''21'');', '2016-01-18 05:16:56'),
(1779, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SUCRE'',''21'');', '2016-01-18 05:17:08'),
(1780, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''VEROES'',''21'');', '2016-01-18 05:17:20'),
(1781, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ALMIRANTE PADILLA'',''23'');', '2016-01-18 05:17:46'),
(1782, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''BARALT'',''23'');', '2016-01-18 05:18:14'),
(1783, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CABIMAS'',''23'');', '2016-01-18 05:18:26'),
(1784, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''CATATUMBO'',''23'');', '2016-01-18 05:18:36'),
(1785, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''COLON'',''23'');', '2016-01-18 05:18:46'),
(1786, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''FRANCISCO JAVIER PULGAR'',''23'');', '2016-01-18 05:19:02'),
(1787, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JESUS ENRIQUE LOSADA'',''23'');', '2016-01-18 05:19:33'),
(1788, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''JUSUS MARIA SEMPRUN'',''23'');', '2016-01-18 05:20:09'),
(1789, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LA CAÑADA DE URDANETA'',''23'');', '2016-01-18 05:20:21'),
(1790, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''LAGUNILLAS'',''23'');', '2016-01-18 05:20:30'),
(1791, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MACHIQUES DE PARIJA'',''23'');', '2016-01-18 05:20:43'),
(1792, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MARA'',''23'');', '2016-01-18 05:21:02'),
(1793, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MARACAIBO'',''23'');', '2016-01-18 05:21:17'),
(1794, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''MIRANDA'',''23'');', '2016-01-18 05:21:31'),
(1795, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''PAEZ'',''23'');', '2016-01-18 05:21:37'),
(1796, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ROSARIO DE PERIJA'',''23'');', '2016-01-18 05:22:26'),
(1797, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SAN FRANCISCO'',''23'');', '2016-01-18 05:22:37'),
(1798, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SANTA RITA'',''23'');', '2016-01-18 05:22:45'),
(1799, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SIMON BOLIVAR'',''23'');', '2016-01-18 05:22:53'),
(1800, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''SUCRE'',''23'');', '2016-01-18 05:22:59'),
(1801, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''VALMORE RODRIGUEZ'',''23'');', '2016-01-18 05:23:16'),
(1802, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-18 15:55:44'),
(1803, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-18 16:27:04'),
(1804, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-18 20:53:32'),
(1805, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V121212121'')', '2016-01-18 21:33:47'),
(1806, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V121212121'')', '2016-01-18 21:34:10'),
(1807, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2016-01-18 21:34:22'),
(1808, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-18 21:34:36'),
(1809, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-18 23:00:33'),
(1810, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set codigo_materia=''CAST002'',descripcion=''CASTELLANO Y LITERATURA'',unidad_curricular=''5'',grado_escolar=''1'' where (codigo_materia=''CAST002'');', '2016-01-18 23:02:02'),
(1811, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set codigo_materia=''CAST001'',descripcion=''CASTELLANO Y LITERATURA'',unidad_curricular=''5'',grado_escolar=''2'' where (codigo_materia=''CAST001'');', '2016-01-18 23:02:40'),
(1812, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''CAST003'',''CASTELLANO Y LITERATURA'',''4'',''3'');', '2016-01-18 23:03:23'),
(1813, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''CAST004'',''CASTELLANO Y LITERATURA'',''3'',''4'');', '2016-01-18 23:03:42'),
(1814, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''CAST005'',''CASTELLANO Y LITERATURA'',''2'',''5'');', '2016-01-18 23:03:59'),
(1815, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set codigo_materia=''CAST001'',descripcion=''CASTELLANO Y LITERATURA'',unidad_curricular=''5'',grado_escolar=''1'' where (codigo_materia=''CAST001'');', '2016-01-18 23:04:19'),
(1816, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set codigo_materia=''CAST002'',descripcion=''CASTELLANO Y LITERATURA'',unidad_curricular=''5'',grado_escolar=''2'' where (codigo_materia=''CAST002'');', '2016-01-18 23:04:30'),
(1817, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set codigo_materia=''INGL001'',descripcion=''INGLES'',unidad_curricular=''4'',grado_escolar=''1'' where (codigo_materia=''1'');', '2016-01-18 23:05:08'),
(1818, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''INGL002'',''INGLES'',''3'',''2'');', '2016-01-18 23:05:42'),
(1819, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''INGL003'',''INGLES'',''3'',''3'');', '2016-01-18 23:06:03'),
(1820, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''INGL004'',''INGLES'',''3'',''4'');', '2016-01-18 23:06:27'),
(1821, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''INGL005'',''INGLES'',''3'',''5'');', '2016-01-18 23:06:40'),
(1822, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set codigo_materia=''MAT001'',descripcion=''MATEMATICA'',unidad_curricular=''4'',grado_escolar=''1'' where (codigo_materia=''2'');', '2016-01-18 23:07:46'),
(1823, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''MAT002'',''MATEMATICA'',''4'',''2'');', '2016-01-18 23:08:02'),
(1824, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''MAT003'',''MATEMATICA'',''3'',''3'');', '2016-01-18 23:08:24'),
(1825, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''MAT004'',''MATEMATICA'',''4'',''4'');', '2016-01-18 23:08:42'),
(1826, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''MAT005'',''MATEMATICA'',''4'',''5'');', '2016-01-18 23:08:53'),
(1827, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''ESTN001'',''ESTUDIO DE LA NATURALEZA'',''6'',''1'');', '2016-01-18 23:10:23'),
(1828, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''BIO001'',''CIENCIAS BIOLOGICAS'',''6'',''2'');', '2016-01-18 23:11:53'),
(1829, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''BIO002'',''CIENCIAS BIOLOGICAS'',''6'',''3'');', '2016-01-18 23:14:42'),
(1830, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''BIO003'',''CIENCIAS BIOLOGICAS'',''6'',''4'');', '2016-01-18 23:14:59'),
(1831, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''BIO004'',''CIENCIAS BIOLOGICAS'',''6'',''5'');', '2016-01-18 23:15:11'),
(1832, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''HISV001'',''HISTORIA DE VENEZUELA'',''3'',''1'');', '2016-01-18 23:16:50'),
(1833, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''EDUCS001'',''EDUCACION PARA LA SALUD'',''2'',''2'');', '2016-01-18 23:17:51'),
(1834, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''QUIM001'',''QUIMICA'',''7'',''3'');', '2016-01-18 23:18:14'),
(1835, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''QUIM002'',''QUIMICA'',''6'',''4'');', '2016-01-18 23:18:38'),
(1836, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''QUIM003'',''QUIMICA'',''6'',''5'');', '2016-01-18 23:18:53'),
(1837, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''EDUCF001'',''EDUCACION FAMILIAR Y CIUDADANA'',''2'',''1'');', '2016-01-18 23:19:36'),
(1838, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''HISV002'',''HISTORIA DE VENEZUELA'',''2'',''2'');', '2016-01-18 23:20:00'),
(1839, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''FIS001'',''FISICA'',''8'',''3'');', '2016-01-18 23:20:18'),
(1840, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''FIS002'',''FISICA'',''6'',''4'');', '2016-01-18 23:20:31'),
(1841, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''FIS003'',''FISICA'',''6'',''5'');', '2016-01-18 23:20:47'),
(1842, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''GEOG001'',''GEOGRAFIA GENERAL'',''3'',''1'');', '2016-01-18 23:21:34'),
(1843, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''HISU001'',''HISTORIA UNIVERSAL'',''4'',''2'');', '2016-01-18 23:22:03'),
(1844, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''GEOV001'',''GEOGRAFIA DE VENEZUELA'',''4'',''3'');', '2016-01-18 23:22:35'),
(1845, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''HISTC001'',''HISTORIA CONTEMPORANEA'',''4'',''4'');', '2016-01-18 23:23:18'),
(1846, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''GEOE001'',''GEOGRAFIA ECONOMICA'',''3'',''5'');', '2016-01-18 23:25:05'),
(1847, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set seccion=''PRIME'',descripcion=''A'',turno=''M'',grado_escolar=''1'', capacidad_min=''10'',capacidad_max=''30'' where (seccion=''PRIME'');', '2016-01-18 23:28:59'),
(1848, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set seccion=''SECC'',descripcion=''PRIMERO A'',turno=''M'',grado_escolar=''1'', capacidad_min=''10'',capacidad_max=''30'' where (seccion=''SECC'');', '2016-01-18 23:29:31'),
(1849, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set fecha_desactivacion=CURDATE() where (seccion=''1'');', '2016-01-18 23:29:43'),
(1850, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set fecha_desactivacion=CURDATE() where (seccion=''2'');', '2016-01-18 23:29:57'),
(1851, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tseccion (seccion,descripcion,turno,grado_escolar,capacidad_min,capacidad_max) values (''SECC'',''PRIMERO B'',''M'',''1'',''10'',''40'');', '2016-01-18 23:30:26'),
(1852, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-19 01:36:08'),
(1853, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set codigo_materia=''EDUCF001'',descripcion=''EDUCACION FAMILIAR Y CIUDADANA'',unidad_curricular=''2'',grado_escolar=''1'' where (codigo_materia=''EDUCF00'');', '2016-01-19 01:49:47'),
(1854, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''EDART001'',''EDUCACION ARTISTICA'',''2'',''1'');', '2016-01-19 01:50:48'),
(1855, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''EDUFIS001'',''EDUCACION FISICA'',''4'',''1'');', '2016-01-19 01:51:21'),
(1856, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''NBOF001'',''NOCIONES BASICAS DE OFICINA'',''3'',''1'');', '2016-01-19 01:55:22'),
(1857, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''AGRIC001'',''AGRICULTURA'',''3'',''1'');', '2016-01-19 01:55:45'),
(1858, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''EPT001'',''EDUCACION PARA EL TRABAJO'',''6'',''1'');', '2016-01-19 01:56:12'),
(1859, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set codigo_materia=''EDUCS001'',descripcion=''EDUCACION PARA LA SALUD'',unidad_curricular=''2'',grado_escolar=''2'' where (codigo_materia=''EDUCS00'');', '2016-01-19 01:58:37'),
(1860, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set codigo_materia=''EDART001'',descripcion=''EDUCACION ARTISTICA'',unidad_curricular=''2'',grado_escolar=''1'' where (codigo_materia=''EDART00'');', '2016-01-19 01:59:37'),
(1861, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set codigo_materia=''EDART001'',descripcion=''EDUCACION ARTISTICA'',unidad_curricular=''2'',grado_escolar=''1'' where (codigo_materia=''EDART00'');', '2016-01-19 02:00:21'),
(1862, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set codigo_materia=''EDART001'',descripcion=''EDUCACION ARTISTICAA'',unidad_curricular=''2'',grado_escolar=''1'' where (codigo_materia=''EDART00'');', '2016-01-19 02:01:10'),
(1863, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set fecha_desactivacion=CURDATE() where (codigo_materia=''EDART00'');', '2016-01-19 02:01:37'),
(1864, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set fecha_desactivacion=NULL where (codigo_materia=''EDART00'');', '2016-01-19 02:02:22'),
(1865, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set codigo_materia=''EDART00'',descripcion=''EDUCACION ARTISTICA'',unidad_curricular=''2'',grado_escolar=''1'' where (codigo_materia=''EDART00'');', '2016-01-19 02:02:33'),
(1866, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''EDART02'',''EDUCACION ARTISTICA'',''3'',''2'');', '2016-01-19 02:03:44'),
(1867, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''EDUCF02'',''EDUCACION FISICA'',''4'',''2'');', '2016-01-19 02:05:16'),
(1868, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''HORT001'',''HORTICULTURA'',''4'',''2'');', '2016-01-19 02:06:02'),
(1869, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''INF001'',''INFORMATICA'',''4'',''2'');', '2016-01-19 02:06:29'),
(1870, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''EPT002'',''EDUCACION PARA EL TRABAJO'',''8'',''2'');', '2016-01-19 02:06:50'),
(1871, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''HISV003'',''HISTORIA DE VENEZUELA(CAT. BOL)'',''2'',''3'');', '2016-01-19 02:09:31'),
(1872, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set codigo_materia=''EDUFIS01'',descripcion=''EDUCACION FISICA'',unidad_curricular=''4'',grado_escolar=''1'' where (codigo_materia=''EDUFIS0'');', '2016-01-19 02:11:12'),
(1873, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''EDUCF03'',''EDUCACION FISICA'',''4'',''3'');', '2016-01-19 02:12:10'),
(1874, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''INF002'',''INFORMATICA'',''4'',''3'');', '2016-01-19 02:13:08'),
(1875, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''FRUT001'',''FRUTICULTURA'',''4'',''3'');', '2016-01-19 02:13:39'),
(1876, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''EPT003'',''EDUCACION PARA EL TRABAJO'',''8'',''3'');', '2016-01-19 02:14:52');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(1877, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''EDUCF04'',''EDUCACION FISICA'',''2'',''4'');', '2016-01-19 02:16:45'),
(1878, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''DIB001'',''DIBUJO'',''2'',''4'');', '2016-01-19 02:17:53'),
(1879, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''IPM001'',''INSTRUCCION PREMILITAR'',''2'',''4'');', '2016-01-19 02:22:53'),
(1880, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''FIL001'',''FILOSOFIA'',''3'',''4'');', '2016-01-19 02:23:17'),
(1881, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set codigo_materia=''HISTC00'',descripcion=''HISTORIA CONTEMPORANEA DE VENEZUELA'',unidad_curricular=''4'',grado_escolar=''4'' where (codigo_materia=''HISTC00'');', '2016-01-19 02:24:20'),
(1882, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''EDUCF05'',''EDUCACION FISICA'',''2'',''5'');', '2016-01-19 02:26:25'),
(1883, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmateria set codigo_materia=''GEOV02'',descripcion=''GEOGRAFIA DE VENEZUELA'',unidad_curricular=''3'',grado_escolar=''5'' where (codigo_materia=''GEOE001'');', '2016-01-19 02:29:58'),
(1884, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''CST001'',''CIENCIAS DE LA TIERRA'',''5'',''5'');', '2016-01-19 02:32:14'),
(1885, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular,grado_escolar) values (''IPM2'',''INSTRUCCION PREMILITAR'',''2'',''5'');', '2016-01-19 02:32:36'),
(1886, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,espersonalinstitucion,fecha_ingreso,codigo_cargo,codigo_dependencia,codigo_dependencia_anterior,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V5942165'',''ERNESTINA DEL CARMEN'',''ESCALONA'',''F'',STR_TO_DATE(''13/10/1961'',''%d/%m/%Y''),''6'',''ARAURE'',''02554564532'',''04121669007'',''ernerstinau@hotmail.com'',''N'',''N'',''Y'',STR_TO_DATE(''15/11/2002'',''%d/%m/%Y''),3,'''','''','''',''LCDO(A).'',''38'',''1249834983H'');', '2016-01-19 03:15:42'),
(1887, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tplantel (codigo_plantel,nombre,direccion,telefono_habitacion,localidad,codigo_municipio,email) VALUES (''OD00741801'',''LICEO BOLIVARIANO QUEBRADA HONDA'',''CALLE #3 CENTRO POBLADO "B" QUEBRADA HONDA'',''02558084598'','''',''2'',''llbqh@hotmail.com'');', '2016-01-19 03:23:38'),
(1888, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tpersona SET cedula=''V5942165'',nombres=''ERNESTINA DEL CARMEN'',apellidos=''ESCALONA'',genero=''F'',fecha_nacimiento=STR_TO_DATE(''13/10/1961'',''%d/%m/%Y''),lugar_nacimiento=''6'',direccion=''ARAURE'',telefono_habitacion=''02554564532'',telefono_movil=''04121669007'',email=''ernerstinau@hotmail.com'',esestudiante=''N'',esrepresentante=''N'',espersonalinstitucion=''Y'',codigo_cargo=3,fecha_ingreso=STR_TO_DATE(''15/11/2002'',''%d/%m/%Y''),codigo_dependencia='''',codigo_dependencia_anterior='''',condicion_cargo=''F'',nivel_academico=''LCDO(A).'',carga_horaria=''38'',codigo_plantel=''OD00741801'' WHERE cedula=''V5942165'';', '2016-01-19 03:24:27'),
(1889, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,espersonalinstitucion,fecha_ingreso,codigo_cargo,codigo_dependencia,codigo_dependencia_anterior,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V9565053'',''GLADYS TIBISAY'',''SOTO COLMENAREZ'',''F'',STR_TO_DATE(''03/01/1967'',''%d/%m/%Y''),''1'',''ACARIGUA'',''02554565334'',''04167168710'','''',''N'',''N'',''Y'',STR_TO_DATE(''07/03/2007'',''%d/%m/%Y''),2,'''','''',''F'',''LCDO(A).'',''27'',''OD00741801'');', '2016-01-19 03:29:04'),
(1890, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,espersonalinstitucion,fecha_ingreso,codigo_cargo,codigo_dependencia,codigo_dependencia_anterior,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V18843196'',''AMANDA MARIA'',''ZERPA MENDOZA'',''F'',STR_TO_DATE(''06/07/1986'',''%d/%m/%Y''),''5'',''AGUA BLANCA'',''02557485569'',''04261986568'',''amanda.zerpa.7@hotmail.com'',''N'',''N'',''Y'',STR_TO_DATE(''01/04/2009'',''%d/%m/%Y''),2,'''','''',''C'',''T.S.U.'',''20'',''OD00741801'');', '2016-01-19 03:33:46'),
(1891, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,espersonalinstitucion,fecha_ingreso,codigo_cargo,codigo_dependencia,codigo_dependencia_anterior,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V9566566'',''JULIO CESAR'',''YOVERA LEAÑEZ'',''M'',STR_TO_DATE(''23/10/1963'',''%d/%m/%Y''),''27'',''SAN RAFEL DE ONOTO, LAS MAJAGUAS'',''02553485642'',''04161996005'',''julioyovera@hotmail.com'',''N'',''N'',''Y'',STR_TO_DATE(''01/01/2001'',''%d/%m/%Y''),5,'''','''',''F'',''Bachiller'',''40'',''OD00741801'');', '2016-01-19 03:38:48'),
(1892, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,telefono_habitacion,telefono_movil,email,esestudiante,esrepresentante,espersonalinstitucion,fecha_ingreso,codigo_cargo,codigo_dependencia,codigo_dependencia_anterior,condicion_cargo,nivel_academico,carga_horaria,codigo_plantel) VALUES (''V9841246'',''JUAN DE JESUS'',''ARGUALLES CHIRINOS'',''M'',STR_TO_DATE(''05/03/1964'',''%d/%m/%Y''),''5'',''MUNICIPIO AGUA BLANCA'',''02554321987'',''04160595780'',''juanarguelles@hotmail.com'',''N'',''N'',''Y'',STR_TO_DATE(''01/11/2006'',''%d/%m/%Y''),5,'''','''',''F'',''Bachiller'',''40'',''OD00741801'');', '2016-01-19 03:42:36'),
(1893, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-19 14:42:15'),
(1894, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-19 18:12:33'),
(1895, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-19 18:35:27'),
(1896, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-19 19:17:59'),
(1897, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set seccion=''SECCB'',descripcion=''SECCION B'',turno=''T'',grado_escolar=''2'', capacidad_min=''20'',capacidad_max=''35'' where (seccion=''SECCB'');', '2016-01-19 19:19:22'),
(1898, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tmateria_seccion_docente(seccion,codigo_materia,cedula_docente) VALUES (''SECCB'',''CAST002'',''V121212121''),(''SECCB'',''MAT001'',''V13131313'');', '2016-01-19 19:19:22'),
(1899, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set seccion=''SECC'',descripcion=''PRIMERO B'',turno=''M'',grado_escolar=''1'', capacidad_min=''10'',capacidad_max=''40'' where (seccion=''SECC'');', '2016-01-19 19:21:19'),
(1900, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tmateria_seccion_docente WHERE (seccion=''SECC'');', '2016-01-19 19:21:19'),
(1901, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tseccion (seccion,descripcion,turno,grado_escolar,capacidad_min,capacidad_max) values (''SECC2'',''TERCERO A'',''M'',''3'',''10'',''40'');', '2016-01-19 19:22:25'),
(1902, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tmateria_seccion_docente WHERE (seccion=''SECC2'');', '2016-01-19 19:22:25'),
(1903, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set fecha_desactivacion=CURDATE() where (seccion=''SECCB'');', '2016-01-19 19:23:31'),
(1904, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set fecha_desactivacion=NULL where (seccion=''2'');', '2016-01-19 19:24:33'),
(1905, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set seccion=''SECC2'',descripcion=''SEGUNDO A'',turno=''M'',grado_escolar=''1'', capacidad_min=''40'',capacidad_max=''50'' where (seccion=''SECC2'');', '2016-01-19 19:24:52'),
(1906, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set fecha_desactivacion=CURDATE() where (seccion=''2'');', '2016-01-19 19:25:03'),
(1907, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set fecha_desactivacion=NULL where (seccion=''2'');', '2016-01-19 19:25:38'),
(1908, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tseccion (seccion,descripcion,turno,grado_escolar,capacidad_min,capacidad_max) values (''SECC4'',''CUARTO A'',''M'',''4'',''10'',''50'');', '2016-01-19 19:26:59'),
(1909, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tmateria_seccion_docente WHERE (seccion=''SECC4'');', '2016-01-19 19:26:59'),
(1910, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set seccion=''SECC2'',descripcion=''SEGUNDO A'',turno=''M'',grado_escolar=''2'', capacidad_min=''40'',capacidad_max=''50'' where (seccion=''SECC2'');', '2016-01-19 19:27:26'),
(1911, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tmateria_seccion_docente WHERE (seccion=''SECC2'');', '2016-01-19 19:27:26'),
(1912, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set fecha_desactivacion=CURDATE() where (seccion=''2'');', '2016-01-19 19:27:39'),
(1913, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tseccion (seccion,descripcion,turno,grado_escolar,capacidad_min,capacidad_max) values (''SECC3'',''TERCERO A'',''M'',''3'',''10'',''50'');', '2016-01-19 19:28:55'),
(1914, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tmateria_seccion_docente WHERE (seccion=''SECC3'');', '2016-01-19 19:28:55'),
(1915, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tseccion (seccion,descripcion,turno,grado_escolar,capacidad_min,capacidad_max) values (''SECC5'',''QUINTO A'',''M'',''5'',''10'',''50'');', '2016-01-19 19:30:01'),
(1916, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tmateria_seccion_docente WHERE (seccion=''SECC5'');', '2016-01-19 19:30:01'),
(1917, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tservicio (descripcion,url,orden,codigo_modulo) values (''BOLETIN'',''REP_BOLETIN'',''10'',''5'');', '2016-01-19 19:43:54'),
(1918, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tperfil set descripcion=''DOCENTE'' where (codigo_perfil=''2'');', '2016-01-19 19:46:52'),
(1919, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''2'');', '2016-01-19 19:46:53'),
(1920, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-19 19:46:53'),
(1921, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',''2'')', '2016-01-19 19:46:53'),
(1922, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',''5'')', '2016-01-19 19:46:53'),
(1923, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',''7'')', '2016-01-19 19:46:53'),
(1924, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-19 19:46:53'),
(1925, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-19 19:46:53'),
(1926, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-19 19:46:53'),
(1927, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-19 19:46:53'),
(1928, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-19 19:46:53'),
(1929, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''36'',NULL)', '2016-01-19 19:46:53'),
(1930, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''36'',''5'')', '2016-01-19 19:46:53'),
(1931, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-19 19:46:54'),
(1932, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',''2'')', '2016-01-19 19:46:54'),
(1933, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-19 19:46:54'),
(1934, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',''2'')', '2016-01-19 19:46:54'),
(1935, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-19 19:46:54'),
(1936, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-19 19:46:54'),
(1937, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-19 19:46:54'),
(1938, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-19 19:46:54'),
(1939, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-19 19:46:54'),
(1940, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-19 19:46:54'),
(1941, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''36'',NULL)', '2016-01-19 19:46:54'),
(1942, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-19 19:46:54'),
(1943, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-19 19:46:54'),
(1944, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-19 19:46:55'),
(1945, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-19 19:46:55'),
(1946, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-19 19:46:55'),
(1947, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-19 19:46:55'),
(1948, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-19 19:46:55'),
(1949, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-19 19:46:55'),
(1950, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''36'',NULL)', '2016-01-19 19:46:55'),
(1951, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-19 19:46:55'),
(1952, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-19 19:46:55'),
(1953, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-19 19:46:55'),
(1954, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-19 19:46:55'),
(1955, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-19 19:46:56'),
(1956, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-19 19:46:56'),
(1957, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-19 19:46:56'),
(1958, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-19 19:46:56'),
(1959, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''36'',NULL)', '2016-01-19 19:46:56'),
(1960, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-19 19:46:56'),
(1961, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-19 19:46:56'),
(1962, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-19 19:46:56'),
(1963, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-19 19:46:56'),
(1964, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-19 19:46:56'),
(1965, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-19 19:46:56'),
(1966, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-19 19:46:56'),
(1967, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-19 19:46:57'),
(1968, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''36'',NULL)', '2016-01-19 19:46:57'),
(1969, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-19 19:46:57'),
(1970, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-19 19:46:57'),
(1971, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-19 19:46:57'),
(1972, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-19 19:46:57'),
(1973, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-19 19:46:57'),
(1974, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-19 19:46:57'),
(1975, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-19 19:46:57'),
(1976, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-19 19:46:57'),
(1977, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''36'',NULL)', '2016-01-19 19:46:57'),
(1978, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-19 19:46:57'),
(1979, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-19 19:46:58'),
(1980, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''7'',NULL)', '2016-01-19 19:46:58'),
(1981, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''16'',NULL)', '2016-01-19 19:46:58'),
(1982, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''21'',NULL)', '2016-01-19 19:46:58'),
(1983, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''22'',NULL)', '2016-01-19 19:46:58'),
(1984, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''23'',NULL)', '2016-01-19 19:46:58'),
(1985, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''24'',NULL)', '2016-01-19 19:46:58'),
(1986, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''36'',NULL)', '2016-01-19 19:46:58'),
(1987, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''33'',NULL)', '2016-01-19 19:46:58'),
(1988, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''2'',''34'',NULL)', '2016-01-19 19:46:58'),
(1989, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tperfil set descripcion=''ADMINISTRADOR'' where (codigo_perfil=''1'');', '2016-01-19 19:47:51'),
(1990, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''1'');', '2016-01-19 19:47:51'),
(1991, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-19 19:47:51'),
(1992, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''1'')', '2016-01-19 19:47:51'),
(1993, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''2'')', '2016-01-19 19:47:51'),
(1994, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''3'')', '2016-01-19 19:47:52'),
(1995, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''4'')', '2016-01-19 19:47:52'),
(1996, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''5'')', '2016-01-19 19:47:52'),
(1997, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''6'')', '2016-01-19 19:47:52'),
(1998, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''7'')', '2016-01-19 19:47:52'),
(1999, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-19 19:47:52'),
(2000, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''1'')', '2016-01-19 19:47:52'),
(2001, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''2'')', '2016-01-19 19:47:52'),
(2002, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''3'')', '2016-01-19 19:47:52'),
(2003, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''4'')', '2016-01-19 19:47:52'),
(2004, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''5'')', '2016-01-19 19:47:52'),
(2005, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''6'')', '2016-01-19 19:47:52'),
(2006, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''7'')', '2016-01-19 19:47:53'),
(2007, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-19 19:47:53'),
(2008, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''1'')', '2016-01-19 19:47:53'),
(2009, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''2'')', '2016-01-19 19:47:53'),
(2010, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''3'')', '2016-01-19 19:47:53'),
(2011, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''4'')', '2016-01-19 19:47:53'),
(2012, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''5'')', '2016-01-19 19:47:53'),
(2013, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''6'')', '2016-01-19 19:47:53'),
(2014, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''7'')', '2016-01-19 19:47:53'),
(2015, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-19 19:47:53'),
(2016, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''1'')', '2016-01-19 19:47:54'),
(2017, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''2'')', '2016-01-19 19:47:54'),
(2018, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''3'')', '2016-01-19 19:47:54'),
(2019, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''4'')', '2016-01-19 19:47:54'),
(2020, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''5'')', '2016-01-19 19:47:54'),
(2021, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''6'')', '2016-01-19 19:47:54'),
(2022, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''7'')', '2016-01-19 19:47:54'),
(2023, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-19 19:47:54'),
(2024, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''1'')', '2016-01-19 19:47:54'),
(2025, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''2'')', '2016-01-19 19:47:54'),
(2026, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''3'')', '2016-01-19 19:47:55'),
(2027, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''4'')', '2016-01-19 19:47:55'),
(2028, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''5'')', '2016-01-19 19:47:55'),
(2029, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''6'')', '2016-01-19 19:47:55'),
(2030, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''7'')', '2016-01-19 19:47:55'),
(2031, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-19 19:47:55'),
(2032, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''1'')', '2016-01-19 19:47:55'),
(2033, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''2'')', '2016-01-19 19:47:55'),
(2034, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''3'')', '2016-01-19 19:47:55'),
(2035, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''4'')', '2016-01-19 19:47:55'),
(2036, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''5'')', '2016-01-19 19:47:55'),
(2037, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''6'')', '2016-01-19 19:47:55'),
(2038, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''7'')', '2016-01-19 19:47:55'),
(2039, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-19 19:47:56'),
(2040, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''1'')', '2016-01-19 19:47:56'),
(2041, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''2'')', '2016-01-19 19:47:56'),
(2042, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''3'')', '2016-01-19 19:47:56'),
(2043, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''4'')', '2016-01-19 19:47:56'),
(2044, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''5'')', '2016-01-19 19:47:56'),
(2045, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''6'')', '2016-01-19 19:47:56'),
(2046, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''7'')', '2016-01-19 19:47:56'),
(2047, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-19 19:47:56'),
(2048, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''1'')', '2016-01-19 19:47:56'),
(2049, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''2'')', '2016-01-19 19:47:56'),
(2050, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''3'')', '2016-01-19 19:47:57'),
(2051, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''4'')', '2016-01-19 19:47:57'),
(2052, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''5'')', '2016-01-19 19:47:57'),
(2053, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''6'')', '2016-01-19 19:47:57'),
(2054, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''7'')', '2016-01-19 19:47:57'),
(2055, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-19 19:47:57'),
(2056, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''1'')', '2016-01-19 19:47:57'),
(2057, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''2'')', '2016-01-19 19:47:57'),
(2058, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''3'')', '2016-01-19 19:47:57'),
(2059, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''4'')', '2016-01-19 19:47:57'),
(2060, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''5'')', '2016-01-19 19:47:57'),
(2061, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''6'')', '2016-01-19 19:47:57'),
(2062, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''7'')', '2016-01-19 19:47:58'),
(2063, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-19 19:47:58'),
(2064, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''1'')', '2016-01-19 19:47:58'),
(2065, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''2'')', '2016-01-19 19:47:58'),
(2066, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''3'')', '2016-01-19 19:47:58'),
(2067, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''4'')', '2016-01-19 19:47:58'),
(2068, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''5'')', '2016-01-19 19:47:58'),
(2069, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''6'')', '2016-01-19 19:47:58'),
(2070, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''7'')', '2016-01-19 19:47:58'),
(2071, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-19 19:47:58'),
(2072, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''1'')', '2016-01-19 19:47:58'),
(2073, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''2'')', '2016-01-19 19:47:58'),
(2074, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''3'')', '2016-01-19 19:47:59'),
(2075, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''4'')', '2016-01-19 19:47:59'),
(2076, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''5'')', '2016-01-19 19:47:59'),
(2077, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''6'')', '2016-01-19 19:47:59'),
(2078, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''7'')', '2016-01-19 19:47:59'),
(2079, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-19 19:47:59'),
(2080, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''1'')', '2016-01-19 19:47:59'),
(2081, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''2'')', '2016-01-19 19:47:59'),
(2082, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''3'')', '2016-01-19 19:47:59'),
(2083, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''4'')', '2016-01-19 19:47:59'),
(2084, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''5'')', '2016-01-19 19:47:59'),
(2085, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''6'')', '2016-01-19 19:48:00'),
(2086, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''7'')', '2016-01-19 19:48:00'),
(2087, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-19 19:48:00'),
(2088, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''1'')', '2016-01-19 19:48:00'),
(2089, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''2'')', '2016-01-19 19:48:00'),
(2090, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''3'')', '2016-01-19 19:48:00'),
(2091, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''4'')', '2016-01-19 19:48:00'),
(2092, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''5'')', '2016-01-19 19:48:00'),
(2093, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''6'')', '2016-01-19 19:48:00'),
(2094, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''7'')', '2016-01-19 19:48:00'),
(2095, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-19 19:48:00');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(2096, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''1'')', '2016-01-19 19:48:01'),
(2097, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''2'')', '2016-01-19 19:48:01'),
(2098, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''3'')', '2016-01-19 19:48:01'),
(2099, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''4'')', '2016-01-19 19:48:01'),
(2100, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''5'')', '2016-01-19 19:48:01'),
(2101, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''6'')', '2016-01-19 19:48:01'),
(2102, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''7'')', '2016-01-19 19:48:01'),
(2103, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-19 19:48:01'),
(2104, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''1'')', '2016-01-19 19:48:01'),
(2105, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''2'')', '2016-01-19 19:48:02'),
(2106, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''3'')', '2016-01-19 19:48:02'),
(2107, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''4'')', '2016-01-19 19:48:02'),
(2108, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''5'')', '2016-01-19 19:48:02'),
(2109, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''6'')', '2016-01-19 19:48:02'),
(2110, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''7'')', '2016-01-19 19:48:02'),
(2111, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-19 19:48:02'),
(2112, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''1'')', '2016-01-19 19:48:02'),
(2113, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''2'')', '2016-01-19 19:48:02'),
(2114, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''3'')', '2016-01-19 19:48:03'),
(2115, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''4'')', '2016-01-19 19:48:03'),
(2116, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''5'')', '2016-01-19 19:48:03'),
(2117, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''6'')', '2016-01-19 19:48:03'),
(2118, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''7'')', '2016-01-19 19:48:03'),
(2119, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-19 19:48:03'),
(2120, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''1'')', '2016-01-19 19:48:03'),
(2121, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''2'')', '2016-01-19 19:48:03'),
(2122, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''3'')', '2016-01-19 19:48:03'),
(2123, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''4'')', '2016-01-19 19:48:03'),
(2124, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''5'')', '2016-01-19 19:48:03'),
(2125, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''6'')', '2016-01-19 19:48:04'),
(2126, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''7'')', '2016-01-19 19:48:04'),
(2127, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-19 19:48:04'),
(2128, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''1'')', '2016-01-19 19:48:04'),
(2129, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''2'')', '2016-01-19 19:48:04'),
(2130, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''3'')', '2016-01-19 19:48:04'),
(2131, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''4'')', '2016-01-19 19:48:04'),
(2132, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''5'')', '2016-01-19 19:48:04'),
(2133, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''6'')', '2016-01-19 19:48:04'),
(2134, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''7'')', '2016-01-19 19:48:04'),
(2135, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-19 19:48:04'),
(2136, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''1'')', '2016-01-19 19:48:05'),
(2137, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''2'')', '2016-01-19 19:48:05'),
(2138, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''3'')', '2016-01-19 19:48:05'),
(2139, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''4'')', '2016-01-19 19:48:05'),
(2140, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''5'')', '2016-01-19 19:48:05'),
(2141, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''6'')', '2016-01-19 19:48:05'),
(2142, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''7'')', '2016-01-19 19:48:05'),
(2143, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-19 19:48:05'),
(2144, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''1'')', '2016-01-19 19:48:05'),
(2145, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''2'')', '2016-01-19 19:48:05'),
(2146, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''3'')', '2016-01-19 19:48:05'),
(2147, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''4'')', '2016-01-19 19:48:05'),
(2148, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''5'')', '2016-01-19 19:48:06'),
(2149, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''6'')', '2016-01-19 19:48:06'),
(2150, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''7'')', '2016-01-19 19:48:06'),
(2151, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-19 19:48:06'),
(2152, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''1'')', '2016-01-19 19:48:06'),
(2153, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''2'')', '2016-01-19 19:48:06'),
(2154, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''3'')', '2016-01-19 19:48:06'),
(2155, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''4'')', '2016-01-19 19:48:06'),
(2156, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''5'')', '2016-01-19 19:48:06'),
(2157, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''6'')', '2016-01-19 19:48:06'),
(2158, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''7'')', '2016-01-19 19:48:06'),
(2159, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-19 19:48:06'),
(2160, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''1'')', '2016-01-19 19:48:07'),
(2161, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''2'')', '2016-01-19 19:48:07'),
(2162, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''3'')', '2016-01-19 19:48:07'),
(2163, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''4'')', '2016-01-19 19:48:07'),
(2164, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''5'')', '2016-01-19 19:48:07'),
(2165, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''6'')', '2016-01-19 19:48:07'),
(2166, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''7'')', '2016-01-19 19:48:07'),
(2167, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-19 19:48:07'),
(2168, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''1'')', '2016-01-19 19:48:07'),
(2169, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''2'')', '2016-01-19 19:48:07'),
(2170, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''3'')', '2016-01-19 19:48:07'),
(2171, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''4'')', '2016-01-19 19:48:08'),
(2172, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''5'')', '2016-01-19 19:48:08'),
(2173, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''6'')', '2016-01-19 19:48:08'),
(2174, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''7'')', '2016-01-19 19:48:08'),
(2175, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-19 19:48:08'),
(2176, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''1'')', '2016-01-19 19:48:08'),
(2177, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''2'')', '2016-01-19 19:48:08'),
(2178, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''3'')', '2016-01-19 19:48:08'),
(2179, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''4'')', '2016-01-19 19:48:08'),
(2180, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''5'')', '2016-01-19 19:48:08'),
(2181, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''6'')', '2016-01-19 19:48:08'),
(2182, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''7'')', '2016-01-19 19:48:09'),
(2183, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-19 19:48:09'),
(2184, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''1'')', '2016-01-19 19:48:09'),
(2185, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''2'')', '2016-01-19 19:48:09'),
(2186, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''3'')', '2016-01-19 19:48:09'),
(2187, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''4'')', '2016-01-19 19:48:09'),
(2188, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''5'')', '2016-01-19 19:48:09'),
(2189, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''6'')', '2016-01-19 19:48:09'),
(2190, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''7'')', '2016-01-19 19:48:09'),
(2191, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-01-19 19:48:09'),
(2192, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',''5'')', '2016-01-19 19:48:09'),
(2193, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',''7'')', '2016-01-19 19:48:09'),
(2194, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-19 19:48:10'),
(2195, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''1'')', '2016-01-19 19:48:10'),
(2196, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''2'')', '2016-01-19 19:48:10'),
(2197, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''3'')', '2016-01-19 19:48:10'),
(2198, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''4'')', '2016-01-19 19:48:10'),
(2199, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''5'')', '2016-01-19 19:48:10'),
(2200, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''6'')', '2016-01-19 19:48:10'),
(2201, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''7'')', '2016-01-19 19:48:10'),
(2202, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-19 19:48:10'),
(2203, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''1'')', '2016-01-19 19:48:10'),
(2204, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''2'')', '2016-01-19 19:48:10'),
(2205, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''3'')', '2016-01-19 19:48:10'),
(2206, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''4'')', '2016-01-19 19:48:10'),
(2207, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''5'')', '2016-01-19 19:48:11'),
(2208, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''6'')', '2016-01-19 19:48:11'),
(2209, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''7'')', '2016-01-19 19:48:11'),
(2210, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-19 19:48:11'),
(2211, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''1'')', '2016-01-19 19:48:11'),
(2212, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''2'')', '2016-01-19 19:48:11'),
(2213, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''3'')', '2016-01-19 19:48:11'),
(2214, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''4'')', '2016-01-19 19:48:11'),
(2215, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''5'')', '2016-01-19 19:48:11'),
(2216, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''6'')', '2016-01-19 19:48:11'),
(2217, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''7'')', '2016-01-19 19:48:11'),
(2218, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-19 19:48:12'),
(2219, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''1'')', '2016-01-19 19:48:12'),
(2220, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''2'')', '2016-01-19 19:48:12'),
(2221, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''3'')', '2016-01-19 19:48:12'),
(2222, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''4'')', '2016-01-19 19:48:12'),
(2223, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''5'')', '2016-01-19 19:48:12'),
(2224, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''6'')', '2016-01-19 19:48:12'),
(2225, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''7'')', '2016-01-19 19:48:12'),
(2226, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-19 19:48:13'),
(2227, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''1'')', '2016-01-19 19:48:13'),
(2228, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''5'')', '2016-01-19 19:48:13'),
(2229, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''6'')', '2016-01-19 19:48:13'),
(2230, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''7'')', '2016-01-19 19:48:13'),
(2231, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-19 19:48:13'),
(2232, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',''2'')', '2016-01-19 19:48:13'),
(2233, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-19 19:48:13'),
(2234, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',''2'')', '2016-01-19 19:48:13'),
(2235, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-19 19:48:13'),
(2236, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''1'')', '2016-01-19 19:48:13'),
(2237, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''2'')', '2016-01-19 19:48:13'),
(2238, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''3'')', '2016-01-19 19:48:14'),
(2239, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''4'')', '2016-01-19 19:48:14'),
(2240, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''5'')', '2016-01-19 19:48:14'),
(2241, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''6'')', '2016-01-19 19:48:14'),
(2242, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''7'')', '2016-01-19 19:48:14'),
(2243, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-19 19:48:14'),
(2244, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''1'')', '2016-01-19 19:48:14'),
(2245, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''2'')', '2016-01-19 19:48:14'),
(2246, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''3'')', '2016-01-19 19:48:14'),
(2247, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''4'')', '2016-01-19 19:48:14'),
(2248, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''5'')', '2016-01-19 19:48:15'),
(2249, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''6'')', '2016-01-19 19:48:15'),
(2250, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''7'')', '2016-01-19 19:48:15'),
(2251, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-19 19:48:15'),
(2252, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''1'')', '2016-01-19 19:48:15'),
(2253, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''2'')', '2016-01-19 19:48:15'),
(2254, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''3'')', '2016-01-19 19:48:15'),
(2255, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''4'')', '2016-01-19 19:48:15'),
(2256, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''5'')', '2016-01-19 19:48:15'),
(2257, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''6'')', '2016-01-19 19:48:15'),
(2258, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''7'')', '2016-01-19 19:48:15'),
(2259, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-19 19:48:15'),
(2260, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-19 19:48:16'),
(2261, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-19 19:48:16'),
(2262, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-19 19:48:16'),
(2263, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-19 19:48:16'),
(2264, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-19 19:48:16'),
(2265, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-19 19:48:16'),
(2266, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-19 19:48:16'),
(2267, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-19 19:48:16'),
(2268, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-19 19:48:16'),
(2269, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-19 19:48:16'),
(2270, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-19 19:48:16'),
(2271, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-19 19:48:16'),
(2272, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-19 19:48:16'),
(2273, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-19 19:48:16'),
(2274, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-19 19:48:16'),
(2275, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-19 19:48:17'),
(2276, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-19 19:48:17'),
(2277, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-19 19:48:17'),
(2278, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-19 19:48:17'),
(2279, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-19 19:48:17'),
(2280, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-19 19:48:17'),
(2281, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-19 19:48:17'),
(2282, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-19 19:48:17'),
(2283, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-19 19:48:17'),
(2284, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-01-19 19:48:17'),
(2285, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-19 19:48:17'),
(2286, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-19 19:48:18'),
(2287, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-19 19:48:18'),
(2288, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-19 19:48:18'),
(2289, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-19 19:48:18'),
(2290, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-19 19:48:18'),
(2291, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-19 19:48:18'),
(2292, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-19 19:48:18'),
(2293, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-19 19:48:18'),
(2294, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-19 19:48:18'),
(2295, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-19 19:48:18'),
(2296, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-19 19:48:18'),
(2297, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-19 19:48:18'),
(2298, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-19 19:48:19'),
(2299, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-19 19:48:19'),
(2300, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-19 19:48:19'),
(2301, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-19 19:48:19'),
(2302, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-19 19:48:19'),
(2303, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-19 19:48:19'),
(2304, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-19 19:48:19'),
(2305, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-19 19:48:19'),
(2306, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-19 19:48:19'),
(2307, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-19 19:48:19'),
(2308, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-19 19:48:19'),
(2309, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-19 19:48:19'),
(2310, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-19 19:48:19'),
(2311, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-19 19:48:19'),
(2312, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-19 19:48:20'),
(2313, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-19 19:48:20'),
(2314, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-19 19:48:20'),
(2315, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-19 19:48:20'),
(2316, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-19 19:48:20'),
(2317, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-19 19:48:20'),
(2318, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-19 19:48:20'),
(2319, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-19 19:48:20'),
(2320, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-01-19 19:48:20'),
(2321, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-19 19:48:20'),
(2322, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-19 19:48:20'),
(2323, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-19 19:48:20'),
(2324, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-19 19:48:21'),
(2325, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-19 19:48:21'),
(2326, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-19 19:48:21'),
(2327, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-19 19:48:21'),
(2328, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-19 19:48:21'),
(2329, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-19 19:48:21');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(2330, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-19 19:48:21'),
(2331, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-19 19:48:21'),
(2332, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-19 19:48:21'),
(2333, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-19 19:48:21'),
(2334, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-19 19:48:21'),
(2335, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-19 19:48:21'),
(2336, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-19 19:48:22'),
(2337, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-19 19:48:22'),
(2338, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-19 19:48:22'),
(2339, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-19 19:48:22'),
(2340, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-19 19:48:22'),
(2341, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-19 19:48:22'),
(2342, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-19 19:48:22'),
(2343, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-19 19:48:22'),
(2344, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-19 19:48:22'),
(2345, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-19 19:48:22'),
(2346, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-19 19:48:22'),
(2347, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-19 19:48:22'),
(2348, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-19 19:48:23'),
(2349, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-19 19:48:23'),
(2350, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-19 19:48:23'),
(2351, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-19 19:48:23'),
(2352, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-19 19:48:23'),
(2353, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-19 19:48:23'),
(2354, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-19 19:48:23'),
(2355, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-19 19:48:24'),
(2356, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-01-19 19:48:24'),
(2357, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-19 19:48:24'),
(2358, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-19 19:48:24'),
(2359, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-19 19:48:24'),
(2360, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-19 19:48:24'),
(2361, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-19 19:48:25'),
(2362, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-19 19:48:25'),
(2363, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-19 19:48:25'),
(2364, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-19 19:48:25'),
(2365, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-19 19:48:25'),
(2366, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-19 19:48:25'),
(2367, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-19 19:48:25'),
(2368, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-19 19:48:25'),
(2369, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-19 19:48:25'),
(2370, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-19 19:48:25'),
(2371, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-19 19:48:25'),
(2372, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-19 19:48:25'),
(2373, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-19 19:48:26'),
(2374, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-19 19:48:26'),
(2375, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-19 19:48:26'),
(2376, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-19 19:48:26'),
(2377, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-19 19:48:26'),
(2378, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-19 19:48:26'),
(2379, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-19 19:48:26'),
(2380, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-19 19:48:26'),
(2381, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-19 19:48:26'),
(2382, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-19 19:48:26'),
(2383, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-19 19:48:26'),
(2384, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-19 19:48:26'),
(2385, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-19 19:48:26'),
(2386, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-19 19:48:27'),
(2387, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-19 19:48:27'),
(2388, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-19 19:48:27'),
(2389, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-19 19:48:27'),
(2390, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-19 19:48:27'),
(2391, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-19 19:48:27'),
(2392, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-01-19 19:48:27'),
(2393, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-19 19:48:27'),
(2394, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-19 19:48:27'),
(2395, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-19 19:48:27'),
(2396, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-19 19:48:27'),
(2397, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-19 19:48:27'),
(2398, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-19 19:48:28'),
(2399, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-19 19:48:28'),
(2400, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-19 19:48:28'),
(2401, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-19 19:48:28'),
(2402, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-19 19:48:28'),
(2403, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-19 19:48:28'),
(2404, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-19 19:48:28'),
(2405, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-19 19:48:28'),
(2406, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-19 19:48:28'),
(2407, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-19 19:48:28'),
(2408, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-19 19:48:29'),
(2409, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-19 19:48:29'),
(2410, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-19 19:48:29'),
(2411, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-19 19:48:29'),
(2412, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-19 19:48:29'),
(2413, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-19 19:48:29'),
(2414, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-19 19:48:29'),
(2415, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-19 19:48:29'),
(2416, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-19 19:48:29'),
(2417, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-19 19:48:29'),
(2418, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-19 19:48:29'),
(2419, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-19 19:48:29'),
(2420, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-19 19:48:29'),
(2421, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-19 19:48:30'),
(2422, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-19 19:48:30'),
(2423, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-19 19:48:30'),
(2424, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-19 19:48:30'),
(2425, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-19 19:48:30'),
(2426, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-19 19:48:30'),
(2427, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-19 19:48:30'),
(2428, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-01-19 19:48:30'),
(2429, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-19 19:48:30'),
(2430, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-19 19:48:30'),
(2431, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-19 19:48:30'),
(2432, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-19 19:48:30'),
(2433, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-19 19:48:31'),
(2434, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-19 19:48:31'),
(2435, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-19 19:48:31'),
(2436, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-19 19:48:31'),
(2437, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-19 19:48:31'),
(2438, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-19 19:48:31'),
(2439, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-19 19:48:31'),
(2440, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-19 19:48:31'),
(2441, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-19 19:48:31'),
(2442, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-19 19:48:31'),
(2443, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-19 19:48:31'),
(2444, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-19 19:48:32'),
(2445, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-19 19:48:32'),
(2446, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-19 19:48:32'),
(2447, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-19 19:48:32'),
(2448, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-19 19:48:32'),
(2449, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-19 19:48:32'),
(2450, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-19 19:48:32'),
(2451, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-19 19:48:32'),
(2452, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-19 19:48:32'),
(2453, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-19 19:48:32'),
(2454, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-19 19:48:32'),
(2455, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-19 19:48:32'),
(2456, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-19 19:48:33'),
(2457, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-19 19:48:33'),
(2458, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-19 19:48:33'),
(2459, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-19 19:48:33'),
(2460, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-19 19:48:33'),
(2461, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-19 19:48:33'),
(2462, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-19 19:48:33'),
(2463, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-19 19:48:33'),
(2464, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-01-19 19:48:33'),
(2465, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-19 19:48:33'),
(2466, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-19 19:48:34'),
(2467, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-19 19:48:34'),
(2468, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-19 19:48:34'),
(2469, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-19 19:48:34'),
(2470, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-19 19:48:34'),
(2471, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-19 19:48:34'),
(2472, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-19 19:48:34'),
(2473, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-19 19:48:35'),
(2474, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-19 19:48:35'),
(2475, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tperfil set descripcion=''ADMINISTRADOR'' where (codigo_perfil=''1'');', '2016-01-19 19:48:35'),
(2476, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''1'');', '2016-01-19 19:48:35'),
(2477, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-19 19:48:35'),
(2478, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''1'')', '2016-01-19 19:48:35'),
(2479, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''2'')', '2016-01-19 19:48:35'),
(2480, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''3'')', '2016-01-19 19:48:35'),
(2481, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''4'')', '2016-01-19 19:48:35'),
(2482, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''5'')', '2016-01-19 19:48:35'),
(2483, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''6'')', '2016-01-19 19:48:35'),
(2484, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''7'')', '2016-01-19 19:48:36'),
(2485, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-19 19:48:36'),
(2486, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''1'')', '2016-01-19 19:48:36'),
(2487, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''2'')', '2016-01-19 19:48:36'),
(2488, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''3'')', '2016-01-19 19:48:36'),
(2489, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''4'')', '2016-01-19 19:48:36'),
(2490, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''5'')', '2016-01-19 19:48:36'),
(2491, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''6'')', '2016-01-19 19:48:36'),
(2492, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''7'')', '2016-01-19 19:48:36'),
(2493, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-19 19:48:36'),
(2494, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''1'')', '2016-01-19 19:48:36'),
(2495, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''2'')', '2016-01-19 19:48:36'),
(2496, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''3'')', '2016-01-19 19:48:37'),
(2497, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''4'')', '2016-01-19 19:48:37'),
(2498, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''5'')', '2016-01-19 19:48:37'),
(2499, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''6'')', '2016-01-19 19:48:37'),
(2500, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''7'')', '2016-01-19 19:48:37'),
(2501, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-19 19:48:37'),
(2502, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''1'')', '2016-01-19 19:48:37'),
(2503, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''2'')', '2016-01-19 19:48:37'),
(2504, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''3'')', '2016-01-19 19:48:37'),
(2505, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''4'')', '2016-01-19 19:48:37'),
(2506, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''5'')', '2016-01-19 19:48:37'),
(2507, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''6'')', '2016-01-19 19:48:38'),
(2508, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''7'')', '2016-01-19 19:48:38'),
(2509, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-19 19:48:38'),
(2510, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''1'')', '2016-01-19 19:48:38'),
(2511, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''2'')', '2016-01-19 19:48:38'),
(2512, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''3'')', '2016-01-19 19:48:38'),
(2513, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''4'')', '2016-01-19 19:48:38'),
(2514, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''5'')', '2016-01-19 19:48:38'),
(2515, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''6'')', '2016-01-19 19:48:38'),
(2516, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''7'')', '2016-01-19 19:48:38'),
(2517, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-19 19:48:38'),
(2518, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''1'')', '2016-01-19 19:48:39'),
(2519, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''2'')', '2016-01-19 19:48:39'),
(2520, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''3'')', '2016-01-19 19:48:39'),
(2521, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''4'')', '2016-01-19 19:48:39'),
(2522, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''5'')', '2016-01-19 19:48:39'),
(2523, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''6'')', '2016-01-19 19:48:39'),
(2524, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''7'')', '2016-01-19 19:48:39'),
(2525, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-19 19:48:39'),
(2526, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''1'')', '2016-01-19 19:48:39'),
(2527, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''2'')', '2016-01-19 19:48:39'),
(2528, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''3'')', '2016-01-19 19:48:40'),
(2529, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''4'')', '2016-01-19 19:48:40'),
(2530, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''5'')', '2016-01-19 19:48:40'),
(2531, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''6'')', '2016-01-19 19:48:40'),
(2532, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''7'')', '2016-01-19 19:48:40'),
(2533, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-19 19:48:40'),
(2534, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''1'')', '2016-01-19 19:48:40'),
(2535, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''2'')', '2016-01-19 19:48:40'),
(2536, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''3'')', '2016-01-19 19:48:40'),
(2537, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''4'')', '2016-01-19 19:48:40'),
(2538, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''5'')', '2016-01-19 19:48:40'),
(2539, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''6'')', '2016-01-19 19:48:40'),
(2540, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''7'')', '2016-01-19 19:48:41'),
(2541, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-19 19:48:41'),
(2542, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''1'')', '2016-01-19 19:48:41'),
(2543, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''2'')', '2016-01-19 19:48:41'),
(2544, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''3'')', '2016-01-19 19:48:41'),
(2545, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''4'')', '2016-01-19 19:48:41'),
(2546, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''5'')', '2016-01-19 19:48:41'),
(2547, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''6'')', '2016-01-19 19:48:41'),
(2548, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''7'')', '2016-01-19 19:48:41'),
(2549, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-19 19:48:41'),
(2550, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''1'')', '2016-01-19 19:48:41'),
(2551, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''2'')', '2016-01-19 19:48:41'),
(2552, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''3'')', '2016-01-19 19:48:42'),
(2553, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''4'')', '2016-01-19 19:48:42'),
(2554, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''5'')', '2016-01-19 19:48:42'),
(2555, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''6'')', '2016-01-19 19:48:42'),
(2556, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''7'')', '2016-01-19 19:48:42'),
(2557, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-19 19:48:42'),
(2558, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''1'')', '2016-01-19 19:48:42'),
(2559, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''2'')', '2016-01-19 19:48:42'),
(2560, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''3'')', '2016-01-19 19:48:42'),
(2561, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''4'')', '2016-01-19 19:48:43'),
(2562, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''5'')', '2016-01-19 19:48:43'),
(2563, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''6'')', '2016-01-19 19:48:43'),
(2564, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''7'')', '2016-01-19 19:48:43');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(2565, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-19 19:48:43'),
(2566, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''1'')', '2016-01-19 19:48:43'),
(2567, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''2'')', '2016-01-19 19:48:43'),
(2568, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''3'')', '2016-01-19 19:48:43'),
(2569, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''4'')', '2016-01-19 19:48:43'),
(2570, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''5'')', '2016-01-19 19:48:43'),
(2571, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''6'')', '2016-01-19 19:48:43'),
(2572, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''7'')', '2016-01-19 19:48:43'),
(2573, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-19 19:48:44'),
(2574, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''1'')', '2016-01-19 19:48:44'),
(2575, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''2'')', '2016-01-19 19:48:44'),
(2576, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''3'')', '2016-01-19 19:48:44'),
(2577, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''4'')', '2016-01-19 19:48:44'),
(2578, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''5'')', '2016-01-19 19:48:44'),
(2579, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''6'')', '2016-01-19 19:48:44'),
(2580, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''7'')', '2016-01-19 19:48:44'),
(2581, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-19 19:48:45'),
(2582, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''1'')', '2016-01-19 19:48:45'),
(2583, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''2'')', '2016-01-19 19:48:45'),
(2584, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''3'')', '2016-01-19 19:48:45'),
(2585, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''4'')', '2016-01-19 19:48:45'),
(2586, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''5'')', '2016-01-19 19:48:45'),
(2587, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''6'')', '2016-01-19 19:48:45'),
(2588, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''7'')', '2016-01-19 19:48:45'),
(2589, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-19 19:48:46'),
(2590, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''1'')', '2016-01-19 19:48:46'),
(2591, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''2'')', '2016-01-19 19:48:46'),
(2592, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''3'')', '2016-01-19 19:48:46'),
(2593, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''4'')', '2016-01-19 19:48:46'),
(2594, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''5'')', '2016-01-19 19:48:46'),
(2595, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''6'')', '2016-01-19 19:48:46'),
(2596, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''7'')', '2016-01-19 19:48:46'),
(2597, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-19 19:48:46'),
(2598, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''1'')', '2016-01-19 19:48:46'),
(2599, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''2'')', '2016-01-19 19:48:47'),
(2600, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''3'')', '2016-01-19 19:48:47'),
(2601, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''4'')', '2016-01-19 19:48:47'),
(2602, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''5'')', '2016-01-19 19:48:47'),
(2603, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''6'')', '2016-01-19 19:48:47'),
(2604, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''7'')', '2016-01-19 19:48:47'),
(2605, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-19 19:48:47'),
(2606, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''1'')', '2016-01-19 19:48:47'),
(2607, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''2'')', '2016-01-19 19:48:47'),
(2608, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''3'')', '2016-01-19 19:48:47'),
(2609, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''4'')', '2016-01-19 19:48:47'),
(2610, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''5'')', '2016-01-19 19:48:47'),
(2611, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''6'')', '2016-01-19 19:48:48'),
(2612, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''7'')', '2016-01-19 19:48:48'),
(2613, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-19 19:48:48'),
(2614, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''1'')', '2016-01-19 19:48:48'),
(2615, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''2'')', '2016-01-19 19:48:48'),
(2616, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''3'')', '2016-01-19 19:48:48'),
(2617, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''4'')', '2016-01-19 19:48:48'),
(2618, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''5'')', '2016-01-19 19:48:48'),
(2619, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''6'')', '2016-01-19 19:48:48'),
(2620, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''7'')', '2016-01-19 19:48:48'),
(2621, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-19 19:48:48'),
(2622, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''1'')', '2016-01-19 19:48:48'),
(2623, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''2'')', '2016-01-19 19:48:48'),
(2624, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''3'')', '2016-01-19 19:48:49'),
(2625, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''4'')', '2016-01-19 19:48:49'),
(2626, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''5'')', '2016-01-19 19:48:49'),
(2627, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''6'')', '2016-01-19 19:48:49'),
(2628, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''7'')', '2016-01-19 19:48:49'),
(2629, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-19 19:48:49'),
(2630, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''1'')', '2016-01-19 19:48:49'),
(2631, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''2'')', '2016-01-19 19:48:49'),
(2632, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''3'')', '2016-01-19 19:48:49'),
(2633, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''4'')', '2016-01-19 19:48:50'),
(2634, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''5'')', '2016-01-19 19:48:50'),
(2635, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''6'')', '2016-01-19 19:48:50'),
(2636, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''7'')', '2016-01-19 19:48:50'),
(2637, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-19 19:48:50'),
(2638, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''1'')', '2016-01-19 19:48:50'),
(2639, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''2'')', '2016-01-19 19:48:50'),
(2640, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''3'')', '2016-01-19 19:48:50'),
(2641, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''4'')', '2016-01-19 19:48:50'),
(2642, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''5'')', '2016-01-19 19:48:50'),
(2643, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''6'')', '2016-01-19 19:48:50'),
(2644, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''7'')', '2016-01-19 19:48:50'),
(2645, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-19 19:48:51'),
(2646, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''1'')', '2016-01-19 19:48:51'),
(2647, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''2'')', '2016-01-19 19:48:51'),
(2648, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''3'')', '2016-01-19 19:48:51'),
(2649, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''4'')', '2016-01-19 19:48:51'),
(2650, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''5'')', '2016-01-19 19:48:51'),
(2651, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''6'')', '2016-01-19 19:48:51'),
(2652, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''7'')', '2016-01-19 19:48:51'),
(2653, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-19 19:48:51'),
(2654, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''1'')', '2016-01-19 19:48:51'),
(2655, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''2'')', '2016-01-19 19:48:51'),
(2656, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''3'')', '2016-01-19 19:48:51'),
(2657, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''4'')', '2016-01-19 19:48:52'),
(2658, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''5'')', '2016-01-19 19:48:52'),
(2659, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''6'')', '2016-01-19 19:48:52'),
(2660, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''7'')', '2016-01-19 19:48:52'),
(2661, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-19 19:48:52'),
(2662, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''1'')', '2016-01-19 19:48:52'),
(2663, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''2'')', '2016-01-19 19:48:52'),
(2664, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''3'')', '2016-01-19 19:48:52'),
(2665, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''4'')', '2016-01-19 19:48:52'),
(2666, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''5'')', '2016-01-19 19:48:52'),
(2667, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''6'')', '2016-01-19 19:48:52'),
(2668, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''7'')', '2016-01-19 19:48:52'),
(2669, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-19 19:48:53'),
(2670, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''1'')', '2016-01-19 19:48:53'),
(2671, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''2'')', '2016-01-19 19:48:53'),
(2672, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''3'')', '2016-01-19 19:48:53'),
(2673, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''4'')', '2016-01-19 19:48:53'),
(2674, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''5'')', '2016-01-19 19:48:53'),
(2675, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''6'')', '2016-01-19 19:48:53'),
(2676, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''7'')', '2016-01-19 19:48:53'),
(2677, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-01-19 19:48:53'),
(2678, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',''5'')', '2016-01-19 19:48:53'),
(2679, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',''7'')', '2016-01-19 19:48:54'),
(2680, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-19 19:48:54'),
(2681, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''1'')', '2016-01-19 19:48:54'),
(2682, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''2'')', '2016-01-19 19:48:54'),
(2683, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''3'')', '2016-01-19 19:48:54'),
(2684, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''4'')', '2016-01-19 19:48:54'),
(2685, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''5'')', '2016-01-19 19:48:54'),
(2686, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''6'')', '2016-01-19 19:48:54'),
(2687, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''7'')', '2016-01-19 19:48:54'),
(2688, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-19 19:48:54'),
(2689, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''1'')', '2016-01-19 19:48:54'),
(2690, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''2'')', '2016-01-19 19:48:54'),
(2691, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''3'')', '2016-01-19 19:48:54'),
(2692, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''4'')', '2016-01-19 19:48:55'),
(2693, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''5'')', '2016-01-19 19:48:55'),
(2694, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''6'')', '2016-01-19 19:48:55'),
(2695, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''7'')', '2016-01-19 19:48:55'),
(2696, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-19 19:48:55'),
(2697, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''1'')', '2016-01-19 19:48:55'),
(2698, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''2'')', '2016-01-19 19:48:55'),
(2699, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''3'')', '2016-01-19 19:48:55'),
(2700, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''4'')', '2016-01-19 19:48:56'),
(2701, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''5'')', '2016-01-19 19:48:56'),
(2702, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''6'')', '2016-01-19 19:48:56'),
(2703, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''7'')', '2016-01-19 19:48:56'),
(2704, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-19 19:48:56'),
(2705, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''1'')', '2016-01-19 19:48:56'),
(2706, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''2'')', '2016-01-19 19:48:57'),
(2707, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''3'')', '2016-01-19 19:48:57'),
(2708, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''4'')', '2016-01-19 19:48:57'),
(2709, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''5'')', '2016-01-19 19:48:57'),
(2710, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''6'')', '2016-01-19 19:48:57'),
(2711, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''7'')', '2016-01-19 19:48:57'),
(2712, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-19 19:48:57'),
(2713, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''1'')', '2016-01-19 19:48:57'),
(2714, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''5'')', '2016-01-19 19:48:57'),
(2715, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''6'')', '2016-01-19 19:48:57'),
(2716, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''7'')', '2016-01-19 19:48:57'),
(2717, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-19 19:48:58'),
(2718, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',''2'')', '2016-01-19 19:48:58'),
(2719, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-19 19:48:58'),
(2720, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',''2'')', '2016-01-19 19:48:58'),
(2721, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-19 19:48:58'),
(2722, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''1'')', '2016-01-19 19:48:58'),
(2723, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''2'')', '2016-01-19 19:48:58'),
(2724, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''3'')', '2016-01-19 19:48:58'),
(2725, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''4'')', '2016-01-19 19:48:58'),
(2726, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''5'')', '2016-01-19 19:48:59'),
(2727, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''6'')', '2016-01-19 19:48:59'),
(2728, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''7'')', '2016-01-19 19:48:59'),
(2729, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-19 19:48:59'),
(2730, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''1'')', '2016-01-19 19:48:59'),
(2731, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''2'')', '2016-01-19 19:48:59'),
(2732, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''3'')', '2016-01-19 19:48:59'),
(2733, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''4'')', '2016-01-19 19:48:59'),
(2734, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''5'')', '2016-01-19 19:48:59'),
(2735, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''6'')', '2016-01-19 19:48:59'),
(2736, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''7'')', '2016-01-19 19:48:59'),
(2737, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-19 19:48:59'),
(2738, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''1'')', '2016-01-19 19:48:59'),
(2739, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''2'')', '2016-01-19 19:49:00'),
(2740, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''3'')', '2016-01-19 19:49:00'),
(2741, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''4'')', '2016-01-19 19:49:00'),
(2742, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''5'')', '2016-01-19 19:49:00'),
(2743, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''6'')', '2016-01-19 19:49:00'),
(2744, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''7'')', '2016-01-19 19:49:00'),
(2745, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-19 19:49:00'),
(2746, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-19 19:49:00'),
(2747, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-19 19:49:00'),
(2748, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-19 19:49:01'),
(2749, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-19 19:49:01'),
(2750, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-19 19:49:01'),
(2751, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-19 19:49:01'),
(2752, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-19 19:49:01'),
(2753, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-19 19:49:01'),
(2754, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-19 19:49:01'),
(2755, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-19 19:49:01'),
(2756, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-19 19:49:01'),
(2757, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-19 19:49:01'),
(2758, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-19 19:49:01'),
(2759, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-19 19:49:01'),
(2760, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-19 19:49:02'),
(2761, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-19 19:49:02'),
(2762, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-19 19:49:02'),
(2763, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-19 19:49:02'),
(2764, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-19 19:49:02'),
(2765, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-19 19:49:02'),
(2766, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-19 19:49:02'),
(2767, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-19 19:49:02'),
(2768, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-19 19:49:02'),
(2769, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-19 19:49:02'),
(2770, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-01-19 19:49:03'),
(2771, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-19 19:49:03'),
(2772, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-19 19:49:03'),
(2773, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-19 19:49:03'),
(2774, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-19 19:49:03'),
(2775, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-19 19:49:03'),
(2776, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-19 19:49:03'),
(2777, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-19 19:49:03'),
(2778, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-19 19:49:03'),
(2779, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-19 19:49:03'),
(2780, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-19 19:49:03'),
(2781, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-19 19:49:03'),
(2782, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-19 19:49:04'),
(2783, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-19 19:49:04'),
(2784, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-19 19:49:04'),
(2785, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-19 19:49:04'),
(2786, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-19 19:49:04'),
(2787, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-19 19:49:04'),
(2788, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-19 19:49:04'),
(2789, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-19 19:49:04'),
(2790, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-19 19:49:04'),
(2791, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-19 19:49:04'),
(2792, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-19 19:49:05'),
(2793, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-19 19:49:05'),
(2794, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-19 19:49:05'),
(2795, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-19 19:49:05'),
(2796, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-19 19:49:05'),
(2797, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-19 19:49:05'),
(2798, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-19 19:49:05');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(2799, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-19 19:49:05'),
(2800, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-19 19:49:06'),
(2801, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-19 19:49:06'),
(2802, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-19 19:49:06'),
(2803, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-19 19:49:06'),
(2804, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-19 19:49:06'),
(2805, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-19 19:49:07'),
(2806, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-01-19 19:49:07'),
(2807, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-19 19:49:07'),
(2808, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-19 19:49:07'),
(2809, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-19 19:49:07'),
(2810, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-19 19:49:07'),
(2811, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-19 19:49:07'),
(2812, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-19 19:49:07'),
(2813, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-19 19:49:07'),
(2814, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-19 19:49:07'),
(2815, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-19 19:49:07'),
(2816, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-19 19:49:07'),
(2817, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-19 19:49:07'),
(2818, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-19 19:49:08'),
(2819, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-19 19:49:08'),
(2820, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-19 19:49:08'),
(2821, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-19 19:49:08'),
(2822, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-19 19:49:08'),
(2823, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-19 19:49:08'),
(2824, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-19 19:49:08'),
(2825, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-19 19:49:08'),
(2826, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-19 19:49:08'),
(2827, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-19 19:49:08'),
(2828, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-19 19:49:09'),
(2829, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-19 19:49:09'),
(2830, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-19 19:49:09'),
(2831, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-19 19:49:09'),
(2832, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-19 19:49:09'),
(2833, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-19 19:49:09'),
(2834, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-19 19:49:09'),
(2835, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-19 19:49:09'),
(2836, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-19 19:49:09'),
(2837, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-19 19:49:09'),
(2838, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-19 19:49:09'),
(2839, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-19 19:49:09'),
(2840, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-19 19:49:10'),
(2841, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-19 19:49:10'),
(2842, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-01-19 19:49:10'),
(2843, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-19 19:49:10'),
(2844, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-19 19:49:10'),
(2845, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-19 19:49:10'),
(2846, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-19 19:49:10'),
(2847, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-19 19:49:10'),
(2848, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-19 19:49:10'),
(2849, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-19 19:49:10'),
(2850, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-19 19:49:10'),
(2851, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-19 19:49:10'),
(2852, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-19 19:49:11'),
(2853, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-19 19:49:11'),
(2854, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-19 19:49:11'),
(2855, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-19 19:49:11'),
(2856, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-19 19:49:11'),
(2857, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-19 19:49:11'),
(2858, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-19 19:49:11'),
(2859, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-19 19:49:11'),
(2860, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-19 19:49:11'),
(2861, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-19 19:49:11'),
(2862, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-19 19:49:11'),
(2863, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-19 19:49:12'),
(2864, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-19 19:49:12'),
(2865, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-19 19:49:12'),
(2866, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-19 19:49:12'),
(2867, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-19 19:49:12'),
(2868, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-19 19:49:12'),
(2869, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-19 19:49:12'),
(2870, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-19 19:49:12'),
(2871, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-19 19:49:12'),
(2872, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-19 19:49:12'),
(2873, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-19 19:49:12'),
(2874, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-19 19:49:13'),
(2875, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-19 19:49:13'),
(2876, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-19 19:49:13'),
(2877, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-19 19:49:13'),
(2878, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-01-19 19:49:13'),
(2879, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-19 19:49:13'),
(2880, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-19 19:49:13'),
(2881, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-19 19:49:13'),
(2882, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-19 19:49:13'),
(2883, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-19 19:49:13'),
(2884, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-19 19:49:14'),
(2885, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-19 19:49:14'),
(2886, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-19 19:49:14'),
(2887, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-19 19:49:14'),
(2888, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-19 19:49:14'),
(2889, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-19 19:49:14'),
(2890, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-19 19:49:14'),
(2891, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-19 19:49:14'),
(2892, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-19 19:49:14'),
(2893, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-19 19:49:14'),
(2894, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-19 19:49:14'),
(2895, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-19 19:49:15'),
(2896, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-19 19:49:15'),
(2897, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-19 19:49:15'),
(2898, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-19 19:49:15'),
(2899, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-19 19:49:15'),
(2900, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-19 19:49:15'),
(2901, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-19 19:49:15'),
(2902, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-19 19:49:15'),
(2903, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-19 19:49:15'),
(2904, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-19 19:49:15'),
(2905, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-19 19:49:15'),
(2906, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-19 19:49:16'),
(2907, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-19 19:49:16'),
(2908, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-19 19:49:16'),
(2909, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-19 19:49:16'),
(2910, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-19 19:49:16'),
(2911, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-19 19:49:16'),
(2912, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-19 19:49:16'),
(2913, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-19 19:49:16'),
(2914, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-01-19 19:49:16'),
(2915, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-19 19:49:17'),
(2916, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-19 19:49:17'),
(2917, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-19 19:49:17'),
(2918, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-19 19:49:17'),
(2919, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-19 19:49:17'),
(2920, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-19 19:49:18'),
(2921, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-19 19:49:18'),
(2922, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-19 19:49:18'),
(2923, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-19 19:49:18'),
(2924, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-19 19:49:18'),
(2925, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-01-19 19:49:18'),
(2926, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-01-19 19:49:18'),
(2927, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-01-19 19:49:18'),
(2928, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-01-19 19:49:18'),
(2929, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-01-19 19:49:18'),
(2930, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-01-19 19:49:18'),
(2931, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-01-19 19:49:19'),
(2932, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-01-19 19:49:19'),
(2933, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-01-19 19:49:19'),
(2934, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-01-19 19:49:19'),
(2935, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-01-19 19:49:19'),
(2936, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-01-19 19:49:19'),
(2937, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-01-19 19:49:19'),
(2938, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-01-19 19:49:19'),
(2939, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-01-19 19:49:19'),
(2940, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-01-19 19:49:19'),
(2941, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-01-19 19:49:19'),
(2942, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-01-19 19:49:20'),
(2943, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-01-19 19:49:20'),
(2944, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-01-19 19:49:20'),
(2945, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-01-19 19:49:20'),
(2946, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-01-19 19:49:20'),
(2947, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-01-19 19:49:20'),
(2948, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-01-19 19:49:20'),
(2949, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-01-19 19:49:20'),
(2950, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-01-19 19:49:20'),
(2951, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-01-19 19:49:20'),
(2952, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-01-19 19:49:20'),
(2953, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-01-19 19:49:21'),
(2954, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-01-19 19:49:21'),
(2955, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-01-19 19:49:21'),
(2956, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-01-19 19:49:21'),
(2957, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-01-19 19:49:21'),
(2958, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-01-19 19:49:21'),
(2959, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-01-19 19:49:21'),
(2960, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-01-19 19:49:21'),
(2961, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-01-19 20:46:18'),
(2962, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET seccion=''1'' WHERE cedula_estudiante = ''V30363014''', '2016-01-19 20:46:57'),
(2963, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set seccion=''SECC'',descripcion=''PRIMERO B'',turno=''M'',grado_escolar=''1'', capacidad_min=''10'',capacidad_max=''40'' where (seccion=''SECC'');', '2016-01-19 20:48:54'),
(2964, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tmateria_seccion_docente WHERE (seccion=''SECC'');', '2016-01-19 20:48:54'),
(2965, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET seccion=''SECC'' WHERE cedula_estudiante = ''V30484143''', '2016-01-19 20:49:23'),
(2966, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set fecha_desactivacion=NULL where (seccion=''1'');', '2016-01-19 20:51:10'),
(2967, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set seccion=''1'',descripcion=''PRIMERO A'',turno=''M'',grado_escolar=''1'', capacidad_min=''10'',capacidad_max=''30'' where (seccion=''1'');', '2016-01-19 20:51:35'),
(2968, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tmateria_seccion_docente WHERE (seccion=''1'');', '2016-01-19 20:51:35'),
(2969, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tseccion set seccion=''1'',descripcion=''PRIMERO A'',turno=''M'',grado_escolar=''1'', capacidad_min=''10'',capacidad_max=''30'' where (seccion=''1'');', '2016-01-19 20:52:50'),
(2970, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tmateria_seccion_docente WHERE (seccion=''1'');', '2016-01-19 20:52:50'),
(2971, '127.0.0.1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tmateria_seccion_docente(seccion,codigo_materia,cedula_docente) VALUES (''1'',''INGL001'',''V9565053'');', '2016-01-19 20:52:50'),
(2972, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2016-08-16 01:16:42'),
(2973, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2016-08-16 01:21:59'),
(2974, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tcontrasena set estado=0 where (nombre_usuario=''V123456789'')', '2016-08-16 01:37:05'),
(2975, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tcontrasena (contrasena,nombre_usuario,estado) values (''2e5f402b1f0117f9f7217a3e8cbff136b1e304ad'',''V123456789'',1)', '2016-08-16 01:37:05'),
(2976, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-16 01:37:12'),
(2977, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tplantel SET nombre=''UNIDAD EDUCATIVA NACIONAL QUEBRADA HONDA'',direccion=''CALLE #3 CENTRO POBLADO "B" QUEBRADA HONDA'',telefono_habitacion=''02558084598'', localidad=''CENTRO OCCIDENTE'',codigo_municipio=''2'',email=''llbqh@hotmail.com'' where (codigo_plantel=''OD00741801'');', '2016-08-16 01:40:16'),
(2978, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tservicio (descripcion,url,orden,codigo_modulo) values (''CONFIGURACIÓN DEL PERFIL'',''CONFIGURACION'',''4'',''6'');', '2016-08-16 02:53:41'),
(2979, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tperfil set descripcion=''ADMINISTRADOR'',codigo_configuracion=1 where (codigo_perfil=''1'');', '2016-08-16 02:55:51'),
(2980, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''1'');', '2016-08-16 02:55:51'),
(2981, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-08-16 02:55:51'),
(2982, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''1'')', '2016-08-16 02:55:52'),
(2983, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''2'')', '2016-08-16 02:55:52'),
(2984, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''3'')', '2016-08-16 02:55:52'),
(2985, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''4'')', '2016-08-16 02:55:52'),
(2986, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''5'')', '2016-08-16 02:55:52'),
(2987, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''6'')', '2016-08-16 02:55:52'),
(2988, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',''7'')', '2016-08-16 02:55:52'),
(2989, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-08-16 02:55:52'),
(2990, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''1'')', '2016-08-16 02:55:52'),
(2991, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''2'')', '2016-08-16 02:55:52'),
(2992, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''3'')', '2016-08-16 02:55:53'),
(2993, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''4'')', '2016-08-16 02:55:53'),
(2994, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''5'')', '2016-08-16 02:55:53'),
(2995, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''6'')', '2016-08-16 02:55:53'),
(2996, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',''7'')', '2016-08-16 02:55:53'),
(2997, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-08-16 02:55:53'),
(2998, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''1'')', '2016-08-16 02:55:53'),
(2999, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''2'')', '2016-08-16 02:55:53'),
(3000, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''3'')', '2016-08-16 02:55:53'),
(3001, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''4'')', '2016-08-16 02:55:53'),
(3002, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''5'')', '2016-08-16 02:55:54'),
(3003, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''6'')', '2016-08-16 02:55:54'),
(3004, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',''7'')', '2016-08-16 02:55:54'),
(3005, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-08-16 02:55:54'),
(3006, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''1'')', '2016-08-16 02:55:54'),
(3007, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''2'')', '2016-08-16 02:55:54'),
(3008, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''3'')', '2016-08-16 02:55:54'),
(3009, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''4'')', '2016-08-16 02:55:54'),
(3010, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''5'')', '2016-08-16 02:55:54'),
(3011, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''6'')', '2016-08-16 02:55:54'),
(3012, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',''7'')', '2016-08-16 02:55:55'),
(3013, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-08-16 02:55:55'),
(3014, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''1'')', '2016-08-16 02:55:55'),
(3015, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''2'')', '2016-08-16 02:55:55'),
(3016, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''3'')', '2016-08-16 02:55:55'),
(3017, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''4'')', '2016-08-16 02:55:55'),
(3018, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''5'')', '2016-08-16 02:55:55'),
(3019, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''6'')', '2016-08-16 02:55:55'),
(3020, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',''7'')', '2016-08-16 02:55:55'),
(3021, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-08-16 02:55:55'),
(3022, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''1'')', '2016-08-16 02:55:56'),
(3023, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''2'')', '2016-08-16 02:55:56'),
(3024, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''3'')', '2016-08-16 02:55:56'),
(3025, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''4'')', '2016-08-16 02:55:56'),
(3026, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''5'')', '2016-08-16 02:55:56'),
(3027, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''6'')', '2016-08-16 02:55:56'),
(3028, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',''7'')', '2016-08-16 02:55:56'),
(3029, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-08-16 02:55:56'),
(3030, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''1'')', '2016-08-16 02:55:56'),
(3031, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''2'')', '2016-08-16 02:55:56'),
(3032, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''3'')', '2016-08-16 02:55:56'),
(3033, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''4'')', '2016-08-16 02:55:57');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(3034, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''5'')', '2016-08-16 02:55:57'),
(3035, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''6'')', '2016-08-16 02:55:57'),
(3036, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',''7'')', '2016-08-16 02:55:57'),
(3037, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-08-16 02:55:57'),
(3038, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''1'')', '2016-08-16 02:55:57'),
(3039, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''2'')', '2016-08-16 02:55:57'),
(3040, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''3'')', '2016-08-16 02:55:57'),
(3041, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''4'')', '2016-08-16 02:55:57'),
(3042, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''5'')', '2016-08-16 02:55:57'),
(3043, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''6'')', '2016-08-16 02:55:57'),
(3044, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',''7'')', '2016-08-16 02:55:57'),
(3045, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-08-16 02:55:58'),
(3046, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''1'')', '2016-08-16 02:55:58'),
(3047, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''2'')', '2016-08-16 02:55:58'),
(3048, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''3'')', '2016-08-16 02:55:58'),
(3049, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''4'')', '2016-08-16 02:55:58'),
(3050, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''5'')', '2016-08-16 02:55:58'),
(3051, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''6'')', '2016-08-16 02:55:58'),
(3052, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',''7'')', '2016-08-16 02:55:58'),
(3053, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-08-16 02:55:58'),
(3054, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''1'')', '2016-08-16 02:55:58'),
(3055, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''2'')', '2016-08-16 02:55:58'),
(3056, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''3'')', '2016-08-16 02:55:59'),
(3057, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''4'')', '2016-08-16 02:55:59'),
(3058, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''5'')', '2016-08-16 02:55:59'),
(3059, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''6'')', '2016-08-16 02:55:59'),
(3060, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',''7'')', '2016-08-16 02:55:59'),
(3061, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-08-16 02:55:59'),
(3062, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''1'')', '2016-08-16 02:55:59'),
(3063, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''2'')', '2016-08-16 02:55:59'),
(3064, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''3'')', '2016-08-16 02:56:00'),
(3065, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''4'')', '2016-08-16 02:56:00'),
(3066, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''5'')', '2016-08-16 02:56:00'),
(3067, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''6'')', '2016-08-16 02:56:00'),
(3068, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',''7'')', '2016-08-16 02:56:00'),
(3069, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-08-16 02:56:00'),
(3070, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''1'')', '2016-08-16 02:56:00'),
(3071, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''2'')', '2016-08-16 02:56:00'),
(3072, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''3'')', '2016-08-16 02:56:00'),
(3073, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''4'')', '2016-08-16 02:56:00'),
(3074, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''5'')', '2016-08-16 02:56:00'),
(3075, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''6'')', '2016-08-16 02:56:00'),
(3076, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',''7'')', '2016-08-16 02:56:01'),
(3077, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-08-16 02:56:01'),
(3078, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''1'')', '2016-08-16 02:56:01'),
(3079, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''2'')', '2016-08-16 02:56:01'),
(3080, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''3'')', '2016-08-16 02:56:01'),
(3081, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''4'')', '2016-08-16 02:56:01'),
(3082, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''5'')', '2016-08-16 02:56:01'),
(3083, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''6'')', '2016-08-16 02:56:01'),
(3084, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',''7'')', '2016-08-16 02:56:01'),
(3085, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-08-16 02:56:01'),
(3086, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''1'')', '2016-08-16 02:56:02'),
(3087, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''2'')', '2016-08-16 02:56:02'),
(3088, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''3'')', '2016-08-16 02:56:02'),
(3089, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''4'')', '2016-08-16 02:56:02'),
(3090, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''5'')', '2016-08-16 02:56:02'),
(3091, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''6'')', '2016-08-16 02:56:02'),
(3092, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',''7'')', '2016-08-16 02:56:02'),
(3093, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-08-16 02:56:02'),
(3094, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''1'')', '2016-08-16 02:56:03'),
(3095, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''2'')', '2016-08-16 02:56:03'),
(3096, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''3'')', '2016-08-16 02:56:03'),
(3097, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''4'')', '2016-08-16 02:56:03'),
(3098, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''5'')', '2016-08-16 02:56:03'),
(3099, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''6'')', '2016-08-16 02:56:03'),
(3100, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',''7'')', '2016-08-16 02:56:03'),
(3101, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-08-16 02:56:03'),
(3102, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''1'')', '2016-08-16 02:56:03'),
(3103, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''2'')', '2016-08-16 02:56:03'),
(3104, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''3'')', '2016-08-16 02:56:03'),
(3105, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''4'')', '2016-08-16 02:56:03'),
(3106, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''5'')', '2016-08-16 02:56:03'),
(3107, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''6'')', '2016-08-16 02:56:04'),
(3108, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',''7'')', '2016-08-16 02:56:04'),
(3109, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-08-16 02:56:04'),
(3110, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''1'')', '2016-08-16 02:56:04'),
(3111, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''2'')', '2016-08-16 02:56:04'),
(3112, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''3'')', '2016-08-16 02:56:04'),
(3113, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''4'')', '2016-08-16 02:56:04'),
(3114, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''5'')', '2016-08-16 02:56:04'),
(3115, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''6'')', '2016-08-16 02:56:04'),
(3116, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',''7'')', '2016-08-16 02:56:04'),
(3117, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-08-16 02:56:04'),
(3118, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''1'')', '2016-08-16 02:56:04'),
(3119, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''2'')', '2016-08-16 02:56:04'),
(3120, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''3'')', '2016-08-16 02:56:05'),
(3121, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''4'')', '2016-08-16 02:56:05'),
(3122, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''5'')', '2016-08-16 02:56:05'),
(3123, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''6'')', '2016-08-16 02:56:05'),
(3124, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',''7'')', '2016-08-16 02:56:05'),
(3125, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-08-16 02:56:05'),
(3126, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''1'')', '2016-08-16 02:56:05'),
(3127, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''2'')', '2016-08-16 02:56:05'),
(3128, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''3'')', '2016-08-16 02:56:05'),
(3129, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''4'')', '2016-08-16 02:56:05'),
(3130, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''5'')', '2016-08-16 02:56:05'),
(3131, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''6'')', '2016-08-16 02:56:05'),
(3132, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',''7'')', '2016-08-16 02:56:05'),
(3133, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-08-16 02:56:05'),
(3134, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''1'')', '2016-08-16 02:56:05'),
(3135, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''2'')', '2016-08-16 02:56:06'),
(3136, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''3'')', '2016-08-16 02:56:06'),
(3137, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''4'')', '2016-08-16 02:56:06'),
(3138, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''5'')', '2016-08-16 02:56:06'),
(3139, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''6'')', '2016-08-16 02:56:06'),
(3140, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',''7'')', '2016-08-16 02:56:06'),
(3141, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-08-16 02:56:06'),
(3142, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''1'')', '2016-08-16 02:56:06'),
(3143, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''2'')', '2016-08-16 02:56:06'),
(3144, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''3'')', '2016-08-16 02:56:06'),
(3145, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''4'')', '2016-08-16 02:56:06'),
(3146, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''5'')', '2016-08-16 02:56:06'),
(3147, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''6'')', '2016-08-16 02:56:06'),
(3148, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',''7'')', '2016-08-16 02:56:06'),
(3149, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-08-16 02:56:07'),
(3150, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''1'')', '2016-08-16 02:56:07'),
(3151, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''2'')', '2016-08-16 02:56:07'),
(3152, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''3'')', '2016-08-16 02:56:07'),
(3153, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''4'')', '2016-08-16 02:56:07'),
(3154, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''5'')', '2016-08-16 02:56:07'),
(3155, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''6'')', '2016-08-16 02:56:07'),
(3156, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',''7'')', '2016-08-16 02:56:07'),
(3157, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-08-16 02:56:07'),
(3158, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''1'')', '2016-08-16 02:56:07'),
(3159, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''2'')', '2016-08-16 02:56:07'),
(3160, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''3'')', '2016-08-16 02:56:07'),
(3161, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''4'')', '2016-08-16 02:56:07'),
(3162, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''5'')', '2016-08-16 02:56:07'),
(3163, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''6'')', '2016-08-16 02:56:08'),
(3164, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',''7'')', '2016-08-16 02:56:08'),
(3165, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-08-16 02:56:08'),
(3166, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''1'')', '2016-08-16 02:56:08'),
(3167, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''2'')', '2016-08-16 02:56:08'),
(3168, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''3'')', '2016-08-16 02:56:08'),
(3169, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''4'')', '2016-08-16 02:56:08'),
(3170, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''5'')', '2016-08-16 02:56:08'),
(3171, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''6'')', '2016-08-16 02:56:08'),
(3172, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',''7'')', '2016-08-16 02:56:08'),
(3173, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-08-16 02:56:08'),
(3174, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''1'')', '2016-08-16 02:56:08'),
(3175, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''2'')', '2016-08-16 02:56:08'),
(3176, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''3'')', '2016-08-16 02:56:09'),
(3177, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''4'')', '2016-08-16 02:56:09'),
(3178, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''5'')', '2016-08-16 02:56:09'),
(3179, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''6'')', '2016-08-16 02:56:09'),
(3180, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',''7'')', '2016-08-16 02:56:09'),
(3181, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-08-16 02:56:09'),
(3182, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',''5'')', '2016-08-16 02:56:09'),
(3183, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',''7'')', '2016-08-16 02:56:09'),
(3184, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-08-16 02:56:09'),
(3185, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''1'')', '2016-08-16 02:56:09'),
(3186, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''2'')', '2016-08-16 02:56:09'),
(3187, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''3'')', '2016-08-16 02:56:09'),
(3188, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''4'')', '2016-08-16 02:56:09'),
(3189, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''5'')', '2016-08-16 02:56:09'),
(3190, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''6'')', '2016-08-16 02:56:09'),
(3191, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',''7'')', '2016-08-16 02:56:10'),
(3192, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-08-16 02:56:10'),
(3193, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''1'')', '2016-08-16 02:56:10'),
(3194, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''2'')', '2016-08-16 02:56:10'),
(3195, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''3'')', '2016-08-16 02:56:10'),
(3196, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''4'')', '2016-08-16 02:56:10'),
(3197, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''5'')', '2016-08-16 02:56:10'),
(3198, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''6'')', '2016-08-16 02:56:10'),
(3199, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',''7'')', '2016-08-16 02:56:10'),
(3200, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-08-16 02:56:10'),
(3201, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''1'')', '2016-08-16 02:56:10'),
(3202, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''2'')', '2016-08-16 02:56:10'),
(3203, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''3'')', '2016-08-16 02:56:10'),
(3204, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''4'')', '2016-08-16 02:56:10'),
(3205, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''5'')', '2016-08-16 02:56:10'),
(3206, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''6'')', '2016-08-16 02:56:11'),
(3207, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',''7'')', '2016-08-16 02:56:11'),
(3208, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-08-16 02:56:11'),
(3209, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''1'')', '2016-08-16 02:56:11'),
(3210, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''2'')', '2016-08-16 02:56:11'),
(3211, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''3'')', '2016-08-16 02:56:11'),
(3212, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''4'')', '2016-08-16 02:56:11'),
(3213, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''5'')', '2016-08-16 02:56:11'),
(3214, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''6'')', '2016-08-16 02:56:11'),
(3215, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',''7'')', '2016-08-16 02:56:11'),
(3216, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-08-16 02:56:11'),
(3217, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''1'')', '2016-08-16 02:56:11'),
(3218, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''5'')', '2016-08-16 02:56:11'),
(3219, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''6'')', '2016-08-16 02:56:11'),
(3220, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',''7'')', '2016-08-16 02:56:12'),
(3221, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-08-16 02:56:12'),
(3222, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',''2'')', '2016-08-16 02:56:12'),
(3223, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-08-16 02:56:12'),
(3224, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',''2'')', '2016-08-16 02:56:12'),
(3225, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-08-16 02:56:12'),
(3226, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''1'')', '2016-08-16 02:56:12'),
(3227, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''2'')', '2016-08-16 02:56:12'),
(3228, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''3'')', '2016-08-16 02:56:12'),
(3229, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''4'')', '2016-08-16 02:56:12'),
(3230, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''5'')', '2016-08-16 02:56:12'),
(3231, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''6'')', '2016-08-16 02:56:12'),
(3232, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',''7'')', '2016-08-16 02:56:13'),
(3233, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''37'',NULL)', '2016-08-16 02:56:13'),
(3234, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''37'',''1'')', '2016-08-16 02:56:13'),
(3235, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''37'',''2'')', '2016-08-16 02:56:13'),
(3236, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''37'',''3'')', '2016-08-16 02:56:13'),
(3237, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''37'',''4'')', '2016-08-16 02:56:13'),
(3238, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''37'',''5'')', '2016-08-16 02:56:13'),
(3239, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''37'',''6'')', '2016-08-16 02:56:13'),
(3240, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''37'',''7'')', '2016-08-16 02:56:13'),
(3241, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-08-16 02:56:13'),
(3242, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''1'')', '2016-08-16 02:56:13'),
(3243, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''2'')', '2016-08-16 02:56:13'),
(3244, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''3'')', '2016-08-16 02:56:13'),
(3245, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''4'')', '2016-08-16 02:56:13'),
(3246, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''5'')', '2016-08-16 02:56:14'),
(3247, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''6'')', '2016-08-16 02:56:14'),
(3248, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',''7'')', '2016-08-16 02:56:14'),
(3249, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-08-16 02:56:14'),
(3250, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''1'')', '2016-08-16 02:56:14'),
(3251, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''2'')', '2016-08-16 02:56:14'),
(3252, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''3'')', '2016-08-16 02:56:14'),
(3253, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''4'')', '2016-08-16 02:56:14'),
(3254, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''5'')', '2016-08-16 02:56:14'),
(3255, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''6'')', '2016-08-16 02:56:14'),
(3256, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',''7'')', '2016-08-16 02:56:14'),
(3257, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-08-16 02:56:14'),
(3258, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-08-16 02:56:14'),
(3259, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-08-16 02:56:14'),
(3260, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-08-16 02:56:15'),
(3261, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-08-16 02:56:15'),
(3262, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-08-16 02:56:15'),
(3263, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-08-16 02:56:15'),
(3264, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-08-16 02:56:15'),
(3265, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-08-16 02:56:15');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(3266, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-08-16 02:56:15'),
(3267, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-08-16 02:56:15'),
(3268, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-08-16 02:56:15'),
(3269, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-08-16 02:56:15'),
(3270, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-08-16 02:56:15'),
(3271, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-08-16 02:56:15'),
(3272, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-08-16 02:56:16'),
(3273, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-08-16 02:56:16'),
(3274, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-08-16 02:56:16'),
(3275, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-08-16 02:56:16'),
(3276, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-08-16 02:56:16'),
(3277, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-08-16 02:56:16'),
(3278, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-08-16 02:56:16'),
(3279, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-08-16 02:56:16'),
(3280, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-08-16 02:56:16'),
(3281, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-08-16 02:56:16'),
(3282, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-08-16 02:56:16'),
(3283, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-08-16 02:56:16'),
(3284, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''29'',NULL)', '2016-08-16 02:56:16'),
(3285, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''30'',NULL)', '2016-08-16 02:56:17'),
(3286, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''31'',NULL)', '2016-08-16 02:56:17'),
(3287, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''32'',NULL)', '2016-08-16 02:56:17'),
(3288, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''33'',NULL)', '2016-08-16 02:56:17'),
(3289, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''34'',NULL)', '2016-08-16 02:56:17'),
(3290, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''35'',NULL)', '2016-08-16 02:56:17'),
(3291, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''37'',NULL)', '2016-08-16 02:56:17'),
(3292, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''17'',NULL)', '2016-08-16 02:56:17'),
(3293, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''18'',NULL)', '2016-08-16 02:56:17'),
(3294, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''1'',NULL)', '2016-08-16 02:56:17'),
(3295, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''2'',NULL)', '2016-08-16 02:56:18'),
(3296, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''3'',NULL)', '2016-08-16 02:56:18'),
(3297, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''4'',NULL)', '2016-08-16 02:56:18'),
(3298, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''5'',NULL)', '2016-08-16 02:56:18'),
(3299, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''6'',NULL)', '2016-08-16 02:56:18'),
(3300, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''7'',NULL)', '2016-08-16 02:56:18'),
(3301, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''8'',NULL)', '2016-08-16 02:56:18'),
(3302, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''9'',NULL)', '2016-08-16 02:56:18'),
(3303, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''10'',NULL)', '2016-08-16 02:56:18'),
(3304, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''11'',NULL)', '2016-08-16 02:56:18'),
(3305, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''12'',NULL)', '2016-08-16 02:56:19'),
(3306, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''13'',NULL)', '2016-08-16 02:56:19'),
(3307, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''14'',NULL)', '2016-08-16 02:56:19'),
(3308, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''15'',NULL)', '2016-08-16 02:56:19'),
(3309, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''16'',NULL)', '2016-08-16 02:56:19'),
(3310, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''19'',NULL)', '2016-08-16 02:56:19'),
(3311, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''20'',NULL)', '2016-08-16 02:56:19'),
(3312, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''21'',NULL)', '2016-08-16 02:56:19'),
(3313, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''22'',NULL)', '2016-08-16 02:56:19'),
(3314, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''23'',NULL)', '2016-08-16 02:56:19'),
(3315, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''24'',NULL)', '2016-08-16 02:56:19'),
(3316, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''25'',NULL)', '2016-08-16 02:56:20'),
(3317, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''26'',NULL)', '2016-08-16 02:56:20'),
(3318, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''27'',NULL)', '2016-08-16 02:56:20'),
(3319, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''36'',NULL)', '2016-08-16 02:56:20'),
(3320, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',''28'',NULL)', '2016-08-16 02:56:20'),
(3321, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tperfil set descripcion=''ADMINISTRADOR'',codigo_configuracion=1 where (codigo_perfil=''1'');', '2016-08-16 03:03:23'),
(3322, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''1'');', '2016-08-16 03:03:23'),
(3323, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',1,1),(''1'',1,2),(''1'',1,3),(''1'',1,4),(''1'',1,5),(''1'',1,6),(''1'',1,7),(''1'',2,1),(''1'',2,2),(''1'',2,3),(''1'',2,4),(''1'',2,5),(''1'',2,6),(''1'',2,7),(''1'',3,1),(''1'',3,2),(''1'',3,3),(''1'',3,4),(''1'',3,5),(''1'',3,6),(''1'',3,7),(''1'',4,1),(''1'',4,2),(''1'',4,3),(''1'',4,4),(''1'',4,5),(''1'',4,6),(''1'',4,7),(''1'',5,1),(''1'',5,2),(''1'',5,3),(''1'',5,4),(''1'',5,5),(''1'',5,6),(''1'',5,7),(''1'',6,1),(''1'',6,2),(''1'',6,3),(''1'',6,4),(''1'',6,5),(''1'',6,6),(''1'',6,7),(''1'',7,1),(''1'',7,2),(''1'',7,3),(''1'',7,4),(''1'',7,5),(''1'',7,6),(''1'',7,7),(''1'',8,1),(''1'',8,2),(''1'',8,3),(''1'',8,4),(''1'',8,5),(''1'',8,6),(''1'',8,7),(''1'',9,1),(''1'',9,2),(''1'',9,3),(''1'',9,4),(''1'',9,5),(''1'',9,6),(''1'',9,7),(''1'',10,1),(''1'',10,2),(''1'',10,3),(''1'',10,4),(''1'',10,5),(''1'',10,6),(''1'',10,7),(''1'',11,1),(''1'',11,2),(''1'',11,3),(''1'',11,4),(''1'',11,5),(''1'',11,6),(''1'',11,7),(''1'',12,1),(''1'',12,2),(''1'',12,3),(''1'',12,4),(''1'',12,5),(''1'',12,6),(''1'',12,7),(''1'',13,1),(''1'',13,2),(''1'',13,3),(''1'',13,4),(''1'',13,5),(''1'',13,6),(''1'',13,7),(''1'',14,1),(''1'',14,2),(''1'',14,3),(''1'',14,4),(''1'',14,5),(''1'',14,6),(''1'',14,7),(''1'',15,1),(''1'',15,2),(''1'',15,3),(''1'',15,4),(''1'',15,5),(''1'',15,6),(''1'',15,7),(''1'',16,1),(''1'',16,2),(''1'',16,3),(''1'',16,4),(''1'',16,5),(''1'',16,6),(''1'',16,7),(''1'',19,1),(''1'',19,2),(''1'',19,3),(''1'',19,4),(''1'',19,5),(''1'',19,6),(''1'',19,7),(''1'',20,1),(''1'',20,2),(''1'',20,3),(''1'',20,4),(''1'',20,5),(''1'',20,6),(''1'',20,7),(''1'',21,1),(''1'',21,2),(''1'',21,3),(''1'',21,4),(''1'',21,5),(''1'',21,6),(''1'',21,7),(''1'',22,1),(''1'',22,2),(''1'',22,3),(''1'',22,4),(''1'',22,5),(''1'',22,6),(''1'',22,7),(''1'',23,1),(''1'',23,2),(''1'',23,3),(''1'',23,4),(''1'',23,5),(''1'',23,6),(''1'',23,7),(''1'',24,1),(''1'',24,2),(''1'',24,3),(''1'',24,4),(''1'',24,5),(''1'',24,6),(''1'',24,7),(''1'',25,1),(''1'',25,2),(''1'',25,3),(''1'',25,4),(''1'',25,5),(''1'',25,6),(''1'',25,7),(''1'',26,1),(''1'',26,2),(''1'',26,3),(''1'',26,4),(''1'',26,5),(''1'',26,6),(''1'',26,7),(''1'',27,1),(''1'',27,2),(''1'',27,3),(''1'',27,4),(''1'',27,5),(''1'',27,6),(''1'',27,7),(''1'',36,5),(''1'',36,7),(''1'',28,1),(''1'',28,2),(''1'',28,3),(''1'',28,4),(''1'',28,5),(''1'',28,6),(''1'',28,7),(''1'',29,1),(''1'',29,2),(''1'',29,3),(''1'',29,4),(''1'',29,5),(''1'',29,6),(''1'',29,7),(''1'',30,1),(''1'',30,2),(''1'',30,3),(''1'',30,4),(''1'',30,5),(''1'',30,6),(''1'',30,7),(''1'',31,1),(''1'',31,2),(''1'',31,3),(''1'',31,4),(''1'',31,5),(''1'',31,6),(''1'',31,7),(''1'',32,1),(''1'',32,5),(''1'',32,6),(''1'',32,7),(''1'',33,2),(''1'',34,2),(''1'',35,1),(''1'',35,2),(''1'',35,3),(''1'',35,4),(''1'',35,5),(''1'',35,6),(''1'',35,7),(''1'',37,1),(''1'',37,2),(''1'',37,3),(''1'',37,4),(''1'',37,5),(''1'',37,6),(''1'',37,7),(''1'',17,1),(''1'',17,2),(''1'',17,3),(''1'',17,4),(''1'',17,5),(''1'',17,6),(''1'',17,7),(''1'',18,1),(''1'',18,2),(''1'',18,3),(''1'',18,4),(''1'',18,5),(''1'',18,6),(''1'',18,7);', '2016-08-16 03:03:23'),
(3324, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tservicio set descripcion=''PERFIL'',url=''PERFILES'',orden=''5'',codigo_modulo=''6'' where (codigo_servicio=''31'');', '2016-08-16 03:04:07'),
(3325, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tservicio set descripcion=''NUEVO USUARIO'',url=''NUEVOUSUARIO'',orden=''6'',codigo_modulo=''6'' where (codigo_servicio=''32'');', '2016-08-16 03:04:30'),
(3326, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tconfiguracion SET descripcion=''POR DEFECTO'',longitud_minclave=6\r\n  ,longitud_maxclave=10,cantidad_letrasmayusculas=1\r\n ,cantidad_letrasminusculas=1,cantidad_caracteresespeciales=1\r\n  ,cantidad_numeros=1,dias_vigenciaclave=365,numero_ultimasclaves=1\r\n ,dias_aviso=10,intentos_fallidos=99999999,numero_preguntas=3\r\n  ,numero_preguntasaresponder=2  \r\n WHERE codigo_configuracion=''1''', '2016-08-16 04:08:31'),
(3327, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tconfiguracion (descripcion,longitud_minclave,longitud_maxclave,cantidad_letrasmayusculas,cantidad_letrasminusculas,\r\n cantidad_caracteresespeciales,cantidad_numeros,dias_vigenciaclave,numero_ultimasclaves,dias_aviso,intentos_fallidos,numero_preguntas,numero_preguntasaresponder) VALUES \r\n  (''DOCENTES'',4,8,0,1\r\n ,0,0,180,3,10\r\n ,5,3,1)', '2016-08-16 04:10:07'),
(3328, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE trespuesta_secreta SET pregunta = ''P1'',respuesta =  ''R1'' \r\n       WHERE nombre_usuario=''V123456789'' AND pregunta = ''P2''', '2016-08-16 04:15:26'),
(3329, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO trespuesta_secreta (nombre_usuario,pregunta,respuesta) \r\n          VALUES (''V123456789'',''P2'',''R2'');', '2016-08-16 04:15:26'),
(3330, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO trespuesta_secreta (nombre_usuario,pregunta,respuesta) \r\n          VALUES (''V123456789'',''P3'',''R3'');', '2016-08-16 04:15:26'),
(3331, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-16 13:54:36'),
(3332, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tperfil set descripcion=''ADMINISTRADOR'',codigo_configuracion=1 where (codigo_perfil=''1'');', '2016-08-16 13:58:32'),
(3333, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''1'');', '2016-08-16 13:58:33'),
(3334, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',1,1),(''1'',1,2),(''1'',1,3),(''1'',1,4),(''1'',1,5),(''1'',1,6),(''1'',1,7),(''1'',2,1),(''1'',2,2),(''1'',2,3),(''1'',2,4),(''1'',2,5),(''1'',2,6),(''1'',2,7),(''1'',3,1),(''1'',3,2),(''1'',3,3),(''1'',3,4),(''1'',3,5),(''1'',3,6),(''1'',3,7),(''1'',4,1),(''1'',4,2),(''1'',4,3),(''1'',4,4),(''1'',4,5),(''1'',4,6),(''1'',4,7),(''1'',5,1),(''1'',5,2),(''1'',5,3),(''1'',5,4),(''1'',5,5),(''1'',5,6),(''1'',5,7),(''1'',6,1),(''1'',6,2),(''1'',6,3),(''1'',6,4),(''1'',6,5),(''1'',6,6),(''1'',6,7),(''1'',7,1),(''1'',7,2),(''1'',7,3),(''1'',7,4),(''1'',7,5),(''1'',7,6),(''1'',7,7),(''1'',8,1),(''1'',8,2),(''1'',8,3),(''1'',8,4),(''1'',8,5),(''1'',8,6),(''1'',8,7),(''1'',9,1),(''1'',9,2),(''1'',9,3),(''1'',9,4),(''1'',9,5),(''1'',9,6),(''1'',9,7),(''1'',10,1),(''1'',10,2),(''1'',10,3),(''1'',10,4),(''1'',10,5),(''1'',10,6),(''1'',10,7),(''1'',11,1),(''1'',11,2),(''1'',11,3),(''1'',11,4),(''1'',11,5),(''1'',11,6),(''1'',11,7),(''1'',12,1),(''1'',12,2),(''1'',12,3),(''1'',12,4),(''1'',12,5),(''1'',12,6),(''1'',12,7),(''1'',13,1),(''1'',13,2),(''1'',13,3),(''1'',13,4),(''1'',13,5),(''1'',13,6),(''1'',13,7),(''1'',14,1),(''1'',14,2),(''1'',14,3),(''1'',14,4),(''1'',14,5),(''1'',14,6),(''1'',14,7),(''1'',15,1),(''1'',15,2),(''1'',15,3),(''1'',15,4),(''1'',15,5),(''1'',15,6),(''1'',15,7),(''1'',16,1),(''1'',16,2),(''1'',16,3),(''1'',16,4),(''1'',16,5),(''1'',16,6),(''1'',16,7),(''1'',19,1),(''1'',19,2),(''1'',19,3),(''1'',19,4),(''1'',19,5),(''1'',19,6),(''1'',19,7),(''1'',20,1),(''1'',20,2),(''1'',20,3),(''1'',20,4),(''1'',20,5),(''1'',20,6),(''1'',20,7),(''1'',21,1),(''1'',21,2),(''1'',21,3),(''1'',21,4),(''1'',21,5),(''1'',21,6),(''1'',21,7),(''1'',22,1),(''1'',22,2),(''1'',22,3),(''1'',22,4),(''1'',22,5),(''1'',22,6),(''1'',22,7),(''1'',23,1),(''1'',23,2),(''1'',23,3),(''1'',23,4),(''1'',23,5),(''1'',23,6),(''1'',23,7),(''1'',24,1),(''1'',24,2),(''1'',24,3),(''1'',24,4),(''1'',24,5),(''1'',24,6),(''1'',24,7),(''1'',25,1),(''1'',25,2),(''1'',25,3),(''1'',25,4),(''1'',25,5),(''1'',25,6),(''1'',25,7),(''1'',26,1),(''1'',26,2),(''1'',26,3),(''1'',26,4),(''1'',26,5),(''1'',26,6),(''1'',26,7),(''1'',27,1),(''1'',27,2),(''1'',27,3),(''1'',27,4),(''1'',27,5),(''1'',27,6),(''1'',27,7),(''1'',36,5),(''1'',36,7),(''1'',28,1),(''1'',28,2),(''1'',28,3),(''1'',28,4),(''1'',28,5),(''1'',28,6),(''1'',28,7),(''1'',29,1),(''1'',29,2),(''1'',29,3),(''1'',29,4),(''1'',29,5),(''1'',29,6),(''1'',29,7),(''1'',30,1),(''1'',30,2),(''1'',30,3),(''1'',30,4),(''1'',30,5),(''1'',30,6),(''1'',30,7),(''1'',31,1),(''1'',31,2),(''1'',31,3),(''1'',31,4),(''1'',31,5),(''1'',31,6),(''1'',31,7),(''1'',32,1),(''1'',32,5),(''1'',32,6),(''1'',32,7),(''1'',33,2),(''1'',34,2),(''1'',35,1),(''1'',35,2),(''1'',35,3),(''1'',35,4),(''1'',35,5),(''1'',35,6),(''1'',35,7),(''1'',37,1),(''1'',37,2),(''1'',37,3),(''1'',37,4),(''1'',37,5),(''1'',37,6),(''1'',37,7),(''1'',17,1),(''1'',17,2),(''1'',17,3),(''1'',17,4),(''1'',17,5),(''1'',17,6),(''1'',17,7),(''1'',18,1),(''1'',18,2),(''1'',18,3),(''1'',18,4),(''1'',18,5),(''1'',18,6),(''1'',18,7);', '2016-08-16 13:58:33'),
(3335, '::1', 'Windows 8/NT', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-16 14:22:03'),
(3336, '::1', 'Linux', 'Google Chrome', 'admin@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''SASD'')', '2016-08-19 16:25:59'),
(3337, '::1', 'Linux', 'Google Chrome', 'admin@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''ZSASD'')', '2016-08-19 16:26:28'),
(3338, '::1', 'Linux', 'Google Chrome', 'admin@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''Z'')', '2016-08-19 16:27:00'),
(3339, '::1', 'Linux', 'Google Chrome', 'admin@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''SASD'')', '2016-08-19 16:27:16'),
(3340, '::1', 'Linux', 'Google Chrome', 'admin@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''ASDAS'')', '2016-08-19 16:28:30'),
(3341, '::1', 'Linux', 'Google Chrome', 'admin@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''AS'')', '2016-08-19 16:33:30'),
(3342, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-19 16:42:45'),
(3343, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-19 16:49:28'),
(3344, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-19 16:50:11'),
(3345, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-19 16:50:49'),
(3346, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-19 16:55:59'),
(3347, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-19 16:56:10'),
(3348, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-19 16:56:19'),
(3349, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2016-08-19 19:03:45'),
(3350, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-19 19:04:06'),
(3351, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-19 19:41:22'),
(3352, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set sesion_abierta=(sesion_abierta+1) where (nombre_usuario=''V123456789'')', '2016-08-19 19:41:23'),
(3353, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-19 19:41:53'),
(3354, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set sesion_abierta=(sesion_abierta+1) where (nombre_usuario=''V123456789'')', '2016-08-19 19:41:54'),
(3355, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set sesion_abierta=(CASE WHEN sesion_abierta = 0 THEN 0 ELSE sesion_abierta-1 END) where (nombre_usuario=''V123456789'')', '2016-08-19 19:43:50'),
(3356, '::1', 'Linux', 'Mozilla Firefox', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-19 19:44:20'),
(3357, '::1', 'Linux', 'Mozilla Firefox', 'admin@localhost', 'V123456789', 'update tusuario set sesion_abierta=(sesion_abierta+1) where (nombre_usuario=''V123456789'')', '2016-08-19 19:44:20'),
(3358, '::1', 'Linux', 'Mozilla Firefox', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-19 19:53:04'),
(3359, '::1', 'Linux', 'Mozilla Firefox', 'admin@localhost', 'V123456789', 'update tusuario set sesion_abierta=(sesion_abierta+1) where (nombre_usuario=''V123456789'')', '2016-08-19 19:53:04'),
(3360, '::1', 'Linux', 'Mozilla Firefox', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-19 20:01:06'),
(3361, '::1', 'Linux', 'Mozilla Firefox', 'admin@localhost', 'V123456789', 'update tusuario set sesion_abierta=(sesion_abierta+1) where (nombre_usuario=''V123456789'')', '2016-08-19 20:01:07'),
(3362, '::1', 'Linux', 'Mozilla Firefox', 'admin@localhost', 'V123456789', 'update tusuario set sesion_abierta=(CASE WHEN sesion_abierta = 0 THEN 0 ELSE sesion_abierta-1 END) where (nombre_usuario=''V123456789'')', '2016-08-19 20:01:32'),
(3363, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-19 20:42:26'),
(3364, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set sesion_abierta=(sesion_abierta+1),fecha_ultimasesion = CURDATE() where (nombre_usuario=''V123456789'')', '2016-08-19 20:42:27'),
(3365, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tconfiguracion SET descripcion=''POR DEFECTO'',longitud_minclave=6\n ,longitud_maxclave=10,cantidad_letrasmayusculas=1\n ,cantidad_letrasminusculas=1,cantidad_caracteresespeciales=1\n  ,cantidad_numeros=1,dias_vigenciaclave=365,numero_ultimasclaves=1\n ,dias_aviso=10,intentos_fallidos=99999999,numero_preguntas=3\n  ,numero_preguntasaresponder=2,dias_inactividad=9999999,maxsesion=5 \n WHERE codigo_configuracion=''1''', '2016-08-19 20:58:11'),
(3366, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tconfiguracion SET descripcion=''DOCENTES'',longitud_minclave=4\n  ,longitud_maxclave=8,cantidad_letrasmayusculas=0\n  ,cantidad_letrasminusculas=1,cantidad_caracteresespeciales=0\n  ,cantidad_numeros=0,dias_vigenciaclave=180,numero_ultimasclaves=3\n ,dias_aviso=10,intentos_fallidos=5,numero_preguntas=3\n ,numero_preguntasaresponder=1,dias_inactividad=120,maxsesion=2 \n WHERE codigo_configuracion=''2''', '2016-08-19 20:58:26'),
(3367, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tservicio (descripcion,url,orden,codigo_modulo) values (''CONFIGURACIÓN DEL NEGOCIO'',''CONFIGURACION_NEGOCIO'',''0'',''6'');', '2016-08-19 21:00:28'),
(3368, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tperfil set descripcion=''ADMINISTRADOR'',codigo_configuracion=1 where (codigo_perfil=''1'');', '2016-08-19 21:00:43'),
(3369, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''1'');', '2016-08-19 21:00:44'),
(3370, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',1,1),(''1'',1,2),(''1'',1,3),(''1'',1,4),(''1'',1,5),(''1'',1,6),(''1'',1,7),(''1'',2,1),(''1'',2,2),(''1'',2,3),(''1'',2,4),(''1'',2,5),(''1'',2,6),(''1'',2,7),(''1'',3,1),(''1'',3,2),(''1'',3,3),(''1'',3,4),(''1'',3,5),(''1'',3,6),(''1'',3,7),(''1'',4,1),(''1'',4,2),(''1'',4,3),(''1'',4,4),(''1'',4,5),(''1'',4,6),(''1'',4,7),(''1'',5,1),(''1'',5,2),(''1'',5,3),(''1'',5,4),(''1'',5,5),(''1'',5,6),(''1'',5,7),(''1'',6,1),(''1'',6,2),(''1'',6,3),(''1'',6,4),(''1'',6,5),(''1'',6,6),(''1'',6,7),(''1'',7,1),(''1'',7,2),(''1'',7,3),(''1'',7,4),(''1'',7,5),(''1'',7,6),(''1'',7,7),(''1'',8,1),(''1'',8,2),(''1'',8,3),(''1'',8,4),(''1'',8,5),(''1'',8,6),(''1'',8,7),(''1'',9,1),(''1'',9,2),(''1'',9,3),(''1'',9,4),(''1'',9,5),(''1'',9,6),(''1'',9,7),(''1'',10,1),(''1'',10,2),(''1'',10,3),(''1'',10,4),(''1'',10,5),(''1'',10,6),(''1'',10,7),(''1'',11,1),(''1'',11,2),(''1'',11,3),(''1'',11,4),(''1'',11,5),(''1'',11,6),(''1'',11,7),(''1'',12,1),(''1'',12,2),(''1'',12,3),(''1'',12,4),(''1'',12,5),(''1'',12,6),(''1'',12,7),(''1'',13,1),(''1'',13,2),(''1'',13,3),(''1'',13,4),(''1'',13,5),(''1'',13,6),(''1'',13,7),(''1'',14,1),(''1'',14,2),(''1'',14,3),(''1'',14,4),(''1'',14,5),(''1'',14,6),(''1'',14,7),(''1'',15,1),(''1'',15,2),(''1'',15,3),(''1'',15,4),(''1'',15,5),(''1'',15,6),(''1'',15,7),(''1'',16,1),(''1'',16,2),(''1'',16,3),(''1'',16,4),(''1'',16,5),(''1'',16,6),(''1'',16,7),(''1'',19,1),(''1'',19,2),(''1'',19,3),(''1'',19,4),(''1'',19,5),(''1'',19,6),(''1'',19,7),(''1'',20,1),(''1'',20,2),(''1'',20,3),(''1'',20,4),(''1'',20,5),(''1'',20,6),(''1'',20,7),(''1'',21,1),(''1'',21,2),(''1'',21,3),(''1'',21,4),(''1'',21,5),(''1'',21,6),(''1'',21,7),(''1'',22,1),(''1'',22,2),(''1'',22,3),(''1'',22,4),(''1'',22,5),(''1'',22,6),(''1'',22,7),(''1'',23,1),(''1'',23,2),(''1'',23,3),(''1'',23,4),(''1'',23,5),(''1'',23,6),(''1'',23,7),(''1'',24,1),(''1'',24,2),(''1'',24,3),(''1'',24,4),(''1'',24,5),(''1'',24,6),(''1'',24,7),(''1'',25,1),(''1'',25,2),(''1'',25,3),(''1'',25,4),(''1'',25,5),(''1'',25,6),(''1'',25,7),(''1'',26,1),(''1'',26,2),(''1'',26,3),(''1'',26,4),(''1'',26,5),(''1'',26,6),(''1'',26,7),(''1'',27,1),(''1'',27,2),(''1'',27,3),(''1'',27,4),(''1'',27,5),(''1'',27,6),(''1'',27,7),(''1'',36,1),(''1'',36,2),(''1'',36,3),(''1'',36,4),(''1'',36,5),(''1'',36,6),(''1'',36,7),(''1'',28,1),(''1'',28,2),(''1'',28,3),(''1'',28,4),(''1'',28,5),(''1'',28,6),(''1'',28,7),(''1'',29,1),(''1'',29,2),(''1'',29,3),(''1'',29,4),(''1'',29,5),(''1'',29,6),(''1'',29,7),(''1'',30,1),(''1'',30,2),(''1'',30,3),(''1'',30,4),(''1'',30,5),(''1'',30,6),(''1'',30,7),(''1'',31,1),(''1'',31,2),(''1'',31,3),(''1'',31,4),(''1'',31,5),(''1'',31,6),(''1'',31,7),(''1'',32,1),(''1'',32,2),(''1'',32,3),(''1'',32,4),(''1'',32,5),(''1'',32,6),(''1'',32,7),(''1'',33,1),(''1'',33,2),(''1'',33,3),(''1'',33,4),(''1'',33,5),(''1'',33,6),(''1'',33,7),(''1'',34,1),(''1'',34,2),(''1'',34,3),(''1'',34,4),(''1'',34,5),(''1'',34,6),(''1'',34,7),(''1'',35,1),(''1'',35,2),(''1'',35,3),(''1'',35,4),(''1'',35,5),(''1'',35,6),(''1'',35,7),(''1'',37,1),(''1'',37,2),(''1'',37,3),(''1'',37,4),(''1'',37,5),(''1'',37,6),(''1'',37,7),(''1'',38,1),(''1'',38,2),(''1'',38,3),(''1'',38,4),(''1'',38,5),(''1'',38,6),(''1'',38,7),(''1'',17,1),(''1'',17,2),(''1'',17,3),(''1'',17,4),(''1'',17,5),(''1'',17,6),(''1'',17,7),(''1'',18,1),(''1'',18,2),(''1'',18,3),(''1'',18,4),(''1'',18,5),(''1'',18,6),(''1'',18,7);', '2016-08-19 21:00:44'),
(3371, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tconfiguracion_negocio set inscripcion_abierta=''Y'',carga_nota_abierta=''Y'',\n    nota_minima=1.00,nota_maxima=20.00,edad_maxima_primer_anio=15,nota_aprobacion=10.00 \n    where (codigo_configuracion_negocio=''1'');', '2016-08-19 22:22:50'),
(3372, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tconfiguracion_negocio (inscripcion_abierta,carga_nota_abierta,nota_minima,nota_maxima,edad_maxima_primer_anio,nota_aprobacion) \n    values (''Y'',''Y'',1,20,15,10);', '2016-08-19 22:23:32'),
(3373, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set sesion_abierta=(CASE WHEN sesion_abierta = 0 THEN 0 ELSE sesion_abierta-1 END) where (nombre_usuario=''V123456789'')', '2016-08-19 22:24:09'),
(3374, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-19 22:56:12'),
(3375, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set sesion_abierta=(sesion_abierta+1),fecha_ultimasesion = CURDATE() where (nombre_usuario=''V123456789'')', '2016-08-19 22:56:12'),
(3376, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tconfiguracion_negocio set inscripcion_abierta=''N'',carga_nota_abierta=''Y'',\n    nota_minima=1.00,nota_maxima=20.00,edad_maxima_primer_anio=15,nota_aprobacion=10.00 \n    where (codigo_configuracion_negocio=''2'');', '2016-08-19 23:03:59'),
(3377, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tconfiguracion_negocio set inscripcion_abierta=''Y'',carga_nota_abierta=''Y'',\n    nota_minima=1.00,nota_maxima=20.00,edad_maxima_primer_anio=15,nota_aprobacion=10.00 \n    where (codigo_configuracion_negocio=''2'');', '2016-08-19 23:04:11'),
(3378, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tconfiguracion_negocio set inscripcion_abierta=''Y'',carga_nota_abierta=''Y'',\n    nota_minima=1.00,nota_maxima=20.00,edad_maxima_primer_anio=18,nota_aprobacion=10.00 \n    where (codigo_configuracion_negocio=''2'');', '2016-08-19 23:26:30'),
(3379, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tconfiguracion_negocio set inscripcion_abierta=''Y'',carga_nota_abierta=''Y'',\n    nota_minima=1.00,nota_maxima=20.00,edad_maxima_primer_anio=14,nota_aprobacion=10.00 \n    where (codigo_configuracion_negocio=''2'');', '2016-08-19 23:26:47'),
(3380, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tconfiguracion_negocio set inscripcion_abierta=''Y'',carga_nota_abierta=''Y'',\n    nota_minima=1.00,nota_maxima=20.00,edad_maxima_primer_anio=15,nota_aprobacion=10.00 \n    where (codigo_configuracion_negocio=''2'');', '2016-08-19 23:26:51'),
(3381, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tpersona SET cedula=''V252132343'',nombres=''JOSE'',apellidos=''LOPEZ'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''13/01/2004'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''N/A'',telefono_habitacion=''02554564532'',telefono_movil='''',email='''',esestudiante=''Y'',esrepresentante=''N'' WHERE cedula=''V252132343'';', '2016-08-19 23:41:28'),
(3382, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_escolar='''',lateralidad=''D'',codigo_canaima='''',canaima_operativa=''Y'',peso=35.5,estatura=''135'',codigo_plantel=''12345645343'',grado_escolar=''1'',seccion=''SECCB'' WHERE cedula_estudiante =''V252132343'';', '2016-08-19 23:41:28'),
(3383, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tpersona SET cedula=''V11111231'',nombres=''LAURA'',apellidos=''JIMENEZ'',genero=''F'',fecha_nacimiento=STR_TO_DATE(''20/01/2000'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''ACARIGUA'',telefono_habitacion=''02554564532'',telefono_movil='''',email=''laura_maria_jimenez@hotmail.com'',esestudiante=''Y'',esrepresentante=''N'' WHERE cedula=''V11111231'';', '2016-08-19 23:42:20'),
(3384, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_escolar='''',lateralidad=''D'',codigo_canaima='''',canaima_operativa=''N'',peso=50,estatura=''156'',codigo_plantel=''1249834983H'',grado_escolar=''1'',seccion='''' WHERE cedula_estudiante =''V11111231'';', '2016-08-19 23:42:20'),
(3386, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tpersona SET cedula=''V111121212'',nombres=''LAURA'',apellidos=''JIMENEZ'',genero=''F'',fecha_nacimiento=STR_TO_DATE(''20/01/2000'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''ACARIGUA'',telefono_habitacion=''02554564532'',telefono_movil='''',email=''laura_maria_jimenez@hotmail.com'',esestudiante=''Y'',esrepresentante=''N'' WHERE cedula=''V111121212'';', '2016-08-19 23:45:11'),
(3387, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_escolar='''',lateralidad=''D'',codigo_canaima='''',canaima_operativa=''N'',peso=50,estatura=''156'',codigo_plantel=''1249834983H'',grado_escolar=''1'',seccion=''2'' WHERE cedula_estudiante =''V111121212'';', '2016-08-19 23:45:11'),
(3388, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tpersona SET cedula=''V25347014'',nombres=''ANYELIS'',apellidos=''SALAZ'',genero=''F'',fecha_nacimiento=STR_TO_DATE(''30/01/2002'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''ACARIGUA'',telefono_habitacion=''02554564532'',telefono_movil='''',email=''anyelisalazar@hotmail.com'',esestudiante=''Y'',esrepresentante=''N'' WHERE cedula=''V25347014'';', '2016-08-19 23:45:36'),
(3389, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_escolar='''',lateralidad=''D'',codigo_canaima='''',canaima_operativa=''N'',peso=50,estatura=''165'',codigo_plantel=''21345687654'',grado_escolar=''1'',seccion=''2'' WHERE cedula_estudiante =''V25347014'';', '2016-08-19 23:45:36'),
(3390, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tpersona SET cedula=''V24935226'',nombres=''OSCARY'',apellidos=''SOTO'',genero=''F'',fecha_nacimiento=STR_TO_DATE(''05/01/2006'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''ACARIGUA'',telefono_habitacion=''02556363333'',telefono_movil='''',email=''oscarysoto@hotmail.com'',esestudiante=''Y'',esrepresentante=''N'' WHERE cedula=''V24935226'';', '2016-08-19 23:45:56'),
(3391, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_escolar='''',lateralidad=''D'',codigo_canaima='''',canaima_operativa=''N'',peso=50,estatura=''162'',codigo_plantel=''12345645343'',grado_escolar=''1'',seccion=''SECC'' WHERE cedula_estudiante =''V24935226'';', '2016-08-19 23:45:56'),
(3392, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tpersona SET cedula=''V25347013'',nombres=''ANYELISMER'',apellidos=''PERZ'',genero=''F'',fecha_nacimiento=STR_TO_DATE(''19/01/2005'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''ACARIGUA'',telefono_habitacion=''02556373737'',telefono_movil='''',email=''anyelismer@hotmail.com'',esestudiante=''Y'',esrepresentante=''N'' WHERE cedula=''V25347013'';', '2016-08-19 23:46:17'),
(3393, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_escolar='''',lateralidad=''D'',codigo_canaima='''',canaima_operativa=''N'',peso=55,estatura=''163'',codigo_plantel=''1249834983H'',grado_escolar=''1'',seccion=''SECC'' WHERE cedula_estudiante =''V25347013'';', '2016-08-19 23:46:17'),
(3394, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tpersona SET cedula=''V12312312'',nombres=''JAVIER JR'',apellidos=''MARTIN'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''21/01/2004'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''N/A'',telefono_habitacion=''02552343423'',telefono_movil='''',email='''',esestudiante=''Y'',esrepresentante=''N'' WHERE cedula=''V12312312'';', '2016-08-19 23:46:34'),
(3395, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_escolar='''',lateralidad=''D'',codigo_canaima=''124321VS123123'',canaima_operativa=''Y'',peso=123.4,estatura=''123'',codigo_plantel=''1249834983H'',grado_escolar=''1'',seccion=''SECC'' WHERE cedula_estudiante =''V12312312'';', '2016-08-19 23:46:34'),
(3396, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tpersona SET cedula=''V30484143'',nombres=''DANIEL'',apellidos=''RODRIGUEZ'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''03/03/2002'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''ACARIGUA'',telefono_habitacion=''02554564532'',telefono_movil='''',email=''daniel@hotmail.com'',esestudiante=''Y'',esrepresentante=''N'' WHERE cedula=''V30484143'';', '2016-08-19 23:46:47'),
(3397, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_escolar='''',lateralidad=''D'',codigo_canaima='''',canaima_operativa=''N'',peso=50,estatura=''160'',codigo_plantel=''1249834983H'',grado_escolar=''1'',seccion=''SECC'' WHERE cedula_estudiante =''V30484143'';', '2016-08-19 23:46:47'),
(3398, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tpersona SET cedula=''V30363014'',nombres=''MARIA ALEJANDRA'',apellidos=''CASTRO BALZA'',genero=''F'',fecha_nacimiento=STR_TO_DATE(''28/01/1999'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''ACARIGUA'',telefono_habitacion=''02554564532'',telefono_movil='''',email=''mariab@hotmail.com'',esestudiante=''Y'',esrepresentante=''N'' WHERE cedula=''V30363014'';', '2016-08-19 23:46:58'),
(3399, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_escolar='''',lateralidad=''D'',codigo_canaima='''',canaima_operativa=''N'',peso=50,estatura=''158'',codigo_plantel=''12345645343'',grado_escolar=''1'',seccion=''1'' WHERE cedula_estudiante =''V30363014'';', '2016-08-19 23:46:58'),
(3400, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tpersona SET cedula=''V105463555'',nombres=''OSCAR'',apellidos=''SOTO'',genero=''M'',fecha_nacimiento=STR_TO_DATE(''09/01/1980'',''%d/%m/%Y''),lugar_nacimiento=''1'',direccion=''ACARIGUA'',telefono_habitacion=''02554567845'',telefono_movil=''04242345678'',email=''oscar@hotmail.com'',esestudiante=''N'',esrepresentante=''Y'' WHERE cedula=''V105463555'';', '2016-08-19 23:48:21'),
(3401, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'UPDATE tproceso_inscripcion SET cedula_docente=''V13131313'',cedula_representante=''V105463555'',codigo_parentesco=''2'',lugar_trabajo=''1'',proceso_completado=''Y''WHERE cedula_estudiante=''V24935226'';', '2016-08-19 23:48:21'),
(3402, '::1', 'Linux', 'Google Chrome', 'admin@localhost', '', 'update tusuario set sesion_abierta=(CASE WHEN sesion_abierta = 0 THEN 0 ELSE sesion_abierta-1 END) where (nombre_usuario='''')', '2016-08-20 00:41:24'),
(3403, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2016-08-21 15:22:40'),
(3404, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set sesion_abierta=(sesion_abierta+1),fecha_ultimasesion = CURDATE() where (nombre_usuario=''V123456789'')', '2016-08-21 15:22:40'),
(3405, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tservicio (descripcion,url,orden,codigo_modulo) values (''AMBIENTE DE CLASES'',''AMBIENTE'',''3'',''3'');', '2016-08-21 16:07:30'),
(3406, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tservicio (descripcion,url,orden,codigo_modulo) values (''BLOQUE DE HORA'',''BLOQUE_HORA'',''4'',''3'');', '2016-08-21 16:08:22'),
(3407, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tmodulo (descripcion,icono,orden) values (''CONTROL DE HORARIOS'',''icon-cog'',''4'');', '2016-08-21 16:09:36'),
(3408, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tservicio set descripcion=''BLOQUE DE HORA'',url=''BLOQUE_HORA'',orden=''1'',codigo_modulo=''8'' where (codigo_servicio=''40'');', '2016-08-21 16:09:58'),
(3409, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tservicio (descripcion,url,orden,codigo_modulo) values (''HORARIO'',''HORARIO'',''2'',''8'');', '2016-08-21 16:10:16'),
(3410, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tperfil set descripcion=''ADMINISTRADOR'',codigo_configuracion=1 where (codigo_perfil=''1'');', '2016-08-21 16:10:29'),
(3411, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''1'');', '2016-08-21 16:10:29'),
(3412, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES (''1'',1,1),(''1'',1,2),(''1'',1,3),(''1'',1,4),(''1'',1,5),(''1'',1,6),(''1'',1,7),(''1'',2,1),(''1'',2,2),(''1'',2,3),(''1'',2,4),(''1'',2,5),(''1'',2,6),(''1'',2,7),(''1'',3,1),(''1'',3,2),(''1'',3,3),(''1'',3,4),(''1'',3,5),(''1'',3,6),(''1'',3,7),(''1'',4,1),(''1'',4,2),(''1'',4,3),(''1'',4,4),(''1'',4,5),(''1'',4,6),(''1'',4,7),(''1'',5,1),(''1'',5,2),(''1'',5,3),(''1'',5,4),(''1'',5,5),(''1'',5,6),(''1'',5,7),(''1'',6,1),(''1'',6,2),(''1'',6,3),(''1'',6,4),(''1'',6,5),(''1'',6,6),(''1'',6,7),(''1'',7,1),(''1'',7,2),(''1'',7,3),(''1'',7,4),(''1'',7,5),(''1'',7,6),(''1'',7,7),(''1'',8,1),(''1'',8,2),(''1'',8,3),(''1'',8,4),(''1'',8,5),(''1'',8,6),(''1'',8,7),(''1'',9,1),(''1'',9,2),(''1'',9,3),(''1'',9,4),(''1'',9,5),(''1'',9,6),(''1'',9,7),(''1'',10,1),(''1'',10,2),(''1'',10,3),(''1'',10,4),(''1'',10,5),(''1'',10,6),(''1'',10,7),(''1'',11,1),(''1'',11,2),(''1'',11,3),(''1'',11,4),(''1'',11,5),(''1'',11,6),(''1'',11,7),(''1'',12,1),(''1'',12,2),(''1'',12,3),(''1'',12,4),(''1'',12,5),(''1'',12,6),(''1'',12,7),(''1'',13,1),(''1'',13,2),(''1'',13,3),(''1'',13,4),(''1'',13,5),(''1'',13,6),(''1'',13,7),(''1'',14,1),(''1'',14,2),(''1'',14,3),(''1'',14,4),(''1'',14,5),(''1'',14,6),(''1'',14,7),(''1'',15,1),(''1'',15,2),(''1'',15,3),(''1'',15,4),(''1'',15,5),(''1'',15,6),(''1'',15,7),(''1'',39,1),(''1'',39,2),(''1'',39,3),(''1'',39,4),(''1'',39,5),(''1'',39,6),(''1'',39,7),(''1'',16,1),(''1'',16,2),(''1'',16,3),(''1'',16,4),(''1'',16,5),(''1'',16,6),(''1'',16,7),(''1'',19,1),(''1'',19,2),(''1'',19,3),(''1'',19,4),(''1'',19,5),(''1'',19,6),(''1'',19,7),(''1'',20,1),(''1'',20,2),(''1'',20,3),(''1'',20,4),(''1'',20,5),(''1'',20,6),(''1'',20,7),(''1'',21,1),(''1'',21,2),(''1'',21,3),(''1'',21,4),(''1'',21,5),(''1'',21,6),(''1'',21,7),(''1'',22,1),(''1'',22,2),(''1'',22,3),(''1'',22,4),(''1'',22,5),(''1'',22,6),(''1'',22,7),(''1'',23,1),(''1'',23,2),(''1'',23,3),(''1'',23,4),(''1'',23,5),(''1'',23,6),(''1'',23,7),(''1'',24,1),(''1'',24,2),(''1'',24,3),(''1'',24,4),(''1'',24,5),(''1'',24,6),(''1'',24,7),(''1'',25,1),(''1'',25,2),(''1'',25,3),(''1'',25,4),(''1'',25,5),(''1'',25,6),(''1'',25,7),(''1'',26,1),(''1'',26,2),(''1'',26,3),(''1'',26,4),(''1'',26,5),(''1'',26,6),(''1'',26,7),(''1'',27,1),(''1'',27,2),(''1'',27,3),(''1'',27,4),(''1'',27,5),(''1'',27,6),(''1'',27,7),(''1'',36,1),(''1'',36,2),(''1'',36,3),(''1'',36,4),(''1'',36,5),(''1'',36,6),(''1'',36,7),(''1'',28,1),(''1'',28,2),(''1'',28,3),(''1'',28,4),(''1'',28,5),(''1'',28,6),(''1'',28,7),(''1'',29,1),(''1'',29,2),(''1'',29,3),(''1'',29,4),(''1'',29,5),(''1'',29,6),(''1'',29,7),(''1'',30,1),(''1'',30,2),(''1'',30,3),(''1'',30,4),(''1'',30,5),(''1'',30,6),(''1'',30,7),(''1'',31,1),(''1'',31,2),(''1'',31,3),(''1'',31,4),(''1'',31,5),(''1'',31,6),(''1'',31,7),(''1'',32,1),(''1'',32,2),(''1'',32,3),(''1'',32,4),(''1'',32,5),(''1'',32,6),(''1'',32,7),(''1'',33,1),(''1'',33,2),(''1'',33,3),(''1'',33,4),(''1'',33,5),(''1'',33,6),(''1'',33,7),(''1'',34,1),(''1'',34,2),(''1'',34,3),(''1'',34,4),(''1'',34,5),(''1'',34,6),(''1'',34,7),(''1'',35,1),(''1'',35,2),(''1'',35,3),(''1'',35,4),(''1'',35,5),(''1'',35,6),(''1'',35,7),(''1'',37,1),(''1'',37,2),(''1'',37,3),(''1'',37,4),(''1'',37,5),(''1'',37,6),(''1'',37,7),(''1'',38,1),(''1'',38,2),(''1'',38,3),(''1'',38,4),(''1'',38,5),(''1'',38,6),(''1'',38,7),(''1'',17,1),(''1'',17,2),(''1'',17,3),(''1'',17,4),(''1'',17,5),(''1'',17,6),(''1'',17,7),(''1'',18,1),(''1'',18,2),(''1'',18,3),(''1'',18,4),(''1'',18,5),(''1'',18,6),(''1'',18,7),(''1'',40,1),(''1'',40,2),(''1'',40,3),(''1'',40,4),(''1'',40,5),(''1'',40,6),(''1'',40,7),(''1'',41,1),(''1'',41,2),(''1'',41,3),(''1'',41,4),(''1'',41,5),(''1'',41,6),(''1'',41,7);', '2016-08-21 16:10:30'),
(3413, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tambiente (descripcion,tipo_ambiente) values (''AULA 1'',''1'');', '2016-08-21 17:10:24'),
(3414, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tambiente (descripcion,tipo_ambiente) values (''AULA 2'',''1'');', '2016-08-21 17:10:30'),
(3415, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tambiente (descripcion,tipo_ambiente) values (''CIENCIAS DE LA NATURALEZA'',''3'');', '2016-08-21 17:10:48'),
(3416, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tambiente (descripcion,tipo_ambiente) values (''CANCHA MULTIPLE'',''2'');', '2016-08-21 17:11:16'),
(3417, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tpais (descripcion) values (''RECIBIMIENTO - ACTO CÍVICO'');', '2016-08-21 17:38:27');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(3418, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tbloque_hora (descripcion,hora_inicio,hora_fin,turno,receso) values (''RECIBIMIENTO - ACTO CÍVICO'',''07:00'',''07:30'',''M'',''Y'');', '2016-08-21 18:11:56'),
(3419, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tbloque_hora (descripcion,hora_inicio,hora_fin,turno,receso) values (''B-1'',''07:30'',''09:00'',''M'',''N'');', '2016-08-21 18:13:06'),
(3420, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tbloque_hora (descripcion,hora_inicio,hora_fin,turno,receso) values (''RECESO'',''09:00'',''09:15'',''M'',''Y'');', '2016-08-21 18:13:39'),
(3421, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tbloque_hora (descripcion,hora_inicio,hora_fin,turno,receso) values (''B-2'',''09:15'',''10:45'',''M'',''N'');', '2016-08-21 18:15:11'),
(3422, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tbloque_hora (descripcion,hora_inicio,hora_fin,turno,receso) values (''B-3'',''10:45'',''12:15'',''M'',''N'');', '2016-08-21 18:15:44'),
(3423, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tbloque_hora (descripcion,hora_inicio,hora_fin,turno,receso) values (''ALMUERZO'',''12:15'',''13:15'',''T'',''Y'');', '2016-08-21 18:16:31'),
(3424, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tbloque_hora (descripcion,hora_inicio,hora_fin,turno,receso) values (''B-4'',''13:15'',''14:45'',''T'',''N'');', '2016-08-21 18:17:14'),
(3425, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tbloque_hora (descripcion,hora_inicio,hora_fin,turno,receso) values (''RECESO'',''14:45'',''14:55'',''T'',''Y'');', '2016-08-21 18:17:49'),
(3426, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tbloque_hora (descripcion,hora_inicio,hora_fin,turno,receso) values (''B-5'',''14:55'',''16:30'',''T'',''N'');', '2016-08-21 18:18:27'),
(3427, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO thorario(dia,codigo_bloque_hora,codigo_ambiente,codigo_ano_academico,codigo_materia,seccion,cedula_docente)\r\n			VALUES (''1'',''2'',''1'',''1'',''INGL001'',''1'',''V121212121'')', '2016-08-21 20:23:09'),
(3428, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'DELETE FROM thorario WHERE codigo_ambiente=''1'' and seccion=''1''', '2016-08-21 20:24:43'),
(3429, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO thorario(dia,codigo_bloque_hora,codigo_ambiente,codigo_ano_academico,codigo_materia,seccion,cedula_docente)\r\n			VALUES (''1'',''2'',''1'',''1'',''INGL001'',''1'',''V121212121'')', '2016-08-21 20:24:43'),
(3430, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'DELETE FROM thorario WHERE codigo_ambiente=''1'' and seccion=''1''', '2016-08-21 20:36:04'),
(3431, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO thorario(dia,codigo_bloque_hora,codigo_ambiente,codigo_ano_academico,codigo_materia,seccion,cedula_docente)\r\n			VALUES (''1'',''2'',''1'',''1'',''INGL001'',''1'',''V121212121'')', '2016-08-21 20:36:04'),
(3432, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tseccion set seccion=''SECC'',descripcion=''PRIMERO B'',turno=''M'',grado_escolar=''1'', capacidad_min=''10'',capacidad_max=''40'' where (seccion=''SECC'');', '2016-08-21 20:37:07'),
(3433, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'DELETE FROM tmateria_seccion_docente WHERE (seccion=''SECC'');', '2016-08-21 20:37:08'),
(3434, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tmateria_seccion_docente(seccion,codigo_materia,cedula_docente) VALUES (''SECC'',''INGL001'',''V121212121'');', '2016-08-21 20:37:08'),
(3435, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO thorario(dia,codigo_bloque_hora,codigo_ambiente,codigo_ano_academico,codigo_materia,seccion,cedula_docente)\r\n			VALUES (''1'',''4'',''1'',''1'',''INGL001'',''SECC'',''V121212121'')', '2016-08-21 20:37:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbloque_hora`
--

DROP TABLE IF EXISTS `tbloque_hora`;
CREATE TABLE IF NOT EXISTS `tbloque_hora` (
`codigo_bloque_hora` int(11) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `receso` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `descripcion` varchar(60) COLLATE utf8_spanish_ci DEFAULT NULL,
  `turno` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'M',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tbloque_hora`
--

INSERT INTO `tbloque_hora` (`codigo_bloque_hora`, `hora_inicio`, `hora_fin`, `receso`, `descripcion`, `turno`, `fecha_desactivacion`) VALUES
(1, '07:00:00', '07:30:00', 'Y', 'RECIBIMIENTO - ACTO CÍVICO', 'M', NULL),
(2, '07:30:00', '09:00:00', 'N', 'B-1', 'M', NULL),
(3, '09:00:00', '09:15:00', 'Y', 'RECESO', 'M', NULL),
(4, '09:15:00', '10:45:00', 'N', 'B-2', 'M', NULL),
(5, '10:45:00', '12:15:00', 'N', 'B-3', 'M', NULL),
(6, '12:15:00', '13:15:00', 'Y', 'ALMUERZO', 'T', NULL),
(7, '13:15:00', '14:45:00', 'N', 'B-4', 'T', NULL),
(8, '14:45:00', '14:55:00', 'Y', 'RECESO', 'T', NULL),
(9, '14:55:00', '16:30:00', 'N', 'B-5', 'T', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcargo`
--

DROP TABLE IF EXISTS `tcargo`;
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
(2, 'DOCENTE', NULL),
(3, 'DIRECTOR(A)', NULL),
(4, 'BIBLIOTECARIO', NULL),
(5, 'OBRERO', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tconfiguracion`
--

DROP TABLE IF EXISTS `tconfiguracion`;
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

DROP TABLE IF EXISTS `tconfiguracion_negocio`;
CREATE TABLE IF NOT EXISTS `tconfiguracion_negocio` (
`codigo_configuracion_negocio` int(11) NOT NULL,
  `inscripcion_abierta` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Y',
  `carga_nota_abierta` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Y',
  `edad_maxima_primer_anio` int(11) DEFAULT '0',
  `nota_minima` float(10,2) NOT NULL DEFAULT '1.00',
  `nota_maxima` float(10,2) NOT NULL DEFAULT '20.00',
  `nota_aprobacion` float(10,2) NOT NULL DEFAULT '10.00',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tconfiguracion_negocio`
--

INSERT INTO `tconfiguracion_negocio` (`codigo_configuracion_negocio`, `inscripcion_abierta`, `carga_nota_abierta`, `edad_maxima_primer_anio`, `nota_minima`, `nota_maxima`, `nota_aprobacion`, `fecha_desactivacion`) VALUES
(2, 'Y', 'Y', 15, 1.00, 20.00, 10.00, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcontrasena`
--

DROP TABLE IF EXISTS `tcontrasena`;
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
('V123456789', '1f82ea75c5cc526729e2d581aeb3aeccfef4407e', 0, '2016-01-09 20:19:04'),
('V123456789', '791acae9d7efbefc2b489747af71cc2f6870554d', 0, '2016-01-14 14:24:57'),
('V123456789', 'bcd5c3e4b7e24e1ec1c57a32ea101a2c114dc364', 0, '2016-01-14 14:29:02'),
('V123456789', '47923b00e914a6343c38d79f78b45959fc4049e9', 0, '2016-01-17 17:49:42'),
('V13131313', '1f82ea75c5cc526729e2d581aeb3aeccfef4407e', 0, '2016-01-15 01:26:08'),
('V13131313', '791acae9d7efbefc2b489747af71cc2f6870554d', 2, '2016-01-15 16:02:45'),
('V121212121', '1f82ea75c5cc526729e2d581aeb3aeccfef4407e', 0, '2016-01-15 01:41:06'),
('V121212121', '791acae9d7efbefc2b489747af71cc2f6870554d', 1, '2016-01-15 01:41:06'),
('V123456789', '7e199bc85c0fdded08fe2bc5375527e89d1e9f6d', 0, '2016-08-16 01:37:05'),
('V123456789', '2e5f402b1f0117f9f7217a3e8cbff136b1e304ad', 1, '2016-08-16 01:37:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcontrol_notas`
--

DROP TABLE IF EXISTS `tcontrol_notas`;
CREATE TABLE IF NOT EXISTS `tcontrol_notas` (
`codigo_controlnotas` int(11) NOT NULL,
  `codigo_msd` int(11) NOT NULL,
  `cedula_estudiante` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_lapso` int(11) NOT NULL,
  `notafinal` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tcontrol_notas`
--

INSERT INTO `tcontrol_notas` (`codigo_controlnotas`, `codigo_msd`, `cedula_estudiante`, `codigo_lapso`, `notafinal`) VALUES
(1, 2, 'V252132343', 2, 12),
(4, 1, 'V252132343', 2, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testado`
--

DROP TABLE IF EXISTS `testado`;
CREATE TABLE IF NOT EXISTS `testado` (
`codigo_estado` int(11) NOT NULL,
  `descripcion` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_pais` int(11) NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `testado`
--

INSERT INTO `testado` (`codigo_estado`, `descripcion`, `codigo_pais`, `fecha_desactivacion`) VALUES
(1, 'PORTUGUESA', 1, NULL),
(2, 'LARA', 1, NULL),
(3, 'AMAZONAS', 1, NULL),
(4, 'ANZOATEGUI', 1, NULL),
(5, 'APURE', 1, NULL),
(6, 'ARAGUA', 1, NULL),
(7, 'BOLIVAR', 1, NULL),
(8, 'CARABOBO', 1, NULL),
(9, 'COJEDES', 1, NULL),
(10, 'DELTA MACURO', 1, NULL),
(11, 'MERIDA', 1, NULL),
(12, 'DISTRITO CAPITAL', 1, NULL),
(13, 'FALCON', 1, NULL),
(14, 'GUARICO', 1, NULL),
(15, 'MIRANDA', 1, NULL),
(16, 'MONAGAS', 1, NULL),
(17, 'BARINAS', 1, NULL),
(18, 'NUEVA ESPARTA', 1, NULL),
(19, 'TACHIRA', 1, NULL),
(20, 'TRUJILLO', 1, NULL),
(21, 'VARGAS', 1, NULL),
(22, 'YARACUY', 1, NULL),
(23, 'ZULIA', 1, NULL),
(24, 'SUCRE', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `thorario`
--

DROP TABLE IF EXISTS `thorario`;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `thorario`
--

INSERT INTO `thorario` (`codigo_horario`, `dia`, `codigo_bloque_hora`, `codigo_ambiente`, `codigo_ano_academico`, `codigo_materia`, `seccion`, `cedula_docente`, `fecha_desactivacion`) VALUES
(3, 1, 2, 1, 1, 'INGL001', '1', 'V121212121', NULL),
(4, 1, 4, 1, 1, 'INGL001', 'SECC', 'V121212121', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tinscripcion`
--

DROP TABLE IF EXISTS `tinscripcion`;
CREATE TABLE IF NOT EXISTS `tinscripcion` (
`codigo_inscripcion` int(11) NOT NULL,
  `descripcion` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_cierre` date NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tinscripcion`
--

INSERT INTO `tinscripcion` (`codigo_inscripcion`, `descripcion`, `fecha_inicio`, `fecha_fin`, `fecha_cierre`, `fecha_desactivacion`) VALUES
(1, 'PERÍODO 2015-2016', '2015-07-27', '2015-08-28', '2016-01-30', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tlapso`
--

DROP TABLE IF EXISTS `tlapso`;
CREATE TABLE IF NOT EXISTS `tlapso` (
`codigo_lapso` int(11) NOT NULL,
  `descripcion` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `codigo_ano_academico` int(11) NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tlapso`
--

INSERT INTO `tlapso` (`codigo_lapso`, `descripcion`, `fecha_inicio`, `fecha_fin`, `codigo_ano_academico`, `fecha_desactivacion`) VALUES
(1, '1ER LAPSO', '2015-09-14', '2015-12-11', 1, NULL),
(2, '2DO LAPSO', '2016-01-11', '2016-03-25', 1, NULL),
(3, '3ER LAPSO', '2016-04-11', '2016-07-15', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmateria`
--

DROP TABLE IF EXISTS `tmateria`;
CREATE TABLE IF NOT EXISTS `tmateria` (
  `codigo_materia` char(7) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `unidad_curricular` int(11) NOT NULL DEFAULT '0',
  `grado_escolar` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '1',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tmateria`
--

INSERT INTO `tmateria` (`codigo_materia`, `descripcion`, `unidad_curricular`, `grado_escolar`, `fecha_desactivacion`) VALUES
('AGRIC00', 'AGRICULTURA', 3, '1', NULL),
('BIO001', 'CIENCIAS BIOLOGICAS', 6, '2', NULL),
('BIO002', 'CIENCIAS BIOLOGICAS', 6, '3', NULL),
('BIO003', 'CIENCIAS BIOLOGICAS', 6, '4', NULL),
('BIO004', 'CIENCIAS BIOLOGICAS', 6, '5', NULL),
('CAST001', 'CASTELLANO Y LITERATURA', 5, '1', NULL),
('CAST002', 'CASTELLANO Y LITERATURA', 5, '2', NULL),
('CAST003', 'CASTELLANO Y LITERATURA', 4, '3', NULL),
('CAST004', 'CASTELLANO Y LITERATURA', 3, '4', NULL),
('CAST005', 'CASTELLANO Y LITERATURA', 2, '5', NULL),
('CST001', 'CIENCIAS DE LA TIERRA', 5, '5', NULL),
('DIB001', 'DIBUJO', 2, '4', NULL),
('EDART00', 'EDUCACION ARTISTICA', 2, '1', NULL),
('EDART02', 'EDUCACION ARTISTICA', 3, '2', NULL),
('EDUCF00', 'EDUCACION FAMILIAR Y CIUDADANA', 2, '1', NULL),
('EDUCF02', 'EDUCACION FISICA', 4, '2', NULL),
('EDUCF03', 'EDUCACION FISICA', 4, '3', NULL),
('EDUCF04', 'EDUCACION FISICA', 2, '4', NULL),
('EDUCF05', 'EDUCACION FISICA', 2, '5', NULL),
('EDUCS00', 'EDUCACION PARA LA SALUD', 2, '2', NULL),
('EDUFIS0', 'EDUCACION FISICA', 4, '1', NULL),
('EPT001', 'EDUCACION PARA EL TRABAJO', 6, '1', NULL),
('EPT002', 'EDUCACION PARA EL TRABAJO', 8, '2', NULL),
('EPT003', 'EDUCACION PARA EL TRABAJO', 8, '3', NULL),
('ESTN001', 'ESTUDIO DE LA NATURALEZA', 6, '1', NULL),
('FIL001', 'FILOSOFIA', 3, '4', NULL),
('FIS001', 'FISICA', 8, '3', NULL),
('FIS002', 'FISICA', 6, '4', NULL),
('FIS003', 'FISICA', 6, '5', NULL),
('FRUT001', 'FRUTICULTURA', 4, '3', NULL),
('GEOG001', 'GEOGRAFIA GENERAL', 3, '1', NULL),
('GEOV001', 'GEOGRAFIA DE VENEZUELA', 4, '3', NULL),
('GEOV02', 'GEOGRAFIA DE VENEZUELA', 3, '5', NULL),
('HISTC00', 'HISTORIA CONTEMPORANEA DE VENEZUELA', 4, '4', NULL),
('HISU001', 'HISTORIA UNIVERSAL', 4, '2', NULL),
('HISV001', 'HISTORIA DE VENEZUELA', 3, '1', NULL),
('HISV002', 'HISTORIA DE VENEZUELA', 2, '2', NULL),
('HISV003', 'HISTORIA DE VENEZUELA(CAT. BOL)', 2, '3', NULL),
('HORT001', 'HORTICULTURA', 4, '2', NULL),
('INF001', 'INFORMATICA', 4, '2', NULL),
('INF002', 'INFORMATICA', 4, '3', NULL),
('INGL001', 'INGLES', 4, '1', NULL),
('INGL002', 'INGLES', 3, '2', NULL),
('INGL003', 'INGLES', 3, '3', NULL),
('INGL004', 'INGLES', 3, '4', NULL),
('INGL005', 'INGLES', 3, '5', NULL),
('IPM001', 'INSTRUCCION PREMILITAR', 2, '4', NULL),
('IPM2', 'INSTRUCCION PREMILITAR', 2, '5', NULL),
('MAT001', 'MATEMATICA', 4, '1', NULL),
('MAT002', 'MATEMATICA', 4, '2', NULL),
('MAT003', 'MATEMATICA', 3, '3', NULL),
('MAT004', 'MATEMATICA', 4, '4', NULL),
('MAT005', 'MATEMATICA', 4, '5', NULL),
('NBOF001', 'NOCIONES BASICAS DE OFICINA', 3, '1', NULL),
('QUIM001', 'QUIMICA', 7, '3', NULL),
('QUIM002', 'QUIMICA', 6, '4', NULL),
('QUIM003', 'QUIMICA', 6, '5', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmateria_seccion_docente`
--

DROP TABLE IF EXISTS `tmateria_seccion_docente`;
CREATE TABLE IF NOT EXISTS `tmateria_seccion_docente` (
`codigo_msd` int(11) NOT NULL,
  `codigo_materia` char(7) COLLATE utf8_spanish_ci NOT NULL,
  `seccion` char(5) COLLATE utf8_spanish_ci NOT NULL,
  `cedula_docente` char(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tmateria_seccion_docente`
--

INSERT INTO `tmateria_seccion_docente` (`codigo_msd`, `codigo_materia`, `seccion`, `cedula_docente`) VALUES
(1, 'CAST002', 'SECCB', 'V121212121'),
(2, 'MAT001', 'SECCB', 'V13131313'),
(3, 'CAST002', 'SECCB', 'V121212121'),
(4, 'MAT001', 'SECCB', 'V13131313'),
(13, 'INGL001', '1', 'V9565053'),
(14, 'INGL001', 'SECC', 'V121212121');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmodulo`
--

DROP TABLE IF EXISTS `tmodulo`;
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
(5, 'REPORTE', 'icon-cog', 6, NULL),
(6, 'SEGURIDAD', 'icon-lock', 7, NULL),
(7, 'INSCRIPCIONES', 'icon-cog', 5, NULL),
(8, 'CONTROL DE HORARIOS', 'icon-cog', 4, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmunicipio`
--

DROP TABLE IF EXISTS `tmunicipio`;
CREATE TABLE IF NOT EXISTS `tmunicipio` (
`codigo_municipio` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_estado` int(11) NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=332 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tmunicipio`
--

INSERT INTO `tmunicipio` (`codigo_municipio`, `descripcion`, `codigo_estado`, `fecha_desactivacion`) VALUES
(1, 'PÁEZ', 1, NULL),
(2, 'AGUA BLANCA', 1, NULL),
(3, 'SAN RAFAEL DE ONOTO', 1, NULL),
(4, 'ANDRES MATA', 24, NULL),
(5, 'SANTA ROSALIA', 1, NULL),
(6, 'ANDRES ELOY BLANCO', 24, NULL),
(7, 'TUREN', 1, NULL),
(8, 'ARAURE', 1, NULL),
(9, 'SUCRE', 1, NULL),
(10, 'GUANARE', 1, NULL),
(11, 'GUANARITO', 1, NULL),
(12, 'MONSEÑOR JOSE VICENTE DE UNDA', 1, NULL),
(13, 'OSPINO', 1, NULL),
(14, 'PAPELON', 1, NULL),
(15, 'EL PLAYON', 1, '2016-01-18'),
(16, 'SAN GENARO DE BOCONOITO', 1, NULL),
(17, 'ALTO ORINOCO', 3, NULL),
(18, 'ATABAPO', 3, NULL),
(19, 'ATURES', 3, NULL),
(20, 'AUTANA', 3, NULL),
(21, 'MANATIARES', 3, NULL),
(22, 'MAROA', 3, NULL),
(23, 'RIO NEGRO', 3, NULL),
(24, 'ANACO', 4, NULL),
(25, 'ARAGUA', 4, NULL),
(26, 'BOLIVAR', 4, NULL),
(27, 'BRUZUAL', 4, NULL),
(28, 'CAJIGAL', 4, NULL),
(29, 'CARVAJAL', 4, NULL),
(30, 'DIEGO BAUTISTA URBANEJA', 4, NULL),
(31, 'FREITES', 4, NULL),
(32, 'GUANIPA', 4, NULL),
(33, 'GUANTA', 4, NULL),
(34, 'INDEPENDENCIA', 4, NULL),
(35, 'LIBERTAD', 4, NULL),
(36, 'MCGREGOR', 4, NULL),
(37, 'MIRANDA', 4, NULL),
(38, 'MONAGAS', 4, NULL),
(39, 'PEÑALVER', 4, NULL),
(40, 'PIRITU', 4, NULL),
(41, 'SAN JUAN DE CAPISTRANO', 4, NULL),
(42, 'SANTA ANA', 4, NULL),
(43, 'SIMON RODRIGUEZ', 4, NULL),
(44, 'SOTILLO', 4, NULL),
(45, 'ACHAGUAS', 5, NULL),
(46, 'BIRUACA', 5, NULL),
(47, 'MUÑOZ', 5, NULL),
(48, 'PEDRO CAMEJO', 5, NULL),
(49, 'ROMULO GALLEGOS', 5, NULL),
(50, 'SAN FERNANDO', 5, NULL),
(51, 'PAEZ', 5, NULL),
(52, 'BOLIVAR', 6, NULL),
(53, 'CAMATAGUA', 6, NULL),
(54, 'FRANCISCO LINARES ALCANTARA', 6, NULL),
(55, 'GIRARDOT', 6, NULL),
(56, 'JOSE ANGEL LAMAS', 6, NULL),
(57, 'JOSE FELIX RIBAS', 6, NULL),
(58, 'JOSE RAFAEL REVENGA', 6, NULL),
(59, 'LIBERTADOR', 6, NULL),
(60, 'MARIO BRICEÑO IRAGORRY', 6, NULL),
(61, 'OCUMARE DE LA COSTA DE ORO', 6, NULL),
(62, 'SAN CASIMIRO', 6, NULL),
(63, 'SAN SEBASTIAN', 6, NULL),
(64, 'SANTIAGO MARIÑO', 6, NULL),
(65, 'SANTOS MICHELENA', 6, NULL),
(66, 'SUCRE', 6, NULL),
(67, 'TOVAR', 6, NULL),
(68, 'URDANETA', 6, NULL),
(69, 'ZAMORA', 6, NULL),
(70, 'ALBERTO ARVELO TORREALBA', 17, NULL),
(71, 'ANDRES ELOY BLANCO', 17, NULL),
(72, 'ANTONIO JOSE DE SUCRE', 17, NULL),
(73, 'ARISMENDI', 17, NULL),
(74, 'BARINAS', 17, NULL),
(75, 'BOLIVAR', 17, NULL),
(76, 'CRUZ PAREDES', 17, NULL),
(77, 'EZEQUIEL ZAMORA', 17, NULL),
(78, 'OBISPOS', 17, NULL),
(79, 'PEDRAZA', 17, NULL),
(80, 'ROJAS', 17, NULL),
(81, 'SOSA', 17, NULL),
(82, 'CARONI', 7, NULL),
(83, 'CEDEÑO', 7, NULL),
(84, 'EL CALLAO', 17, NULL),
(85, 'GRAN SABANA', 7, NULL),
(86, 'HERES', 7, NULL),
(87, 'PIAR', 7, NULL),
(88, 'RAUL LEON', 7, NULL),
(89, 'ROSCIO', 7, NULL),
(90, 'SIFONTES', 7, NULL),
(91, 'SUCRE', 7, NULL),
(92, 'PADRE PEDRO CHEN', 7, NULL),
(93, 'BEJUMA', 8, NULL),
(94, 'CARLOS ARVELO', 8, NULL),
(95, 'DIEGO IBARRA', 8, NULL),
(96, 'GUACARA', 8, NULL),
(97, 'JUAN JOSE MORA', 8, NULL),
(98, 'LIBERTADOR', 8, NULL),
(99, 'LOS GUAYOS', 8, NULL),
(100, 'MIRANDA', 8, NULL),
(101, 'MONTALBAN', 8, NULL),
(102, 'NAGUANAGUA', 8, NULL),
(103, 'PUERTO CABELLO', 8, NULL),
(104, 'SAN DIEGO', 8, NULL),
(105, 'SAN JOAQUIN', 8, NULL),
(106, 'VALENCIA', 8, NULL),
(107, 'ANZOATEGUI', 9, NULL),
(108, 'FALCON', 9, NULL),
(109, 'GIRARDOT', 9, NULL),
(110, 'LIMA BLANCO', 9, NULL),
(111, 'PAO DE SAN JUAN BAUTISTA', 9, NULL),
(112, 'RICAURTE', 9, NULL),
(113, 'ROMULO', 9, NULL),
(114, 'ANTONIO DIAZ', 10, NULL),
(115, 'CASACOIMA', 10, NULL),
(116, 'PEDERNALES', 10, NULL),
(117, 'TUCUPITA', 10, NULL),
(118, 'ACOSTA', 13, NULL),
(119, 'BOLIVAR', 13, NULL),
(120, 'BUCHIVACOA', 13, NULL),
(121, 'CACIQUE MANAURE', 13, NULL),
(122, 'CARIRUBANA', 13, NULL),
(123, 'COLINA', 13, NULL),
(124, 'DABAJURO', 13, NULL),
(125, 'DEMOCRACIA', 13, NULL),
(126, 'FALCON', 13, NULL),
(127, 'FEDERACION', 13, NULL),
(128, 'JACURA', 13, NULL),
(129, 'LOS TAQUES', 13, NULL),
(130, 'MAUROA', 13, NULL),
(131, 'MIRANDA', 13, NULL),
(132, 'MONSEÑOR ITURRIZA', 13, NULL),
(133, 'PALMASOLA', 13, NULL),
(134, 'PETIT', 13, NULL),
(135, 'PIRITU', 13, NULL),
(136, 'SAN FRANCISCO', 13, NULL),
(137, 'SILVA', 13, NULL),
(138, 'SUCRE', 13, NULL),
(139, 'TOCOPERO', 13, NULL),
(140, 'UNION', 13, NULL),
(141, 'URUMACO', 13, NULL),
(142, 'ZAMORA', 13, NULL),
(143, 'ESTERIOS DE CAMAGUAN', 14, NULL),
(144, 'CHAGUARAMOS', 14, NULL),
(145, 'EL SOCORRO', 14, NULL),
(146, 'FRANCISCO DE MIRANDA', 14, NULL),
(147, 'JOSE FELIX RIBAS', 14, NULL),
(148, 'JOSE TADEO MONAGAS', 14, NULL),
(149, 'JUAN GERMAN ROSCIO', 14, NULL),
(150, 'JULIAN MELLADO', 14, NULL),
(151, 'LAS MERCEDES', 14, NULL),
(152, 'LEONARDO INFANTE', 14, NULL),
(153, 'PEDRO ZARAZA', 14, NULL),
(154, 'ORTIZ', 14, NULL),
(155, 'SAN GERONIMO DE GUAYABAL', 14, NULL),
(156, 'SAN JOSE DE GUARIBA', 14, NULL),
(157, 'SANTA MARIA DE IPIRE', 14, NULL),
(158, 'ANDRES ELOY BLANCO', 2, NULL),
(159, 'CRESPO', 2, NULL),
(160, 'IRIBARREN', 2, NULL),
(161, 'JIMENEZ', 2, NULL),
(162, 'MORAN', 2, NULL),
(163, 'PALAVECINO', 2, NULL),
(164, 'SIMON PLANAS', 2, NULL),
(165, 'TORRES', 2, NULL),
(166, 'URDANETA', 2, NULL),
(167, 'ALBERTO ADRIANI', 11, NULL),
(168, 'ANDRES BELLO', 11, NULL),
(169, 'ANTONIO PINTO SALINAS', 11, NULL),
(170, 'ARICAGUA', 11, NULL),
(171, 'ARZOBISPO CHACON', 11, NULL),
(172, 'CAMPO ELIAS', 11, NULL),
(173, 'CARACCIOLO PARRA OLMEDO', 11, NULL),
(174, 'CARDENAL QUITERO', 11, NULL),
(175, 'GUARAQUE', 11, NULL),
(176, 'JULIO CESAR SALAS', 11, NULL),
(177, 'JUSTO BRICEÑO', 11, NULL),
(178, 'LIBERTADOR', 11, NULL),
(179, 'MIRANDA', 11, NULL),
(180, 'OBISPO RAMOS DE LARA', 11, NULL),
(181, 'PADRE NOGUERA', 11, NULL),
(182, 'PUEBLO LLANO', 11, NULL),
(183, 'RANGEL', 11, NULL),
(184, 'RIBAS DAVILA', 11, NULL),
(185, 'SANTOS MARTINA', 11, NULL),
(186, 'SUCRE', 11, NULL),
(187, 'TOVAR', 11, NULL),
(188, 'TULIO FEBRES CORDERO', 11, NULL),
(189, 'ZEA', 11, NULL),
(190, 'ASEVEDO', 15, NULL),
(191, 'ANDRES BELLO', 15, NULL),
(192, 'BARUTA', 15, NULL),
(193, 'BRION', 15, NULL),
(194, 'BUROZ', 15, NULL),
(195, 'CARIZAL', 15, NULL),
(196, 'CHACAO', 15, NULL),
(197, 'CRISTOBAL ROJAS', 15, NULL),
(198, 'EL ATILLO', 15, NULL),
(199, 'GUAICAIPURO', 15, NULL),
(200, 'INDEPENDENCIA', 15, NULL),
(201, 'LANDER', 15, NULL),
(202, 'LOS SALIAS', 15, NULL),
(203, 'PAEZ', 15, NULL),
(204, 'PAZ CASTILLO', 15, NULL),
(205, 'PEDRO GUAL', 15, NULL),
(206, 'PLAZA', 15, NULL),
(207, 'SIMON BOLIVAR', 15, NULL),
(208, 'SOCRE', 15, NULL),
(209, 'URDANETA', 15, NULL),
(210, 'ZAMORA', 15, NULL),
(211, 'ACOSTA', 16, NULL),
(212, 'AGUASAY', 16, NULL),
(213, 'BOLIVAR', 16, NULL),
(214, 'CARIPEL', 16, NULL),
(215, 'CEDEÑO', 16, NULL),
(216, 'EZEQUIEL ZAMORA', 16, NULL),
(217, 'LIBERTADOR', 16, NULL),
(218, 'MATURIN', 16, NULL),
(219, 'PIAR', 16, NULL),
(220, 'PUNCERES', 16, NULL),
(221, 'SANTA BARBARA', 16, NULL),
(222, 'SOTILLO', 16, NULL),
(223, 'URACOA', 16, NULL),
(224, 'ANTOLIN DEL CAMPO', 18, NULL),
(225, 'ARISMENDI', 18, NULL),
(226, 'DIAZ', 18, NULL),
(227, 'GRACIAS', 18, NULL),
(228, 'GOMEZ', 18, NULL),
(229, 'MANEIRO', 18, NULL),
(230, 'MARCANO', 18, NULL),
(231, 'MARIÑO', 18, NULL),
(232, 'PENINSULA DE MACANAO', 18, NULL),
(233, 'TUBORES', 18, NULL),
(234, 'VILLAIBA', 18, NULL),
(235, 'ARISMENDI', 24, NULL),
(236, 'BENITEZ', 24, NULL),
(237, 'BERMUDEZ', 24, NULL),
(238, 'BOLIVAR', 24, NULL),
(239, 'CAJIGAL', 24, NULL),
(240, 'CRUZ SALMERON ACOSTA', 24, NULL),
(241, 'LIBERTADOR', 24, NULL),
(242, 'MARIÑO', 24, NULL),
(243, 'MEJIA', 24, NULL),
(244, 'MONTES', 24, NULL),
(245, 'RIBERO', 24, NULL),
(246, 'SUCRE', 24, NULL),
(247, 'VALDEZ', 24, NULL),
(248, 'ANDRES BELLO', 19, NULL),
(249, 'ANTONIO ROMULO COSTA', 19, NULL),
(250, 'AYACUCHO', 19, NULL),
(251, 'BOLIVAR', 19, NULL),
(252, 'CARDENAS', 19, NULL),
(253, 'CORDOVA', 19, NULL),
(254, 'FERNANDEZ FEO', 19, NULL),
(255, 'FRANCISCO DE MIRANDA', 19, NULL),
(256, 'GARCIA DE HEVIA', 19, NULL),
(257, 'GUASIMOS', 19, NULL),
(258, 'INDEPENDENCIA', 19, NULL),
(259, 'JAUREGUI', 19, NULL),
(260, 'JOSE MARIA VARGAS', 19, NULL),
(261, 'JUNIN', 19, NULL),
(262, 'LIBERTAD', 19, NULL),
(263, 'LIBERTADOR', 19, NULL),
(264, 'LOBATERA', 19, NULL),
(265, 'MICHELENA', 19, NULL),
(266, 'PANAMERICANO', 19, NULL),
(267, 'PEDRO MARIA UREÑA', 19, NULL),
(268, 'SAMUEL DARIO MALDONADO', 19, NULL),
(269, 'SAN CRISTOBAL', 19, NULL),
(270, 'SEBORUCO', 19, NULL),
(271, 'SIMON RODRIGUEZ', 19, NULL),
(272, 'SUCRE', 19, NULL),
(273, 'TORBES', 19, NULL),
(274, 'URIBANTE', 19, NULL),
(275, 'SAN JUDAS TADEO', 19, NULL),
(276, 'RAFAEL URDANETA', 19, NULL),
(277, 'ANDRES BELLO', 20, NULL),
(278, 'BOCONO', 20, NULL),
(279, 'BOLIVAR', 20, NULL),
(280, 'CANDELARIA', 20, NULL),
(281, 'CARACHE', 20, NULL),
(282, 'ESCUQUE', 20, NULL),
(283, 'JOSE FELIPE MARQUEZ CAÑIZALEZ', 20, NULL),
(284, 'JUAN VICENTE CAMPOS ELIAS', 20, NULL),
(285, 'LA CEIBA', 20, NULL),
(286, 'MIRANDA', 20, NULL),
(287, 'MONTE CARMELO', 20, NULL),
(288, 'MOTATAN', 20, NULL),
(289, 'PAMPAN', 20, NULL),
(290, 'PAMPANITO', 20, NULL),
(291, 'RAFAEL RANGEL', 20, NULL),
(292, 'SAN RAFAEL DE CARVAJAL', 20, NULL),
(293, 'SUCRE', 20, NULL),
(294, 'TRUJILLO', 20, NULL),
(295, 'URDANETA', 20, NULL),
(296, 'VALERA', 20, NULL),
(297, 'VARGAS', 21, NULL),
(298, 'ARISTIDES BASTIDAS', 21, NULL),
(299, 'BOLIVAR', 21, NULL),
(300, 'BRUZUAL', 21, NULL),
(301, 'COCOROTE', 21, NULL),
(302, 'INDEPENDENCIA', 21, NULL),
(303, 'JOSE ANTONIO PAEZ', 21, NULL),
(304, 'LA TRINIDAD', 21, NULL),
(305, 'MANUEL MONGE', 21, NULL),
(306, 'NIRGUA', 21, NULL),
(307, 'PEÑA', 21, NULL),
(308, 'SAN FELIPE', 21, NULL),
(309, 'SUCRE', 21, NULL),
(310, 'VEROES', 21, NULL),
(311, 'ALMIRANTE PADILLA', 23, NULL),
(312, 'BARALT', 23, NULL),
(313, 'CABIMAS', 23, NULL),
(314, 'CATATUMBO', 23, NULL),
(315, 'COLON', 23, NULL),
(316, 'FRANCISCO JAVIER PULGAR', 23, NULL),
(317, 'JESUS ENRIQUE LOSADA', 23, NULL),
(318, 'JUSUS MARIA SEMPRUN', 23, NULL),
(319, 'LA CAÑADA DE URDANETA', 23, NULL),
(320, 'LAGUNILLAS', 23, NULL),
(321, 'MACHIQUES DE PARIJA', 23, NULL),
(322, 'MARA', 23, NULL),
(323, 'MARACAIBO', 23, NULL),
(324, 'MIRANDA', 23, NULL),
(325, 'PAEZ', 23, NULL),
(326, 'ROSARIO DE PERIJA', 23, NULL),
(327, 'SAN FRANCISCO', 23, NULL),
(328, 'SANTA RITA', 23, NULL),
(329, 'SIMON BOLIVAR', 23, NULL),
(330, 'SUCRE', 23, NULL),
(331, 'VALMORE RODRIGUEZ', 23, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `topcion`
--

DROP TABLE IF EXISTS `topcion`;
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

DROP TABLE IF EXISTS `tpais`;
CREATE TABLE IF NOT EXISTS `tpais` (
`codigo_pais` int(11) NOT NULL,
  `descripcion` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tpais`
--

INSERT INTO `tpais` (`codigo_pais`, `descripcion`, `fecha_desactivacion`) VALUES
(1, 'VENEZUELA', NULL),
(2, 'COLOMBIA', NULL),
(3, 'ARGENTINA', NULL),
(4, 'CHILE', NULL),
(5, 'CHINA', NULL),
(6, 'PERU', NULL),
(7, 'BOLIVIA', NULL),
(8, 'PORTUGAL', NULL),
(9, 'BRASIL', NULL),
(10, 'ALEMANIA', NULL),
(11, 'COSTA RICA', NULL),
(12, 'AUSTRIA', NULL),
(13, 'PUERTO RICO', NULL),
(14, 'CROACIA', NULL),
(15, 'GUATEMALA', NULL),
(16, 'ESPAÑA', NULL),
(17, 'JAMAICA', NULL),
(18, 'SUDAFRICA', NULL),
(19, 'JAPON', NULL),
(20, 'GRECIA', NULL),
(21, 'MEXICO', NULL),
(22, 'PANAMA', NULL),
(23, 'DINAMARCA', NULL),
(24, 'CANADA', NULL),
(25, 'AUSTRALIA', NULL),
(26, 'BELJICA', NULL),
(27, 'BELGICA', NULL),
(28, 'ITALIA', NULL),
(29, 'PARAGUAI', NULL),
(30, 'URUGUAY', NULL),
(31, 'SUIZA', NULL),
(32, 'RECIBIMIENTO - ACTO CÍVICO', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tparentesco`
--

DROP TABLE IF EXISTS `tparentesco`;
CREATE TABLE IF NOT EXISTS `tparentesco` (
`codigo_parentesco` int(11) NOT NULL,
  `descripcion` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tparentesco`
--

INSERT INTO `tparentesco` (`codigo_parentesco`, `descripcion`, `fecha_desactivacion`) VALUES
(1, 'TIO', NULL),
(2, 'PADRE', NULL),
(3, 'MADRE', NULL),
(4, 'HERMANO', NULL),
(5, 'PRIMA', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tparroquia`
--

DROP TABLE IF EXISTS `tparroquia`;
CREATE TABLE IF NOT EXISTS `tparroquia` (
`codigo_parroquia` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo_municipio` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tparroquia`
--

INSERT INTO `tparroquia` (`codigo_parroquia`, `descripcion`, `fecha_desactivacion`, `codigo_municipio`) VALUES
(1, 'ACARIGUA', NULL, 1),
(2, 'PAYARA', NULL, 1),
(3, 'PIMPINELA', NULL, 1),
(4, 'RAMON PERAZA', NULL, 1),
(5, 'AGUA BLANCA', NULL, 2),
(6, 'ARAURE', NULL, 8),
(7, 'RIO ACARIGUA', NULL, 8),
(8, 'PIRITU', NULL, 4),
(9, 'UVERAL', NULL, 4),
(10, 'CORDOVA', NULL, 10),
(11, 'GUANARE', NULL, 10),
(12, 'SAN JOSE DE LA MONTAÑA', NULL, 10),
(13, 'SAN JUAN DE GUANAGUANARE', NULL, 10),
(14, 'VIRGEN DE COROMOTO', NULL, 10),
(15, 'GUANARITO', NULL, 11),
(16, 'TRINIDAD DE LA CAPILLA', NULL, 11),
(17, 'DIVINA PASTORA', NULL, 11),
(18, 'PEÑA BLANCA', NULL, 12),
(19, 'APARICION', NULL, 13),
(20, 'LA ESTACION', NULL, 13),
(21, 'OSPINO', NULL, 13),
(22, 'CAÑO DELGADITO', NULL, 14),
(23, 'PAPELON', NULL, 14),
(24, 'BOCONOITO', NULL, 16),
(25, 'ANTOLIN TOVAR ANQUINO', NULL, 16),
(26, 'SANTA FE', NULL, 3),
(27, 'SAN RAFAEL DE ONOTO', NULL, 3),
(28, 'THERMO MORALES', NULL, 3),
(29, 'FLORIDA', NULL, 5),
(30, 'EL PLAYON', NULL, 5),
(31, 'BISCUCUY', NULL, 9),
(32, 'CONCEPCION', NULL, 9),
(33, 'SAN JOSE DE SAGUAZ', NULL, 9),
(34, 'SAN RAFAEL DE PALO ALZADO', NULL, 9),
(35, 'UVENCIO ANTONIO VELASQUEZ', NULL, 9),
(36, 'VILLA ROSA', NULL, 9),
(37, 'VILLA BRUZUAL', NULL, 7),
(38, 'CANELONES', NULL, 7),
(39, 'SANTA CRUZ', NULL, 7),
(40, 'SAN ISIDRO LABRADOR', NULL, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tperfil`
--

DROP TABLE IF EXISTS `tperfil`;
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
(2, 'DOCENTE', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpersona`
--

DROP TABLE IF EXISTS `tpersona`;
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
('V092123123', 'LAURA', 'JIMENEZ', 'F', '1994-01-18', 1, 'N/A', '02553453234', '04142353234', '', 'N', 'N', 'Y', '2009-01-14', 3, '234234324', '', 'F', 'LCDO(A).', 23, '1249834983H', NULL),
('V105463555', 'OSCAR', 'SOTO', 'M', '1980-01-09', 1, 'ACARIGUA', '02554567845', '04242345678', 'oscar@hotmail.com', 'N', 'Y', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('V111111111', 'KARINA', 'PEÑA', 'F', '2000-01-14', 1, 'ACARIGUA', '02556777777', '04246747474', '', 'N', 'N', 'Y', '2006-01-19', 1, '2G22738237', '', 'F', 'T.S.U.', 49, '1249834983H', NULL),
('V111121212', 'LAURA', 'JIMENEZ', 'F', '2000-01-20', 1, 'ACARIGUA', '02554564532', '', 'laura_maria_jimenez@hotmail.com', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('V115678456', 'MANUEL', 'CASTRO', 'M', '1984-04-20', 1, 'PAEZ', '', '', '', 'N', 'Y', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('V121212121', 'JOSE', 'LOPEZ', 'M', '1995-06-20', 1, 'N/A', '02553453242', '04142345234', '', 'N', 'N', 'Y', '2009-07-21', 2, '0234324232', '', 'F', 'LCDO(A).', 23, '1249834983H', NULL),
('V12312312', 'JAVIER JR', 'MARTIN', 'M', '2004-01-21', 1, 'N/A', '02552343423', '', '', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('V123456789', 'MATIAS', 'HERNANDEZ', 'M', '0000-00-00', 1, 'BARRIO SAN VICENTE SECTOR 3 CASA 12-45', NULL, NULL, NULL, 'N', 'N', 'Y', NULL, 1, NULL, NULL, 'C', NULL, 0, NULL, NULL),
('V13131313', 'MARIA', 'CONTRERAS', 'F', '1994-05-11', 1, 'N/A', '02562345234', '04143454352', '', 'N', 'Y', 'Y', '2011-01-18', 2, '3452344234', '', 'F', 'T.S.U.', 34, '1249834983H', NULL),
('V16292131', 'SARAHY', 'BALZA', 'F', '1988-01-09', 1, 'ACARIGUA', '02552132134', '04261996982', 'baslza@hotmail.com', 'N', 'Y', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('V17946809', 'MILAGROS', 'HENRIQUEZ', 'F', '1992-06-19', 1, 'CASERIO MARATAN', '', '04161258603', '', 'N', 'Y', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('V18843196', 'AMANDA MARIA', 'ZERPA MENDOZA', 'F', '1986-07-06', 5, 'AGUA BLANCA', '02557485569', '04261986568', 'amanda.zerpa.7@hotmail.com', 'N', 'N', 'Y', '2009-04-01', 2, '', '', 'C', 'T.S.U.', 20, 'OD00741801', NULL),
('V23411212', 'JAVIER', 'MARTIN', 'M', '2001-01-03', 1, 'N/A', '02554565325', '04143452332', '', 'N', 'Y', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('V24935226', 'OSCARY', 'SOTO', 'F', '2006-01-05', 1, 'ACARIGUA', '02556363333', '', 'oscarysoto@hotmail.com', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('V252132343', 'JOSE', 'LOPEZ', 'M', '2004-01-13', 1, 'N/A', '02554564532', '', '', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('V25347013', 'ANYELISMER', 'PERZ', 'F', '2005-01-19', 1, 'ACARIGUA', '02556373737', '', 'anyelismer@hotmail.com', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('V25347014', 'ANYELIS', 'SALAZ', 'F', '2002-01-30', 1, 'ACARIGUA', '02554564532', '', 'anyelisalazar@hotmail.com', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('V30363014', 'MARIA ALEJANDRA', 'CASTRO BALZA', 'F', '1999-01-28', 1, 'ACARIGUA', '02554564532', '', 'mariab@hotmail.com', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('V30484143', 'DANIEL', 'RODRIGUEZ', 'M', '2002-03-03', 1, 'ACARIGUA', '02554564532', '', 'daniel@hotmail.com', 'Y', 'N', 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('V5942165', 'ERNESTINA DEL CARMEN', 'ESCALONA', 'F', '1961-10-13', 6, 'ARAURE', '02554564532', '04121669007', 'ernerstinau@hotmail.com', 'N', 'N', 'Y', '2002-11-15', 3, '', '', 'F', 'LCDO(A).', 38, 'OD00741801', NULL),
('V9565053', 'GLADYS TIBISAY', 'SOTO COLMENAREZ', 'F', '1967-01-03', 1, 'ACARIGUA', '02554565334', '04167168710', '', 'N', 'N', 'Y', '2007-03-07', 2, '', '', 'F', 'LCDO(A).', 27, 'OD00741801', NULL),
('V9566566', 'JULIO CESAR', 'YOVERA LEAÑEZ', 'M', '1963-10-23', 27, 'SAN RAFEL DE ONOTO, LAS MAJAGUAS', '02553485642', '04161996005', 'julioyovera@hotmail.com', 'N', 'N', 'Y', '2001-01-01', 5, '', '', 'F', 'Bachiller', 40, 'OD00741801', NULL),
('V9841246', 'JUAN DE JESUS', 'ARGUALLES CHIRINOS', 'M', '1964-03-05', 5, 'MUNICIPIO AGUA BLANCA', '02554321987', '04160595780', 'juanarguelles@hotmail.com', 'N', 'N', 'Y', '2006-11-01', 5, '', '', 'F', 'Bachiller', 40, 'OD00741801', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tplantel`
--

DROP TABLE IF EXISTS `tplantel`;
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
('12345645343', 'LICEO BOLIVARIANO TOCUYANO', 'CENTRO "I" TOCUYANO', '02556345678', 'TOCUYANO', '', 2, NULL),
('1249834983H', 'AGUA BLANCA', 'MUNICIPIO AGUA BLANCA', '02558765645', 'AGUA BLANCA', '', 2, NULL),
('21345687654', 'LICEO BOLIVARIANO PIRITAL', 'CENTRO POBLADO PIRITAL', '02553456784', 'PIRITAL', '', 2, NULL),
('OD00741801', 'UNIDAD EDUCATIVA NACIONAL QUEBRADA HONDA', 'CALLE #3 CENTRO POBLADO "B" QUEBRADA HONDA', '02558084598', 'CENTRO OCCIDENTE', 'llbqh@hotmail.com', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tproceso_inscripcion`
--

DROP TABLE IF EXISTS `tproceso_inscripcion`;
CREATE TABLE IF NOT EXISTS `tproceso_inscripcion` (
`codigo_procesoinscripcion` int(11) NOT NULL,
  `codigo_inscripcion` int(11) NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `codigo_ano_academico` int(11) NOT NULL,
  `cedula_docente` char(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cedula_estudiante` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `cedula_escolar` char(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `lateralidad` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'D',
  `codigo_canaima` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `canaima_operativa` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Y',
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
  `grado_escolar` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '1',
  `proceso_completado` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N',
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tproceso_inscripcion`
--

INSERT INTO `tproceso_inscripcion` (`codigo_procesoinscripcion`, `codigo_inscripcion`, `fecha_inscripcion`, `codigo_ano_academico`, `cedula_docente`, `cedula_estudiante`, `cedula_escolar`, `lateralidad`, `codigo_canaima`, `canaima_operativa`, `peso`, `estatura`, `codigo_plantel`, `certificado_sextogrado`, `notascertificadas`, `cartabuenaconducta`, `fotoestudiante`, `fotorepresentante`, `fotocopia_ciestudiante`, `fotocopia_cirepresentante`, `fotocopia_pnestudiante`, `kitscomedor`, `becado`, `tipobeca`, `cedula_madre`, `cedula_padre`, `cedula_representante`, `codigo_parentesco`, `lugar_trabajo`, `primerafi`, `seccion`, `grado_escolar`, `proceso_completado`, `estatus`) VALUES
(1, 1, '2016-01-14', 1, 'V13131313', 'V252132343', '', 'D', '', 'Y', 35.5, 135, '12345645343', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'H', NULL, 'V121212121', 'V121212121', 2, 1, '2016-01-14', 'SECCB', '1', 'Y', '1'),
(2, 1, '2016-01-15', 1, NULL, 'V111121212', '', 'D', '', 'N', 50, 156, '1249834983H', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', NULL, NULL, NULL, NULL, NULL, '2016-01-15', '2', '1', 'N', '1'),
(3, 1, '2016-01-15', 1, NULL, 'V25347014', '', 'D', '', 'N', 50, 165, '21345687654', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', NULL, NULL, NULL, NULL, NULL, '2016-01-15', '2', '1', 'N', '1'),
(4, 1, '2016-01-15', 1, 'V13131313', 'V24935226', '', 'D', '', 'N', 50, 162, '12345645343', 'Y', 'N', 'Y', 'N', 'Y', 'N', 'N', 'Y', 'N', 'N', 'N', NULL, 'V105463555', 'V105463555', 2, 1, '2016-01-15', 'SECC', '1', 'Y', '1'),
(5, 1, '2016-01-15', 1, NULL, 'V25347013', '', 'D', '', 'N', 55, 163, '1249834983H', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', NULL, NULL, NULL, NULL, NULL, '2016-01-15', 'SECC', '1', 'N', '1'),
(6, 1, '2016-01-17', 1, NULL, 'V12312312', '', 'D', '124321VS123123', 'Y', 123.4, 123, '1249834983H', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', '0', NULL, NULL, NULL, NULL, NULL, '2016-01-17', 'SECC', '1', 'N', '1'),
(7, 1, '2016-01-17', 1, 'V121212121', 'V30484143', '', 'D', '', 'N', 50, 160, '1249834983H', 'Y', 'Y', 'Y', 'N', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'V17946809', NULL, 'V17946809', 3, 1, '2016-01-17', 'SECC', '1', 'Y', '1'),
(8, 1, '2016-01-17', 1, 'V121212121', 'V30363014', '', 'D', '', 'N', 50, 158, '12345645343', 'N', 'N', 'Y', 'Y', 'Y', 'N', 'N', 'Y', 'N', 'N', 'N', 'V16292131', 'V115678456', 'V115678456', 2, 1, '2016-01-17', '1', '1', 'Y', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trespuesta_secreta`
--

DROP TABLE IF EXISTS `trespuesta_secreta`;
CREATE TABLE IF NOT EXISTS `trespuesta_secreta` (
`codigo_respuesta` int(11) NOT NULL,
  `nombre_usuario` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `pregunta` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `respuesta` varchar(60) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `trespuesta_secreta`
--

INSERT INTO `trespuesta_secreta` (`codigo_respuesta`, `nombre_usuario`, `pregunta`, `respuesta`) VALUES
(1, 'V13131313', 'P1', 'R1'),
(2, 'V13131313', 'P2', 'R2'),
(3, 'V121212121', 'P1', 'R1'),
(4, 'V121212121', 'P2', 'R2'),
(6, 'V123456789', 'P1', 'R1'),
(7, 'V123456789', 'P2', 'R2'),
(8, 'V123456789', 'P3', 'R3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tseccion`
--

DROP TABLE IF EXISTS `tseccion`;
CREATE TABLE IF NOT EXISTS `tseccion` (
  `seccion` char(5) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `turno` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `capacidad_min` int(11) NOT NULL DEFAULT '5',
  `capacidad_max` int(11) NOT NULL DEFAULT '40',
  `grado_escolar` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '1',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tseccion`
--

INSERT INTO `tseccion` (`seccion`, `descripcion`, `turno`, `capacidad_min`, `capacidad_max`, `grado_escolar`, `fecha_desactivacion`) VALUES
('1', 'PRIMERO A', 'M', 10, 30, '1', NULL),
('2', 'SEGUNDO A', 'M', 40, 50, '1', '2016-01-19'),
('SECC', 'PRIMERO B', 'M', 10, 40, '1', NULL),
('SECC2', 'SEGUNDO A', 'M', 40, 50, '2', NULL),
('SECC3', 'TERCERO A', 'M', 10, 50, '3', NULL),
('SECC4', 'CUARTO A', 'M', 10, 50, '4', NULL),
('SECC5', 'QUINTO A', 'M', 10, 50, '5', NULL),
('SECCB', 'SECCION B', 'T', 20, 35, '2', '2016-01-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tservicio`
--

DROP TABLE IF EXISTS `tservicio`;
CREATE TABLE IF NOT EXISTS `tservicio` (
`codigo_servicio` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden` decimal(10,0) DEFAULT '0',
  `codigo_modulo` int(11) NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(10, 'LAPSO', 'LAPSO', 3, 3, NULL),
(11, 'MATERIA', 'MATERIA', 4, 3, NULL),
(12, 'SECCIÓN', 'SECCION', 6, 3, NULL),
(13, 'ESTUDIANTES', 'ESTUDIANTE', 7, 3, NULL),
(14, 'CERRAR AÑO ACADÉMICO', 'CERRAR_ANOACADEMICO', 7, 3, NULL),
(15, 'INSCRIPCIÓN', 'INSCRIPCION', 8, 3, NULL),
(16, 'ASIGNACIÓN DE NOTAS', 'ASIGNAR_NOTAS', 1, 4, NULL),
(17, 'PROCESO DE INSCRIPCIÓN', 'PROCESO_INSCRIPCION', 1, 7, NULL),
(18, 'ASIGNACIÓN DE SECCIONES', 'ASIGNAR_SECCION', 10, 7, NULL),
(19, 'FICHA DE INSCRIPCIÓN', 'REP_FICHAINSCRIPCION', 1, 5, NULL),
(20, 'CONSTANCIA DE ESTUDIO', 'REP_CONSTANCIAESTUDIO', 2, 5, NULL),
(21, 'HISTORIAL DEL PERSONAL ADMINISTRATIVO', 'REP_HISTORIALPERSONAL', 3, 5, NULL),
(22, 'ESTUDIANTES POR GRADO ESCOLAR', 'REP_ESTUDIANTESPORGRADO', 4, 5, NULL),
(23, 'ESTUDIANTES POR SECCIÓN', 'REP_ESTUDIANTESPORSECCION', 5, 5, NULL),
(24, 'ESTUDIANTES NUEVO INGRESO', 'REP_ESTUDIANTESNUEVOINGRESO', 6, 5, NULL),
(25, 'LISTADO DE DOCENTES', 'REP_DOCENTES', 7, 5, NULL),
(26, 'LISTADO DE DOCENTES POR MATERIA', 'REP_DOCENTESPORMATERIA', 8, 5, NULL),
(27, 'NOTAS CERTIFICADAS', 'REP_NOTASCERTIFICADAS', 9, 5, NULL),
(28, 'MÓDULO', 'MODULO', 1, 6, NULL),
(29, 'SERVICIOS', 'SERVICIO', 2, 6, NULL),
(30, 'BOTONERA', 'BOTONES', 3, 6, NULL),
(31, 'PERFIL', 'PERFILES', 5, 6, NULL),
(32, 'NUEVO USUARIO', 'NUEVOUSUARIO', 6, 6, NULL),
(33, 'MÍ PERFIL', 'PERFIL', 6, 6, NULL),
(34, 'CAMBIAR CONTRASEÑA', 'CAMBIARCONTRASENA', 7, 6, NULL),
(35, 'HISTÓRICO DE CAMBIOS', 'BITACORA', 9, 6, NULL),
(36, 'BOLETIN', 'REP_BOLETIN', 10, 5, NULL),
(37, 'CONFIGURACIÓN DEL PERFIL', 'CONFIGURACION', 4, 6, NULL),
(38, 'CONFIGURACIÓN DEL NEGOCIO', 'CONFIGURACION_NEGOCIO', 0, 6, NULL),
(39, 'AMBIENTE DE CLASES', 'AMBIENTE', 3, 3, NULL),
(40, 'BLOQUE DE HORA', 'BLOQUE_HORA', 1, 8, NULL),
(41, 'HORARIO', 'HORARIO', 2, 8, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tservicio_usuario_opcion`
--

DROP TABLE IF EXISTS `tservicio_usuario_opcion`;
CREATE TABLE IF NOT EXISTS `tservicio_usuario_opcion` (
  `codigo_opcion` int(11) DEFAULT NULL,
  `codigo_servicio` int(11) NOT NULL,
  `codigo_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tservicio_usuario_opcion`
--

INSERT INTO `tservicio_usuario_opcion` (`codigo_opcion`, `codigo_servicio`, `codigo_perfil`) VALUES
(NULL, 7, 2),
(2, 7, 2),
(5, 7, 2),
(7, 7, 2),
(NULL, 16, 2),
(NULL, 21, 2),
(NULL, 22, 2),
(NULL, 23, 2),
(NULL, 24, 2),
(NULL, 36, 2),
(5, 36, 2),
(NULL, 33, 2),
(2, 33, 2),
(NULL, 34, 2),
(2, 34, 2),
(NULL, 7, 2),
(NULL, 16, 2),
(NULL, 21, 2),
(NULL, 22, 2),
(NULL, 23, 2),
(NULL, 24, 2),
(NULL, 36, 2),
(NULL, 33, 2),
(NULL, 34, 2),
(NULL, 7, 2),
(NULL, 16, 2),
(NULL, 21, 2),
(NULL, 22, 2),
(NULL, 23, 2),
(NULL, 24, 2),
(NULL, 36, 2),
(NULL, 33, 2),
(NULL, 34, 2),
(NULL, 7, 2),
(NULL, 16, 2),
(NULL, 21, 2),
(NULL, 22, 2),
(NULL, 23, 2),
(NULL, 24, 2),
(NULL, 36, 2),
(NULL, 33, 2),
(NULL, 34, 2),
(NULL, 7, 2),
(NULL, 16, 2),
(NULL, 21, 2),
(NULL, 22, 2),
(NULL, 23, 2),
(NULL, 24, 2),
(NULL, 36, 2),
(NULL, 33, 2),
(NULL, 34, 2),
(NULL, 7, 2),
(NULL, 16, 2),
(NULL, 21, 2),
(NULL, 22, 2),
(NULL, 23, 2),
(NULL, 24, 2),
(NULL, 36, 2),
(NULL, 33, 2),
(NULL, 34, 2),
(NULL, 7, 2),
(NULL, 16, 2),
(NULL, 21, 2),
(NULL, 22, 2),
(NULL, 23, 2),
(NULL, 24, 2),
(NULL, 36, 2),
(NULL, 33, 2),
(NULL, 34, 2),
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
(1, 14, 1),
(2, 14, 1),
(3, 14, 1),
(4, 14, 1),
(5, 14, 1),
(6, 14, 1),
(7, 14, 1),
(1, 15, 1),
(2, 15, 1),
(3, 15, 1),
(4, 15, 1),
(5, 15, 1),
(6, 15, 1),
(7, 15, 1),
(1, 39, 1),
(2, 39, 1),
(3, 39, 1),
(4, 39, 1),
(5, 39, 1),
(6, 39, 1),
(7, 39, 1),
(1, 16, 1),
(2, 16, 1),
(3, 16, 1),
(4, 16, 1),
(5, 16, 1),
(6, 16, 1),
(7, 16, 1),
(1, 19, 1),
(2, 19, 1),
(3, 19, 1),
(4, 19, 1),
(5, 19, 1),
(6, 19, 1),
(7, 19, 1),
(1, 20, 1),
(2, 20, 1),
(3, 20, 1),
(4, 20, 1),
(5, 20, 1),
(6, 20, 1),
(7, 20, 1),
(1, 21, 1),
(2, 21, 1),
(3, 21, 1),
(4, 21, 1),
(5, 21, 1),
(6, 21, 1),
(7, 21, 1),
(1, 22, 1),
(2, 22, 1),
(3, 22, 1),
(4, 22, 1),
(5, 22, 1),
(6, 22, 1),
(7, 22, 1),
(1, 23, 1),
(2, 23, 1),
(3, 23, 1),
(4, 23, 1),
(5, 23, 1),
(6, 23, 1),
(7, 23, 1),
(1, 24, 1),
(2, 24, 1),
(3, 24, 1),
(4, 24, 1),
(5, 24, 1),
(6, 24, 1),
(7, 24, 1),
(1, 25, 1),
(2, 25, 1),
(3, 25, 1),
(4, 25, 1),
(5, 25, 1),
(6, 25, 1),
(7, 25, 1),
(1, 26, 1),
(2, 26, 1),
(3, 26, 1),
(4, 26, 1),
(5, 26, 1),
(6, 26, 1),
(7, 26, 1),
(1, 27, 1),
(2, 27, 1),
(3, 27, 1),
(4, 27, 1),
(5, 27, 1),
(6, 27, 1),
(7, 27, 1),
(1, 36, 1),
(2, 36, 1),
(3, 36, 1),
(4, 36, 1),
(5, 36, 1),
(6, 36, 1),
(7, 36, 1),
(1, 28, 1),
(2, 28, 1),
(3, 28, 1),
(4, 28, 1),
(5, 28, 1),
(6, 28, 1),
(7, 28, 1),
(1, 29, 1),
(2, 29, 1),
(3, 29, 1),
(4, 29, 1),
(5, 29, 1),
(6, 29, 1),
(7, 29, 1),
(1, 30, 1),
(2, 30, 1),
(3, 30, 1),
(4, 30, 1),
(5, 30, 1),
(6, 30, 1),
(7, 30, 1),
(1, 31, 1),
(2, 31, 1),
(3, 31, 1),
(4, 31, 1),
(5, 31, 1),
(6, 31, 1),
(7, 31, 1),
(1, 32, 1),
(2, 32, 1),
(3, 32, 1),
(4, 32, 1),
(5, 32, 1),
(6, 32, 1),
(7, 32, 1),
(1, 33, 1),
(2, 33, 1),
(3, 33, 1),
(4, 33, 1),
(5, 33, 1),
(6, 33, 1),
(7, 33, 1),
(1, 34, 1),
(2, 34, 1),
(3, 34, 1),
(4, 34, 1),
(5, 34, 1),
(6, 34, 1),
(7, 34, 1),
(1, 35, 1),
(2, 35, 1),
(3, 35, 1),
(4, 35, 1),
(5, 35, 1),
(6, 35, 1),
(7, 35, 1),
(1, 37, 1),
(2, 37, 1),
(3, 37, 1),
(4, 37, 1),
(5, 37, 1),
(6, 37, 1),
(7, 37, 1),
(1, 38, 1),
(2, 38, 1),
(3, 38, 1),
(4, 38, 1),
(5, 38, 1),
(6, 38, 1),
(7, 38, 1),
(1, 17, 1),
(2, 17, 1),
(3, 17, 1),
(4, 17, 1),
(5, 17, 1),
(6, 17, 1),
(7, 17, 1),
(1, 18, 1),
(2, 18, 1),
(3, 18, 1),
(4, 18, 1),
(5, 18, 1),
(6, 18, 1),
(7, 18, 1),
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
(7, 41, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tusuario`
--

DROP TABLE IF EXISTS `tusuario`;
CREATE TABLE IF NOT EXISTS `tusuario` (
  `nombre_usuario` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `cedula` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_perfil` int(11) NOT NULL,
  `intento_fallido` int(11) NOT NULL DEFAULT '0',
  `activar_caducidad` int(11) NOT NULL DEFAULT '1',
  `sesion_abierta` int(11) NOT NULL DEFAULT '0',
  `fecha_ultimasesion` date DEFAULT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tusuario`
--

INSERT INTO `tusuario` (`nombre_usuario`, `cedula`, `codigo_perfil`, `intento_fallido`, `activar_caducidad`, `sesion_abierta`, `fecha_ultimasesion`, `fecha_desactivacion`) VALUES
('V121212121', 'V121212121', 2, 2, 1, 0, NULL, NULL),
('V123456789', 'V123456789', 1, 0, 1, 1, '2016-08-21', NULL),
('V13131313', 'V13131313', 1, 3, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vhorario`
--
DROP VIEW IF EXISTS `vhorario`;
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
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vmateria_seccion_horario`
--
DROP VIEW IF EXISTS `vmateria_seccion_horario`;
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

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `vhorario` AS select `pr`.`nombres` AS `nombre`,`pr`.`apellidos` AS `apellido`,concat(`h`.`codigo_bloque_hora`,'-',`h`.`dia`) AS `celda`,`pr`.`cedula` AS `cedula`,`h`.`dia` AS `dia`,`h`.`codigo_bloque_hora` AS `codigo_bloque_hora`,`h`.`codigo_materia` AS `materia`,`h`.`cedula_docente` AS `profesor`,`h`.`codigo_ambiente` AS `codigo_ambiente`,`h`.`seccion` AS `seccion`,`h`.`codigo_ano_academico` AS `codigo_ano_academico`,`tm`.`descripcion` AS `nombre_materia`,`ta`.`descripcion` AS `nombre_ambiente`,concat(`bh`.`hora_inicio`,'-',`bh`.`hora_fin`) AS `hora`,`s`.`descripcion` AS `nombre_seccion`,coalesce(`pr`.`carga_horaria`,0) AS `maxhoras` from (((((`thorario` `h` left join `tseccion` `s` on((`s`.`seccion` = `h`.`seccion`))) left join `tpersona` `pr` on((`pr`.`cedula` = `h`.`cedula_docente`))) left join `tmateria` `tm` on((`tm`.`codigo_materia` = `h`.`codigo_materia`))) left join `tambiente` `ta` on((`ta`.`codigo_ambiente` = `h`.`codigo_ambiente`))) left join `tbloque_hora` `bh` on((`bh`.`codigo_bloque_hora` = `h`.`codigo_bloque_hora`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vmateria_seccion_horario`
--
DROP TABLE IF EXISTS `vmateria_seccion_horario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`admin`@`%` SQL SECURITY DEFINER VIEW `vmateria_seccion_horario` AS select `s`.`seccion` AS `seccion`,count(`h`.`codigo_materia`) AS `cantidad_materia_horario`,count(`msd`.`codigo_materia`) AS `cantidad_materia_seccion` from ((`tseccion` `s` left join `tmateria_seccion_docente` `msd` on((`s`.`seccion` = `msd`.`seccion`))) left join `thorario` `h` on((`h`.`seccion` = `s`.`seccion`))) group by `s`.`seccion`,`msd`.`codigo_materia`;

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
 ADD PRIMARY KEY (`codigo_configuracion_negocio`);

--
-- Indices de la tabla `tcontrasena`
--
ALTER TABLE `tcontrasena`
 ADD KEY `tcontrasena_ibfk_1` (`nombre_usuario`);

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
 ADD PRIMARY KEY (`codigo_msd`), ADD KEY `fk_tmateria_seccion_tmateria` (`codigo_materia`), ADD KEY `fk_tmateria_seccion_tseccion` (`seccion`), ADD KEY `fk_tmateria_seccion_tpersona` (`cedula_docente`);

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
 ADD PRIMARY KEY (`codigo_perfil`), ADD KEY `codigo_configuracion` (`codigo_configuracion`);

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
-- Indices de la tabla `tproceso_inscripcion`
--
ALTER TABLE `tproceso_inscripcion`
 ADD PRIMARY KEY (`codigo_procesoinscripcion`), ADD KEY `fk_tpi_tinscrip` (`codigo_inscripcion`), ADD KEY `fk_tpi_taa` (`codigo_ano_academico`), ADD KEY `fk_tpi_tdocente` (`cedula_docente`), ADD KEY `fk_tpi_testudiante` (`cedula_estudiante`), ADD KEY `fk_tpi_tmadre` (`cedula_madre`), ADD KEY `fk_tpi_tpadre` (`cedula_padre`), ADD KEY `fk_tpi_trepresentante` (`cedula_representante`), ADD KEY `fk_tpi_tparentesco` (`codigo_parentesco`), ADD KEY `fk_tpi_tlugartrabajo` (`lugar_trabajo`), ADD KEY `fk_tpi_tseccion` (`seccion`);

--
-- Indices de la tabla `trespuesta_secreta`
--
ALTER TABLE `trespuesta_secreta`
 ADD PRIMARY KEY (`codigo_respuesta`), ADD KEY `nombre_usuario` (`nombre_usuario`);

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
MODIFY `codigo_ano_academico` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tauditoria`
--
ALTER TABLE `tauditoria`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3436;
--
-- AUTO_INCREMENT de la tabla `tbloque_hora`
--
ALTER TABLE `tbloque_hora`
MODIFY `codigo_bloque_hora` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
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
MODIFY `codigo_configuracion_negocio` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tcontrol_notas`
--
ALTER TABLE `tcontrol_notas`
MODIFY `codigo_controlnotas` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `testado`
--
ALTER TABLE `testado`
MODIFY `codigo_estado` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT de la tabla `thorario`
--
ALTER TABLE `thorario`
MODIFY `codigo_horario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tinscripcion`
--
ALTER TABLE `tinscripcion`
MODIFY `codigo_inscripcion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tlapso`
--
ALTER TABLE `tlapso`
MODIFY `codigo_lapso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tmateria_seccion_docente`
--
ALTER TABLE `tmateria_seccion_docente`
MODIFY `codigo_msd` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `tmodulo`
--
ALTER TABLE `tmodulo`
MODIFY `codigo_modulo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `tmunicipio`
--
ALTER TABLE `tmunicipio`
MODIFY `codigo_municipio` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=332;
--
-- AUTO_INCREMENT de la tabla `topcion`
--
ALTER TABLE `topcion`
MODIFY `codigo_opcion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `tpais`
--
ALTER TABLE `tpais`
MODIFY `codigo_pais` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT de la tabla `tparentesco`
--
ALTER TABLE `tparentesco`
MODIFY `codigo_parentesco` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tparroquia`
--
ALTER TABLE `tparroquia`
MODIFY `codigo_parroquia` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `tperfil`
--
ALTER TABLE `tperfil`
MODIFY `codigo_perfil` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tproceso_inscripcion`
--
ALTER TABLE `tproceso_inscripcion`
MODIFY `codigo_procesoinscripcion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `trespuesta_secreta`
--
ALTER TABLE `trespuesta_secreta`
MODIFY `codigo_respuesta` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `tservicio`
--
ALTER TABLE `tservicio`
MODIFY `codigo_servicio` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=42;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tcontrasena`
--
ALTER TABLE `tcontrasena`
ADD CONSTRAINT `tcontrasena_ibfk_1` FOREIGN KEY (`nombre_usuario`) REFERENCES `tusuario` (`nombre_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tcontrol_notas`
--
ALTER TABLE `tcontrol_notas`
ADD CONSTRAINT `fk_tcontrolnotas_estudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tcontrolnotas_lapso` FOREIGN KEY (`codigo_lapso`) REFERENCES `tlapso` (`codigo_lapso`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tcontrolnotas_msd` FOREIGN KEY (`codigo_msd`) REFERENCES `tmateria_seccion_docente` (`codigo_msd`) ON UPDATE CASCADE;

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
ADD CONSTRAINT `fk_tmateria_seccion_tpersona` FOREIGN KEY (`cedula_docente`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tmateria_seccion_tseccion` FOREIGN KEY (`seccion`) REFERENCES `tseccion` (`seccion`) ON UPDATE CASCADE;

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
ADD CONSTRAINT `tperfil_ibfk_1` FOREIGN KEY (`codigo_configuracion`) REFERENCES `tconfiguracion` (`codigo_configuracion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tpersona`
--
ALTER TABLE `tpersona`
ADD CONSTRAINT `fk_tpersona_tcargo` FOREIGN KEY (`codigo_cargo`) REFERENCES `tcargo` (`codigo_cargo`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpersona_tparroquia` FOREIGN KEY (`lugar_nacimiento`) REFERENCES `tparroquia` (`codigo_parroquia`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpersona_tplantel` FOREIGN KEY (`codigo_plantel`) REFERENCES `tplantel` (`codigo_plantel`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tplantel`
--
ALTER TABLE `tplantel`
ADD CONSTRAINT `fk_tplantel_tmunicipio` FOREIGN KEY (`codigo_municipio`) REFERENCES `tmunicipio` (`codigo_municipio`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tproceso_inscripcion`
--
ALTER TABLE `tproceso_inscripcion`
ADD CONSTRAINT `fk_tpi_taa` FOREIGN KEY (`codigo_ano_academico`) REFERENCES `tano_academico` (`codigo_ano_academico`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_tdocente` FOREIGN KEY (`cedula_docente`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_testudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_tinscrip` FOREIGN KEY (`codigo_inscripcion`) REFERENCES `tinscripcion` (`codigo_inscripcion`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_tlugartrabajo` FOREIGN KEY (`lugar_trabajo`) REFERENCES `tparroquia` (`codigo_parroquia`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_tmadre` FOREIGN KEY (`cedula_madre`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_tpadre` FOREIGN KEY (`cedula_padre`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_tparentesco` FOREIGN KEY (`codigo_parentesco`) REFERENCES `tparentesco` (`codigo_parentesco`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_trepresentante` FOREIGN KEY (`cedula_representante`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tpi_tseccion` FOREIGN KEY (`seccion`) REFERENCES `tseccion` (`seccion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `trespuesta_secreta`
--
ALTER TABLE `trespuesta_secreta`
ADD CONSTRAINT `trespuesta_secreta_ibfk_1` FOREIGN KEY (`nombre_usuario`) REFERENCES `tusuario` (`nombre_usuario`) ON UPDATE CASCADE;

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
ADD CONSTRAINT `fk_tservicio_usuario_opcion_tperfil` FOREIGN KEY (`codigo_perfil`) REFERENCES `tperfil` (`codigo_perfil`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tservicio_usuario_opcion_tservicio` FOREIGN KEY (`codigo_servicio`) REFERENCES `tservicio` (`codigo_servicio`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tusuario`
--
ALTER TABLE `tusuario`
ADD CONSTRAINT `tusuario_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
ADD CONSTRAINT `tusuario_ibfk_2` FOREIGN KEY (`codigo_perfil`) REFERENCES `tperfil` (`codigo_perfil`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
