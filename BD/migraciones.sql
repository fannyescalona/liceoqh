DROP TABLE IF EXISTS tauditoria_proceso;

CREATE TABLE tauditoria_proceso (
  id int(11) NOT NULL AUTO_INCREMENT,
  nombre_usuario char(15) COLLATE utf8_spanish_ci NOT NULL,
  fecha timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  proceso varchar(255) NOT NULL,
  parametro_valor text NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;