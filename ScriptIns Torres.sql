DROP DATABASE IF EXISTS proyecto_alpha;
CREATE DATABASE proyecto_alpha;

USE proyecto_alpha; /* Selecciona el scheme creado. */

CREATE TABLE if NOT EXISTS farmacia(

id_farmacia int primary key,
stock_farmaco varchar(50) NOT NULL,
nombre_farmaco varchar(100) NOT NULL,
precio_farmaco float NOT NULL,
descripcion_farmaco varchar(50) NOT NULL

);

CREATE TABLE if NOT EXISTS receta(

id_receta int primary key,
dosis float NOT NULL,
farmaco_recetado varchar(100) NOT NULL,
validez_receta date NOT NULL,
frecuencia_uso time NOT NULL

);

CREATE TABLE if NOT EXISTS historialClinico(

id_historialClinico int primary key,
nombre_medico varchar(50) NOT NULL,
numero_medico varchar(80) NOT NULL,
observacion varchar(150) NULL,
especialidad varchar(50) NOT NULL,
fecha_citada date NOT NULL

);

CREATE TABLE if NOT EXISTS obraSocial(

id_obraSocial int primary key,
telefono_cliente varchar(100) NULL,
nombre_cliente varchar(50) NOT NULL,
apellido_cliente varchar(50) NOT NULL,
nombre_obraSocial varchar(50) NOT NULL,
email varchar(50) NULL,
numero_socio int NOT NULL

);

CREATE TABLE if NOT EXISTS cliente(

/* Creacion de Foreign keys*/
id_obra_social int NOT NULL,
idreceta int NOT NULL,
id_histclinico int NOT NULL,
id_farm int NOT NULL,

/* Resto de los datos */

id_cliente int primary key,
nombre_cliente varchar(50) NOT NULL,
apellido_cliente varchar(50) NOT NULL,
dni_cliente int NOT NULL,
telefono_cliente varchar(100) NULL,
email varchar(50) NULL,

/* Referencias a las Foreign keys */
FOREIGN KEY (id_obra_social) REFERENCES obraSocial(id_obraSocial),
FOREIGN KEY (idreceta) REFERENCES receta(id_receta),
FOREIGN KEY (id_histclinico) REFERENCES historialClinico(id_historialClinico),
FOREIGN KEY (id_farm) REFERENCES farmacia(id_farmacia)

);

show tables;

create VIEW v_cliente as SELECT nombre_cliente, apellido_cliente, dni_cliente, telefono_cliente, email from cliente;

SELECT * FROM v_cliente;

create VIEW v_farmaco as SELECT nombre_farmaco, precio_farmaco, descripcion_farmaco from farmacia;

SELECT * FROM v_farmaco;

create VIEW v_obra_cliente as SELECT cliente.id_cliente, cliente.nombre_cliente, cliente.apellido_cliente, obraSocial.id_obrasocial, obraSocial.nombre_obrasocial, obraSocial.numero_socio from cliente, obraSocial WHERE cliente.id_obra_social = obraSocial.id_obraSocial;

SELECT * FROM v_obra_cliente;

create VIEW v_historial_cliente as SELECT cliente.id_cliente, cliente.nombre_cliente, cliente.apellido_cliente, historialClinico.id_historialClinico,  historialClinico.nombre_medico, historialClinico.numero_medico, historialClinico.observacion from cliente, historialClinico WHERE cliente.id_histclinico = historialClinico.id_historialClinico;

SELECT * FROM v_historial_cliente;

create VIEW v_receta_cliente as SELECT cliente.id_cliente, cliente.nombre_cliente, cliente.apellido_cliente, receta.id_receta,  receta.farmaco_recetado,  receta.dosis from cliente, receta WHERE cliente.idreceta = receta.id_receta;

SELECT * FROM v_receta_cliente;
