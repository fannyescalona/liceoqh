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
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tauditoria`
--

LOCK TABLES `tauditoria` WRITE;
/*!40000 ALTER TABLE `tauditoria` DISABLE KEYS */;
INSERT INTO `tauditoria` VALUES (1,'::1','Linux','Google Chrome','root@localhost','V123456789','update tusuario set intento_fallido=0 where (nombre_usuario=\'V123456789\')','2015-11-03 18:31:18'),(2,'::1','Linux','Google Chrome','root@localhost','V123456789','update tcontrasena set estado=0 where (nombre_usuario=\'V123456789\')','2015-11-03 18:32:29'),(3,'::1','Linux','Google Chrome','root@localhost','V123456789','insert into tcontrasena (contrasena,nombre_usuario,estado)values(\'2e5f402b1f0117f9f7217a3e8cbff136b1e304ad\',\'V123456789\',1)','2015-11-03 18:32:29'),(4,'::1','Linux','Google Chrome','root@localhost','V123456789','update tusuario set intento_fallido=0 where (nombre_usuario=\'V123456789\')','2015-11-03 18:32:40'),(5,'::1','Linux','Google Chrome','root@localhost','V123456789','update tusuario set intento_fallido=0 where (nombre_usuario=\'V123456789\')','2015-11-03 18:54:17'),(6,'::1','Linux','Google Chrome','root@localhost','V123456789','update tusuario set intento_fallido=0 where (nombre_usuario=\'V123456789\')','2015-11-04 17:07:36'),(7,'::1','Linux','Google Chrome','root@localhost','V123456789','update tusuario set intento_fallido=0 where (nombre_usuario=\'V123456789\')','2015-11-04 17:34:51'),(8,'::1','Linux','Google Chrome','root@localhost','V123456789','update tmodulo set descripcion=\'GENERAL\',icono=\'icon-list\',orden=\'2\' where (codigo_modulo=\'2\');','2015-11-04 17:35:20'),(9,'::1','Linux','Google Chrome','root@localhost','V123456789','update tmodulo set descripcion=\'EDUCACIÓN\',icono=\'icon-list-alt\',orden=\'3\' where (codigo_modulo=\'3\');','2015-11-04 17:35:35'),(10,'::1','Linux','Google Chrome','root@localhost','V123456789','update topcion set descripcion=\'INSERTAR\',icono=\'Icon-pencil\',orden=1 where (codigo_opcion=\'1\');','2015-11-04 18:04:25'),(11,'::1','Linux','Google Chrome','root@localhost','V123456789','update topcion set descripcion=\'INSERTAR\',icono=\'icon-pencil\',orden=1 where (codigo_opcion=\'1\');','2015-11-04 18:06:41'),(12,'::1','Linux','Google Chrome','root@localhost','V123456789','update topcion set descripcion=\'INSERTAR\',icono=\'icon-pencil\',orden=1 where (codigo_opcion=\'1\');','2015-11-04 18:06:48'),(13,'::1','Linux','Google Chrome','root@localhost','V123456789','update topcion set descripcion=\'INSERTAR\',icono=\'icon-pencil\',orden=1 where (codigo_opcion=\'1\');','2015-11-04 18:09:03'),(14,'::1','Linux','Google Chrome','root@localhost','V123456789','update topcion set descripcion=\'ACTUALIZAR\',icono=\'icon-edit\',orden=2 where (codigo_opcion=\'2\');','2015-11-04 18:10:30'),(15,'::1','Linux','Google Chrome','root@localhost','V123456789','update topcion set fecha_desactivacion=CURDATE() where (codigo_opcion=\'3\');','2015-11-04 18:10:40'),(16,'::1','Linux','Google Chrome','root@localhost','V123456789','update topcion set fecha_desactivacion=NULL where (codigo_opcion=\'3\');','2015-11-04 18:10:45'),(17,'::1','Linux','Google Chrome','root@localhost','V123456789','insert into topcion (descripcion,icono,orden) values (\'CANCELAR\',\'icon-remove\',6);','2015-11-04 18:11:11'),(18,'::1','Linux','Google Chrome','root@localhost','V123456789','insert into topcion (descripcion,icono,orden) values (\'LISTAR\',\'icon-print\',7);','2015-11-04 18:11:25'),(19,'::1','Linux','Google Chrome','root@localhost','V123456789','update tservicio set descripcion=\'MÓDULO\',url=\'MODULO\',\r\n    orden=\'1\',codigo_modulo=\'6\' where (codigo_servicio=\'19\');','2015-11-04 18:19:55'),(20,'::1','Linux','Google Chrome','root@localhost','V123456789','update tperfil set descripcion=\'ADMINISTRADOR\' where (codigo_perfil=\'1\');','2015-11-04 18:30:12'),(21,'::1','Linux','Google Chrome','root@localhost','V123456789','DELETE FROM tservicio_usuario_opcion where (codigo_perfil=\'1\');','2015-11-04 18:30:12'),(22,'::1','Linux','Google Chrome','root@localhost','V123456789','update tperfil set descripcion=\'ADMINISTRADOR\' where (codigo_perfil=\'1\');','2015-11-04 18:30:55'),(23,'::1','Linux','Google Chrome','root@localhost','V123456789','DELETE FROM tservicio_usuario_opcion where (codigo_perfil=\'1\');','2015-11-04 18:30:55'),(24,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'1\',NULL)','2015-11-04 18:30:55'),(25,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'1\',\'1\')','2015-11-04 18:30:56'),(26,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'1\',\'2\')','2015-11-04 18:30:56'),(27,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'1\',\'3\')','2015-11-04 18:30:56'),(28,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'1\',\'4\')','2015-11-04 18:30:56'),(29,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'1\',\'5\')','2015-11-04 18:30:56'),(30,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'1\',\'6\')','2015-11-04 18:30:56'),(31,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'1\',\'7\')','2015-11-04 18:30:56'),(32,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'2\',NULL)','2015-11-04 18:30:56'),(33,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'2\',\'1\')','2015-11-04 18:30:56'),(34,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'2\',\'2\')','2015-11-04 18:30:56'),(35,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'2\',\'3\')','2015-11-04 18:30:56'),(36,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'2\',\'4\')','2015-11-04 18:30:57'),(37,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'2\',\'5\')','2015-11-04 18:30:57'),(38,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'2\',\'6\')','2015-11-04 18:30:57'),(39,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'2\',\'7\')','2015-11-04 18:30:57'),(40,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'3\',NULL)','2015-11-04 18:30:57'),(41,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'3\',\'1\')','2015-11-04 18:30:57'),(42,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'3\',\'2\')','2015-11-04 18:30:57'),(43,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'3\',\'3\')','2015-11-04 18:30:57'),(44,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'3\',\'4\')','2015-11-04 18:30:57'),(45,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'3\',\'5\')','2015-11-04 18:30:57'),(46,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'3\',\'6\')','2015-11-04 18:30:57'),(47,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'3\',\'7\')','2015-11-04 18:30:58'),(48,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'4\',NULL)','2015-11-04 18:30:58'),(49,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'4\',\'1\')','2015-11-04 18:30:58'),(50,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'4\',\'2\')','2015-11-04 18:30:58'),(51,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'4\',\'3\')','2015-11-04 18:30:58'),(52,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'4\',\'4\')','2015-11-04 18:30:58'),(53,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'4\',\'5\')','2015-11-04 18:30:58'),(54,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'4\',\'6\')','2015-11-04 18:30:58'),(55,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'4\',\'7\')','2015-11-04 18:30:58'),(56,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'5\',NULL)','2015-11-04 18:30:58'),(57,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'5\',\'1\')','2015-11-04 18:30:58'),(58,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'5\',\'2\')','2015-11-04 18:30:58'),(59,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'5\',\'3\')','2015-11-04 18:30:58'),(60,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'5\',\'4\')','2015-11-04 18:30:58'),(61,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'5\',\'5\')','2015-11-04 18:30:59'),(62,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'5\',\'6\')','2015-11-04 18:30:59'),(63,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'5\',\'7\')','2015-11-04 18:30:59'),(64,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'6\',NULL)','2015-11-04 18:30:59'),(65,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'6\',\'1\')','2015-11-04 18:30:59'),(66,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'6\',\'2\')','2015-11-04 18:30:59'),(67,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'6\',\'3\')','2015-11-04 18:30:59'),(68,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'6\',\'4\')','2015-11-04 18:30:59'),(69,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'6\',\'5\')','2015-11-04 18:30:59'),(70,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'6\',\'6\')','2015-11-04 18:30:59'),(71,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'6\',\'7\')','2015-11-04 18:30:59'),(72,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'7\',NULL)','2015-11-04 18:30:59'),(73,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'7\',\'1\')','2015-11-04 18:31:00'),(74,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'7\',\'2\')','2015-11-04 18:31:00'),(75,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'7\',\'3\')','2015-11-04 18:31:00'),(76,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'7\',\'4\')','2015-11-04 18:31:00'),(77,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'7\',\'5\')','2015-11-04 18:31:00'),(78,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'7\',\'6\')','2015-11-04 18:31:00'),(79,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'7\',\'7\')','2015-11-04 18:31:00'),(80,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'8\',NULL)','2015-11-04 18:31:00'),(81,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'8\',\'1\')','2015-11-04 18:31:00'),(82,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'8\',\'2\')','2015-11-04 18:31:00'),(83,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'8\',\'3\')','2015-11-04 18:31:00'),(84,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'8\',\'4\')','2015-11-04 18:31:00'),(85,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'8\',\'5\')','2015-11-04 18:31:01'),(86,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'8\',\'6\')','2015-11-04 18:31:01'),(87,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'8\',\'7\')','2015-11-04 18:31:01'),(88,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'9\',NULL)','2015-11-04 18:31:01'),(89,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'9\',\'1\')','2015-11-04 18:31:01'),(90,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'9\',\'2\')','2015-11-04 18:31:01'),(91,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'9\',\'3\')','2015-11-04 18:31:01'),(92,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'9\',\'4\')','2015-11-04 18:31:01'),(93,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'9\',\'5\')','2015-11-04 18:31:01'),(94,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'9\',\'6\')','2015-11-04 18:31:01'),(95,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'9\',\'7\')','2015-11-04 18:31:01'),(96,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'10\',NULL)','2015-11-04 18:31:01'),(97,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'10\',\'1\')','2015-11-04 18:31:01'),(98,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'10\',\'2\')','2015-11-04 18:31:02'),(99,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'10\',\'3\')','2015-11-04 18:31:02'),(100,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'10\',\'4\')','2015-11-04 18:31:02'),(101,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'10\',\'5\')','2015-11-04 18:31:02'),(102,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'10\',\'6\')','2015-11-04 18:31:02'),(103,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'10\',\'7\')','2015-11-04 18:31:02'),(104,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'11\',NULL)','2015-11-04 18:31:02'),(105,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'11\',\'1\')','2015-11-04 18:31:02'),(106,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'11\',\'2\')','2015-11-04 18:31:02'),(107,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'11\',\'3\')','2015-11-04 18:31:02'),(108,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'11\',\'4\')','2015-11-04 18:31:02'),(109,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'11\',\'5\')','2015-11-04 18:31:02'),(110,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'11\',\'6\')','2015-11-04 18:31:02'),(111,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'11\',\'7\')','2015-11-04 18:31:03'),(112,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'12\',NULL)','2015-11-04 18:31:03'),(113,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'12\',\'1\')','2015-11-04 18:31:03'),(114,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'12\',\'2\')','2015-11-04 18:31:03'),(115,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'12\',\'3\')','2015-11-04 18:31:03'),(116,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'12\',\'4\')','2015-11-04 18:31:03'),(117,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'12\',\'5\')','2015-11-04 18:31:03'),(118,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'12\',\'6\')','2015-11-04 18:31:03'),(119,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'12\',\'7\')','2015-11-04 18:31:03'),(120,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'13\',NULL)','2015-11-04 18:31:03'),(121,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'13\',\'1\')','2015-11-04 18:31:03'),(122,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'13\',\'2\')','2015-11-04 18:31:04'),(123,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'13\',\'3\')','2015-11-04 18:31:04'),(124,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'13\',\'4\')','2015-11-04 18:31:04'),(125,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'13\',\'5\')','2015-11-04 18:31:04'),(126,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'13\',\'6\')','2015-11-04 18:31:04'),(127,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'13\',\'7\')','2015-11-04 18:31:04'),(128,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'14\',NULL)','2015-11-04 18:31:04'),(129,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'14\',\'1\')','2015-11-04 18:31:04'),(130,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'14\',\'2\')','2015-11-04 18:31:04'),(131,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'14\',\'3\')','2015-11-04 18:31:04'),(132,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'14\',\'4\')','2015-11-04 18:31:04'),(133,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'14\',\'5\')','2015-11-04 18:31:04'),(134,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'14\',\'6\')','2015-11-04 18:31:04'),(135,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'14\',\'7\')','2015-11-04 18:31:04'),(136,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'15\',NULL)','2015-11-04 18:31:04'),(137,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'15\',\'1\')','2015-11-04 18:31:05'),(138,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'15\',\'2\')','2015-11-04 18:31:05'),(139,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'15\',\'3\')','2015-11-04 18:31:05'),(140,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'15\',\'4\')','2015-11-04 18:31:05'),(141,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'15\',\'5\')','2015-11-04 18:31:05'),(142,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'15\',\'6\')','2015-11-04 18:31:05'),(143,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'15\',\'7\')','2015-11-04 18:31:05'),(144,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'16\',NULL)','2015-11-04 18:31:05'),(145,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'16\',\'1\')','2015-11-04 18:31:05'),(146,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'16\',\'2\')','2015-11-04 18:31:05'),(147,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'16\',\'3\')','2015-11-04 18:31:05'),(148,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'16\',\'4\')','2015-11-04 18:31:05'),(149,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'16\',\'5\')','2015-11-04 18:31:06'),(150,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'16\',\'6\')','2015-11-04 18:31:06'),(151,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'16\',\'7\')','2015-11-04 18:31:06'),(152,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'17\',NULL)','2015-11-04 18:31:06'),(153,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'17\',\'1\')','2015-11-04 18:31:06'),(154,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'17\',\'2\')','2015-11-04 18:31:06'),(155,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'17\',\'3\')','2015-11-04 18:31:06'),(156,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'17\',\'4\')','2015-11-04 18:31:06'),(157,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'17\',\'5\')','2015-11-04 18:31:07'),(158,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'17\',\'6\')','2015-11-04 18:31:07'),(159,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'17\',\'7\')','2015-11-04 18:31:07'),(160,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'18\',NULL)','2015-11-04 18:31:07'),(161,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'18\',\'1\')','2015-11-04 18:31:07'),(162,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'18\',\'2\')','2015-11-04 18:31:07'),(163,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'18\',\'3\')','2015-11-04 18:31:07'),(164,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'18\',\'4\')','2015-11-04 18:31:07'),(165,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'18\',\'5\')','2015-11-04 18:31:07'),(166,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'18\',\'6\')','2015-11-04 18:31:07'),(167,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'18\',\'7\')','2015-11-04 18:31:07'),(168,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'19\',NULL)','2015-11-04 18:31:07'),(169,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'19\',\'1\')','2015-11-04 18:31:07'),(170,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'19\',\'2\')','2015-11-04 18:31:07'),(171,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'19\',\'3\')','2015-11-04 18:31:08'),(172,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'19\',\'4\')','2015-11-04 18:31:08'),(173,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'19\',\'5\')','2015-11-04 18:31:08'),(174,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'19\',\'6\')','2015-11-04 18:31:08'),(175,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'19\',\'7\')','2015-11-04 18:31:08'),(176,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'20\',NULL)','2015-11-04 18:31:08'),(177,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'20\',\'1\')','2015-11-04 18:31:08'),(178,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'20\',\'2\')','2015-11-04 18:31:08'),(179,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'20\',\'3\')','2015-11-04 18:31:08'),(180,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'20\',\'4\')','2015-11-04 18:31:08'),(181,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'20\',\'5\')','2015-11-04 18:31:08'),(182,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'20\',\'6\')','2015-11-04 18:31:08'),(183,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'20\',\'7\')','2015-11-04 18:31:08'),(184,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'21\',NULL)','2015-11-04 18:31:09'),(185,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'21\',\'1\')','2015-11-04 18:31:09'),(186,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'21\',\'2\')','2015-11-04 18:31:09'),(187,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'21\',\'3\')','2015-11-04 18:31:09'),(188,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'21\',\'4\')','2015-11-04 18:31:09'),(189,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'21\',\'5\')','2015-11-04 18:31:09'),(190,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'21\',\'6\')','2015-11-04 18:31:09'),(191,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'21\',\'7\')','2015-11-04 18:31:09'),(192,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'22\',NULL)','2015-11-04 18:31:09'),(193,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'22\',\'1\')','2015-11-04 18:31:09'),(194,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'22\',\'2\')','2015-11-04 18:31:09'),(195,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'22\',\'3\')','2015-11-04 18:31:10'),(196,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'22\',\'4\')','2015-11-04 18:31:10'),(197,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'22\',\'5\')','2015-11-04 18:31:10'),(198,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'22\',\'6\')','2015-11-04 18:31:10'),(199,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'22\',\'7\')','2015-11-04 18:31:10'),(200,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'23\',NULL)','2015-11-04 18:31:10'),(201,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'23\',\'1\')','2015-11-04 18:31:10'),(202,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'23\',\'2\')','2015-11-04 18:31:10'),(203,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'23\',\'3\')','2015-11-04 18:31:10'),(204,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'23\',\'4\')','2015-11-04 18:31:10'),(205,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'23\',\'5\')','2015-11-04 18:31:10'),(206,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'23\',\'6\')','2015-11-04 18:31:10'),(207,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'23\',\'7\')','2015-11-04 18:31:10'),(208,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'24\',NULL)','2015-11-04 18:31:10'),(209,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'24\',\'1\')','2015-11-04 18:31:11'),(210,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'24\',\'2\')','2015-11-04 18:31:11'),(211,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'24\',\'3\')','2015-11-04 18:31:11'),(212,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'24\',\'4\')','2015-11-04 18:31:11'),(213,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'24\',\'5\')','2015-11-04 18:31:11'),(214,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'24\',\'6\')','2015-11-04 18:31:11'),(215,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'24\',\'7\')','2015-11-04 18:31:11'),(216,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'25\',NULL)','2015-11-04 18:31:11'),(217,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'25\',\'1\')','2015-11-04 18:31:11'),(218,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'25\',\'2\')','2015-11-04 18:31:11'),(219,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'25\',\'3\')','2015-11-04 18:31:12'),(220,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'25\',\'4\')','2015-11-04 18:31:12'),(221,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'25\',\'5\')','2015-11-04 18:31:12'),(222,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'25\',\'6\')','2015-11-04 18:31:12'),(223,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'25\',\'7\')','2015-11-04 18:31:12'),(224,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'26\',NULL)','2015-11-04 18:31:12'),(225,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'26\',\'1\')','2015-11-04 18:31:12'),(226,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'26\',\'2\')','2015-11-04 18:31:12'),(227,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'26\',\'3\')','2015-11-04 18:31:12'),(228,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'26\',\'4\')','2015-11-04 18:31:12'),(229,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'26\',\'5\')','2015-11-04 18:31:13'),(230,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'26\',\'6\')','2015-11-04 18:31:13'),(231,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'26\',\'7\')','2015-11-04 18:31:13'),(232,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'27\',NULL)','2015-11-04 18:31:13'),(233,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'27\',\'1\')','2015-11-04 18:31:13'),(234,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'27\',\'2\')','2015-11-04 18:31:13'),(235,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'27\',\'3\')','2015-11-04 18:31:13'),(236,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'27\',\'4\')','2015-11-04 18:31:13'),(237,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'27\',\'5\')','2015-11-04 18:31:13'),(238,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'27\',\'6\')','2015-11-04 18:31:13'),(239,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'27\',\'7\')','2015-11-04 18:31:13'),(240,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'1\',NULL)','2015-11-04 18:31:13'),(241,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'2\',NULL)','2015-11-04 18:31:13'),(242,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'3\',NULL)','2015-11-04 18:31:14'),(243,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'4\',NULL)','2015-11-04 18:31:14'),(244,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'5\',NULL)','2015-11-04 18:31:14'),(245,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'6\',NULL)','2015-11-04 18:31:14'),(246,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'7\',NULL)','2015-11-04 18:31:14'),(247,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'8\',NULL)','2015-11-04 18:31:14'),(248,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'9\',NULL)','2015-11-04 18:31:14'),(249,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'10\',NULL)','2015-11-04 18:31:14'),(250,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'11\',NULL)','2015-11-04 18:31:14'),(251,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'12\',NULL)','2015-11-04 18:31:14'),(252,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'13\',NULL)','2015-11-04 18:31:14'),(253,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'14\',NULL)','2015-11-04 18:31:14'),(254,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'15\',NULL)','2015-11-04 18:31:15'),(255,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'16\',NULL)','2015-11-04 18:31:15'),(256,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'17\',NULL)','2015-11-04 18:31:15'),(257,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'18\',NULL)','2015-11-04 18:31:15'),(258,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'19\',NULL)','2015-11-04 18:31:15'),(259,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'20\',NULL)','2015-11-04 18:31:15'),(260,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'21\',NULL)','2015-11-04 18:31:15'),(261,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'22\',NULL)','2015-11-04 18:31:15'),(262,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'23\',NULL)','2015-11-04 18:31:15'),(263,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'24\',NULL)','2015-11-04 18:31:16'),(264,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'25\',NULL)','2015-11-04 18:31:16'),(265,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'26\',NULL)','2015-11-04 18:31:16'),(266,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'27\',NULL)','2015-11-04 18:31:16'),(267,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'1\',NULL)','2015-11-04 18:31:16'),(268,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'2\',NULL)','2015-11-04 18:31:16'),(269,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'3\',NULL)','2015-11-04 18:31:17'),(270,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'4\',NULL)','2015-11-04 18:31:17'),(271,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'5\',NULL)','2015-11-04 18:31:17'),(272,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'6\',NULL)','2015-11-04 18:31:17'),(273,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'7\',NULL)','2015-11-04 18:31:17'),(274,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'8\',NULL)','2015-11-04 18:31:17'),(275,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'9\',NULL)','2015-11-04 18:31:17'),(276,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'10\',NULL)','2015-11-04 18:31:17'),(277,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'11\',NULL)','2015-11-04 18:31:17'),(278,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'12\',NULL)','2015-11-04 18:31:17'),(279,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'13\',NULL)','2015-11-04 18:31:17'),(280,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'14\',NULL)','2015-11-04 18:31:17'),(281,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'15\',NULL)','2015-11-04 18:31:18'),(282,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'16\',NULL)','2015-11-04 18:31:18'),(283,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'17\',NULL)','2015-11-04 18:31:18'),(284,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'18\',NULL)','2015-11-04 18:31:18'),(285,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'19\',NULL)','2015-11-04 18:31:18'),(286,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'20\',NULL)','2015-11-04 18:31:18'),(287,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'21\',NULL)','2015-11-04 18:31:18'),(288,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'22\',NULL)','2015-11-04 18:31:18'),(289,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'23\',NULL)','2015-11-04 18:31:18'),(290,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'24\',NULL)','2015-11-04 18:31:18'),(291,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'25\',NULL)','2015-11-04 18:31:18'),(292,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'26\',NULL)','2015-11-04 18:31:18'),(293,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'27\',NULL)','2015-11-04 18:31:19'),(294,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'1\',NULL)','2015-11-04 18:31:19'),(295,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'2\',NULL)','2015-11-04 18:31:19'),(296,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'3\',NULL)','2015-11-04 18:31:19'),(297,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'4\',NULL)','2015-11-04 18:31:19'),(298,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'5\',NULL)','2015-11-04 18:31:19'),(299,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'6\',NULL)','2015-11-04 18:31:19'),(300,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'7\',NULL)','2015-11-04 18:31:19'),(301,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'8\',NULL)','2015-11-04 18:31:19'),(302,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'9\',NULL)','2015-11-04 18:31:19'),(303,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'10\',NULL)','2015-11-04 18:31:19'),(304,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'11\',NULL)','2015-11-04 18:31:20'),(305,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'12\',NULL)','2015-11-04 18:31:20'),(306,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'13\',NULL)','2015-11-04 18:31:20'),(307,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'14\',NULL)','2015-11-04 18:31:20'),(308,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'15\',NULL)','2015-11-04 18:31:20'),(309,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'16\',NULL)','2015-11-04 18:31:20'),(310,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'17\',NULL)','2015-11-04 18:31:20'),(311,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'18\',NULL)','2015-11-04 18:31:20'),(312,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'19\',NULL)','2015-11-04 18:31:20'),(313,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'20\',NULL)','2015-11-04 18:31:20'),(314,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'21\',NULL)','2015-11-04 18:31:20'),(315,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'22\',NULL)','2015-11-04 18:31:20'),(316,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'23\',NULL)','2015-11-04 18:31:20'),(317,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'24\',NULL)','2015-11-04 18:31:20'),(318,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'25\',NULL)','2015-11-04 18:31:21'),(319,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'26\',NULL)','2015-11-04 18:31:21'),(320,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'27\',NULL)','2015-11-04 18:31:21'),(321,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'1\',NULL)','2015-11-04 18:31:21'),(322,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'2\',NULL)','2015-11-04 18:31:21'),(323,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'3\',NULL)','2015-11-04 18:31:21'),(324,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'4\',NULL)','2015-11-04 18:31:21'),(325,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'5\',NULL)','2015-11-04 18:31:21'),(326,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'6\',NULL)','2015-11-04 18:31:22'),(327,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'7\',NULL)','2015-11-04 18:31:22'),(328,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'8\',NULL)','2015-11-04 18:31:22'),(329,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'9\',NULL)','2015-11-04 18:31:22'),(330,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'10\',NULL)','2015-11-04 18:31:22'),(331,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'11\',NULL)','2015-11-04 18:31:22'),(332,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'12\',NULL)','2015-11-04 18:31:22'),(333,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'13\',NULL)','2015-11-04 18:31:22'),(334,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'14\',NULL)','2015-11-04 18:31:22'),(335,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'15\',NULL)','2015-11-04 18:31:22'),(336,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'16\',NULL)','2015-11-04 18:31:22'),(337,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'17\',NULL)','2015-11-04 18:31:23'),(338,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'18\',NULL)','2015-11-04 18:31:23'),(339,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'19\',NULL)','2015-11-04 18:31:23'),(340,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'20\',NULL)','2015-11-04 18:31:23'),(341,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'21\',NULL)','2015-11-04 18:31:23'),(342,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'22\',NULL)','2015-11-04 18:31:23'),(343,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'23\',NULL)','2015-11-04 18:31:23'),(344,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'24\',NULL)','2015-11-04 18:31:23'),(345,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'25\',NULL)','2015-11-04 18:31:23'),(346,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'26\',NULL)','2015-11-04 18:31:23'),(347,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'27\',NULL)','2015-11-04 18:31:23'),(348,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'1\',NULL)','2015-11-04 18:31:23'),(349,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'2\',NULL)','2015-11-04 18:31:23'),(350,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'3\',NULL)','2015-11-04 18:31:24'),(351,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'4\',NULL)','2015-11-04 18:31:24'),(352,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'5\',NULL)','2015-11-04 18:31:24'),(353,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'6\',NULL)','2015-11-04 18:31:24'),(354,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'7\',NULL)','2015-11-04 18:31:24'),(355,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'8\',NULL)','2015-11-04 18:31:24'),(356,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'9\',NULL)','2015-11-04 18:31:24'),(357,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'10\',NULL)','2015-11-04 18:31:24'),(358,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'11\',NULL)','2015-11-04 18:31:24'),(359,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'12\',NULL)','2015-11-04 18:31:24'),(360,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'13\',NULL)','2015-11-04 18:31:24'),(361,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'14\',NULL)','2015-11-04 18:31:24'),(362,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'15\',NULL)','2015-11-04 18:31:24'),(363,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'16\',NULL)','2015-11-04 18:31:25'),(364,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'17\',NULL)','2015-11-04 18:31:25'),(365,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'18\',NULL)','2015-11-04 18:31:25'),(366,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'19\',NULL)','2015-11-04 18:31:25'),(367,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'20\',NULL)','2015-11-04 18:31:25'),(368,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'21\',NULL)','2015-11-04 18:31:25'),(369,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'22\',NULL)','2015-11-04 18:31:25'),(370,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'23\',NULL)','2015-11-04 18:31:25'),(371,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'24\',NULL)','2015-11-04 18:31:25'),(372,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'25\',NULL)','2015-11-04 18:31:25'),(373,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'26\',NULL)','2015-11-04 18:31:26'),(374,'::1','Linux','Google Chrome','root@localhost','V123456789','INSERT INTO tservicio_usuario_opcion(codigo_perfil,codigo_servicio,codigo_opcion) VALUES \r\n    (\'1\',\'27\',NULL)','2015-11-04 18:31:26'),(375,'::1','Linux','Google Chrome','root@localhost','V123456789','insert into tpais (descripcion) values (\'COLOMBIA\');','2015-11-04 18:51:56'),(376,'::1','Linux','Google Chrome','root@localhost','V123456789','update tpais set fecha_desactivacion=CURDATE() where (codigo_pais=\'2\');','2015-11-04 18:53:33'),(377,'::1','Linux','Google Chrome','root@localhost','V123456789','update tpais set fecha_desactivacion=NULL where (codigo_pais=\'2\');','2015-11-04 18:53:39'),(378,'::1','Linux','Google Chrome','root@localhost','V123456789','insert into testado (descripcion,codigo_pais) values (\'MERIDA\',\'1\');','2015-11-04 18:57:19'),(379,'::1','Linux','Google Chrome','root@localhost','V123456789','insert into testado (descripcion,codigo_pais) values (\'LARA\',\'1\');','2015-11-04 18:57:23'),(380,'::1','Linux','Google Chrome','root@localhost','V123456789','update testado set descripcion=\'APURE\',codigo_pais=\'1\' where (codigo_estado=\'2\');','2015-11-04 18:57:42'),(381,'::1','Linux','Google Chrome','root@localhost','V123456789','insert into tmunicipio (descripcion,codigo_estado) values (\'ARAURE\',\'1\');','2015-11-04 19:07:01'),(382,'::1','Linux','Google Chrome','root@localhost','V123456789','insert into tmunicipio (descripcion,codigo_estado) values (\'ESTELLER\',\'1\');','2015-11-04 19:07:16'),(383,'::1','Linux','Google Chrome','root@localhost','V123456789','insert into tparroquia (descripcion,codigo_municipio) values (\'CAPITAL ARAURE\',\'2\');','2015-11-04 19:10:11'),(384,'::1','Linux','Google Chrome','root@localhost','V123456789','insert into tparroquia (descripcion,codigo_municipio) values (\'RÍO ACARIGUA\',\'2\');','2015-11-04 19:10:20');
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
  CONSTRAINT `fk_tcontrolnotas_estudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tcontrolnotas_lapso` FOREIGN KEY (`codigo_lapso`) REFERENCES `tlapso` (`codigo_lapso`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tcontrolnotas_msd` FOREIGN KEY (`codigo_msd`) REFERENCES `tmateria_seccion_docente` (`codigo_msd`) ON UPDATE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testado`
--

LOCK TABLES `testado` WRITE;
/*!40000 ALTER TABLE `testado` DISABLE KEYS */;
INSERT INTO `testado` VALUES (1,'PORTUGUESA',1,NULL),(2,'APURE',1,NULL),(3,'LARA',1,NULL);
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
  CONSTRAINT `fk_tmateria_seccion_tpersona` FOREIGN KEY (`cedula_docente`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tmateria_seccion_tseccion` FOREIGN KEY (`seccion`) REFERENCES `tseccion` (`seccion`) ON UPDATE CASCADE
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
INSERT INTO `tmodulo` VALUES (1,'LOCALIDADES','icon-list',1,NULL),(2,'GENERAL','icon-list',2,NULL),(3,'EDUCACIÓN','icon-list-alt',3,NULL),(4,'CONTROL DE NOTAS','icon-list-alt',4,NULL),(5,'REPORTES','icon-cog',5,NULL),(6,'SEGURIDAD','icon-lock',6,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmunicipio`
--

LOCK TABLES `tmunicipio` WRITE;
/*!40000 ALTER TABLE `tmunicipio` DISABLE KEYS */;
INSERT INTO `tmunicipio` VALUES (1,'PÁEZ',1,NULL),(2,'ARAURE',1,NULL),(3,'ESTELLER',1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topcion`
--

LOCK TABLES `topcion` WRITE;
/*!40000 ALTER TABLE `topcion` DISABLE KEYS */;
INSERT INTO `topcion` VALUES (1,'INSERTAR','icon-pencil',1,NULL),(2,'ACTUALIZAR','icon-edit',2,NULL),(3,'DESACTIVAR','icon-eye-close',3,NULL),(4,'ACTIVAR','icon-eye-open',4,NULL),(5,'CONSULTAR','icon-search',5,NULL),(6,'CANCELAR','icon-remove',6,NULL),(7,'LISTAR','icon-print',7,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpais`
--

LOCK TABLES `tpais` WRITE;
/*!40000 ALTER TABLE `tpais` DISABLE KEYS */;
INSERT INTO `tpais` VALUES (1,'VENEZUELA',NULL),(2,'COLOMBIA',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tparroquia`
--

LOCK TABLES `tparroquia` WRITE;
/*!40000 ALTER TABLE `tparroquia` DISABLE KEYS */;
INSERT INTO `tparroquia` VALUES (1,'ACARIGUA',NULL,1),(2,'CAPITAL ARAURE',NULL,2),(3,'RÍO ACARIGUA',NULL,2);
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
  CONSTRAINT `fk_tpersona_tcargo` FOREIGN KEY (`codigo_cargo`) REFERENCES `tcargo` (`codigo_cargo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpersona_tparroquia` FOREIGN KEY (`lugar_nacimiento`) REFERENCES `tparroquia` (`codigo_parroquia`) ON UPDATE CASCADE,
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
  CONSTRAINT `fk_tpi_taa` FOREIGN KEY (`codigo_ano_academico`) REFERENCES `tano_academico` (`codigo_ano_academico`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_tdocente` FOREIGN KEY (`cedula_docente`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_testudiante` FOREIGN KEY (`cedula_estudiante`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_tinscrip` FOREIGN KEY (`codigo_inscripcion`) REFERENCES `tinscripcion` (`codigo_inscripcion`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_tlugartrabajo` FOREIGN KEY (`lugar_trabajo`) REFERENCES `tparroquia` (`codigo_parroquia`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_tmadre` FOREIGN KEY (`cedula_madre`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_tpadre` FOREIGN KEY (`cedula_padre`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_tparentesco` FOREIGN KEY (`codigo_parentesco`) REFERENCES `tparentesco` (`codigo_parentesco`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tpi_trepresentante` FOREIGN KEY (`cedula_representante`) REFERENCES `tpersona` (`cedula`) ON UPDATE CASCADE,
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
  CONSTRAINT `fk_tservicio_usuario_opcion_tperfil` FOREIGN KEY (`codigo_perfil`) REFERENCES `tperfil` (`codigo_perfil`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tservicio_usuario_opcion_tservicio` FOREIGN KEY (`codigo_servicio`) REFERENCES `tservicio` (`codigo_servicio`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tservicio_usuario_opcion`
--

LOCK TABLES `tservicio_usuario_opcion` WRITE;
/*!40000 ALTER TABLE `tservicio_usuario_opcion` DISABLE KEYS */;
INSERT INTO `tservicio_usuario_opcion` VALUES (NULL,1,1),(1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,1,1),(7,1,1),(NULL,2,1),(1,2,1),(2,2,1),(3,2,1),(4,2,1),(5,2,1),(6,2,1),(7,2,1),(NULL,3,1),(1,3,1),(2,3,1),(3,3,1),(4,3,1),(5,3,1),(6,3,1),(7,3,1),(NULL,4,1),(1,4,1),(2,4,1),(3,4,1),(4,4,1),(5,4,1),(6,4,1),(7,4,1),(NULL,5,1),(1,5,1),(2,5,1),(3,5,1),(4,5,1),(5,5,1),(6,5,1),(7,5,1),(NULL,6,1),(1,6,1),(2,6,1),(3,6,1),(4,6,1),(5,6,1),(6,6,1),(7,6,1),(NULL,7,1),(1,7,1),(2,7,1),(3,7,1),(4,7,1),(5,7,1),(6,7,1),(7,7,1),(NULL,8,1),(1,8,1),(2,8,1),(3,8,1),(4,8,1),(5,8,1),(6,8,1),(7,8,1),(NULL,9,1),(1,9,1),(2,9,1),(3,9,1),(4,9,1),(5,9,1),(6,9,1),(7,9,1),(NULL,10,1),(1,10,1),(2,10,1),(3,10,1),(4,10,1),(5,10,1),(6,10,1),(7,10,1),(NULL,11,1),(1,11,1),(2,11,1),(3,11,1),(4,11,1),(5,11,1),(6,11,1),(7,11,1),(NULL,12,1),(1,12,1),(2,12,1),(3,12,1),(4,12,1),(5,12,1),(6,12,1),(7,12,1),(NULL,13,1),(1,13,1),(2,13,1),(3,13,1),(4,13,1),(5,13,1),(6,13,1),(7,13,1),(NULL,14,1),(1,14,1),(2,14,1),(3,14,1),(4,14,1),(5,14,1),(6,14,1),(7,14,1),(NULL,15,1),(1,15,1),(2,15,1),(3,15,1),(4,15,1),(5,15,1),(6,15,1),(7,15,1),(NULL,16,1),(1,16,1),(2,16,1),(3,16,1),(4,16,1),(5,16,1),(6,16,1),(7,16,1),(NULL,17,1),(1,17,1),(2,17,1),(3,17,1),(4,17,1),(5,17,1),(6,17,1),(7,17,1),(NULL,18,1),(1,18,1),(2,18,1),(3,18,1),(4,18,1),(5,18,1),(6,18,1),(7,18,1),(NULL,19,1),(1,19,1),(2,19,1),(3,19,1),(4,19,1),(5,19,1),(6,19,1),(7,19,1),(NULL,20,1),(1,20,1),(2,20,1),(3,20,1),(4,20,1),(5,20,1),(6,20,1),(7,20,1),(NULL,21,1),(1,21,1),(2,21,1),(3,21,1),(4,21,1),(5,21,1),(6,21,1),(7,21,1),(NULL,22,1),(1,22,1),(2,22,1),(3,22,1),(4,22,1),(5,22,1),(6,22,1),(7,22,1),(NULL,23,1),(1,23,1),(2,23,1),(3,23,1),(4,23,1),(5,23,1),(6,23,1),(7,23,1),(NULL,24,1),(1,24,1),(2,24,1),(3,24,1),(4,24,1),(5,24,1),(6,24,1),(7,24,1),(NULL,25,1),(1,25,1),(2,25,1),(3,25,1),(4,25,1),(5,25,1),(6,25,1),(7,25,1),(NULL,26,1),(1,26,1),(2,26,1),(3,26,1),(4,26,1),(5,26,1),(6,26,1),(7,26,1),(NULL,27,1),(1,27,1),(2,27,1),(3,27,1),(4,27,1),(5,27,1),(6,27,1),(7,27,1),(NULL,1,1),(NULL,2,1),(NULL,3,1),(NULL,4,1),(NULL,5,1),(NULL,6,1),(NULL,7,1),(NULL,8,1),(NULL,9,1),(NULL,10,1),(NULL,11,1),(NULL,12,1),(NULL,13,1),(NULL,14,1),(NULL,15,1),(NULL,16,1),(NULL,17,1),(NULL,18,1),(NULL,19,1),(NULL,20,1),(NULL,21,1),(NULL,22,1),(NULL,23,1),(NULL,24,1),(NULL,25,1),(NULL,26,1),(NULL,27,1),(NULL,1,1),(NULL,2,1),(NULL,3,1),(NULL,4,1),(NULL,5,1),(NULL,6,1),(NULL,7,1),(NULL,8,1),(NULL,9,1),(NULL,10,1),(NULL,11,1),(NULL,12,1),(NULL,13,1),(NULL,14,1),(NULL,15,1),(NULL,16,1),(NULL,17,1),(NULL,18,1),(NULL,19,1),(NULL,20,1),(NULL,21,1),(NULL,22,1),(NULL,23,1),(NULL,24,1),(NULL,25,1),(NULL,26,1),(NULL,27,1),(NULL,1,1),(NULL,2,1),(NULL,3,1),(NULL,4,1),(NULL,5,1),(NULL,6,1),(NULL,7,1),(NULL,8,1),(NULL,9,1),(NULL,10,1),(NULL,11,1),(NULL,12,1),(NULL,13,1),(NULL,14,1),(NULL,15,1),(NULL,16,1),(NULL,17,1),(NULL,18,1),(NULL,19,1),(NULL,20,1),(NULL,21,1),(NULL,22,1),(NULL,23,1),(NULL,24,1),(NULL,25,1),(NULL,26,1),(NULL,27,1),(NULL,1,1),(NULL,2,1),(NULL,3,1),(NULL,4,1),(NULL,5,1),(NULL,6,1),(NULL,7,1),(NULL,8,1),(NULL,9,1),(NULL,10,1),(NULL,11,1),(NULL,12,1),(NULL,13,1),(NULL,14,1),(NULL,15,1),(NULL,16,1),(NULL,17,1),(NULL,18,1),(NULL,19,1),(NULL,20,1),(NULL,21,1),(NULL,22,1),(NULL,23,1),(NULL,24,1),(NULL,25,1),(NULL,26,1),(NULL,27,1),(NULL,1,1),(NULL,2,1),(NULL,3,1),(NULL,4,1),(NULL,5,1),(NULL,6,1),(NULL,7,1),(NULL,8,1),(NULL,9,1),(NULL,10,1),(NULL,11,1),(NULL,12,1),(NULL,13,1),(NULL,14,1),(NULL,15,1),(NULL,16,1),(NULL,17,1),(NULL,18,1),(NULL,19,1),(NULL,20,1),(NULL,21,1),(NULL,22,1),(NULL,23,1),(NULL,24,1),(NULL,25,1),(NULL,26,1),(NULL,27,1);
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

-- Dump completed on 2015-11-04 14:41:40
