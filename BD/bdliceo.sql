-- phpMyAdmin SQL Dump
-- version 4.2.12deb2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 04-11-2015 a las 12:10:07
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
  `fecha_desactivacion` date DEFAULT NULL,
  `descripcion` char(10) COLLATE utf8_spanish_ci NOT NULL
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tauditoria`
--

INSERT INTO `tauditoria` (`id`, `ip`, `so`, `navigador`, `usuario_base_de_datos`, `usuario_aplicacion`, `query`, `fecha`) VALUES
(1, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-03 18:31:18'),
(2, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tcontrasena set estado=0 where (nombre_usuario=''V123456789'')', '2015-11-03 18:32:29'),
(3, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'insert into tcontrasena (contrasena,nombre_usuario,estado)values(''2e5f402b1f0117f9f7217a3e8cbff136b1e304ad'',''V123456789'',1)', '2015-11-03 18:32:29'),
(4, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-03 18:32:40'),
(5, '::1', 'Linux', 'Google Chrome', 'root@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-03 18:54:17'),
(6, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-04 01:14:36'),
(7, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-04 01:57:59'),
(8, '::1', 'Linux', 'Google Chrome', 'admin@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2015-11-04 13:23:02'),
(9, '::1', 'Linux', 'Google Chrome', 'admin@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2015-11-04 13:23:49'),
(10, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-04 13:25:20'),
(11, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tmodulo set descripcion=''GENERAL'',icono=''icon-home'',orden=''2'' where (codigo_modulo=''2'');', '2015-11-04 15:52:59'),
(12, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tmodulo set descripcion=''GENERAL'',icono=''icon-list'',orden=''5'' where (codigo_modulo=''5'');', '2015-11-04 15:54:22'),
(13, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tmodulo set descripcion=''LOCALIDADES'',icono=''icon-list'',orden=''1'' where (codigo_modulo=''1'');', '2015-11-04 15:55:28'),
(14, '::1', 'Linux', 'Google Chrome', 'admin@localhost', '', 'update tusuario set intento_fallido=(intento_fallido+1) where (nombre_usuario=''V123456789'')', '2015-11-04 16:07:59'),
(15, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'V123456789', 'update tusuario set intento_fallido=0 where (nombre_usuario=''V123456789'')', '2015-11-04 16:08:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcargo`
--

