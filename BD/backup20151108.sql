-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 08-11-2015 a las 15:22:04
-- Versión del servidor: 5.5.44-0+deb8u1
-- Versión de PHP: 5.6.13-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bdliceo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tano_academico`
--

CREATE TABLE IF NOT EXISTS `tano_academico` (
`codigo_ano_academico` int(11) NOT NULL,
  `descripcion` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tano_academico`
--

INSERT INTO `tano_academico` (`codigo_ano_academico`, `descripcion`, `fecha_desactivacion`) VALUES
(1, '1er año', '0000-00-00'),
(2, '2015-2016', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=794 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tauditoria`
--

INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(1, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-03 18:31:18'),
(2, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tcontrasena set estado=0 where (nombre_usuario=''V123456789'')', '2015-11-03 18:32:29'),
(3, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tcontrasena (contrasena,nombre_usuario,estado)values(''2e5f402b1f0117f9f7217a3e8cbff136b1e304ad'',''V123456789'',1)', '2015-11-03 18:32:29'),
(4, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-03 18:32:40'),
(5, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-03 18:54:17'),
(6, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-04 17:07:36'),
(7, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-04 17:34:51'),
(8, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmodulo set descripcion=''GENERAL'',icono=''icon-list'',orden=''2'' where (codigo_modulo=''2'');', '2015-11-04 17:35:20'),
(9, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tmodulo set descripcion=''EDUCACIÓN'',icono=''icon-list-alt'',orden=''3'' where (codigo_modulo=''3'');', '2015-11-04 17:35:35'),
(10, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update topcion set descripcion=''INSERTAR'',icono=''Icon-pencil'',orden=1 where (codigo_opcion=''1'');', '2015-11-04 18:04:25'),
(11, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update topcion set descripcion=''INSERTAR'',icono=''icon-pencil'',orden=1 where (codigo_opcion=''1'');', '2015-11-04 18:06:41'),
(12, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update topcion set descripcion=''INSERTAR'',icono=''icon-pencil'',orden=1 where (codigo_opcion=''1'');', '2015-11-04 18:06:48'),
(13, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update topcion set descripcion=''INSERTAR'',icono=''icon-pencil'',orden=1 where (codigo_opcion=''1'');', '2015-11-04 18:09:03'),
(14, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update topcion set descripcion=''ACTUALIZAR'',icono=''icon-edit'',orden=2 where (codigo_opcion=''2'');', '2015-11-04 18:10:30'),
(15, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update topcion set fecha_desactivacion=CURDATE() where (codigo_opcion=''3'');', '2015-11-04 18:10:40'),
(16, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update topcion set fecha_desactivacion=NULL where (codigo_opcion=''3'');', '2015-11-04 18:10:45'),
(17, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into topcion (descripcion,icono,orden) values (''CANCELAR'',''icon-remove'',6);', '2015-11-04 18:11:11'),
(18, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into topcion (descripcion,icono,orden) values (''LISTAR'',''icon-print'',7);', '2015-11-04 18:11:25'),
(19, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tservicio set descripcion=''MÓDULO'',url=''MODULO'',\r\n    orden=''1'',codigo_modulo=''6'' where (codigo_servicio=''19'');', '2015-11-04 18:19:55'),
(20, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tperfil set descripcion=''ADMINISTRADOR'' where (codigo_perfil=''1'');', '2015-11-04 18:30:12'),
(21, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''1'');', '2015-11-04 18:30:12'),
(22, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tperfil set descripcion=''ADMINISTRADOR'' where (codigo_perfil=''1'');', '2015-11-04 18:30:55'),
(23, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''1'');', '2015-11-04 18:30:55'),
(24, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',NULL)', '2015-11-04 18:30:55'),
(25, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',''1'')', '2015-11-04 18:30:56'),
(26, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',''2'')', '2015-11-04 18:30:56'),
(27, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',''3'')', '2015-11-04 18:30:56'),
(28, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',''4'')', '2015-11-04 18:30:56'),
(29, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',''5'')', '2015-11-04 18:30:56'),
(30, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',''6'')', '2015-11-04 18:30:56'),
(31, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',''7'')', '2015-11-04 18:30:56'),
(32, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',NULL)', '2015-11-04 18:30:56'),
(33, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',''1'')', '2015-11-04 18:30:56'),
(34, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',''2'')', '2015-11-04 18:30:56'),
(35, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',''3'')', '2015-11-04 18:30:56'),
(36, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',''4'')', '2015-11-04 18:30:57'),
(37, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',''5'')', '2015-11-04 18:30:57'),
(38, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',''6'')', '2015-11-04 18:30:57'),
(39, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',''7'')', '2015-11-04 18:30:57'),
(40, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',NULL)', '2015-11-04 18:30:57'),
(41, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',''1'')', '2015-11-04 18:30:57'),
(42, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',''2'')', '2015-11-04 18:30:57'),
(43, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',''3'')', '2015-11-04 18:30:57'),
(44, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',''4'')', '2015-11-04 18:30:57'),
(45, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',''5'')', '2015-11-04 18:30:57'),
(46, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',''6'')', '2015-11-04 18:30:57'),
(47, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',''7'')', '2015-11-04 18:30:58'),
(48, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',NULL)', '2015-11-04 18:30:58'),
(49, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',''1'')', '2015-11-04 18:30:58'),
(50, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',''2'')', '2015-11-04 18:30:58'),
(51, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',''3'')', '2015-11-04 18:30:58'),
(52, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',''4'')', '2015-11-04 18:30:58'),
(53, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',''5'')', '2015-11-04 18:30:58'),
(54, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',''6'')', '2015-11-04 18:30:58'),
(55, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',''7'')', '2015-11-04 18:30:58'),
(56, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',NULL)', '2015-11-04 18:30:58'),
(57, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',''1'')', '2015-11-04 18:30:58'),
(58, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',''2'')', '2015-11-04 18:30:58'),
(59, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',''3'')', '2015-11-04 18:30:58'),
(60, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',''4'')', '2015-11-04 18:30:58'),
(61, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',''5'')', '2015-11-04 18:30:59'),
(62, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',''6'')', '2015-11-04 18:30:59'),
(63, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',''7'')', '2015-11-04 18:30:59'),
(64, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',NULL)', '2015-11-04 18:30:59'),
(65, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',''1'')', '2015-11-04 18:30:59'),
(66, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',''2'')', '2015-11-04 18:30:59'),
(67, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',''3'')', '2015-11-04 18:30:59'),
(68, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',''4'')', '2015-11-04 18:30:59'),
(69, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',''5'')', '2015-11-04 18:30:59'),
(70, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',''6'')', '2015-11-04 18:30:59'),
(71, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',''7'')', '2015-11-04 18:30:59'),
(72, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',NULL)', '2015-11-04 18:30:59'),
(73, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',''1'')', '2015-11-04 18:31:00'),
(74, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',''2'')', '2015-11-04 18:31:00'),
(75, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',''3'')', '2015-11-04 18:31:00'),
(76, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',''4'')', '2015-11-04 18:31:00'),
(77, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',''5'')', '2015-11-04 18:31:00'),
(78, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',''6'')', '2015-11-04 18:31:00'),
(79, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',''7'')', '2015-11-04 18:31:00'),
(80, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',NULL)', '2015-11-04 18:31:00'),
(81, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',''1'')', '2015-11-04 18:31:00'),
(82, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',''2'')', '2015-11-04 18:31:00'),
(83, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',''3'')', '2015-11-04 18:31:00'),
(84, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',''4'')', '2015-11-04 18:31:00'),
(85, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',''5'')', '2015-11-04 18:31:01'),
(86, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',''6'')', '2015-11-04 18:31:01'),
(87, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',''7'')', '2015-11-04 18:31:01'),
(88, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',NULL)', '2015-11-04 18:31:01'),
(89, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',''1'')', '2015-11-04 18:31:01'),
(90, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',''2'')', '2015-11-04 18:31:01'),
(91, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',''3'')', '2015-11-04 18:31:01'),
(92, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',''4'')', '2015-11-04 18:31:01'),
(93, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',''5'')', '2015-11-04 18:31:01'),
(94, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',''6'')', '2015-11-04 18:31:01'),
(95, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',''7'')', '2015-11-04 18:31:01'),
(96, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',NULL)', '2015-11-04 18:31:01'),
(97, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',''1'')', '2015-11-04 18:31:01'),
(98, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',''2'')', '2015-11-04 18:31:02'),
(99, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',''3'')', '2015-11-04 18:31:02'),
(100, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',''4'')', '2015-11-04 18:31:02'),
(101, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',''5'')', '2015-11-04 18:31:02'),
(102, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',''6'')', '2015-11-04 18:31:02'),
(103, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',''7'')', '2015-11-04 18:31:02'),
(104, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',NULL)', '2015-11-04 18:31:02'),
(105, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',''1'')', '2015-11-04 18:31:02'),
(106, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',''2'')', '2015-11-04 18:31:02'),
(107, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',''3'')', '2015-11-04 18:31:02'),
(108, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',''4'')', '2015-11-04 18:31:02'),
(109, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',''5'')', '2015-11-04 18:31:02'),
(110, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',''6'')', '2015-11-04 18:31:02'),
(111, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',''7'')', '2015-11-04 18:31:03'),
(112, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',NULL)', '2015-11-04 18:31:03'),
(113, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',''1'')', '2015-11-04 18:31:03'),
(114, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',''2'')', '2015-11-04 18:31:03'),
(115, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',''3'')', '2015-11-04 18:31:03'),
(116, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',''4'')', '2015-11-04 18:31:03'),
(117, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',''5'')', '2015-11-04 18:31:03'),
(118, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',''6'')', '2015-11-04 18:31:03'),
(119, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',''7'')', '2015-11-04 18:31:03'),
(120, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',NULL)', '2015-11-04 18:31:03'),
(121, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',''1'')', '2015-11-04 18:31:03'),
(122, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',''2'')', '2015-11-04 18:31:04'),
(123, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',''3'')', '2015-11-04 18:31:04'),
(124, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',''4'')', '2015-11-04 18:31:04'),
(125, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',''5'')', '2015-11-04 18:31:04'),
(126, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',''6'')', '2015-11-04 18:31:04'),
(127, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',''7'')', '2015-11-04 18:31:04'),
(128, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',NULL)', '2015-11-04 18:31:04'),
(129, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',''1'')', '2015-11-04 18:31:04'),
(130, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',''2'')', '2015-11-04 18:31:04'),
(131, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',''3'')', '2015-11-04 18:31:04'),
(132, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',''4'')', '2015-11-04 18:31:04'),
(133, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',''5'')', '2015-11-04 18:31:04'),
(134, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',''6'')', '2015-11-04 18:31:04'),
(135, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',''7'')', '2015-11-04 18:31:04'),
(136, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',NULL)', '2015-11-04 18:31:04'),
(137, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',''1'')', '2015-11-04 18:31:05'),
(138, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',''2'')', '2015-11-04 18:31:05'),
(139, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',''3'')', '2015-11-04 18:31:05'),
(140, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',''4'')', '2015-11-04 18:31:05'),
(141, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',''5'')', '2015-11-04 18:31:05'),
(142, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',''6'')', '2015-11-04 18:31:05'),
(143, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',''7'')', '2015-11-04 18:31:05'),
(144, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',NULL)', '2015-11-04 18:31:05'),
(145, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',''1'')', '2015-11-04 18:31:05'),
(146, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',''2'')', '2015-11-04 18:31:05'),
(147, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',''3'')', '2015-11-04 18:31:05'),
(148, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',''4'')', '2015-11-04 18:31:05'),
(149, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',''5'')', '2015-11-04 18:31:06'),
(150, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',''6'')', '2015-11-04 18:31:06'),
(151, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',''7'')', '2015-11-04 18:31:06'),
(152, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',NULL)', '2015-11-04 18:31:06'),
(153, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',''1'')', '2015-11-04 18:31:06'),
(154, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',''2'')', '2015-11-04 18:31:06'),
(155, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',''3'')', '2015-11-04 18:31:06'),
(156, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',''4'')', '2015-11-04 18:31:06'),
(157, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',''5'')', '2015-11-04 18:31:07'),
(158, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',''6'')', '2015-11-04 18:31:07'),
(159, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',''7'')', '2015-11-04 18:31:07'),
(160, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',NULL)', '2015-11-04 18:31:07'),
(161, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',''1'')', '2015-11-04 18:31:07'),
(162, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',''2'')', '2015-11-04 18:31:07'),
(163, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',''3'')', '2015-11-04 18:31:07'),
(164, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',''4'')', '2015-11-04 18:31:07'),
(165, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',''5'')', '2015-11-04 18:31:07'),
(166, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',''6'')', '2015-11-04 18:31:07'),
(167, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',''7'')', '2015-11-04 18:31:07'),
(168, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',NULL)', '2015-11-04 18:31:07'),
(169, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',''1'')', '2015-11-04 18:31:07'),
(170, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',''2'')', '2015-11-04 18:31:07'),
(171, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',''3'')', '2015-11-04 18:31:08'),
(172, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',''4'')', '2015-11-04 18:31:08'),
(173, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',''5'')', '2015-11-04 18:31:08'),
(174, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',''6'')', '2015-11-04 18:31:08'),
(175, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',''7'')', '2015-11-04 18:31:08'),
(176, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',NULL)', '2015-11-04 18:31:08'),
(177, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',''1'')', '2015-11-04 18:31:08'),
(178, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',''2'')', '2015-11-04 18:31:08'),
(179, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',''3'')', '2015-11-04 18:31:08'),
(180, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',''4'')', '2015-11-04 18:31:08'),
(181, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',''5'')', '2015-11-04 18:31:08'),
(182, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',''6'')', '2015-11-04 18:31:08'),
(183, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',''7'')', '2015-11-04 18:31:08'),
(184, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',NULL)', '2015-11-04 18:31:09'),
(185, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',''1'')', '2015-11-04 18:31:09'),
(186, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',''2'')', '2015-11-04 18:31:09'),
(187, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',''3'')', '2015-11-04 18:31:09'),
(188, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',''4'')', '2015-11-04 18:31:09'),
(189, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',''5'')', '2015-11-04 18:31:09'),
(190, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',''6'')', '2015-11-04 18:31:09'),
(191, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',''7'')', '2015-11-04 18:31:09'),
(192, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',NULL)', '2015-11-04 18:31:09'),
(193, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',''1'')', '2015-11-04 18:31:09'),
(194, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',''2'')', '2015-11-04 18:31:09'),
(195, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',''3'')', '2015-11-04 18:31:10'),
(196, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',''4'')', '2015-11-04 18:31:10'),
(197, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',''5'')', '2015-11-04 18:31:10'),
(198, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',''6'')', '2015-11-04 18:31:10'),
(199, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',''7'')', '2015-11-04 18:31:10'),
(200, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',NULL)', '2015-11-04 18:31:10'),
(201, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',''1'')', '2015-11-04 18:31:10'),
(202, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',''2'')', '2015-11-04 18:31:10'),
(203, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',''3'')', '2015-11-04 18:31:10'),
(204, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',''4'')', '2015-11-04 18:31:10'),
(205, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',''5'')', '2015-11-04 18:31:10'),
(206, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',''6'')', '2015-11-04 18:31:10'),
(207, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',''7'')', '2015-11-04 18:31:10'),
(208, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',NULL)', '2015-11-04 18:31:10'),
(209, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',''1'')', '2015-11-04 18:31:11'),
(210, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',''2'')', '2015-11-04 18:31:11'),
(211, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',''3'')', '2015-11-04 18:31:11'),
(212, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',''4'')', '2015-11-04 18:31:11'),
(213, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',''5'')', '2015-11-04 18:31:11'),
(214, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',''6'')', '2015-11-04 18:31:11'),
(215, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',''7'')', '2015-11-04 18:31:11'),
(216, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',NULL)', '2015-11-04 18:31:11'),
(217, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',''1'')', '2015-11-04 18:31:11'),
(218, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',''2'')', '2015-11-04 18:31:11'),
(219, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',''3'')', '2015-11-04 18:31:12'),
(220, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',''4'')', '2015-11-04 18:31:12'),
(221, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',''5'')', '2015-11-04 18:31:12'),
(222, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',''6'')', '2015-11-04 18:31:12'),
(223, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',''7'')', '2015-11-04 18:31:12'),
(224, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',NULL)', '2015-11-04 18:31:12'),
(225, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',''1'')', '2015-11-04 18:31:12'),
(226, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',''2'')', '2015-11-04 18:31:12'),
(227, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',''3'')', '2015-11-04 18:31:12'),
(228, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',''4'')', '2015-11-04 18:31:12'),
(229, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',''5'')', '2015-11-04 18:31:13'),
(230, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',''6'')', '2015-11-04 18:31:13'),
(231, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',''7'')', '2015-11-04 18:31:13'),
(232, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',NULL)', '2015-11-04 18:31:13'),
(233, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',''1'')', '2015-11-04 18:31:13'),
(234, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',''2'')', '2015-11-04 18:31:13'),
(235, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',''3'')', '2015-11-04 18:31:13'),
(236, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',''4'')', '2015-11-04 18:31:13'),
(237, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',''5'')', '2015-11-04 18:31:13');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(238, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',''6'')', '2015-11-04 18:31:13'),
(239, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',''7'')', '2015-11-04 18:31:13'),
(240, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',NULL)', '2015-11-04 18:31:13'),
(241, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',NULL)', '2015-11-04 18:31:13'),
(242, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',NULL)', '2015-11-04 18:31:14'),
(243, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',NULL)', '2015-11-04 18:31:14'),
(244, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',NULL)', '2015-11-04 18:31:14'),
(245, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',NULL)', '2015-11-04 18:31:14'),
(246, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',NULL)', '2015-11-04 18:31:14'),
(247, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',NULL)', '2015-11-04 18:31:14'),
(248, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',NULL)', '2015-11-04 18:31:14'),
(249, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',NULL)', '2015-11-04 18:31:14'),
(250, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',NULL)', '2015-11-04 18:31:14'),
(251, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',NULL)', '2015-11-04 18:31:14'),
(252, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',NULL)', '2015-11-04 18:31:14'),
(253, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',NULL)', '2015-11-04 18:31:14'),
(254, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',NULL)', '2015-11-04 18:31:15'),
(255, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',NULL)', '2015-11-04 18:31:15'),
(256, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',NULL)', '2015-11-04 18:31:15'),
(257, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',NULL)', '2015-11-04 18:31:15'),
(258, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',NULL)', '2015-11-04 18:31:15'),
(259, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',NULL)', '2015-11-04 18:31:15'),
(260, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',NULL)', '2015-11-04 18:31:15'),
(261, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',NULL)', '2015-11-04 18:31:15'),
(262, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',NULL)', '2015-11-04 18:31:15'),
(263, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',NULL)', '2015-11-04 18:31:16'),
(264, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',NULL)', '2015-11-04 18:31:16'),
(265, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',NULL)', '2015-11-04 18:31:16'),
(266, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',NULL)', '2015-11-04 18:31:16'),
(267, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',NULL)', '2015-11-04 18:31:16'),
(268, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',NULL)', '2015-11-04 18:31:16'),
(269, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',NULL)', '2015-11-04 18:31:17'),
(270, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',NULL)', '2015-11-04 18:31:17'),
(271, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',NULL)', '2015-11-04 18:31:17'),
(272, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',NULL)', '2015-11-04 18:31:17'),
(273, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',NULL)', '2015-11-04 18:31:17'),
(274, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',NULL)', '2015-11-04 18:31:17'),
(275, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',NULL)', '2015-11-04 18:31:17'),
(276, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',NULL)', '2015-11-04 18:31:17'),
(277, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',NULL)', '2015-11-04 18:31:17'),
(278, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',NULL)', '2015-11-04 18:31:17'),
(279, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',NULL)', '2015-11-04 18:31:17'),
(280, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',NULL)', '2015-11-04 18:31:17'),
(281, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',NULL)', '2015-11-04 18:31:18'),
(282, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',NULL)', '2015-11-04 18:31:18'),
(283, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',NULL)', '2015-11-04 18:31:18'),
(284, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',NULL)', '2015-11-04 18:31:18'),
(285, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',NULL)', '2015-11-04 18:31:18'),
(286, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',NULL)', '2015-11-04 18:31:18'),
(287, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',NULL)', '2015-11-04 18:31:18'),
(288, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',NULL)', '2015-11-04 18:31:18'),
(289, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',NULL)', '2015-11-04 18:31:18'),
(290, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',NULL)', '2015-11-04 18:31:18'),
(291, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',NULL)', '2015-11-04 18:31:18'),
(292, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',NULL)', '2015-11-04 18:31:18'),
(293, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',NULL)', '2015-11-04 18:31:19'),
(294, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',NULL)', '2015-11-04 18:31:19'),
(295, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',NULL)', '2015-11-04 18:31:19'),
(296, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',NULL)', '2015-11-04 18:31:19'),
(297, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',NULL)', '2015-11-04 18:31:19'),
(298, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',NULL)', '2015-11-04 18:31:19'),
(299, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',NULL)', '2015-11-04 18:31:19'),
(300, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',NULL)', '2015-11-04 18:31:19'),
(301, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',NULL)', '2015-11-04 18:31:19'),
(302, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',NULL)', '2015-11-04 18:31:19'),
(303, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',NULL)', '2015-11-04 18:31:19'),
(304, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',NULL)', '2015-11-04 18:31:20'),
(305, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',NULL)', '2015-11-04 18:31:20'),
(306, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',NULL)', '2015-11-04 18:31:20'),
(307, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',NULL)', '2015-11-04 18:31:20'),
(308, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',NULL)', '2015-11-04 18:31:20'),
(309, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',NULL)', '2015-11-04 18:31:20'),
(310, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',NULL)', '2015-11-04 18:31:20'),
(311, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',NULL)', '2015-11-04 18:31:20'),
(312, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',NULL)', '2015-11-04 18:31:20'),
(313, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',NULL)', '2015-11-04 18:31:20'),
(314, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',NULL)', '2015-11-04 18:31:20'),
(315, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',NULL)', '2015-11-04 18:31:20'),
(316, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',NULL)', '2015-11-04 18:31:20'),
(317, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',NULL)', '2015-11-04 18:31:20'),
(318, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',NULL)', '2015-11-04 18:31:21'),
(319, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',NULL)', '2015-11-04 18:31:21'),
(320, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',NULL)', '2015-11-04 18:31:21'),
(321, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',NULL)', '2015-11-04 18:31:21'),
(322, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',NULL)', '2015-11-04 18:31:21'),
(323, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',NULL)', '2015-11-04 18:31:21'),
(324, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',NULL)', '2015-11-04 18:31:21'),
(325, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',NULL)', '2015-11-04 18:31:21'),
(326, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',NULL)', '2015-11-04 18:31:22'),
(327, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',NULL)', '2015-11-04 18:31:22'),
(328, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',NULL)', '2015-11-04 18:31:22'),
(329, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',NULL)', '2015-11-04 18:31:22'),
(330, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',NULL)', '2015-11-04 18:31:22'),
(331, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',NULL)', '2015-11-04 18:31:22'),
(332, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',NULL)', '2015-11-04 18:31:22'),
(333, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',NULL)', '2015-11-04 18:31:22'),
(334, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',NULL)', '2015-11-04 18:31:22'),
(335, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',NULL)', '2015-11-04 18:31:22'),
(336, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',NULL)', '2015-11-04 18:31:22'),
(337, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',NULL)', '2015-11-04 18:31:23'),
(338, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',NULL)', '2015-11-04 18:31:23'),
(339, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',NULL)', '2015-11-04 18:31:23'),
(340, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',NULL)', '2015-11-04 18:31:23'),
(341, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',NULL)', '2015-11-04 18:31:23'),
(342, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',NULL)', '2015-11-04 18:31:23'),
(343, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',NULL)', '2015-11-04 18:31:23'),
(344, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',NULL)', '2015-11-04 18:31:23'),
(345, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',NULL)', '2015-11-04 18:31:23'),
(346, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',NULL)', '2015-11-04 18:31:23'),
(347, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',NULL)', '2015-11-04 18:31:23'),
(348, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',NULL)', '2015-11-04 18:31:23'),
(349, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',NULL)', '2015-11-04 18:31:23'),
(350, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',NULL)', '2015-11-04 18:31:24'),
(351, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',NULL)', '2015-11-04 18:31:24'),
(352, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',NULL)', '2015-11-04 18:31:24'),
(353, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',NULL)', '2015-11-04 18:31:24'),
(354, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',NULL)', '2015-11-04 18:31:24'),
(355, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',NULL)', '2015-11-04 18:31:24'),
(356, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',NULL)', '2015-11-04 18:31:24'),
(357, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',NULL)', '2015-11-04 18:31:24'),
(358, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',NULL)', '2015-11-04 18:31:24'),
(359, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',NULL)', '2015-11-04 18:31:24'),
(360, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',NULL)', '2015-11-04 18:31:24'),
(361, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',NULL)', '2015-11-04 18:31:24'),
(362, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',NULL)', '2015-11-04 18:31:24'),
(363, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',NULL)', '2015-11-04 18:31:25'),
(364, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',NULL)', '2015-11-04 18:31:25'),
(365, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',NULL)', '2015-11-04 18:31:25'),
(366, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',NULL)', '2015-11-04 18:31:25'),
(367, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',NULL)', '2015-11-04 18:31:25'),
(368, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',NULL)', '2015-11-04 18:31:25'),
(369, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',NULL)', '2015-11-04 18:31:25'),
(370, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',NULL)', '2015-11-04 18:31:25'),
(371, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',NULL)', '2015-11-04 18:31:25'),
(372, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',NULL)', '2015-11-04 18:31:25'),
(373, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',NULL)', '2015-11-04 18:31:26'),
(374, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',NULL)', '2015-11-04 18:31:26'),
(375, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tpais (descripcion) values (''COLOMBIA'');', '2015-11-04 18:51:56'),
(376, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tpais set fecha_desactivacion=CURDATE() where (codigo_pais=''2'');', '2015-11-04 18:53:33'),
(377, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tpais set fecha_desactivacion=NULL where (codigo_pais=''2'');', '2015-11-04 18:53:39'),
(378, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''MERIDA'',''1'');', '2015-11-04 18:57:19'),
(379, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into testado (descripcion,codigo_pais) values (''LARA'',''1'');', '2015-11-04 18:57:23'),
(380, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update testado set descripcion=''APURE'',codigo_pais=''1'' where (codigo_estado=''2'');', '2015-11-04 18:57:42'),
(381, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ARAURE'',''1'');', '2015-11-04 19:07:01'),
(382, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''ESTELLER'',''1'');', '2015-11-04 19:07:16'),
(383, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''CAPITAL ARAURE'',''2'');', '2015-11-04 19:10:11'),
(384, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tparroquia (descripcion,codigo_municipio) values (''RÍO ACARIGUA'',''2'');', '2015-11-04 19:10:20'),
(385, '::1', 'Linux', 'Google Chrome', 'admin@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2015-11-04 19:58:06'),
(386, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-04 19:58:15'),
(387, '::1', 'Linux', 'Google Chrome', 'admin@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2015-11-04 21:10:01'),
(388, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-04 21:10:12'),
(389, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tparentesco (descripcion) values (''PADRE'');', '2015-11-04 21:21:37'),
(390, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tservicio set descripcion=''AÑO ACADÉMICO'',url=''ANO_ACADEMICO'',\r\n    orden=''2'',codigo_modulo=''3'' where (codigo_servicio=''9'');', '2015-11-04 22:13:04'),
(391, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tservicio set descripcion=''AÑO ACADÉMICO'',url=''ANO_ACADEMICO'',\r\n    orden=''2'',codigo_modulo=''3'' where (codigo_servicio=''9'');', '2015-11-04 22:14:17'),
(392, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tservicio set descripcion=''AÑO ACADÉMICO'',url=''ANO_ACADEMICO'',\r\n    orden=''2'',codigo_modulo=''3'' where (codigo_servicio=''9'');', '2015-11-04 22:28:26'),
(393, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tmateria (descripcion,unidad_curricular) values (''IDIOMA'',''IDIOMA'');', '2015-11-04 23:47:49'),
(394, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tmateria set descripcion=''IDIOMA'',unidad_curricular=''2'' where (codigo_materia='''');', '2015-11-04 23:53:04'),
(395, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tmateria set descripcion=''IDIOMA'',unidad_curricular=''2'' where (codigo_materia=''Id001'');', '2015-11-04 23:57:01'),
(396, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tmateria set descripcion=''IDIOMA'',unidad_curricular=''2'' where (codigo_materia=''IDIO001'');', '2015-11-04 23:58:50'),
(397, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tmateria (descripcion,unidad_curricular) values (''IDIOMA'',''2'');', '2015-11-05 00:02:30'),
(398, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tmateria set descripcion=''IDIOMA'',unidad_curricular=''2'' where (codigo_materia=''IDIO001'');', '2015-11-05 00:03:58'),
(399, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular) values (''IDIO001'',''IDIOMA'',''2'');', '2015-11-05 00:06:35'),
(400, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-06 19:45:19'),
(401, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tseccion (seccion,descripcion,turno,capacidad_min,capacidad_max) values \r\n    (''SEC01'',''SECCIÓN 1'',''D'',''15'',''30'');', '2015-11-06 20:18:58'),
(402, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tservicio set descripcion=''AÑO ACADÉMICO'',url=''ANO_ACADEMICO'',\r\n    orden=''2'',codigo_modulo=''3'' where (codigo_servicio=''9'');', '2015-11-06 20:32:35'),
(403, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2015-11-06 21:08:15'),
(404, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-06 21:08:26'),
(405, '::1', 'Linux', 'Google Chrome', 'admin@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2015-11-06 22:11:09'),
(406, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-06 22:11:26'),
(407, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-06 22:51:36'),
(408, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tinscripcion (fecha_inicio,fecha_fin,fecha_cierre) values (''06/11/2015'',\n    ''19/11/2015'',''26/11/2015'');', '2015-11-06 23:07:26'),
(409, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-08 13:33:44'),
(410, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tcargo (descripcion) values (''DOCENTE'');', '2015-11-08 13:43:57'),
(411, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tcargo (descripcion) values (''DIRECTOR'');', '2015-11-08 13:44:06'),
(412, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tcargo set descripcion=''DIRECTORA'' where (codigo_cargo=''3'');', '2015-11-08 13:44:17'),
(413, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tcargo set descripcion=''DIRECTOR'' where (codigo_cargo=''3'');', '2015-11-08 13:44:26'),
(414, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tparentesco (descripcion) values (''MADRE'');', '2015-11-08 13:44:56'),
(415, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tparentesco (descripcion) values (''HERMANO'');', '2015-11-08 13:45:10'),
(416, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tparentesco set descripcion=''HERMANA'' where (codigo_parentesco=''3'');', '2015-11-08 13:45:21'),
(417, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tparentesco (descripcion) values (''HERMANO'');', '2015-11-08 13:45:30'),
(418, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tparentesco (descripcion) values (''PRIMO'');', '2015-11-08 13:45:36'),
(419, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tparentesco (descripcion) values (''PRIMA'');', '2015-11-08 13:45:42'),
(420, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-08 13:48:57'),
(421, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-08 13:49:47'),
(422, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tano_academico (descripcion) values (''AÑO 2015-2016'');', '2015-11-08 13:55:31'),
(423, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tano_academico set descripcion=''2015-2016'' where (codigo_ano_academico=''2'');', '2015-11-08 13:59:47'),
(424, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tano_academico set fecha_desactivacion=CURDATE() where (codigo_ano_academico=''2'');', '2015-11-08 14:03:26'),
(425, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tano_academico set fecha_desactivacion=NULL where (codigo_ano_academico=''2'');', '2015-11-08 14:03:31'),
(426, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tlapso (descripcion,fecha_inicio,fecha_fin,codigo_ano_academico) values (''1ER LAPSO'',''15/09/2015'',\r\n    ''11/12/2015'',''2'');', '2015-11-08 14:09:57'),
(427, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tlapso (descripcion,fecha_inicio,fecha_fin,codigo_ano_academico) values (''2DO LAPSO'',''11/01/2016'',\r\n    ''30/04/2016'',''2'');', '2015-11-08 14:11:04'),
(428, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tlapso (descripcion,fecha_inicio,fecha_fin,codigo_ano_academico) values (''3ER LAPSO'',''09/05/2016'',\r\n    ''15/07/2016'',''2'');', '2015-11-08 14:11:37'),
(429, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tlapso (descripcion,fecha_inicio,fecha_fin,codigo_ano_academico) values (''4TO LAPSO'',STR_TO_DATE(''01/11/2015'',''%d/%m/%Y''),\r\n    STR_TO_DATE(''30/11/2015'',''%d/%m/%Y''),''2'');', '2015-11-08 14:24:11'),
(430, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tlapso set fecha_desactivacion=CURDATE() where (codigo_lapso=''3'');', '2015-11-08 14:27:02'),
(431, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tlapso set fecha_desactivacion=NULL where (codigo_lapso=''3'');', '2015-11-08 14:27:11'),
(432, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tmateria (codigo_materia,descripcion,unidad_curricular) values (''LYL0001'',''LENGUA Y LITERATURA'',''2'');', '2015-11-08 14:27:46'),
(433, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tmateria set  codigo_materia=''CAST0001'',descripcion=''CASTELLANOS'',unidad_curricular=''1'' where (codigo_materia=''CAST0001'');', '2015-11-08 14:32:10'),
(434, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tmateria set  codigo_materia=''CAST0001'',descripcion=''CASTELLANOS'',unidad_curricular=''1'' where (codigo_materia=''LYL0001'');', '2015-11-08 14:35:47'),
(435, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tmateria set  codigo_materia=''CAS0001'',descripcion=''CASTELLANOS'',unidad_curricular=''1'' where (codigo_materia=''CAST000'');', '2015-11-08 14:36:06'),
(436, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tservicio set descripcion=''PLANTEL'',url=''PLANTEL'',\r\n    orden=''1'',codigo_modulo=''2'' where (codigo_servicio=''5'');', '2015-11-08 14:42:06'),
(437, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-08 15:10:19'),
(438, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tmunicipio (descripcion,codigo_estado) values (''AGUA BLANCA'',''1'');', '2015-11-08 15:50:03'),
(439, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tplantel (codigo_plantel,nombre,direccion,telefono_habitacion,localidad,codigo_municipio) values \r\n    (''OD00741801'',''UNIDAD EDUCATIVA NACIONAL QUEBRADA HONDA'',''CALLE 03 CENTRO POBLADO B QUEBRADA HONDA'',''02558084598'',''CENTRO B'',''4'');', '2015-11-08 15:53:03'),
(440, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tinscripcion (descripcion,fecha_inicio,fecha_fin,fecha_cierre) values (''PERÍODO 2015-2016'',STR_TO_DATE(''03/08/2015'',''%d/%m/%Y''),\n    STR_TO_DATE(''28/08/2015'',''%d/%m/%Y''),STR_TO_DATE(''11/09/2015'',''%d/%m/%Y''));', '2015-11-08 16:23:27'),
(441, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-08 19:08:50'),
(442, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-08 19:25:07'),
(443, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tperfil set descripcion=''ADMINISTRADOR'' where (codigo_perfil=''1'');', '2015-11-08 19:28:03'),
(444, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'DELETE FROM tservicio_usuario_opcion where (codigo_perfil=''1'');', '2015-11-08 19:28:03'),
(445, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',NULL)', '2015-11-08 19:28:03'),
(446, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',''5'')', '2015-11-08 19:28:03'),
(447, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',''6'')', '2015-11-08 19:28:04'),
(448, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',''7'')', '2015-11-08 19:28:04'),
(449, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',NULL)', '2015-11-08 19:28:04'),
(450, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',''1'')', '2015-11-08 19:28:04'),
(451, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',''2'')', '2015-11-08 19:28:04'),
(452, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',''3'')', '2015-11-08 19:28:04'),
(453, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',''4'')', '2015-11-08 19:28:04'),
(454, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',''5'')', '2015-11-08 19:28:04'),
(455, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',''6'')', '2015-11-08 19:28:04'),
(456, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',''7'')', '2015-11-08 19:28:05'),
(457, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',NULL)', '2015-11-08 19:28:05'),
(458, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',''1'')', '2015-11-08 19:28:05'),
(459, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',''2'')', '2015-11-08 19:28:05'),
(460, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',''3'')', '2015-11-08 19:28:05'),
(461, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',''4'')', '2015-11-08 19:28:05'),
(462, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',''5'')', '2015-11-08 19:28:05'),
(463, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',''6'')', '2015-11-08 19:28:05'),
(464, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',''7'')', '2015-11-08 19:28:05'),
(465, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',NULL)', '2015-11-08 19:28:05'),
(466, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',''1'')', '2015-11-08 19:28:05'),
(467, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',''2'')', '2015-11-08 19:28:06'),
(468, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',''3'')', '2015-11-08 19:28:06'),
(469, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',''4'')', '2015-11-08 19:28:06'),
(470, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',''5'')', '2015-11-08 19:28:06'),
(471, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',''6'')', '2015-11-08 19:28:06'),
(472, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',''7'')', '2015-11-08 19:28:06'),
(473, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',NULL)', '2015-11-08 19:28:06'),
(474, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',''1'')', '2015-11-08 19:28:06'),
(475, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',''2'')', '2015-11-08 19:28:06'),
(476, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',''3'')', '2015-11-08 19:28:06'),
(477, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',''4'')', '2015-11-08 19:28:07');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(478, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',''5'')', '2015-11-08 19:28:07'),
(479, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',''6'')', '2015-11-08 19:28:07'),
(480, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',''7'')', '2015-11-08 19:28:07'),
(481, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',NULL)', '2015-11-08 19:28:07'),
(482, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',''1'')', '2015-11-08 19:28:07'),
(483, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',''2'')', '2015-11-08 19:28:07'),
(484, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',''3'')', '2015-11-08 19:28:08'),
(485, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',''4'')', '2015-11-08 19:28:08'),
(486, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',''5'')', '2015-11-08 19:28:08'),
(487, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',''6'')', '2015-11-08 19:28:08'),
(488, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',''7'')', '2015-11-08 19:28:08'),
(489, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',NULL)', '2015-11-08 19:28:08'),
(490, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',''1'')', '2015-11-08 19:28:08'),
(491, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',''2'')', '2015-11-08 19:28:08'),
(492, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',''3'')', '2015-11-08 19:28:08'),
(493, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',''4'')', '2015-11-08 19:28:09'),
(494, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',''5'')', '2015-11-08 19:28:09'),
(495, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',''6'')', '2015-11-08 19:28:09'),
(496, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',''7'')', '2015-11-08 19:28:09'),
(497, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',NULL)', '2015-11-08 19:28:09'),
(498, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',''1'')', '2015-11-08 19:28:09'),
(499, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',''2'')', '2015-11-08 19:28:09'),
(500, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',''3'')', '2015-11-08 19:28:09'),
(501, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',''4'')', '2015-11-08 19:28:09'),
(502, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',''5'')', '2015-11-08 19:28:09'),
(503, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',''6'')', '2015-11-08 19:28:10'),
(504, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',''7'')', '2015-11-08 19:28:10'),
(505, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',NULL)', '2015-11-08 19:28:10'),
(506, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',''1'')', '2015-11-08 19:28:10'),
(507, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',''2'')', '2015-11-08 19:28:10'),
(508, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',''3'')', '2015-11-08 19:28:10'),
(509, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',''4'')', '2015-11-08 19:28:10'),
(510, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',''5'')', '2015-11-08 19:28:10'),
(511, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',''6'')', '2015-11-08 19:28:10'),
(512, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',''7'')', '2015-11-08 19:28:11'),
(513, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',NULL)', '2015-11-08 19:28:11'),
(514, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',''1'')', '2015-11-08 19:28:11'),
(515, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',''2'')', '2015-11-08 19:28:11'),
(516, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',''3'')', '2015-11-08 19:28:11'),
(517, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',''4'')', '2015-11-08 19:28:11'),
(518, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',''5'')', '2015-11-08 19:28:11'),
(519, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',''6'')', '2015-11-08 19:28:11'),
(520, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',''7'')', '2015-11-08 19:28:11'),
(521, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',NULL)', '2015-11-08 19:28:12'),
(522, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',''1'')', '2015-11-08 19:28:12'),
(523, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',''2'')', '2015-11-08 19:28:12'),
(524, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',''3'')', '2015-11-08 19:28:12'),
(525, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',''4'')', '2015-11-08 19:28:12'),
(526, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',''5'')', '2015-11-08 19:28:12'),
(527, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',''6'')', '2015-11-08 19:28:12'),
(528, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',''7'')', '2015-11-08 19:28:13'),
(529, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',NULL)', '2015-11-08 19:28:13'),
(530, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',''1'')', '2015-11-08 19:28:13'),
(531, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',''2'')', '2015-11-08 19:28:13'),
(532, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',''3'')', '2015-11-08 19:28:13'),
(533, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',''4'')', '2015-11-08 19:28:13'),
(534, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',''5'')', '2015-11-08 19:28:13'),
(535, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',''6'')', '2015-11-08 19:28:14'),
(536, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',''7'')', '2015-11-08 19:28:14'),
(537, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',NULL)', '2015-11-08 19:28:14'),
(538, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',''1'')', '2015-11-08 19:28:14'),
(539, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',''2'')', '2015-11-08 19:28:14'),
(540, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',''3'')', '2015-11-08 19:28:14'),
(541, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',''4'')', '2015-11-08 19:28:14'),
(542, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',''5'')', '2015-11-08 19:28:15'),
(543, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',''6'')', '2015-11-08 19:28:15'),
(544, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',''7'')', '2015-11-08 19:28:15'),
(545, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',NULL)', '2015-11-08 19:28:15'),
(546, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',''1'')', '2015-11-08 19:28:15'),
(547, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',''2'')', '2015-11-08 19:28:15'),
(548, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',''3'')', '2015-11-08 19:28:15'),
(549, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',''4'')', '2015-11-08 19:28:16'),
(550, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',''5'')', '2015-11-08 19:28:16'),
(551, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',''6'')', '2015-11-08 19:28:16'),
(552, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',''7'')', '2015-11-08 19:28:16'),
(553, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',NULL)', '2015-11-08 19:28:16'),
(554, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',''1'')', '2015-11-08 19:28:16'),
(555, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',''2'')', '2015-11-08 19:28:16'),
(556, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',''3'')', '2015-11-08 19:28:17'),
(557, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',''4'')', '2015-11-08 19:28:17'),
(558, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',''5'')', '2015-11-08 19:28:17'),
(559, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',''6'')', '2015-11-08 19:28:17'),
(560, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',''7'')', '2015-11-08 19:28:17'),
(561, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',NULL)', '2015-11-08 19:28:17'),
(562, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',''1'')', '2015-11-08 19:28:17'),
(563, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',''2'')', '2015-11-08 19:28:17'),
(564, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',''3'')', '2015-11-08 19:28:17'),
(565, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',''4'')', '2015-11-08 19:28:17'),
(566, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',''5'')', '2015-11-08 19:28:18'),
(567, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',''6'')', '2015-11-08 19:28:18'),
(568, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',''7'')', '2015-11-08 19:28:18'),
(569, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',NULL)', '2015-11-08 19:28:18'),
(570, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',''1'')', '2015-11-08 19:28:18'),
(571, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',''2'')', '2015-11-08 19:28:18'),
(572, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',''3'')', '2015-11-08 19:28:18'),
(573, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',''4'')', '2015-11-08 19:28:18'),
(574, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',''5'')', '2015-11-08 19:28:18'),
(575, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',''6'')', '2015-11-08 19:28:18'),
(576, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',''7'')', '2015-11-08 19:28:18'),
(577, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',NULL)', '2015-11-08 19:28:19'),
(578, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',''1'')', '2015-11-08 19:28:19'),
(579, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',''2'')', '2015-11-08 19:28:19'),
(580, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',''3'')', '2015-11-08 19:28:19'),
(581, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',''4'')', '2015-11-08 19:28:19'),
(582, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',''5'')', '2015-11-08 19:28:19'),
(583, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',''6'')', '2015-11-08 19:28:19'),
(584, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',''7'')', '2015-11-08 19:28:19'),
(585, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',NULL)', '2015-11-08 19:28:19'),
(586, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',''1'')', '2015-11-08 19:28:20'),
(587, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',''2'')', '2015-11-08 19:28:20'),
(588, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',''3'')', '2015-11-08 19:28:20'),
(589, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',''4'')', '2015-11-08 19:28:20'),
(590, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',''5'')', '2015-11-08 19:28:20'),
(591, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',''6'')', '2015-11-08 19:28:20'),
(592, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',''7'')', '2015-11-08 19:28:20'),
(593, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',NULL)', '2015-11-08 19:28:20'),
(594, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',''1'')', '2015-11-08 19:28:20'),
(595, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',''2'')', '2015-11-08 19:28:20'),
(596, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',''3'')', '2015-11-08 19:28:21'),
(597, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',''4'')', '2015-11-08 19:28:21'),
(598, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',''5'')', '2015-11-08 19:28:21'),
(599, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',''6'')', '2015-11-08 19:28:21'),
(600, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',''7'')', '2015-11-08 19:28:21'),
(601, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',NULL)', '2015-11-08 19:28:21'),
(602, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',''1'')', '2015-11-08 19:28:21'),
(603, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',''2'')', '2015-11-08 19:28:21'),
(604, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',''3'')', '2015-11-08 19:28:22'),
(605, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',''4'')', '2015-11-08 19:28:22'),
(606, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',''5'')', '2015-11-08 19:28:22'),
(607, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',''6'')', '2015-11-08 19:28:22'),
(608, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',''7'')', '2015-11-08 19:28:22'),
(609, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',NULL)', '2015-11-08 19:28:22'),
(610, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',''1'')', '2015-11-08 19:28:22'),
(611, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',''2'')', '2015-11-08 19:28:22'),
(612, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',''3'')', '2015-11-08 19:28:22'),
(613, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',''4'')', '2015-11-08 19:28:23'),
(614, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',''5'')', '2015-11-08 19:28:23'),
(615, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',''6'')', '2015-11-08 19:28:23'),
(616, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',''7'')', '2015-11-08 19:28:23'),
(617, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',NULL)', '2015-11-08 19:28:23'),
(618, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',''1'')', '2015-11-08 19:28:23'),
(619, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',''2'')', '2015-11-08 19:28:23'),
(620, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',''3'')', '2015-11-08 19:28:23'),
(621, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',''4'')', '2015-11-08 19:28:23'),
(622, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',''5'')', '2015-11-08 19:28:24'),
(623, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',''6'')', '2015-11-08 19:28:24'),
(624, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',''7'')', '2015-11-08 19:28:24'),
(625, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',NULL)', '2015-11-08 19:28:24'),
(626, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',''1'')', '2015-11-08 19:28:24'),
(627, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',''2'')', '2015-11-08 19:28:24'),
(628, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',''3'')', '2015-11-08 19:28:24'),
(629, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',''4'')', '2015-11-08 19:28:25'),
(630, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',''5'')', '2015-11-08 19:28:25'),
(631, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',''6'')', '2015-11-08 19:28:25'),
(632, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',''7'')', '2015-11-08 19:28:25'),
(633, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',NULL)', '2015-11-08 19:28:25'),
(634, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',''1'')', '2015-11-08 19:28:25'),
(635, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',''2'')', '2015-11-08 19:28:25'),
(636, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',''3'')', '2015-11-08 19:28:25'),
(637, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',''4'')', '2015-11-08 19:28:25'),
(638, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',''5'')', '2015-11-08 19:28:26'),
(639, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',''6'')', '2015-11-08 19:28:26'),
(640, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',''7'')', '2015-11-08 19:28:26'),
(641, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',NULL)', '2015-11-08 19:28:26'),
(642, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',''1'')', '2015-11-08 19:28:26'),
(643, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',''2'')', '2015-11-08 19:28:26'),
(644, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',''3'')', '2015-11-08 19:28:26'),
(645, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',''4'')', '2015-11-08 19:28:26'),
(646, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',''5'')', '2015-11-08 19:28:26'),
(647, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',''6'')', '2015-11-08 19:28:27'),
(648, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',''7'')', '2015-11-08 19:28:27'),
(649, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',NULL)', '2015-11-08 19:28:27'),
(650, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',''1'')', '2015-11-08 19:28:27'),
(651, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',''2'')', '2015-11-08 19:28:27'),
(652, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',''3'')', '2015-11-08 19:28:27'),
(653, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',''4'')', '2015-11-08 19:28:27'),
(654, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',''5'')', '2015-11-08 19:28:27'),
(655, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',''6'')', '2015-11-08 19:28:28'),
(656, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',''7'')', '2015-11-08 19:28:28'),
(657, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',NULL)', '2015-11-08 19:28:28'),
(658, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',NULL)', '2015-11-08 19:28:28'),
(659, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',NULL)', '2015-11-08 19:28:28'),
(660, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',NULL)', '2015-11-08 19:28:28'),
(661, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',NULL)', '2015-11-08 19:28:28'),
(662, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',NULL)', '2015-11-08 19:28:28'),
(663, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',NULL)', '2015-11-08 19:28:29'),
(664, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',NULL)', '2015-11-08 19:28:29'),
(665, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',NULL)', '2015-11-08 19:28:29'),
(666, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',NULL)', '2015-11-08 19:28:29'),
(667, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',NULL)', '2015-11-08 19:28:29'),
(668, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',NULL)', '2015-11-08 19:28:29'),
(669, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',NULL)', '2015-11-08 19:28:29'),
(670, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',NULL)', '2015-11-08 19:28:29'),
(671, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',NULL)', '2015-11-08 19:28:29'),
(672, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',NULL)', '2015-11-08 19:28:29'),
(673, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',NULL)', '2015-11-08 19:28:30'),
(674, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',NULL)', '2015-11-08 19:28:30'),
(675, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',NULL)', '2015-11-08 19:28:30'),
(676, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',NULL)', '2015-11-08 19:28:30'),
(677, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',NULL)', '2015-11-08 19:28:30'),
(678, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',NULL)', '2015-11-08 19:28:30'),
(679, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',NULL)', '2015-11-08 19:28:30'),
(680, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',NULL)', '2015-11-08 19:28:30'),
(681, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',NULL)', '2015-11-08 19:28:31'),
(682, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',NULL)', '2015-11-08 19:28:31'),
(683, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',NULL)', '2015-11-08 19:28:31'),
(684, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',NULL)', '2015-11-08 19:28:31'),
(685, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',NULL)', '2015-11-08 19:28:31'),
(686, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',NULL)', '2015-11-08 19:28:31'),
(687, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',NULL)', '2015-11-08 19:28:31'),
(688, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',NULL)', '2015-11-08 19:28:31'),
(689, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',NULL)', '2015-11-08 19:28:31'),
(690, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',NULL)', '2015-11-08 19:28:32'),
(691, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',NULL)', '2015-11-08 19:28:32'),
(692, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',NULL)', '2015-11-08 19:28:32'),
(693, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',NULL)', '2015-11-08 19:28:32'),
(694, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',NULL)', '2015-11-08 19:28:32'),
(695, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',NULL)', '2015-11-08 19:28:32'),
(696, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',NULL)', '2015-11-08 19:28:32'),
(697, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',NULL)', '2015-11-08 19:28:32'),
(698, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',NULL)', '2015-11-08 19:28:32'),
(699, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',NULL)', '2015-11-08 19:28:32'),
(700, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',NULL)', '2015-11-08 19:28:33'),
(701, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',NULL)', '2015-11-08 19:28:33'),
(702, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',NULL)', '2015-11-08 19:28:33'),
(703, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',NULL)', '2015-11-08 19:28:33'),
(704, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',NULL)', '2015-11-08 19:28:33'),
(705, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',NULL)', '2015-11-08 19:28:33'),
(706, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',NULL)', '2015-11-08 19:28:33'),
(707, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',NULL)', '2015-11-08 19:28:33'),
(708, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',NULL)', '2015-11-08 19:28:34'),
(709, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',NULL)', '2015-11-08 19:28:34');
INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(710, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',NULL)', '2015-11-08 19:28:34'),
(711, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',NULL)', '2015-11-08 19:28:34'),
(712, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',NULL)', '2015-11-08 19:28:34'),
(713, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',NULL)', '2015-11-08 19:28:34'),
(714, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',NULL)', '2015-11-08 19:28:34'),
(715, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',NULL)', '2015-11-08 19:28:34'),
(716, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',NULL)', '2015-11-08 19:28:34'),
(717, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',NULL)', '2015-11-08 19:28:35'),
(718, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',NULL)', '2015-11-08 19:28:35'),
(719, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',NULL)', '2015-11-08 19:28:35'),
(720, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',NULL)', '2015-11-08 19:28:35'),
(721, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',NULL)', '2015-11-08 19:28:35'),
(722, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',NULL)', '2015-11-08 19:28:36'),
(723, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',NULL)', '2015-11-08 19:28:36'),
(724, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',NULL)', '2015-11-08 19:28:36'),
(725, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',NULL)', '2015-11-08 19:28:36'),
(726, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',NULL)', '2015-11-08 19:28:36'),
(727, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',NULL)', '2015-11-08 19:28:36'),
(728, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',NULL)', '2015-11-08 19:28:36'),
(729, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',NULL)', '2015-11-08 19:28:36'),
(730, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',NULL)', '2015-11-08 19:28:37'),
(731, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',NULL)', '2015-11-08 19:28:37'),
(732, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',NULL)', '2015-11-08 19:28:37'),
(733, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',NULL)', '2015-11-08 19:28:37'),
(734, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',NULL)', '2015-11-08 19:28:37'),
(735, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',NULL)', '2015-11-08 19:28:37'),
(736, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',NULL)', '2015-11-08 19:28:37'),
(737, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',NULL)', '2015-11-08 19:28:37'),
(738, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',NULL)', '2015-11-08 19:28:38'),
(739, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',NULL)', '2015-11-08 19:28:38'),
(740, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',NULL)', '2015-11-08 19:28:38'),
(741, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',NULL)', '2015-11-08 19:28:38'),
(742, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',NULL)', '2015-11-08 19:28:38'),
(743, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',NULL)', '2015-11-08 19:28:38'),
(744, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',NULL)', '2015-11-08 19:28:38'),
(745, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',NULL)', '2015-11-08 19:28:38'),
(746, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',NULL)', '2015-11-08 19:28:38'),
(747, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',NULL)', '2015-11-08 19:28:38'),
(748, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',NULL)', '2015-11-08 19:28:39'),
(749, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',NULL)', '2015-11-08 19:28:39'),
(750, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',NULL)', '2015-11-08 19:28:39'),
(751, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',NULL)', '2015-11-08 19:28:39'),
(752, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',NULL)', '2015-11-08 19:28:39'),
(753, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',NULL)', '2015-11-08 19:28:39'),
(754, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',NULL)', '2015-11-08 19:28:39'),
(755, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',NULL)', '2015-11-08 19:28:40'),
(756, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',NULL)', '2015-11-08 19:28:40'),
(757, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',NULL)', '2015-11-08 19:28:40'),
(758, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',NULL)', '2015-11-08 19:28:40'),
(759, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',NULL)', '2015-11-08 19:28:40'),
(760, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',NULL)', '2015-11-08 19:28:40'),
(761, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',NULL)', '2015-11-08 19:28:40'),
(762, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',NULL)', '2015-11-08 19:28:40'),
(763, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',NULL)', '2015-11-08 19:28:40'),
(764, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',NULL)', '2015-11-08 19:28:41'),
(765, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''1'',NULL)', '2015-11-08 19:28:41'),
(766, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''2'',NULL)', '2015-11-08 19:28:41'),
(767, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''3'',NULL)', '2015-11-08 19:28:41'),
(768, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''4'',NULL)', '2015-11-08 19:28:41'),
(769, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''5'',NULL)', '2015-11-08 19:28:41'),
(770, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''6'',NULL)', '2015-11-08 19:28:41'),
(771, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''7'',NULL)', '2015-11-08 19:28:41'),
(772, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''8'',NULL)', '2015-11-08 19:28:42'),
(773, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''9'',NULL)', '2015-11-08 19:28:42'),
(774, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''10'',NULL)', '2015-11-08 19:28:42'),
(775, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''11'',NULL)', '2015-11-08 19:28:42'),
(776, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''12'',NULL)', '2015-11-08 19:28:42'),
(777, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''13'',NULL)', '2015-11-08 19:28:42'),
(778, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''14'',NULL)', '2015-11-08 19:28:42'),
(779, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''15'',NULL)', '2015-11-08 19:28:42'),
(780, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''16'',NULL)', '2015-11-08 19:28:42'),
(781, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''17'',NULL)', '2015-11-08 19:28:43'),
(782, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''18'',NULL)', '2015-11-08 19:28:43'),
(783, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''19'',NULL)', '2015-11-08 19:28:43'),
(784, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''20'',NULL)', '2015-11-08 19:28:43'),
(785, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''21'',NULL)', '2015-11-08 19:28:43'),
(786, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''22'',NULL)', '2015-11-08 19:28:43'),
(787, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''23'',NULL)', '2015-11-08 19:28:43'),
(788, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''24'',NULL)', '2015-11-08 19:28:43'),
(789, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''25'',NULL)', '2015-11-08 19:28:43'),
(790, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''26'',NULL)', '2015-11-08 19:28:44'),
(791, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (''1'',''27'',NULL)', '2015-11-08 19:28:44'),
(792, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'insert into tmodulo (descripcion,icono,orden) values (''TRANSACCIONES'',''icon-cog'',''5'');', '2015-11-08 19:46:12'),
(793, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tservicio set descripcion=''ASIGNACIÓN DE SECCIONES'',url=''ASIGNAR_SECCION'',\r\n    orden=''10'',codigo_modulo=''7'' where (codigo_servicio=''17'');', '2015-11-08 19:46:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcargo`
--

CREATE TABLE IF NOT EXISTS `tcargo` (
`codigo_cargo` int(15) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tcargo`
--

INSERT INTO `tcargo` (`codigo_cargo`, `descripcion`, `fecha_desactivacion`) VALUES
(1, 'OPERADOR DE SISTEMA', NULL),
(2, 'DOCENTE', NULL),
(3, 'DIRECTOR', NULL);

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
('V123456789', '1f82ea75c5cc526729e2d581aeb3aeccfef4407e', 0, '2015-11-03 18:32:29'),
('V123456789', '2e5f402b1f0117f9f7217a3e8cbff136b1e304ad', 1, '2015-11-03 18:32:29');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `testado`
--

INSERT INTO `testado` (`codigo_estado`, `descripcion`, `codigo_pais`, `fecha_desactivacion`) VALUES
(1, 'PORTUGUESA', 1, NULL),
(2, 'APURE', 1, NULL),
(3, 'LARA', 1, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tinscripcion`
--

INSERT INTO `tinscripcion` (`codigo_inscripcion`, `descripcion`, `fecha_inicio`, `fecha_fin`, `fecha_cierre`, `fecha_desactivacion`) VALUES
(2, 'PERÍODO 2015-2016', '2015-08-03', '2015-08-28', '2015-09-11', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tlapso`
--

INSERT INTO `tlapso` (`codigo_lapso`, `descripcion`, `fecha_inicio`, `fecha_fin`, `codigo_ano_academico`, `fecha_desactivacion`) VALUES
(1, '1ER LAPSO', '2015-09-14', '2015-12-11', 2, NULL),
(2, '2DO LAPSO', '2016-01-11', '2016-04-29', 2, NULL),
(3, '3ER LAPSO', '2016-05-09', '2016-07-15', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmateria`
--

CREATE TABLE IF NOT EXISTS `tmateria` (
  `codigo_materia` char(7) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `unidad_curricular` int(11) NOT NULL DEFAULT '0',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tmateria`
--

INSERT INTO `tmateria` (`codigo_materia`, `descripcion`, `unidad_curricular`, `fecha_desactivacion`) VALUES
('CAS0001', 'CASTELLANOS', 1, NULL),
('IDIO001', 'IDIOMA', 2, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tmodulo`
--

INSERT INTO `tmodulo` (`codigo_modulo`, `descripcion`, `icono`, `orden`, `fecha_desactivacion`) VALUES
(1, 'LOCALIDADES', 'icon-list', 1, NULL),
(2, 'GENERAL', 'icon-list', 2, NULL),
(3, 'EDUCACIÓN', 'icon-list-alt', 3, NULL),
(4, 'CONTROL DE NOTAS', 'icon-list-alt', 4, NULL),
(5, 'REPORTES', 'icon-cog', 5, NULL),
(6, 'SEGURIDAD', 'icon-lock', 6, NULL),
(7, 'TRANSACCIONES', 'icon-cog', 5, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmunicipio`
--

CREATE TABLE IF NOT EXISTS `tmunicipio` (
`codigo_municipio` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_estado` int(11) NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tmunicipio`
--

INSERT INTO `tmunicipio` (`codigo_municipio`, `descripcion`, `codigo_estado`, `fecha_desactivacion`) VALUES
(1, 'PÁEZ', 1, NULL),
(2, 'ARAURE', 1, NULL),
(3, 'ESTELLER', 1, NULL),
(4, 'AGUA BLANCA', 1, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tpais`
--

INSERT INTO `tpais` (`codigo_pais`, `descripcion`, `fecha_desactivacion`) VALUES
(1, 'VENEZUELA', NULL),
(2, 'COLOMBIA', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tparentesco`
--

CREATE TABLE IF NOT EXISTS `tparentesco` (
`codigo_parentesco` int(11) NOT NULL,
  `descripcion` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tparentesco`
--

INSERT INTO `tparentesco` (`codigo_parentesco`, `descripcion`, `fecha_desactivacion`) VALUES
(1, 'PADRE', NULL),
(2, 'MADRE', NULL),
(3, 'HERMANA', NULL),
(4, 'HERMANO', NULL),
(5, 'PRIMO', NULL),
(6, 'PRIMA', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tparroquia`
--

CREATE TABLE IF NOT EXISTS `tparroquia` (
`codigo_parroquia` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo_municipio` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tparroquia`
--

INSERT INTO `tparroquia` (`codigo_parroquia`, `descripcion`, `fecha_desactivacion`, `codigo_municipio`) VALUES
(1, 'ACARIGUA', NULL, 1),
(2, 'CAPITAL ARAURE', NULL, 2),
(3, 'RÍO ACARIGUA', NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tperfil`
--

CREATE TABLE IF NOT EXISTS `tperfil` (
`codigo_perfil` int(11) NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tperfil`
--

INSERT INTO `tperfil` (`codigo_perfil`, `descripcion`, `fecha_desactivacion`) VALUES
(1, 'ADMINISTRADOR', NULL);

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
  `condicion_cargo` char(1) COLLATE utf8_spanish_ci DEFAULT 'T',
  `nivel_academico` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT '0',
  `codigo_plantel` char(11) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tpersona`
--

INSERT INTO `tpersona` (`cedula`, `nombres`, `apellidos`, `genero`, `fecha_nacimiento`, `lugar_nacimiento`, `direccion`, `telefono_habitacion`, `telefono_movil`, `email`, `esestudiante`, `esrepresentante`, `espersonalinstitucion`, `fecha_ingreso`, `codigo_cargo`, `codigo_dependencia`, `condicion_cargo`, `nivel_academico`, `carga_horaria`, `codigo_plantel`, `fecha_desactivacion`) VALUES
('V123456789', 'MATIAS', 'HERNANDEZ', 'M', '0000-00-00', 1, 'BARRIO SAN VICENTE SECTOR 3 CASA 12-45', NULL, NULL, NULL, 'N', 'N', 'Y', NULL, 1, NULL, 'T', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tplantel`
--

CREATE TABLE IF NOT EXISTS `tplantel` (
  `codigo_plantel` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `telefono_habitacion` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `localidad` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo_municipio` int(11) NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tplantel`
--

INSERT INTO `tplantel` (`codigo_plantel`, `nombre`, `direccion`, `telefono_habitacion`, `localidad`, `codigo_municipio`, `fecha_desactivacion`) VALUES
('OD00741801', 'UNIDAD EDUCATIVA NACIONAL QUEBRADA ', 'CALLE 03 CENTRO POBLADO B QUEBRADA HONDA', '02558084598', 'CENTRO B', 4, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tproceso_inscripcion`
--

CREATE TABLE IF NOT EXISTS `tproceso_inscripcion` (
`codigo_procesoinscripcion` int(11) NOT NULL,
  `codigo_inscripcion` int(11) NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `codigo_ano_academico` int(11) NOT NULL,
  `cedula_docente` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `cedula_estudiante` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_canaima` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `peso` int(11) NOT NULL DEFAULT '0',
  `estatura` int(11) NOT NULL DEFAULT '0',
  `talla` char(2) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'S',
  `plantel_procedencia` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
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
  `cedula_representante` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_parentesco` int(11) NOT NULL,
  `lugar_trabajo` int(11) NOT NULL,
  `primerafi` date NOT NULL,
  `seccion` char(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '1'
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
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tseccion`
--

INSERT INTO `tseccion` (`seccion`, `descripcion`, `turno`, `capacidad_min`, `capacidad_max`, `fecha_desactivacion`) VALUES
('SEC01', 'SECCIÓN 1', 'D', 15, 30, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

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
(12, 'PERÍODO', 'PERIODO', 5, 3, NULL),
(13, 'SECCIÓN', 'SECCION', 6, 3, NULL),
(14, 'ESTUDIANTES', 'ESTUDIANTE', 7, 3, NULL),
(15, 'INSCRIPCIÓN', 'INSCRIPCION', 8, 3, NULL),
(16, 'PROCESO DE  INSCRIPCIÓN', 'PROCESO_INSCRIPCION', 9, 3, NULL),
(17, 'ASIGNACIÓN DE SECCIONES', 'ASIGNAR_SECCION', 10, 7, NULL),
(18, 'ASIGNACIÓN DE NOTAS', 'ASIGNAR_NOTAS', 1, 4, NULL),
(19, 'MÓDULO', 'MODULO', 1, 6, NULL),
(20, 'SERVICIOS', 'SERVICIO', 2, 6, NULL),
(21, 'BOTONERA', 'BOTONES', 3, 6, NULL),
(22, 'PERFIL', 'PERFILES', 4, 6, NULL),
(23, 'NUEVO USUARIO', 'NUEVOUSUARIO', 5, 6, NULL),
(24, 'MÍ PERFIL', 'PERFIL', 6, 6, NULL),
(25, 'CAMBIAR CONTRASEÑA', 'CAMBIARCONTRASENA', 7, 6, NULL),
(26, 'DESBLOQUEAR USUARIO', 'DESBLOQUEARUSUARIO', 8, 6, NULL),
(27, 'HISTÓRICO DE CAMBIOS', 'BITACORA', 9, 6, NULL);

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
(NULL, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1),
(NULL, 2, 1),
(1, 2, 1),
(2, 2, 1),
(3, 2, 1),
(4, 2, 1),
(5, 2, 1),
(6, 2, 1),
(7, 2, 1),
(NULL, 3, 1),
(1, 3, 1),
(2, 3, 1),
(3, 3, 1),
(4, 3, 1),
(5, 3, 1),
(6, 3, 1),
(7, 3, 1),
(NULL, 4, 1),
(1, 4, 1),
(2, 4, 1),
(3, 4, 1),
(4, 4, 1),
(5, 4, 1),
(6, 4, 1),
(7, 4, 1),
(NULL, 5, 1),
(1, 5, 1),
(2, 5, 1),
(3, 5, 1),
(4, 5, 1),
(5, 5, 1),
(6, 5, 1),
(7, 5, 1),
(NULL, 6, 1),
(1, 6, 1),
(2, 6, 1),
(3, 6, 1),
(4, 6, 1),
(5, 6, 1),
(6, 6, 1),
(7, 6, 1),
(NULL, 7, 1),
(1, 7, 1),
(2, 7, 1),
(3, 7, 1),
(4, 7, 1),
(5, 7, 1),
(6, 7, 1),
(7, 7, 1),
(NULL, 8, 1),
(1, 8, 1),
(2, 8, 1),
(3, 8, 1),
(4, 8, 1),
(5, 8, 1),
(6, 8, 1),
(7, 8, 1),
(NULL, 9, 1),
(1, 9, 1),
(2, 9, 1),
(3, 9, 1),
(4, 9, 1),
(5, 9, 1),
(6, 9, 1),
(7, 9, 1),
(NULL, 10, 1),
(1, 10, 1),
(2, 10, 1),
(3, 10, 1),
(4, 10, 1),
(5, 10, 1),
(6, 10, 1),
(7, 10, 1),
(NULL, 11, 1),
(1, 11, 1),
(2, 11, 1),
(3, 11, 1),
(4, 11, 1),
(5, 11, 1),
(6, 11, 1),
(7, 11, 1),
(NULL, 12, 1),
(1, 12, 1),
(2, 12, 1),
(3, 12, 1),
(4, 12, 1),
(5, 12, 1),
(6, 12, 1),
(7, 12, 1),
(NULL, 13, 1),
(1, 13, 1),
(2, 13, 1),
(3, 13, 1),
(4, 13, 1),
(5, 13, 1),
(6, 13, 1),
(7, 13, 1),
(NULL, 14, 1),
(1, 14, 1),
(2, 14, 1),
(3, 14, 1),
(4, 14, 1),
(5, 14, 1),
(6, 14, 1),
(7, 14, 1),
(NULL, 15, 1),
(1, 15, 1),
(2, 15, 1),
(3, 15, 1),
(4, 15, 1),
(5, 15, 1),
(6, 15, 1),
(7, 15, 1),
(NULL, 16, 1),
(1, 16, 1),
(2, 16, 1),
(3, 16, 1),
(4, 16, 1),
(5, 16, 1),
(6, 16, 1),
(7, 16, 1),
(NULL, 17, 1),
(1, 17, 1),
(2, 17, 1),
(3, 17, 1),
(4, 17, 1),
(5, 17, 1),
(6, 17, 1),
(7, 17, 1),
(NULL, 18, 1),
(1, 18, 1),
(2, 18, 1),
(3, 18, 1),
(4, 18, 1),
(5, 18, 1),
(6, 18, 1),
(7, 18, 1),
(NULL, 19, 1),
(1, 19, 1),
(2, 19, 1),
(3, 19, 1),
(4, 19, 1),
(5, 19, 1),
(6, 19, 1),
(7, 19, 1),
(NULL, 20, 1),
(1, 20, 1),
(2, 20, 1),
(3, 20, 1),
(4, 20, 1),
(5, 20, 1),
(6, 20, 1),
(7, 20, 1),
(NULL, 21, 1),
(1, 21, 1),
(2, 21, 1),
(3, 21, 1),
(4, 21, 1),
(5, 21, 1),
(6, 21, 1),
(7, 21, 1),
(NULL, 22, 1),
(1, 22, 1),
(2, 22, 1),
(3, 22, 1),
(4, 22, 1),
(5, 22, 1),
(6, 22, 1),
(7, 22, 1),
(NULL, 23, 1),
(1, 23, 1),
(2, 23, 1),
(3, 23, 1),
(4, 23, 1),
(5, 23, 1),
(6, 23, 1),
(7, 23, 1),
(NULL, 24, 1),
(1, 24, 1),
(2, 24, 1),
(3, 24, 1),
(4, 24, 1),
(5, 24, 1),
(6, 24, 1),
(7, 24, 1),
(NULL, 25, 1),
(1, 25, 1),
(2, 25, 1),
(3, 25, 1),
(4, 25, 1),
(5, 25, 1),
(6, 25, 1),
(7, 25, 1),
(NULL, 26, 1),
(1, 26, 1),
(2, 26, 1),
(3, 26, 1),
(4, 26, 1),
(5, 26, 1),
(6, 26, 1),
(7, 26, 1),
(NULL, 27, 1),
(1, 27, 1),
(2, 27, 1),
(3, 27, 1),
(4, 27, 1),
(5, 27, 1),
(6, 27, 1),
(7, 27, 1),
(NULL, 1, 1),
(NULL, 2, 1),
(NULL, 3, 1),
(NULL, 4, 1),
(NULL, 5, 1),
(NULL, 6, 1),
(NULL, 7, 1),
(NULL, 8, 1),
(NULL, 9, 1),
(NULL, 10, 1),
(NULL, 11, 1),
(NULL, 12, 1),
(NULL, 13, 1),
(NULL, 14, 1),
(NULL, 15, 1),
(NULL, 16, 1),
(NULL, 17, 1),
(NULL, 18, 1),
(NULL, 19, 1),
(NULL, 20, 1),
(NULL, 21, 1),
(NULL, 22, 1),
(NULL, 23, 1),
(NULL, 24, 1),
(NULL, 25, 1),
(NULL, 26, 1),
(NULL, 27, 1),
(NULL, 1, 1),
(NULL, 2, 1),
(NULL, 3, 1),
(NULL, 4, 1),
(NULL, 5, 1),
(NULL, 6, 1),
(NULL, 7, 1),
(NULL, 8, 1),
(NULL, 9, 1),
(NULL, 10, 1),
(NULL, 11, 1),
(NULL, 12, 1),
(NULL, 13, 1),
(NULL, 14, 1),
(NULL, 15, 1),
(NULL, 16, 1),
(NULL, 17, 1),
(NULL, 18, 1),
(NULL, 19, 1),
(NULL, 20, 1),
(NULL, 21, 1),
(NULL, 22, 1),
(NULL, 23, 1),
(NULL, 24, 1),
(NULL, 25, 1),
(NULL, 26, 1),
(NULL, 27, 1),
(NULL, 1, 1),
(NULL, 2, 1),
(NULL, 3, 1),
(NULL, 4, 1),
(NULL, 5, 1),
(NULL, 6, 1),
(NULL, 7, 1),
(NULL, 8, 1),
(NULL, 9, 1),
(NULL, 10, 1),
(NULL, 11, 1),
(NULL, 12, 1),
(NULL, 13, 1),
(NULL, 14, 1),
(NULL, 15, 1),
(NULL, 16, 1),
(NULL, 17, 1),
(NULL, 18, 1),
(NULL, 19, 1),
(NULL, 20, 1),
(NULL, 21, 1),
(NULL, 22, 1),
(NULL, 23, 1),
(NULL, 24, 1),
(NULL, 25, 1),
(NULL, 26, 1),
(NULL, 27, 1),
(NULL, 1, 1),
(NULL, 2, 1),
(NULL, 3, 1),
(NULL, 4, 1),
(NULL, 5, 1),
(NULL, 6, 1),
(NULL, 7, 1),
(NULL, 8, 1),
(NULL, 9, 1),
(NULL, 10, 1),
(NULL, 11, 1),
(NULL, 12, 1),
(NULL, 13, 1),
(NULL, 14, 1),
(NULL, 15, 1),
(NULL, 16, 1),
(NULL, 17, 1),
(NULL, 18, 1),
(NULL, 19, 1),
(NULL, 20, 1),
(NULL, 21, 1),
(NULL, 22, 1),
(NULL, 23, 1),
(NULL, 24, 1),
(NULL, 25, 1),
(NULL, 26, 1),
(NULL, 27, 1),
(NULL, 1, 1),
(NULL, 2, 1),
(NULL, 3, 1),
(NULL, 4, 1),
(NULL, 5, 1),
(NULL, 6, 1),
(NULL, 7, 1),
(NULL, 8, 1),
(NULL, 9, 1),
(NULL, 10, 1),
(NULL, 11, 1),
(NULL, 12, 1),
(NULL, 13, 1),
(NULL, 14, 1),
(NULL, 15, 1),
(NULL, 16, 1),
(NULL, 17, 1),
(NULL, 18, 1),
(NULL, 19, 1),
(NULL, 20, 1),
(NULL, 21, 1),
(NULL, 22, 1),
(NULL, 23, 1),
(NULL, 24, 1),
(NULL, 25, 1),
(NULL, 26, 1),
(NULL, 27, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tusuario`
--

CREATE TABLE IF NOT EXISTS `tusuario` (
  `nombre_usuario` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `pregunta_1` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pregunta_2` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `respuesta_1` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `respuesta_2` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cedula` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_perfil` int(11) NOT NULL,
  `intento_fallido` int(11) NOT NULL DEFAULT '0',
  `activar_caducidad` int(11) NOT NULL DEFAULT '1',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tusuario`
--

INSERT INTO `tusuario` (`nombre_usuario`, `pregunta_1`, `pregunta_2`, `respuesta_1`, `respuesta_2`, `cedula`, `codigo_perfil`, `intento_fallido`, `activar_caducidad`, `fecha_desactivacion`) VALUES
('V123456789', 'P1', 'P2', 'R1', 'R2', 'V123456789', 1, 0, 1, NULL);

--
-- Índices para tablas volcadas
--

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
-- Indices de la tabla `tcargo`
--
ALTER TABLE `tcargo`
 ADD PRIMARY KEY (`codigo_cargo`);

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
 ADD PRIMARY KEY (`codigo_perfil`);

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
-- AUTO_INCREMENT de la tabla `tano_academico`
--
ALTER TABLE `tano_academico`
MODIFY `codigo_ano_academico` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tauditoria`
--
ALTER TABLE `tauditoria`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=794;
--
-- AUTO_INCREMENT de la tabla `tcargo`
--
ALTER TABLE `tcargo`
MODIFY `codigo_cargo` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tcontrol_notas`
--
ALTER TABLE `tcontrol_notas`
MODIFY `codigo_controlnotas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `testado`
--
ALTER TABLE `testado`
MODIFY `codigo_estado` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tinscripcion`
--
ALTER TABLE `tinscripcion`
MODIFY `codigo_inscripcion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tlapso`
--
ALTER TABLE `tlapso`
MODIFY `codigo_lapso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tmateria_seccion_docente`
--
ALTER TABLE `tmateria_seccion_docente`
MODIFY `codigo_msd` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tmodulo`
--
ALTER TABLE `tmodulo`
MODIFY `codigo_modulo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `tmunicipio`
--
ALTER TABLE `tmunicipio`
MODIFY `codigo_municipio` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `topcion`
--
ALTER TABLE `topcion`
MODIFY `codigo_opcion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `tpais`
--
ALTER TABLE `tpais`
MODIFY `codigo_pais` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tparentesco`
--
ALTER TABLE `tparentesco`
MODIFY `codigo_parentesco` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tparroquia`
--
ALTER TABLE `tparroquia`
MODIFY `codigo_parroquia` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tperfil`
--
ALTER TABLE `tperfil`
MODIFY `codigo_perfil` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tproceso_inscripcion`
--
ALTER TABLE `tproceso_inscripcion`
MODIFY `codigo_procesoinscripcion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tservicio`
--
ALTER TABLE `tservicio`
MODIFY `codigo_servicio` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
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
