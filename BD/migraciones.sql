ALTER TABLE tusuario ADD COLUMN sesion VARCHAR(255) DEFAULT NULL AFTER activar_caducidad;
ALTER TABLE tmateria_seccion_docente ADD UNIQUE( codigo_materia, seccion, cedula_docente);
INSERT INTO tservicio (descripcion,url,orden,codigo_modulo) VALUES ('PLANIFIACIÓN DE NOTAS','REP_PLANIFICACIONNOTAS',12,5);