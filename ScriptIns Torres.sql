DROP DATABASE IF EXISTS proyecto_alpha;
CREATE DATABASE proyecto_alpha;

USE proyecto_alpha; /* Selecciona el scheme creado. */

CREATE TABLE if NOT EXISTS farmacia(

id_farmacia int primary key,
stock_farmaco varchar(50) NOT NULL,
nombre_farmaco varchar(50) NOT NULL,
precio_farmaco float NOT NULL,
descripcion_farmaco varchar(50) NOT NULL

);

CREATE TABLE if NOT EXISTS receta(

id_receta int primary key,
dosis float NOT NULL,
farmaco_recetado varchar(50) NOT NULL,
validez_receta date NOT NULL,
frecuencia_uso time NOT NULL

);

CREATE TABLE if NOT EXISTS historialClinico(

id_historialClinico int primary key,
nombre_medico varchar(50) NOT NULL,
numero_medico int NOT NULL,
observacion varchar(50) NULL,
especialidad varchar(50) NOT NULL,
fecha_citada date NOT NULL

);

CREATE TABLE if NOT EXISTS obraSocial(

id_obraSocial int primary key,
telefono_cliente int NULL,
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
telefono_cliente int NULL,
email varchar(50) NULL,

/* Referencias a las Foreign keys */
FOREIGN KEY (id_obra_social) REFERENCES obraSocial(id_obraSocial),
FOREIGN KEY (idreceta) REFERENCES receta(id_receta),
FOREIGN KEY (id_histclinico) REFERENCES historialClinico(id_historialClinico),
FOREIGN KEY (id_farm) REFERENCES farmacia(id_farmacia)

);