--Se crea la base de datos

CREATE DATABASE Fast_Food;

--Me posiciono en la base de datos

USE Fast_Food

-- Creación de las tablas

CREATE TABLE Productos (
   ID_Producto INT PRIMARY KEY IDENTITY,
   Nombre VARCHAR (300) NOT NULL,
   ID_Categoria INT,
   Precio DECIMAL (10,2) NOT NULL);

CREATE TABLE Categorias (
   ID_Caregoria INT PRIMARY KEY IDENTITY,
   Nombre VARCHAR (300));

CREATE TABLE Sucursales(
    ID_Sucursal INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR (300) NOT NULL,
	Direccion VARCHAR (300));

CREATE TABLE Empleados (
    ID_Empleado INT PRIMARY KEY IDENTITY,
	Nombre VARCHAR (300) NOT NULL,
	Posicion VARCHAR (300),
	Departamento VARCHAR (300),
	ID_Sucursal INT,
	Rol VARCHAR (300));

CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY IDENTITY, 
	Nombre VARCHAR (300) NOT NULL,
	Direccion VARCHAR (300));

CREATE TABLE Origenes_De_Ordenes (
    ID_Origen_De_Orden INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR (300));

CREATE TABLE Tipo_De_Pago (
    ID_Tipo_De_Pago INT PRIMARY KEY IDENTITY,
	Descripcion VARCHAR (300));

--Modifico las ultimas dos tablas agregando not null

ALTER TABLE Origenes_De_Ordenes
ALTER COLUMN Descripcion VARCHAR (300) NOT NULL;

ALTER TABLE Tipo_De_Pago
ALTER COLUMN Descripcion VARCHAR (300) NOT NULL;

--Continuo creando tablas

CREATE TABLE Mensajeros (
     ID_Mensajero INT PRIMARY KEY IDENTITY,
	 Nombre VARCHAR (300),
	 ES_Externo BIT NOT NULL);

CREATE TABLE Ordenes (
      ID_Orden INT PRIMARY KEY IDENTITY,
	  ID_Cliente INT,
	  ID_Empleado INT,
	  ID_Sucursal INT,
	  ID_Mensajero INT,
	  ID_Tipo_De_Pago INT,
	  ID_Origen_De_Orden INT,
	  Horario_Venta VARCHAR (300),
	  Total_Compra DECIMAL (10,2),
	  Kilometros_Recorren DECIMAL (10,2),
	  Fecha_De_Despacho DATETIME,
	  Fecha_De_Enetrega DATETIME,
	  Fecha_Orden_Tomada DATETIME,
	  Fecha_Orden_Lista DATETIME);

CREATE TABLE Detalles_De_Ordenes (
      ID_Orden INT,
	  ID_Producto INT,
	  Cantidad INT,
	  Precio DECIMAL (10,2),
	  PRIMARY KEY (ID_Orden,ID_Producto));


----------------------------------------GENERAR RELACIONES--------------------------------------------------------

ALTER TABLE Productos
ADD CONSTRAINT FK_Productos_Categorias2
FOREIGN KEY (ID_Categoria) REFERENCES Categorias (ID_Caregoria);

ALTER TABLE Detalles_De_Ordenes
ADD CONSTRAINT FK_Productos_Detalles_De_Ordenes
FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto);


ALTER TABLE Detalles_De_Ordenes
ADD CONSTRAINT FK_Detalles_Ordenes2
FOREIGN KEY (ID_Orden) REFERENCES Ordenes (ID_Orden);

ALTER TABLE Empleados
ADD CONSTRAINT FK_Empleados_Sucursales
FOREIGN KEY (ID_Sucursal) REFERENCES Sucursales (ID_Sucursal);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Orden_Cliente
FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Cliente);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Orden_Empleado
FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordene_Sucursal
FOREIGN KEY (ID_Sucursal) REFERENCES Sucursales (ID_Sucursal);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Mensajeros
FOREIGN KEY (ID_Mensajero) REFERENCES Mensajeros (ID_Mensajero);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Tipo_De_Pagos
FOREIGN KEY (ID_Tipo_De_Pago) REFERENCES Tipo_De_Pago (ID_Tipo_De_Pago);

ALTER TABLE Ordenes 
ADD CONSTRAINT FK_Ordenes_Origen_De_Pagos
FOREIGN KEY (ID_Origen_De_Orden) REFERENCES Origenes_De_Ordenes (ID_Origen_De_Orden);
