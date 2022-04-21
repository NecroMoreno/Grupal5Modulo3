-- Parte 2: Crear dos tablas. 
-- La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido, contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto). 

CREATE TABLE usuarios(
idUsuario MEDIUMINT NOT NULL AUTO_INCREMENT, 
nombre VARCHAR(30), 
apellido VARCHAR(30), 
contraseña CHAR(32),  
zonaHoraria CHAR(5) DEFAULT "UTC-3", 
genero BINARY, 
telefono char(9),
PRIMARY KEY(idUsuario));

-- La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la fecha-hora actual)). 

CREATE TABLE fechashoras(
idIngreso MEDIUMINT NOT NULL AUTO_INCREMENT, 
idUsuario MEDIUMINT NOT NULL, 
fechaHora DATETIME,
PRIMARY KEY(idIngreso),
FOREIGN KEY (idUsuario) REFERENCES usuarios(IdUsuario));

-- Parte 3: Modificación de la tabla 
-- Modifique el UTC por defecto.Desde UTC-3 a UTC-2. 

ALTER TABLE usuarios MODIFY zonaHoraria CHAR(5) DEFAULT "UTC-2";

-- Parte 4: Creación de registros. - 
-- Para cada tabla crea 8 registros. 

INSERT INTO usuarios(
nombre,
apellido, 
contraseña,
genero,
telefono) VALUES 
( 'Jorge', 'Gonzalez', '12345','1', '095550213');

INSERT INTO usuarios (
nombre, 
apellido, 
contraseña,  
zonaHoraria, 
genero, 
telefono) VALUES 
('Maria','Gonzalez','23456','UTC-1',0,'095550243'),
('Francisco','Gonzalez','34567','UTC-2',1,'095550243'),
('Pedro','Vidal','45678','UTC-3',1,'095551243'),
('Juan','Moreno','56789','UTC-4',1,'095552244'),
('Ana','Vallejo','67890','UTC-5',0,'095553245'),
('Francisca','Espinozas','78901','UTC-6',0,'095554246'),
('Claudia','Gutierres','89012','UTC-7',0,'095555247');

-- la idea de insertar asi espaceado en tiempo es para que queden en diferente horas( 30s ).

INSERT INTO fechashoras ( 
idUsuario, 
fechaHora) VALUES 
(8,now());
SELECT SLEEP(25);
INSERT INTO fechashoras ( 
idUsuario, 
fechaHora) VALUES 
(7,now());
SELECT SLEEP(25);
INSERT INTO fechashoras ( 
idUsuario, 
fechaHora) VALUES 
(6,now());
SELECT SLEEP(25);
INSERT INTO fechashoras ( 
idUsuario, 
fechaHora) VALUES 
(5,now());
SELECT SLEEP(25);
INSERT INTO fechashoras ( 
idUsuario, 
fechaHora) VALUES 
(8,now());
SELECT SLEEP(25);
INSERT INTO fechashoras ( 
idUsuario, 
fechaHora) VALUES 
(7,now());
SELECT SLEEP(25);
INSERT INTO fechashoras ( 
idUsuario, 
fechaHora) VALUES 
(6,now());
SELECT SLEEP(25);
INSERT INTO fechashoras ( 
idUsuario, 
fechaHora) VALUES 
(5,now());

-- Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso? 
/*
En la Tabla fechashoras y los campos:
-	idIngreso MEDIUMINT NOT NULL AUTO_INCREMENT se le da una id de medium int porque cubre toda la población de chile not null porque es clave primaria y auto increment para que se incremente sola 
aunque debido a los ingresos posiblemente sería mejor haberle puesto más capacidad  
-	idUsuario MEDIUMINT NOT NULL lo mismo que arriba, 
-	fechaHora DATETIME debido a que es fecha y hora,
-	PRIMARY KEY(idIngreso) se deja como clave primaria idIngreso,
-	 FOREIGN KEY (idUsuario) REFERENCES usuarios(IdUsuario) se referencia y se le asigna a idUsuario como clave foranea creando un enlace de uno a muchos, un usuario puede tener muchos log in, 
por lo que convierte esta tabla en la débil.

En la Tabla usuarios y los campos:
- idUsuario MEDIUMINT NOT NULL AUTO_INCREMENT se le da una id de medium int porque cubre toda la población de chile not null porque es clave primaria y auto increment para que se incremente sola, 
- nombre VARCHAR(30) varchar porque los nombres son variados y si se puede ahorrar memoria mejor, 
- apellido VARCHAR(30) varchar porque los nombres son variados y si se puede ahorrar memoria mejor, 
- contraseña CHAR(32) la contraseña le coloqué 32 caracter que son lo que genera un md5 ya que las claves se deberían guardar siempre encriptada,  
- zonaHoraria CHAR(5) DEFAULT "UTC-3" se le coloca el default tal como dice ka tarea y se hace de 5 porque las horas van de +12 a -12 sino estoy mal, 
- genero BINARY h y m, 
- telefono char(9) son 9 dígitos en chile sin el +56,
- PRIMARY KEY(idUsuario)) se asigna clave primaria a id de usuario;
*/
-- Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de teléfono, correo electrónico).

CREATE TABLE contactos(
idContacto MEDIUMINT NOT NULL AUTO_INCREMENT,
idUsuario MEDIUMINT NOT NULL, 
numeroTelefono VARCHAR(9), 
email VARCHAR(40),
PRIMARY KEY(idContacto));

-- Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos. 

ALTER TABLE contactos ADD FOREIGN KEY (idUsuario) REFERENCES usuarios(IdUsuario);

-- El ejercicio debe ser subido a github y al Nodo Virtual.Consideraciones generales 
-- El entregable es un script de SQL. 
-- El tiempo máximo para resolver la evaluación es el periodo correspondiente a una clase regular. 
