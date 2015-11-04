-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bdliceo
-- ------------------------------------------------------
-- Server version	5.5.44-0+deb8u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tano_academico`
--

DROP TABLE IF EXISTS `tano_academico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tano_academico` (
  `codigo_ano_academico` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_desactivacion` date DEFAULT NULL,
  `descripcion` char(10) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codigo_ano_academico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tano_academico`
--

LOCK TABLES `tano_academico` WRITE;
/*!40000 ALTER TABLE `tano_academico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tano_academico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tauditoria`
--

DROP TABLE IF EXISTS `tauditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tauditoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `so` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `navigador` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `usuario_base_de_datos` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `usuario_aplicacion` char(15) COLLATE utf8_spanish_ci NOT NULL,
  `query` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tauditoria`
--

LOCK TABLES `tauditoria` WRITE;
/*!40000 ALTER TABLE `tauditoria` DISABLE KEYS */;
INSERT INTO `tauditoria` VALUES (1,'::1','Linux','Google Chrome','root@localhost','V123456789','update tusuario set intento_fallido=0 where (nombre_usuario=\'V123456789\')','2015-11-03 18:31:18'),(2,'::1','Linux','Google Chrome','root@localhost','V123456789','update tcontrasena set estado=0 where (nombre_usuario=\'V123456789\')','2015-11-03 18:32:29'),(3,'::1','Linux','Google Chrome','root@localhost','V123456789','insert into tcontrasena (contrasena,nombre_usuario,estado)values(\'2e5f402b1f0117f9f7217a3e8cbff136b1e304ad\',\'V123456789\',1)','2015-11-03 18:32:29'),(4,'::1','Linux','Google Chrome','root@localhost','V123456789','update tusuario set intento_fallido=0 where (nombre_usuario=\'V123456789\')','2015-11-03 18:32:40'),(5,'::1','Linux','Google Chrome','root@localhost','V123456789','update tusuario set intento_fallido=0 where (nombre_usuario=\'V123456789\')','2015-11-03 18:54:17');
/*!40000 ALTER TABLE `tauditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcargo`
--

DROP TABLE IF EXISTS `tcargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcargo` (
  `codigo_cargo` int(15) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL,
  PRIMARY KEY (`codigo_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcargo`
--

LOCK TABLES `tcargo` WRITE;
/*!40000 ALTER TABLE `tcargo` DISABLE KEYS */;
INSERT INTO `tcargo` VALUES (1,'OPERADOR DE SISTEMA',NULL);
/*!40000 ALTER TABLE `tcargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontrasena`
--

DROP TABLE IF EXISTS `tcontrasena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontrasena` (
  `nombre_usuario` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '3' COMMENT '0 clave usado 1 usuario activo 2 caducidad de clave 3 usuario nuevo 4 usuario bloqueado',
  `fecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `tcontrasena_ibfk_1` (`nombre_usuario`),
  CONSTRAINT `tcontrasena_ibfk_1` FOREIGN KEY (`nombre_usuario`) REFERENCES `tusuario` (`nombre_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontrasena`
--

LOCK TABLES `tcontrasena` WRITE;
/*!40000 ALTER TABLE `tcontrasena` DISABLE KEYS */;
INSERT INTO `tcontrasena` VALUES ('V123456789','1f82ea75c5cc526729e2d581aeb3aeccfef4407e',0,'2015-11-03 18:32:29'),('V123456789','2e5f402b1f0117f9f7217a3e8cbff136b1e304ad',1,'2015-11-03 18:32:29');
/*!40000 ALTER TABLE `tcontrasena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcontrol_notas`
--

DROP TABLE IF EXISTS `tcontrol_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tcontrol_notas` (
  `codigo_controlnotas` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_msd` int(11) NOT NULL,
  `cedula_estudiante` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_lapso` int(11) NOT NULL,
  `notafinal` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codigo_controlnotas`),
  KEY `fk_tcontrolnotas_msd` (`codigo_msd`),
  KEY `fk_tcontrolnotas_lapso` (`codigo_lapso`),
  KEY `fk_tcontrolnotas_estudiante` (`cedula_estudiante`),
  CONSTRAINT `fk_tcontrolnotas_msd` FOREIGN KEY (`codigo_msd`) REFERENCES `tmateria_seccion_docente` (`codigo_msd`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tcontrolnotas_lapso` FOREIGN KEY (`codigo_lapso`) REFERENCES `tlapso` (`codigo_lapso`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tcontrolnotas_estudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcontrol_notas`
--

LOCK TABLES `tcontrol_notas` WRITE;
/*!40000 ALTER TABLE `tcontrol_notas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcontrol_notas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testado`
--

DROP TABLE IF EXISTS `testado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testado` (
  `codigo_estado` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_pais` int(11) NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL,
  PRIMARY KEY (`codigo_estado`),
  KEY `fk_testado_tpais` (`codigo_pais`),
  CONSTRAINT `fk_testado_tpais` FOREIGN KEY (`codigo_pais`) REFERENCES `tpais` (`codigo_pais`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testado`
--

LOCK TABLES `testado` WRITE;
/*!40000 ALTER TABLE `testado` DISABLE KEYS */;
INSERT INTO `testado` VALUES (1,'PORTUGUESA',1,NULL);
/*!40000 ALTER TABLE `testado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinscripcion`
--

DROP TABLE IF EXISTS `tinscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tinscripcion` (
  `codigo_inscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_cierre` date NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL,
  PRIMARY KEY (`codigo_inscripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinscripcion`
--

LOCK TABLES `tinscripcion` WRITE;
/*!40000 ALTER TABLE `tinscripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlapso`
--

DROP TABLE IF EXISTS `tlapso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tlapso` (
  `codigo_lapso` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `codigo_ano_academico` int(11) NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL,
  PRIMARY KEY (`codigo_lapso`),
  KEY `fk_tlapso_tanoacademico` (`codigo_ano_academico`),
  CONSTRAINT `fk_tlapso_tanoacademico` FOREIGN KEY (`codigo_ano_academico`) REFERENCES `tano_academico` (`codigo_ano_academico`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlapso`
--

LOCK TABLES `tlapso` WRITE;
/*!40000 ALTER TABLE `tlapso` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlapso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmateria`
--

DROP TABLE IF EXISTS `tmateria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmateria` (
  `codigo_materia` char(7) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `unidad_curricular` int(11) NOT NULL DEFAULT '0',
  `fecha_desactivacion` date DEFAULT NULL,
  PRIMARY KEY (`codigo_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmateria`
--

LOCK TABLES `tmateria` WRITE;
/*!40000 ALTER TABLE `tmateria` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmateria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmateria_seccion_docente`
--

DROP TABLE IF EXISTS `tmateria_seccion_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmateria_seccion_docente` (
  `codigo_msd` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_materia` char(7) COLLATE utf8_spanish_ci NOT NULL,
  `seccion` char(5) COLLATE utf8_spanish_ci NOT NULL,
  `cedula_docente` char(10) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`codigo_msd`),
  KEY `fk_tmateria_seccion_tmateria` (`codigo_materia`),
  KEY `fk_tmateria_seccion_tseccion` (`seccion`),
  KEY `fk_tmateria_seccion_tpersona` (`cedula_docente`),
  CONSTRAINT `fk_tmateria_seccion_tmateria` FOREIGN KEY (`codigo_materia`) REFERENCES `tmateria` (`codigo_materia`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tmateria_seccion_tseccion` FOREIGN KEY (`seccion`) REFERENCES `tseccion` (`seccion`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tmateria_seccion_tpersona` FOREIGN KEY (`cedula_docente`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmateria_seccion_docente`
--

LOCK TABLES `tmateria_seccion_docente` WRITE;
/*!40000 ALTER TABLE `tmateria_seccion_docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmateria_seccion_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmodulo`
--

DROP TABLE IF EXISTS `tmodulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmodulo` (
  `codigo_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(70) COLLATE utf8_spanish_ci NOT NULL,
  `icono` varchar(200) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'icon-list-alt',
  `orden` int(11) NOT NULL DEFAULT '0',
  `fecha_desactivacion` date DEFAULT NULL,
  PRIMARY KEY (`codigo_modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmodulo`
--

LOCK TABLES `tmodulo` WRITE;
/*!40000 ALTER TABLE `tmodulo` DISABLE KEYS */;
INSERT INTO `tmodulo` VALUES (1,'LOCALIDADES','icon-list',1,NULL),(2,'GENERAL','icon-list-alt',2,NULL),(3,'EDUCACIÓN','icon-list-alt',3,NULL),(4,'CONTROL DE NOTAS','icon-list-alt',4,NULL),(5,'REPORTES','icon-cog',5,NULL),(6,'SEGURIDAD','icon-lock',6,NULL);
/*!40000 ALTER TABLE `tmodulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmunicipio`
--

DROP TABLE IF EXISTS `tmunicipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmunicipio` (
  `codigo_municipio` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_estado` int(11) NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`codigo_municipio`),
  KEY `fk_tmunicipio_testado` (`codigo_estado`),
  CONSTRAINT `fk_tmunicipio_testado` FOREIGN KEY (`codigo_estado`) REFERENCES `testado` (`codigo_estado`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmunicipio`
--

LOCK TABLES `tmunicipio` WRITE;
/*!40000 ALTER TABLE `tmunicipio` DISABLE KEYS */;
INSERT INTO `tmunicipio` VALUES (1,'PÁEZ',1,NULL);
/*!40000 ALTER TABLE `tmunicipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topcion`
--

DROP TABLE IF EXISTS `topcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topcion` (
  `codigo_opcion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `icono` varchar(200) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'icon-pencil',
  `orden` int(11) NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL,
  PRIMARY KEY (`codigo_opcion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topcion`
--

LOCK TABLES `topcion` WRITE;
/*!40000 ALTER TABLE `topcion` DISABLE KEYS */;
INSERT INTO `topcion` VALUES (1,'INSERTAR','icon-pencil',1,NULL),(2,'ACTUALIZAR','icon-edit',2,NULL),(3,'DESACTIVAR','icon-eye-close',3,NULL),(4,'ACTIVAR','icon-eye-open',4,NULL),(5,'CONSULTAR','icon-search',5,NULL);
/*!40000 ALTER TABLE `topcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpais`
--

DROP TABLE IF EXISTS `tpais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpais` (
  `codigo_pais` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`codigo_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpais`
--

LOCK TABLES `tpais` WRITE;
/*!40000 ALTER TABLE `tpais` DISABLE KEYS */;
INSERT INTO `tpais` VALUES (1,'VENEZUELA',NULL);
/*!40000 ALTER TABLE `tpais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tparentesco`
--

DROP TABLE IF EXISTS `tparentesco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tparentesco` (
  `codigo_parentesco` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`codigo_parentesco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tparentesco`
--

LOCK TABLES `tparentesco` WRITE;
/*!40000 ALTER TABLE `tparentesco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tparentesco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tparroquia`
--

DROP TABLE IF EXISTS `tparroquia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tparroquia` (
  `codigo_parroquia` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo_municipio` int(11) NOT NULL,
  PRIMARY KEY (`codigo_parroquia`),
  KEY `fk_tparroquia_tmunicipio` (`codigo_municipio`),
  CONSTRAINT `fk_tparroquia_tmunicipio` FOREIGN KEY (`codigo_municipio`) REFERENCES `tmunicipio` (`codigo_municipio`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tparroquia`
--

LOCK TABLES `tparroquia` WRITE;
/*!40000 ALTER TABLE `tparroquia` DISABLE KEYS */;
INSERT INTO `tparroquia` VALUES (1,'ACARIGUA',NULL,1);
/*!40000 ALTER TABLE `tparroquia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tperfil`
--

DROP TABLE IF EXISTS `tperfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tperfil` (
  `codigo_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL,
  PRIMARY KEY (`codigo_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tperfil`
--

LOCK TABLES `tperfil` WRITE;
/*!40000 ALTER TABLE `tperfil` DISABLE KEYS */;
INSERT INTO `tperfil` VALUES (1,'ADMINISTRADOR',NULL);
/*!40000 ALTER TABLE `tperfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpersona`
--

DROP TABLE IF EXISTS `tpersona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tpersona` (
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
  `fecha_desactivacion` date DEFAULT NULL,
  PRIMARY KEY (`cedula`),
  KEY `fk_tpersona_tparroquia` (`lugar_nacimiento`),
  KEY `fk_tpersona_tcargo` (`codigo_cargo`),
  KEY `fk_tpersona_tplantel` (`codigo_plantel`),
  CONSTRAINT `fk_tpersona_tparroquia` FOREIGN KEY (`lugar_nacimiento`) REFERENCES `tparroquia` (`codigo_parroquia`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpersona_tcargo` FOREIGN KEY (`codigo_cargo`) REFERENCES `tcargo` (`codigo_cargo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpersona_tplantel` FOREIGN KEY (`codigo_plantel`) REFERENCES `tplantel` (`codigo_plantel`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpersona`
--

LOCK TABLES `tpersona` WRITE;
/*!40000 ALTER TABLE `tpersona` DISABLE KEYS */;
INSERT INTO `tpersona` VALUES ('V123456789','MATIAS','HERNANDEZ','M','0000-00-00',1,'BARRIO SAN VICENTE SECTOR 3 CASA 12-45',NULL,NULL,NULL,'N','N','Y',NULL,1,NULL,'T',NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `tpersona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tplantel`
--

DROP TABLE IF EXISTS `tplantel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tplantel` (
  `codigo_plantel` char(11) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `telefono_habitacion` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `localidad` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo_municipio` int(11) NOT NULL,
  `fecha_desactivacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`codigo_plantel`),
  KEY `fk_tplantel_tmunicipio` (`codigo_municipio`),
  CONSTRAINT `fk_tplantel_tmunicipio` FOREIGN KEY (`codigo_municipio`) REFERENCES `tmunicipio` (`codigo_municipio`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tplantel`
--

LOCK TABLES `tplantel` WRITE;
/*!40000 ALTER TABLE `tplantel` DISABLE KEYS */;
/*!40000 ALTER TABLE `tplantel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tproceso_inscripcion`
--

DROP TABLE IF EXISTS `tproceso_inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tproceso_inscripcion` (
  `codigo_procesoinscripcion` int(11) NOT NULL AUTO_INCREMENT,
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
  `estatus` char(1) COLLATE utf8_spanish_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`codigo_procesoinscripcion`),
  KEY `fk_tpi_tinscrip` (`codigo_inscripcion`),
  KEY `fk_tpi_taa` (`codigo_ano_academico`),
  KEY `fk_tpi_tdocente` (`cedula_docente`),
  KEY `fk_tpi_testudiante` (`cedula_estudiante`),
  KEY `fk_tpi_tmadre` (`cedula_madre`),
  KEY `fk_tpi_tpadre` (`cedula_padre`),
  KEY `fk_tpi_trepresentante` (`cedula_representante`),
  KEY `fk_tpi_tparentesco` (`codigo_parentesco`),
  KEY `fk_tpi_tlugartrabajo` (`lugar_trabajo`),
  KEY `fk_tpi_tseccion` (`seccion`),
  CONSTRAINT `fk_tpi_tinscrip` FOREIGN KEY (`codigo_inscripcion`) REFERENCES `tinscripcion` (`codigo_inscripcion`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_taa` FOREIGN KEY (`codigo_ano_academico`) REFERENCES `tano_academico` (`codigo_ano_academico`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_tdocente` FOREIGN KEY (`cedula_docente`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_testudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_tmadre` FOREIGN KEY (`cedula_madre`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_tpadre` FOREIGN KEY (`cedula_padre`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_trepresentante` FOREIGN KEY (`cedula_representante`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_tparentesco` FOREIGN KEY (`codigo_parentesco`) REFERENCES `tparentesco` (`codigo_parentesco`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_tlugartrabajo` FOREIGN KEY (`lugar_trabajo`) REFERENCES `tparroquia` (`codigo_parroquia`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_tseccion` FOREIGN KEY (`seccion`) REFERENCES `tseccion` (`seccion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tproceso_inscripcion`
--

LOCK TABLES `tproceso_inscripcion` WRITE;
/*!40000 ALTER TABLE `tproceso_inscripcion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tproceso_inscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tseccion`
--

DROP TABLE IF EXISTS `tseccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tseccion` (
  `seccion` char(5) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `turno` char(1) COLLATE utf8_spanish_ci NOT NULL,
  `capacidad_min` int(11) NOT NULL DEFAULT '5',
  `capacidad_max` int(11) NOT NULL DEFAULT '40',
  `fecha_desactivacion` date DEFAULT NULL,
  PRIMARY KEY (`seccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tseccion`
--

LOCK TABLES `tseccion` WRITE;
/*!40000 ALTER TABLE `tseccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tseccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tservicio`
--

DROP TABLE IF EXISTS `tservicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tservicio` (
  `codigo_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `orden` decimal(10,0) DEFAULT '0',
  `codigo_modulo` int(11) NOT NULL,
  `fecha_desactivacion` date DEFAULT NULL,
  PRIMARY KEY (`codigo_servicio`),
  UNIQUE KEY `url` (`url`),
  KEY `tservicios_ibfk_1` (`codigo_modulo`),
  CONSTRAINT `tservicios_ibfk_1` FOREIGN KEY (`codigo_modulo`) REFERENCES `tmodulo` (`codigo_modulo`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tservicio`
--

LOCK TABLES `tservicio` WRITE;
/*!40000 ALTER TABLE `tservicio` DISABLE KEYS */;
INSERT INTO `tservicio` VALUES (1,'PAÍS','PAIS',1,1,NULL),(2,'ESTADO','ESTADO',2,1,NULL),(3,'MUNICIPIO','MUNICIPIO',3,1,NULL),(4,'PARROQUIA','PARROQUIA',4,1,NULL),(5,'ORGANIZACIÓN','ORGANIZACION',1,2,NULL),(6,'CARGO','CARGO',2,2,NULL),(7,'PERSONA','PERSONA',3,2,NULL),(8,'PARENTESCO','PARENTESCO',4,2,NULL),(9,'AÑO ACADÉMICO','ANO_ACADEMICO',2,3,NULL),(10,'LAPSO','LAPSO',3,3,NULL),(11,'MATERIA','MATERIA',4,3,NULL),(12,'PERÍODO','PERIODO',5,3,NULL),(13,'SECCIÓN','SECCION',6,3,NULL),(14,'ESTUDIANTES','ESTUDIANTE',7,3,NULL),(15,'INSCRIPCIÓN','INSCRIPCION',8,3,NULL),(16,'PROCESO DE  INSCRIPCIÓN','PROCESO_INSCRIPCION',9,3,NULL),(17,'ASIGNACIÓN DE SECCIONES','ASIGNAR_SECCION',10,3,NULL),(18,'ASIGNACIÓN DE NOTAS','ASIGNAR_NOTAS',1,4,NULL),(19,'MÓDULO','MODULO',1,6,NULL),(20,'SERVICIOS','SERVICIO',2,6,NULL),(21,'BOTONERA','BOTONES',3,6,NULL),(22,'PERFIL','PERFILES',4,6,NULL),(23,'NUEVO USUARIO','NUEVOUSUARIO',5,6,NULL),(24,'MÍ PERFIL','PERFIL',6,6,NULL),(25,'CAMBIAR CONTRASEÑA','CAMBIARCONTRASENA',7,6,NULL),(26,'DESBLOQUEAR USUARIO','DESBLOQUEARUSUARIO',8,6,NULL),(27,'HISTÓRICO DE CAMBIOS','BITACORA',9,6,NULL);
/*!40000 ALTER TABLE `tservicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tservicio_usuario_opcion`
--

DROP TABLE IF EXISTS `tservicio_usuario_opcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tservicio_usuario_opcion` (
  `codigo_opcion` int(11) DEFAULT NULL,
  `codigo_servicio` int(11) NOT NULL,
  `codigo_perfil` int(11) NOT NULL,
  KEY `fk_tservicio_usuario_opcion_topcion` (`codigo_opcion`),
  KEY `fk_tservicio_usuario_opcion_tservicio` (`codigo_servicio`),
  KEY `fk_tservicio_usuario_opcion_tperfil` (`codigo_perfil`),
  CONSTRAINT `fk_tservicio_usuario_opcion_topcion` FOREIGN KEY (`codigo_opcion`) REFERENCES `topcion` (`codigo_opcion`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tservicio_usuario_opcion_tservicio` FOREIGN KEY (`codigo_servicio`) REFERENCES `tservicio` (`codigo_servicio`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tservicio_usuario_opcion_tperfil` FOREIGN KEY (`codigo_perfil`) REFERENCES `tperfil` (`codigo_perfil`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tservicio_usuario_opcion`
--

LOCK TABLES `tservicio_usuario_opcion` WRITE;
/*!40000 ALTER TABLE `tservicio_usuario_opcion` DISABLE KEYS */;
INSERT INTO `tservicio_usuario_opcion` VALUES (1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),(1,2,1),(2,2,1),(3,2,1),(4,2,1),(5,2,1),(1,3,1),(2,3,1),(3,3,1),(4,3,1),(5,3,1),(1,4,1),(2,4,1),(3,4,1),(4,4,1),(5,4,1),(1,5,1),(2,5,1),(3,5,1),(4,5,1),(5,5,1),(1,6,1),(2,6,1),(3,6,1),(4,6,1),(5,6,1),(1,7,1),(2,7,1),(3,7,1),(4,7,1),(5,7,1),(1,8,1),(2,8,1),(3,8,1),(4,8,1),(5,8,1),(1,9,1),(2,9,1),(3,9,1),(4,9,1),(5,9,1),(1,10,1),(2,10,1),(3,10,1),(4,10,1),(5,10,1),(1,11,1),(2,11,1),(3,11,1),(4,11,1),(5,11,1),(1,12,1),(2,12,1),(3,12,1),(4,12,1),(5,12,1),(1,13,1),(2,13,1),(3,13,1),(4,13,1),(5,13,1),(1,14,1),(2,14,1),(3,14,1),(4,14,1),(5,14,1),(1,15,1),(2,15,1),(3,15,1),(4,15,1),(5,15,1),(1,16,1),(2,16,1),(3,16,1),(4,16,1),(5,16,1),(1,17,1),(2,17,1),(3,17,1),(4,17,1),(5,17,1),(1,18,1),(2,18,1),(3,18,1),(4,18,1),(5,18,1),(1,19,1),(2,19,1),(3,19,1),(4,19,1),(5,19,1),(1,20,1),(2,20,1),(3,20,1),(4,20,1),(5,20,1),(1,21,1),(2,21,1),(3,21,1),(4,21,1),(5,21,1),(1,22,1),(2,22,1),(3,22,1),(4,22,1),(5,22,1),(1,23,1),(2,23,1),(3,23,1),(4,23,1),(5,23,1),(1,24,1),(2,24,1),(3,24,1),(4,24,1),(5,24,1),(1,25,1),(2,25,1),(3,25,1),(4,25,1),(5,25,1),(1,26,1),(2,26,1),(3,26,1),(4,26,1),(5,26,1),(1,27,1),(2,27,1),(3,27,1),(4,27,1),(5,27,1);
/*!40000 ALTER TABLE `tservicio_usuario_opcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tusuario`
--

DROP TABLE IF EXISTS `tusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tusuario` (
  `nombre_usuario` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `pregunta_1` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pregunta_2` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `respuesta_1` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `respuesta_2` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cedula` char(10) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_perfil` int(11) NOT NULL,
  `intento_fallido` int(11) NOT NULL DEFAULT '0',
  `activar_caducidad` int(11) NOT NULL DEFAULT '1',
  `fecha_desactivacion` date DEFAULT NULL,
  PRIMARY KEY (`nombre_usuario`),
  KEY `tusuario_ibfk_1` (`cedula`),
  KEY `tusuario_ibfk_2` (`codigo_perfil`),
  CONSTRAINT `tusuario_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
  CONSTRAINT `tusuario_ibfk_2` FOREIGN KEY (`codigo_perfil`) REFERENCES `tperfil` (`codigo_perfil`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusuario`
--

LOCK TABLES `tusuario` WRITE;
/*!40000 ALTER TABLE `tusuario` DISABLE KEYS */;
INSERT INTO `tusuario` VALUES ('V123456789','P1','P2','R1','R2','V123456789',1,0,1,NULL);
/*!40000 ALTER TABLE `tusuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-03 14:30:33
