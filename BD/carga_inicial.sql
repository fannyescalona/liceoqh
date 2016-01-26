-- Created First Country

INSERT INTO tpais (descripcion) VALUES ('VENEZUELA');

-- Created First State

INSERT INTO testado (descripcion,codigo_pais) VALUES ('PORTUGUESA',1);

-- Created First Municipality

INSERT INTO tmunicipio (descripcion,codigo_estado) VALUES ('PÁEZ',1);

-- Created First Parish

INSERT INTO tparroquia (descripcion,codigo_municipio) VALUES ('ACARIGUA',1);

-- Created First Charge

INSERT INTO tcargo (descripcion) VALUES ('OPERADOR DE SISTEMA');

-- Created First Person 

INSERT INTO tpersona (cedula,nombres,apellidos,genero,fecha_nacimiento,lugar_nacimiento,direccion,espersonalinstitucion,codigo_cargo) VALUES ('V123456789','MATIAS','HERNANDEZ','M','01/01/1985',1,'BARRIO SAN VICENTE SECTOR 3 CASA 12-45','Y',1);

-- Created First Perfil

INSERT INTO tperfil (descripcion) VALUES ('ADMINISTRADOR');

-- Created Modules 
 
INSERT INTO tmodulo (descripcion,icono,orden) VALUES ('LOCALIDADES','icon-list',1);
INSERT INTO tmodulo (descripcion,icono,orden) VALUES ('GENERAL','icon-list',2);
INSERT INTO tmodulo (descripcion,icono,orden) VALUES ('EDUCACIÓN','icon-list-alt',3);
INSERT INTO tmodulo (descripcion,icono,orden) VALUES ('CONTROL DE NOTAS','icon-cog',4);
INSERT INTO tmodulo (descripcion,icono,orden) VALUES ('INSCRIPCIONES','icon-cog',5);
INSERT INTO tmodulo (descripcion,icono,orden) VALUES ('REPORTES','icon-cog',6);
INSERT INTO tmodulo (descripcion,icono,orden) VALUES ('SEGURIDAD','icon-lock',7);

-- Created Options 

INSERT INTO topcion (descripcion,icono,orden) VALUES ('INSERTAR','icon-pencil',1);
INSERT INTO topcion (descripcion,icono,orden) VALUES ('ACTUALIZAR','icon-edit',2);
INSERT INTO topcion (descripcion,icono,orden) VALUES ('DESACTIVAR','icon-eye-close',3);
INSERT INTO topcion (descripcion,icono,orden) VALUES ('ACTIVAR','icon-eye-open',4);
INSERT INTO topcion (descripcion,icono,orden) VALUES ('CONSULTAR','icon-search',5);
INSERT INTO topcion (descripcion,icono,orden) VALUES ('CANCELAR','icon-remove',6);
INSERT INTO topcion (descripcion,icono,orden) VALUES ('LISTAR','icon-print',7);

-- Created Services of Security Modules

INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('PAÍS','PAIS',1,1);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('ESTADO','ESTADO',1,2);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('MUNICIPIO','MUNICIPIO',1,3);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('PARROQUIA','PARROQUIA',1,4);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('PLANTEL','PLANTEL',2,1);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('CARGO','CARGO',2,2);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('PERSONA','PERSONA',2,3);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('PARENTESCO','PARENTESCO',2,4);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('AÑO ACADÉMICO','ANO_ACADEMICO',3,2);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('LAPSO','LAPSO',3,3);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('MATERIA','MATERIA',3,4);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('SECCIÓN','SECCION',3,6);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('ESTUDIANTES','ESTUDIANTE',3,7);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('CERRAR AÑO ACADÉMICO','CERRAR_ANOACADEMICO',3,7);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('INSCRIPCIÓN','INSCRIPCION',3,8);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('ASIGNACIÓN DE NOTAS','ASIGNAR_NOTAS',4,1);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('PROCESO DE INSCRIPCIÓN','PROCESO_INSCRIPCION',7,1);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('ASIGNACIÓN DE SECCIONES','ASIGNAR_SECCION',7,10);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('FICHA DE INSCRIPCIÓN','REP_FICHAINSCRIPCION',5,1);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('CONSTANCIA DE ESTUDIO','REP_CONSTANCIAESTUDIO',5,2);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('HISTORIAL DEL PERSONAL ADMINISTRATIVO','REP_HISTORIALPERSONAL',5,3);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('ESTUDIANTES POR GRADO ESCOLAR','REP_ESTUDIANTESPORGRADO',5,4);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('ESTUDIANTES POR SECCIÓN','REP_ESTUDIANTESPORSECCION',5,5);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('ESTUDIANTES NUEVO INGRESO','REP_ESTUDIANTESNUEVOINGRESO',5,6);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('LISTADO DE DOCENTES','REP_DOCENTES',5,7);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('LISTADO DE DOCENTES POR MATERIA','REP_DOCENTESPORMATERIA',5,8);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('NOTAS CERTIFICADAS','REP_NOTASCERTIFICADAS',5,9);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('MÓDULO','MODULO',6,1);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('SERVICIOS','SERVICIO',6,2);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('BOTONERA','BOTONES',6,3);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('PERFIL','PERFILES',6,4);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('NUEVO USUARIO','NUEVOUSUARIO',6,5);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('MÍ PERFIL','PERFIL',6,6);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('CAMBIAR CONTRASEÑA','CAMBIARCONTRASENA',6,7);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('HISTÓRICO DE CAMBIOS','BITACORA',6,9);

