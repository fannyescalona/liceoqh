ALTER TABLE tproceso_inscripcion DROP FOREIGN KEY fk_tpi_tlugartrabajo;
ALTER TABLE tproceso_inscripcion DROP INDEX fk_tpi_tlugartrabajo;
ALTER TABLE tproceso_inscripcion CHANGE `lugar_trabajo` `lugar_trabajo` VARCHAR(120) NULL DEFAULT NULL;