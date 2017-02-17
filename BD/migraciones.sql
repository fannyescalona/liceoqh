ALTER TABLE tconfiguracion_negocio ADD COLUMN hora_minima_docente int(11) NOT NULL DEFAULT 0;
ALTER TABLE tconfiguracion_negocio ADD COLUMN hora_maxima_docente int(11) NOT NULL DEFAULT 0;
ALTER TABLE tconfiguracion_negocio ADD COLUMN hora_minima_materia int(11) NOT NULL DEFAULT 0;
ALTER TABLE tconfiguracion_negocio ADD COLUMN hora_maxima_materia int(11) NOT NULL DEFAULT 0;