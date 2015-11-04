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
INSERT INTO tmodulo (descripcion,icono,orden) VALUES ('GENERAL','icon-list-alt',2);
INSERT INTO tmodulo (descripcion,icono,orden) VALUES ('EDUCACIÓN','icon-list-alt',3);
INSERT INTO tmodulo (descripcion,icono,orden) VALUES ('CONTROL DE NOTAS','icon-list-alt',4);
INSERT INTO tmodulo (descripcion,icono,orden) VALUES ('REPORTES','icon-cog',5);
INSERT INTO tmodulo (descripcion,icono,orden) VALUES ('SEGURIDAD','icon-lock',6);

-- Created Options 

INSERT INTO topcion (descripcion,icono,orden) VALUES ('INSERTAR','icon-pencil',1);
INSERT INTO topcion (descripcion,icono,orden) VALUES ('ACTUALIZAR','icon-edit',2);
INSERT INTO topcion (descripcion,icono,orden) VALUES ('DESACTIVAR','icon-eye-close',3);
INSERT INTO topcion (descripcion,icono,orden) VALUES ('ACTIVAR','icon-eye-open',4);
INSERT INTO topcion (descripcion,icono,orden) VALUES ('CONSULTAR','icon-search',5);

-- Created Services of Security Modules

INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('PAÍS','PAIS',1,1);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('ESTADO','ESTADO',1,2);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('MUNICIPIO','MUNICIPIO',1,3);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('PARROQUIA','PARROQUIA',1,4);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('ORGANIZACIÓN','ORGANIZACION',2,1);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('CARGO','CARGO',2,2);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('PERSONA','PERSONA',2,3);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('PARENTESCO','PARENTESCO',2,4);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('AÑO ACADÉMICO','ANO_ACADEMICO',3,2);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('LAPSO','LAPSO',3,3);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('MATERIA','MATERIA',3,4);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('PERÍODO','PERIODO',3,5);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('SECCIÓN','SECCION',3,6);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('ESTUDIANTES','ESTUDIANTE',3,7);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('INSCRIPCIÓN','INSCRIPCION',3,8);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('PROCESO DE  INSCRIPCIÓN','PROCESO_INSCRIPCION',3,9);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('ASIGNACIÓN DE SECCIONES','ASIGNAR_SECCION',3,10);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('ASIGNACIÓN DE NOTAS','ASIGNAR_NOTAS',4,1);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('MÓDULO','MODULO',6,1);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('SERVICIOS','SERVICIO',6,2);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('BOTONERA','BOTONES',6,3);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('PERFIL','PERFILES',6,4);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('NUEVO USUARIO','NUEVOUSUARIO',6,5);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('MÍ PERFIL','PERFIL',6,6);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('CAMBIAR CONTRASEÑA','CAMBIARCONTRASENA',6,7);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('DESBLOQUEAR USUARIO','DESBLOQUEARUSUARIO',6,8);
INSERT INTO tservicio (descripcion,url,codigo_modulo,orden) VALUES ('HISTÓRICO DE CAMBIOS','BITACORA',6,9);

-- Created Access Windows for Security Modules

INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,1);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,1);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,1);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,1);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,1);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,2);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,2);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,2);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,2);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,2);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,3);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,3);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,3);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,3);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,3);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,4);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,4);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,4);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,4);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,4);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,5);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,5);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,5);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,5);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,5);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,6);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,6);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,6);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,6);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,6);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,7);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,7);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,7);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,7);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,7);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,8);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,8);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,8);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,8);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,8);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,9);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,9);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,9);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,9);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,9);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,10);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,10);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,10);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,10);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,10);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,11);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,11);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,11);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,11);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,11);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,12);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,12);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,12);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,12);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,12);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,13);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,13);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,13);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,13);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,13);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,14);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,14);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,14);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,14);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,14);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,15);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,15);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,15);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,15);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,15);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,16);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,16);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,16);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,16);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,16);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,17);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,17);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,17);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,17);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,17);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,18);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,18);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,18);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,18);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,18);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,19);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,19);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,19);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,19);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,19);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,20);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,20);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,20);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,20);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,20);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,21);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,21);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,21);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,21);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,21);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,22);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,22);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,22);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,22);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,22);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,23);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,23);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,23);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,23);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,23);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,24);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,24);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,24);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,24);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,24);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,25);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,25);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,25);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,25);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,25);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,26);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,26);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,26);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,26);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,26);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,1,27);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,2,27);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,3,27);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,4,27);
INSERT INTO tservicio_usuario_opcion (codigo_perfil,codigo_opcion,codigo_servicio) VALUES (1,5,27);

-- Created First User Admin

INSERT INTO tusuario (nombre_usuario,cedula,codigo_perfil,intento_fallido,pregunta_1,respuesta_1,pregunta_2,respuesta_2) VALUES ('V123456789','V123456789',1,0,'P1','R1','P2','R2');

-- Created First Password 12345678

INSERT INTO tcontrasena (nombre_usuario,contrasena,estado) VALUES ('V123456789','1f82ea75c5cc526729e2d581aeb3aeccfef4407e',3);