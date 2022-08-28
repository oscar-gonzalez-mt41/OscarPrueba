-- Creacion de base de datos 
CREATE DATABASE sistema_facturacion;

USE sistema_facturacion;

-- Creacion de tablas 
CREATE TABLE cliente(
	id_cliente int identity(1,1) primary key,
	nombre varchar(40) not null,
	edad int not null,
	cedula varchar(12) not null,
	telefono varchar(13) not null,
	email varchar(40) not null, 
	direccion varchar(30) not null,

);

CREATE TABLE producto(
	id_producto int identity(1,1) primary key,
	nombre varchar(50) not null,
	precio float not null,
	descripcion varchar(500) not null
);

CREATE TABLE inventario(
	id_inventario int identity(1,1) primary key,
	id_producto int foreign key references producto(id_producto),
	cantidad int not null
);

CREATE TABLE factura(
	id_factura int identity(1,1) primary key,
	id_cliente int foreign key references cliente(id_cliente),
	fecha_compra date not null,
	total float null
);

CREATE TABLE factura_producto(
	id_factura_producto int identity(1,1) primary key,
	id_factura int foreign key references factura(id_factura),
	id_producto int foreign key references producto(id_producto),
	cantidad int not null
);

-- Insercion de datos de prueba tabla cliente
INSERT INTO cliente(nombre, cedula, edad, telefono, email, direccion)VALUES('Carlos Gomez', '1236547896', 35,  '3144586220', 'CarlosGomez@hotmail.com', 'Tv 68 # 70-20');
INSERT INTO cliente(nombre, cedula, edad, telefono, email, direccion)VALUES('Juan Morant', '5963148', 28,  '3146952010', 'JuanMorant@hotmail.com', 'CR 68 # 60');
INSERT INTO cliente(nombre, cedula, edad, telefono, email, direccion)VALUES('Camilo Gonzalez', '10023869',25,  '3143259802', 'CamiloGonzalez@hotmail.com', 'Calle 30 # 501-20');
INSERT INTO cliente(nombre, cedula, edad, telefono, email, direccion)VALUES('David Sandoval', '986325810',40,  '3138999020', 'DavidSandoval@hotmail.com', 'Tv 63 # 29 B - 20');
INSERT INTO cliente(nombre, cedula, edad, telefono, email, direccion)VALUES('Edgar Munar', '4568219',60,  '3203069345', 'EdgarMunar@hotmail.com', 'CR Caracas # 10-19');
INSERT INTO cliente(nombre, cedula, edad, telefono, email, direccion)VALUES('Martha Saavedra', '7895214',32,  '3144597742', 'MarthaSaavedra@hotmail.com', 'Calle 20 # 50-60');
INSERT INTO cliente(nombre, cedula, edad, telefono, email, direccion)VALUES('Lilia Sarmiento', '15968423',75,  '3158963257', 'LiliaSarmiento@hotmail.com', 'Tv 93 # 70 B - 20 Norte');
INSERT INTO cliente(nombre, cedula, edad, telefono, email, direccion)VALUES('Karen Abril', '10236589',24,  '3138987452', 'KarenAbril@hotmail.com', 'Calle 15 # 90-20');
INSERT INTO cliente(nombre, cedula, edad, telefono, email, direccion)VALUES('Alexander Gonzalez', '6985315',36,  '3158963252', 'AlexanderGonzalez@hotmail.com', 'CR 68 # 19-40');
INSERT INTO cliente(nombre, cedula, edad, telefono, email, direccion)VALUES('Camila Cortez', '89364710',21,  '3145557130', 'CamilaCortez@hotmail.com', 'Tv 68 # 96 A Sur');

-- Insercion de datos tabla producto 
INSERT INTO producto(nombre, precio , descripcion) VALUES('Audifonos Sony', 70000.0, 'Audifonos no inalambricos marca Sony');
INSERT INTO producto(nombre, precio , descripcion) VALUES('Estuche Iphone 13 pro', 120000.0, 'Estuche Iphone 13 pro negro');
INSERT INTO producto(nombre, precio , descripcion) VALUES('Televisor Samsung 50 Pulgadas 4K Au7000 Smart Tv',2000000.0 , 'El potente aumento de 4K asegura que obtengas una resolución de hasta 4K para el contenido que amas. También experimentarás expresiones de color más realistas gracias a su sofisticada tecnología de asignación de color.');
INSERT INTO producto(nombre, precio , descripcion) VALUES('Smart Watch Huawei', 240000.0, 'Reloj intelingente con multiples sensores');
INSERT INTO producto(nombre, precio , descripcion) VALUES('Celular Galaxy A35', 1000000.0, 'Moderno celular procesador 4nucleos y 4 GB de ram');
INSERT INTO producto(nombre, precio , descripcion) VALUES('Estabilizador Energy', 700000.0, 'Estabilazador de voltajes');
INSERT INTO producto(nombre, precio , descripcion) VALUES('Tablet Sony', 300000.0, 'Economica tablet, perfecta para niños');
INSERT INTO producto(nombre, precio , descripcion) VALUES('Tv 30 pulgadas Challinger', 100000.0, 'Tv con sistema operativo android');
INSERT INTO producto(nombre, precio , descripcion) VALUES('Xbox 360', 3000000.0, 'Moderna consola con 2 controles y 4 video juegos');
INSERT INTO producto(nombre, precio , descripcion) VALUES('Apuntador laser', 30000.0, 'Apuntador laser para niños y adultos');

-- Insercion de datos tabla inventario
INSERT INTO inventario(id_producto, cantidad) VALUES(1, 5);
INSERT INTO inventario(id_producto, cantidad) VALUES(2, 5);
INSERT INTO inventario(id_producto, cantidad) VALUES(3, 15);
INSERT INTO inventario(id_producto, cantidad) VALUES(4, 9);
INSERT INTO inventario(id_producto, cantidad) VALUES(5, 5);
INSERT INTO inventario(id_producto, cantidad) VALUES(6, 3);
INSERT INTO inventario(id_producto, cantidad) VALUES(7, 10);
INSERT INTO inventario(id_producto, cantidad) VALUES(8, 5);
INSERT INTO inventario(id_producto, cantidad) VALUES(9, 20);
INSERT INTO inventario(id_producto, cantidad) VALUES(10, 5);

-- Insercion de datos tabla factura
INSERT INTO factura(id_cliente, fecha_compra) VALUES(1,'2022-08-10');
INSERT INTO factura(id_cliente, fecha_compra) VALUES(2,'2000-02-01');
INSERT INTO factura(id_cliente, fecha_compra) VALUES(3,'2000-04-15');
INSERT INTO factura(id_cliente, fecha_compra) VALUES(4,'2000-05-20');


-- Insercio de datos tabla factura_producto
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(1, 1, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(1, 2, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(1, 3, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(1, 4, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(1, 5, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(1, 6, 1);

INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(2, 1, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(2, 2, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(2, 3, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(2, 4, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(2, 5, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(2, 6, 1);

INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(3, 1, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(3, 2, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(3, 3, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(3, 4, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(3, 5, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(3, 6, 1);

INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(4, 1, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(4, 2, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(4, 3, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(4, 4, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(4, 5, 1);
INSERT INTO factura_producto (id_factura, id_producto ,cantidad) VALUES(4, 6, 1);