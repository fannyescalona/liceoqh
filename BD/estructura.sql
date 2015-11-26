--
--
-- Table structure for table tano_academico
--

DROP TABLE IF EXISTS tano_academico;

CREATE TABLE tano_academico (
  codigo_ano_academico int(11) NOT NULL AUTO_INCREMENT,
  descripcion char(10) COLLATE utf8_spanish_ci NOT NULL,
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_ano_academico)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tmateria
--

DROP TABLE IF EXISTS tmateria;

CREATE TABLE tmateria (
  codigo_materia char(7) COLLATE utf8_spanish_ci NOT NULL,
  descripcion varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  unidad_curricular int(11) NOT NULL DEFAULT '0',
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
-- Table structure for table tperfil
--

DROP TABLE IF EXISTS tperfil;

CREATE TABLE tperfil (
  codigo_perfil int(11) NOT NULL AUTO_INCREMENT,
  descripcion varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (codigo_perfil)
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
  condicion_cargo char(1) DEFAULT 'T',
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
  talla char(2) NOT NULL DEFAULT 'S',
  plantel_procedencia varchar(50),
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
  CONSTRAINT fk_tpi_tseccion FOREIGN KEY (seccion) REFERENCES tseccion (seccion) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Table structure for table tusuario
--

DROP TABLE IF EXISTS tusuario;

CREATE TABLE tusuario (
  nombre_usuario char(10) COLLATE utf8_spanish_ci NOT NULL,
  pregunta_1 varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  pregunta_2 varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  respuesta_1 varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  respuesta_2 varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  cedula char(10) COLLATE utf8_spanish_ci NOT NULL,
  codigo_perfil int(11) NOT NULL,
  intento_fallido int(11) NOT NULL DEFAULT '0',
  activar_caducidad int(11) NOT NULL DEFAULT '1',
  fecha_desactivacion date DEFAULT NULL,
  PRIMARY KEY (nombre_usuario),
  CONSTRAINT tusuario_ibfk_1 FOREIGN KEY (cedula) REFERENCES tpersona (cedula) ON UPDATE CASCADE,
  CONSTRAINT tusuario_ibfk_2 FOREIGN KEY (codigo_perfil) REFERENCES tperfil (codigo_perfil) ON DELETE CASCADE ON UPDATE CASCADE
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
  CONSTRAINT tcontrasena_ibfk_1 FOREIGN KEY (nombre_usuario) REFERENCES tusuario (nombre_usuario) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;