-- Created Access Windows for Security Modules

INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,1);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,1);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,1);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,1);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,1);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,1);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,1);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,2);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,2);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,2);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,2);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,2);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,2);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,2);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,3);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,3);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,3);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,3);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,3);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,3);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,3);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,4);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,4);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,4);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,4);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,4);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,4);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,4);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,5);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,5);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,5);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,5);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,5);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,5);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,5);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,6);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,6);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,6);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,6);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,6);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,6);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,6);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,7);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,7);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,7);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,7);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,7);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,7);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,7);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,8);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,8);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,8);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,8);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,8);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,8);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,8);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,9);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,9);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,9);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,9);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,9);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,9);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,9);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,10);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,10);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,10);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,10);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,10);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,10);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,10);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,11);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,11);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,11);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,11);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,11);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,11);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,11);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,12);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,12);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,12);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,12);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,12);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,12);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,12);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,13);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,13);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,13);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,13);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,13);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,13);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,13);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,14);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,14);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,14);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,14);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,14);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,14);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,14);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,15);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,15);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,15);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,15);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,15);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,15);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,15);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,16);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,16);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,16);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,16);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,16);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,16);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,16);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,17);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,17);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,17);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,17);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,17);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,17);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,17);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,18);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,18);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,18);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,18);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,18);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,18);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,18);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,19);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,19);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,19);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,19);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,19);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,19);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,19);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,20);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,20);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,20);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,20);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,20);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,20);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,20);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,21);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,21);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,21);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,21);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,21);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,21);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,21);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,22);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,22);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,22);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,22);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,22);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,22);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,22);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,23);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,23);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,23);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,23);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,23);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,23);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,23);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,24);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,24);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,24);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,24);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,24);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,24);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,24);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,25);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,25);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,25);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,25);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,25);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,25);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,25);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,26);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,26);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,26);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,26);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,26);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,26);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,26);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,27);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,27);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,27);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,27);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,27);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,27);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,27);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,28);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,28);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,28);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,28);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,28);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,28);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,28);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,29);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,29);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,29);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,29);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,29);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,29);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,29);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,30);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,30);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,30);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,30);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,30);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,30);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,30);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,31);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,31);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,31);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,31);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,31);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,31);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,31);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,32);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,32);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,32);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,32);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,32);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,32);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,32);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,33);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,33);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,33);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,33);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,33);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,33);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,33);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,34);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,34);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,34);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,34);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,34);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,34);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,34);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,35);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,35);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,35);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,35);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,35);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,6,35);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,7,35);

-- Created First User Admin

INSERT INTO tusuario (nombre_usuario,cedula,codigo_perfil,intento_fallido,pregunta_1,respuesta_1,pregunta_2,respuesta_2) VALUES ('V123456789','V123456789',1,0,'P1','R1','P2','R2');

-- Created First Password 12345678

INSERT INTO tcontrasena (nombre_usuario,contrasena,estado) VALUES ('V123456789','1f82ea75c5cc526729e2d581aeb3aeccfef4407e',3);