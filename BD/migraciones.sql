ALTER TABLE `tconfiguracion_negocio` ADD `cantidad_materia_reprobada` INT NOT NULL AFTER `nota_aprobacion`, 
ADD `cantidad_materia_maxima` INT NOT NULL AFTER `cantidad_materia_reprobada`, 
ADD `datos_padre_obligatorio` CHAR(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N' AFTER `cantidad_materia_maxima`, 
ADD `datos_madre_obligatorio` CHAR(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N' AFTER `datos_padre_obligatorio`, 
ADD `url_imagen_reporte` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL AFTER `datos_madre_obligatorio`;
ALTER TABLE `tmateria` DROP `unidad_curricular`;
-- Agregado el día 04/03/2017
DROP TABLE IF EXISTS tmateria_docente;
CREATE TABLE tmateria_docente (
  codigo_materia_docente int(11) NOT NULL AUTO_INCREMENT,
  cedula_docente char(10) COLLATE utf8_spanish_ci NOT NULL,
  codigo_materia char(7) COLLATE utf8_spanish_ci NOT NULL,
  grado_escolar char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY(codigo_materia_docente),
  CONSTRAINT fk_tmateria_docente_tmateria FOREIGN KEY (codigo_materia) REFERENCES tmateria (codigo_materia) ON UPDATE CASCADE,
  CONSTRAINT fk_tmateria_docente_tpersona FOREIGN KEY (cedula_docente) REFERENCES tpersona (cedula) ON UPDATE CASCADE 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
DROP TABLE IF EXISTS tmateria_pendiente;
CREATE TABLE tmateria_pendiente (
  codigo_materia_pendiente int(11) NOT NULL AUTO_INCREMENT,
  codigo_materia char(7) NOT NULL,
  cedula_estudiante char(10) NOT NULL,
  PRIMARY KEY(codigo_materia_pendiente),
  CONSTRAINT uk_me UNIQUE(codigo_materia,cedula_estudiante),
  CONSTRAINT fk_tmateria_pendiente_tmateria FOREIGN KEY(codigo_materia) REFERENCES tmateria (codigo_materia) ON UPDATE CASCADE,
  CONSTRAINT fk_tmateria_pendiente_tpersona FOREIGN KEY(cedula_estudiante) REFERENCES tpersona (cedula) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
ALTER TABLE `tmateria_pendiente` ADD `aprobada` CHAR(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N' AFTER `cedula_estudiante`;