CREATE DATABASE IF NOT EXISTS DISTRIBUIDORA_VALLE;
USE DISTRIBUIDORA_VALLE;

CREATE TABLE Clientes(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50) NOT NULL, 
    apellido VARCHAR(50)NOT NULL,
    telefono VARCHAR(15) NOT NULL, 
    direccion VARCHAR(150) NOT NULL, 
    identificacion VARCHAR(15) NOT NULL UNIQUE, 
    correo VARCHAR(120) NOT NULL UNIQUE
);

CREATE TABLE Categorias(
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    categoria VARCHAR(20)
);

CREATE TABLE Volumen_ml (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    volumen_ml INT NOT NULL
);

CREATE TABLE Productos (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(30) NOT NULL, 
    id_categoria INT NOT NULL, 
    id_volumen_ml INT NOT NULL, 
    precio DECIMAL (4,2) NOT NULL,
    stock_actual INT NOT NULL, 
    stock_minimo INT NOT NULL,
    
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id),
    FOREIGN KEY (id_volumen_ml) REFERENCES Volumen_ml(id)
);

CREATE TABLE Encargados (
	id INT PRIMARY KEY AUTO_INCREMENT, 
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL
);

CREATE TABLE Sedes (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    nombre VARCHAR (30) NOT NULL, 
    direccion VARCHAR (150) NOT NULL, 
    telefono INT NOT NULL, 
    capacidad_almacenamiento INT NOT NULL, 
    id_encargado INT NOT NULL,
    
    FOREIGN KEY (id_encargado) REFERENCES Encargados(id)
);

CREATE TABLE Pedidos (
	id INT PRIMARY KEY AUTO_INCREMENT, 
    codigo_pedido VARCHAR(50) NOT NULL UNIQUE,
    direccion VARCHAR(150) NOT NULL,
    fecha DATETIME,
    id_cliente INT NOT NULL, 
    id_sede INT NOT NULL, 

	FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
	FOREIGN KEY (id_sede) REFERENCES Sedes(id)
);

CREATE TABLE Detalles_pedidos(
	id_detalle INT PRIMARY KEY AUTO_INCREMENT,
	id_pedido INT NOT NULL, 
    id_producto INT NOT NULL, 
    cantidad INT NOT NULL, 
    precio_unitario DECIMAL(4,2) NOT NULL,		
    
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
    FOREIGN KEY (id_producto) REFERENCES Productos(id)
);