CREATE TABLE IF NOT EXISTS `tcargo` (
`codigo_cargo` int(15) NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tcargo`
--

INSERT INTO `tcargo` (`codigo_cargo`, `descripcion`, `fecha_desactivacion`) VALUES
(1, 'OPERADOR DE SISTEMA', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `testado`
--

INSERT INTO `testado` (`codigo_estado`, `descripcion`, `codigo_pais`, `fecha_desactivacion`) VALUES
(1, 'PORTUGUESA', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tinscripcion`
--

CREATE TABLE IF NOT EXISTS `tinscripcion` (
`codigo_inscripcion` int(11) NOT NULL,
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
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '1',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tmodulo`
--

INSERT INTO `tmodulo` (`codigo_modulo`, `descripcion`, `icono`, `orden`, `estatus`, `fecha_desactivacion`) VALUES
(1, 'LOCALIDADES', 'icon-list', 1, '1', NULL),
(2, 'GENERAL', 'icon-home', 2, '1', NULL),
(3, 'EDUCACIÓN', 'icon-list-alt', 3, '1', NULL),
(4, 'CONTROL DE NOTAS', 'icon-list-alt', 4, '1', NULL),
(5, 'SEGURIDAD', 'icon-lock', 5, '1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmunicipio`
--

CREATE TABLE IF NOT EXISTS `tmunicipio` (
`codigo_municipio` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_estado` int(11) NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tmunicipio`
--

INSERT INTO `tmunicipio` (`codigo_municipio`, `descripcion`, `codigo_estado`, `fecha_desactivacion`) VALUES
(1, 'PÁEZ', 1, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `topcion`
--

INSERT INTO `topcion` (`codigo_opcion`, `descripcion`, `icono`, `orden`, `fecha_desactivacion`) VALUES
(1, 'INSERTAR', 'icon-pencil', 1, NULL),
(2, 'ACTUALIZAR', 'icon-edit', 2, NULL),
(3, 'DESACTIVAR', 'icon-eye-close', 3, NULL),
(4, 'ACTIVAR', 'icon-eye-open', 4, NULL),
(5, 'CONSULTAR', 'icon-search', 5, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tparroquia`
--

CREATE TABLE IF NOT EXISTS `tparroquia` (
`codigo_parroquia` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo_municipio` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tparroquia`
--

INSERT INTO `tparroquia` (`codigo_parroquia`, `descripcion`, `fecha_desactivacion`, `codigo_municipio`) VALUES
(1, 'ACARIGUA', NULL, 1);

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
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '1',
  `fecha_desactivacion` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tservicio`
--

INSERT INTO `tservicio` (`codigo_servicio`, `descripcion`, `url`, `orden`, `codigo_modulo`, `estatus`, `fecha_desactivacion`) VALUES
(1, 'PAÍS', 'PAIS', 1, 1, '', NULL),
(2, 'ESTADO', 'ESTADO', 2, 1, '1', NULL),
(3, 'MUNICIPIO', 'MUNICIPIO', 3, 1, '1', NULL),
(4, 'PARROQUIA', 'PARROQUIA', 4, 1, '1', NULL),
(5, 'ORGANIZACIÓN', 'ORGANIZACION', 1, 2, '1', NULL),
(6, 'CARGO', 'CARGO', 2, 2, '1', NULL),
(7, 'PERSONA', 'PERSONA', 3, 2, '1', NULL),
(8, 'PARENTESCO', 'PARENTESCO', 4, 2, '1', NULL),
(9, 'AÑO ACADÉMICO', 'ANO_ACADEMICO', 2, 3, '1', NULL),
(10, 'LAPSO', 'LAPSO', 3, 3, '1', NULL),
(11, 'MATERIA', 'MATERIA', 4, 3, '1', NULL),
(12, 'PERÍODO', 'PERIODO', 5, 3, '1', NULL),
(13, 'SECCIÓN', 'SECCION', 6, 3, '1', NULL),
(14, 'ESTUDIANTES', 'ESTUDIANTE', 7, 3, '1', NULL),
(15, 'INSCRIPCIÓN', 'INSCRIPCION', 8, 3, '1', NULL),
(16, 'PROCESO DE  INSCRIPCIÓN', 'PROCESO_INSCRIPCION', 9, 3, '1', NULL),
(17, 'ASIGNACIÓN DE SECCIONES', 'ASIGNAR_SECCION', 10, 3, '1', NULL),
(18, 'ASIGNACIÓN DE NOTAS', 'ASIGNAR_NOTAS', 1, 4, '1', NULL),
(19, 'MÓDULO', 'MODULO', 1, 5, '1', NULL),
(20, 'SERVICIOS', 'SERVICIO', 2, 5, '1', NULL),
(21, 'BOTONERA', 'BOTONES', 3, 5, '1', NULL),
(22, 'PERFIL', 'PERFILES', 4, 5, '1', NULL),
(23, 'NUEVO USUARIO', 'NUEVOUSUARIO', 5, 5, '1', NULL),
(24, 'MÍ PERFIL', 'PERFIL', 6, 5, '1', NULL),
(25, 'CAMBIAR CONTRASEÑA', 'CAMBIARCONTRASENA', 7, 5, '1', NULL),
(26, 'DESBLOQUEAR USUARIO', 'DESBLOQUEARUSUARIO', 8, 5, '', NULL),
(27, 'HISTÓRICO DE CAMBIOS', 'BITACORA', 9, 5, '', NULL);

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
(1, 2, 1),
(2, 2, 1),
(3, 2, 1),
(4, 2, 1),
(5, 2, 1),
(1, 3, 1),
(2, 3, 1),
(3, 3, 1),
(4, 3, 1),
(5, 3, 1),
(1, 4, 1),
(2, 4, 1),
(3, 4, 1),
(4, 4, 1),
(5, 4, 1),
(1, 5, 1),
(2, 5, 1),
(3, 5, 1),
(4, 5, 1),
(5, 5, 1),
(1, 6, 1),
(2, 6, 1),
(3, 6, 1),
(4, 6, 1),
(5, 6, 1),
(1, 7, 1),
(2, 7, 1),
(3, 7, 1),
(4, 7, 1),
(5, 7, 1),
(1, 8, 1),
(2, 8, 1),
(3, 8, 1),
(4, 8, 1),
(5, 8, 1),
(1, 9, 1),
(2, 9, 1),
(3, 9, 1),
(4, 9, 1),
(5, 9, 1),
(1, 10, 1),
(2, 10, 1),
(3, 10, 1),
(4, 10, 1),
(5, 10, 1),
(1, 11, 1),
(2, 11, 1),
(3, 11, 1),
(4, 11, 1),
(5, 11, 1),
(1, 12, 1),
(2, 12, 1),
(3, 12, 1),
(4, 12, 1),
(5, 12, 1),
(1, 13, 1),
(2, 13, 1),
(3, 13, 1),
(4, 13, 1),
(5, 13, 1),
(1, 14, 1),
(2, 14, 1),
(3, 14, 1),
(4, 14, 1),
(5, 14, 1),
(1, 15, 1),
(2, 15, 1),
(3, 15, 1),
(4, 15, 1),
(5, 15, 1),
(1, 16, 1),
(2, 16, 1),
(3, 16, 1),
(4, 16, 1),
(5, 16, 1),
(1, 17, 1),
(2, 17, 1),
(3, 17, 1),
(4, 17, 1),
(5, 17, 1),
(1, 18, 1),
(2, 18, 1),
(3, 18, 1),
(4, 18, 1),
(5, 18, 1),
(1, 19, 1),
(2, 19, 1),
(3, 19, 1),
(4, 19, 1),
(5, 19, 1),
(1, 20, 1),
(2, 20, 1),
(3, 20, 1),
(4, 20, 1),
(5, 20, 1),
(1, 21, 1),
(2, 21, 1),
(3, 21, 1),
(4, 21, 1),
(5, 21, 1),
(1, 22, 1),
(2, 22, 1),
(3, 22, 1),
(4, 22, 1),
(5, 22, 1),
(1, 23, 1),
(2, 23, 1),
(3, 23, 1),
(4, 23, 1),
(5, 23, 1),
(1, 24, 1),
(2, 24, 1),
(3, 24, 1),
(4, 24, 1),
(5, 24, 1),
(1, 25, 1),
(2, 25, 1),
(3, 25, 1),
(4, 25, 1),
(5, 25, 1),
(1, 26, 1),
(2, 26, 1),
(3, 26, 1),
(4, 26, 1),
(5, 26, 1),
(1, 27, 1),
(2, 27, 1),
(3, 27, 1),
(4, 27, 1),
(5, 27, 1);

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
MODIFY `codigo_ano_academico` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tauditoria`
--
ALTER TABLE `tauditoria`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `tcargo`
--
ALTER TABLE `tcargo`
MODIFY `codigo_cargo` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tcontrol_notas`
--
ALTER TABLE `tcontrol_notas`
MODIFY `codigo_controlnotas` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `testado`
--
ALTER TABLE `testado`
MODIFY `codigo_estado` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
MODIFY `codigo_modulo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tmunicipio`
--
ALTER TABLE `tmunicipio`
MODIFY `codigo_municipio` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `topcion`
--
ALTER TABLE `topcion`
MODIFY `codigo_opcion` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tpais`
--
ALTER TABLE `tpais`
MODIFY `codigo_pais` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tparentesco`
--
ALTER TABLE `tparentesco`
MODIFY `codigo_parentesco` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tparroquia`
--
ALTER TABLE `tparroquia`
MODIFY `codigo_parroquia` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
ADD CONSTRAINT `fk_tcontrolnotas_msd` FOREIGN KEY (`codigo_msd`) REFERENCES `tmateria_seccion_docente` (`codigo_msd`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tcontrolnotas_lapso` FOREIGN KEY (`codigo_lapso`) REFERENCES `tlapso` (`codigo_lapso`) ON UPDATE CASCADE,
ADD CONSTRAINT `fk_tcontrolnotas_estudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE;

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
