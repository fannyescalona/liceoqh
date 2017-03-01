ALTER TABLE `tconfiguracion_negocio` ADD `cantidad_materia_reprobada` INT NOT NULL AFTER `nota_aprobacion`, 
ADD `cantidad_materia_maxima` INT NOT NULL AFTER `cantidad_materia_reprobada`, 
ADD `datos_padre_obligatorio` CHAR(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N' AFTER `cantidad_materia_maxima`, 
ADD `datos_madre_obligatorio` CHAR(1) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'N' AFTER `datos_padre_obligatorio`, 
ADD `url_imagen_reporte` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL AFTER `datos_madre_obligatorio`;
ALTER TABLE `tmateria` DROP `unidad_curricular`;