CREATE DATABASE tiendaRopa CHARACTER SET utf8 COLLATE  utf8_unicode_ci;

USE tiendaRopa;


CREATE TABLE producto (
	idProducto	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombreProducto	VARCHAR(255),
	precio		INT,
	imgProducto	VARCHAR(255),	
	descripcion	VARCHAR(255),
	idSubcategoria	INT NOT NULL,
	idEstado	INT NOT NULL,
);


CREATE TABLE categoria (
    idCategoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombreCategoria VARCHAR(255),
    idEstado INT NOT NULL
);


CREATE TABLE subcategoria(
	idSubcategoria		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombreSubcategoria	VARCHAR(255),
	idCategoria		INT NOT NULL,
);



CREATE TABLE usuario (
    idUsuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR (255),
    apellido VARCHAR (255),
    correo   VARCHAR (255),
    contrasena VARCHAR (255),
    idEstado INT NOT NULL,
    idRol INT NOT NULL
);


CREATE TABLE rol (
	idRol	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombreRol		VARCHAR (255),
	idEstado	    INT NOT NULL,

);

CREATE TABLE estado (

    idEstado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombreEstado	VARCHAR(255),

);


INSERT INTO producto (nombreProducto, precio, imgProducto, descripcion, idSubcategoria, idEstado) VALUES ('Zapatillas deportivas', 300000, 'https://shorturl.me/FRFOJpq', 'Para hombre', 1, 1);

INSERT INTO categoria (nombrecategoria, idEstado) VALUES ('NIKE', 1);

INSERT INTO subCategoria (nombreSubcategoria, idCategoria) VALUES ('AIR MAX 90 FDNY', 1);

INSERT INTO usuario (nombre, apellido, correo, contrasena, idEstado, idRol) VALUES ('Richard', 'rincon', 'richo@gmail.com', 'ABCD1234', 1, 1);

INSERT INTO rol (nombreRol, idEstado) VALUES  ('Vendedor',1), ('Administrador',1);

INSERT INTO estado (nombreEstado) VALUES ('activo/En stock'), ('inactivo/En stock');



ALTER TABLE subcategoria ADD CONSTRAINT fk_categoria FOREIGN KEY (idCategoria) REFERENCES categoria (idCategoria) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE usuario ADD CONSTRAINT fk_rol FOREIGN KEY (idRol) REFERENCES rol (idRol)  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE usuario ADD CONSTRAINT fk_estadouser FOREIGN KEY (idEstado) REFERENCES estado (idEstado)  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE rol ADD CONSTRAINT fk_estadorol FOREIGN KEY (idEstado) REFERENCES estado (idEstado) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE producto ADD CONSTRAINT fk_subcategoria FOREIGN KEY (idSubcategoria) REFERENCES subcategoria(idSubcategoria) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE producto ADD CONSTRAINT fk_estadoprod FOREIGN KEY (idEstado) REFERENCES estado (idEstado) ON DELETE CASCADE ON UPDATE CASCADE;


