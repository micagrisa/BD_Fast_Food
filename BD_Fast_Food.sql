--Se crea la base de datos

CREATE DATABASE Fast_Food_DB

--Me posiciono en la base de datos

USE Fast_Food_DB

--Se crean las tablas

CREATE TABLE Productos (
  ID_Producto INT PRIMARY KEY IDENTITY,
  Nombre VARCHAR (280) NOT NULL,
  ID_Categoria INT, --menci�n a una llave foranea 
  Precio INT);

CREATE TABLE Categorias (
   ID_Categoria INT PRIMARY KEY IDENTITY,
   Nombre VARCHAR (280) NOT NULL);

CREATE TABLE Clientes (
     ID_Clientes INT PRIMARY KEY IDENTITY,
     Nombre VARCHAR (280) NOT NULL,
     Direccion varchar (280) NOT NULL);

CREATE TABLE Detalles_De_Ordenes (
     ID_Orden INT NOT NULL,
	 ID_Producto INT NOT NULL,
	 Cantidad INT NOT NULL,
	 Precio_Unitario DECIMAL (6,2) NOT NULL);

CREATE TABLE Tipo_De_Pago (
	   ID_Tipo_De_Pago INT PRIMARY KEY IDENTITY,
	   Descripcion VARCHAR (500));

CREATE TABLE Ordenes (
        ID_Orden INT PRIMARY KEY IDENTITY NOT NULL,
		ID_Producto INT NOT NULL,
		ID_Sucursal INT NOT NULL,
		ID_Mensajero INT NOT NULL DEFAULT 0,
		ID_Cliente INT NOT NULL,
		ID_Empleado INT NOT NULL,
		ID_Origen INT NOT NULL,
		ID_Tipo_De_Pago INT NOT NULL,
		Horario_Venta DATETIME NOT NULL,
		Total_Compra DECIMAL (6,2) NOT NULL,
		Kilometros_Recorrer DECIMAL (6,2) NOT NULL DEFAULT 0,
		Fecha_Orden_Tomada DATETIME NOT NULL,
		Fecha_Orden_Lista DATETIME NOT NULL,
		Fecha_Despacho DATETIME NOT NULL,
		Fecha_Entrega DATETIME NOT NULL);

CREATE TABLE Mensajero (
        ID_Mensajero INT PRIMARY KEY IDENTITY NOT NULL,
		Nombre VARCHAR (350),
		Es_Externo BIT NOT NULL);

CREATE TABLE Sucursales (
       ID_Sucursal INT PRIMARY KEY IDENTITY NOT NULL,
	   Nombre VARCHAR (300) NOT NULL,
	   Direccion VARCHAR (300)NOT NULL);

CREATE TABLE Empleados (
       ID_Empleado INT PRIMARY KEY IDENTITY NOT NULL,
	   Nombre VARCHAR (300) NOT NULL,
	   ID_Sucursal INT NOT NULL,
	   Departamento VARCHAR (250) NOT NULL,
	   Posicion VARCHAR (250));

CREATE TABLE Origenes (
        ID_Origen INT PRIMARY KEY IDENTITY NOT NULL,
		Tipo_De_Origenes VARCHAR (100));



		---------------------------------------------RELACIONES----------------------------------------------
		USE Fast_Food_DB

ALTER TABLE Productos
ADD CONSTRAINT FK_Productos_Categorias2
FOREIGN KEY (ID_Categoria) REFERENCES Categorias (ID_Categoria);

ALTER TABLE Detalles_De_Ordenes
ADD CONSTRAINT FK_Productos_Detalles_De_Ordenes
FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Detalles_De_Ordenes
FOREIGN KEY (ID_Detalle_De_Ordenes) REFERENCES Detalles_De_Ordenes (ID_Detalle_De_Ordenes);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Clientes2
FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Clientes);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Tipo_De_Pago
FOREIGN KEY (ID_Tipo_De_Pago) REFERENCES Tipo_De_Pago (ID_Tipo_De_Pago);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Mensajeros
FOREIGN KEY (ID_Mensajero) REFERENCES Mensajero (ID_Mensajero);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Sucursales
FOREIGN KEY (ID_Sucursal) REFERENCES Sucursales (ID_Sucursal);

ALTER TABLE Empleados
ADD CONSTRAINT FK_Empleados_Sucursales
FOREIGN KEY (ID_Sucursal) REFERENCES Sucursales (ID_Sucursal);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Empleados_Ordenes
FOREIGN KEY (ID_Empleado) REFERENCES Empleados (ID_Empleado);
/* Modifico la llave primaria de Detalles_De_Ordenes
ya que se duplicaria con la llave primaria de Ordenes */

ALTER TABLE Detalles_De_Ordenes
DROP COLUMN ID_Orden;

ALTER TABLE Detalles_De_Ordenes
ADD ID_Detalle_De_Orden INT PRIMARY KEY IDENTITY NOT NULL;

ALTER TABLE Ordenes
ADD ID_Detalle_De_Orden INT ;

-- Continuo con las conecciones de llaves 

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Detalles_De_Ordenes_Ordenes
FOREIGN KEY (ID_Detalle_De_Orden) REFERENCES Detalles_De_Ordenes (ID_Detalle_De_Orden);

----------------------------------------Carga de datos------------------------------------------------------------


-- Insertar datos en Categorias

INSERT INTO Categorias (Nombre) 
VALUES ('Comida R�pida'), ('Postres'), ('Bebidas'), ('Ensaladas'), ('Desayunos'),
('Cafeter�a'), ('Helados'), ('Comida Vegana'), ('Carnes'), ('Pizzas');

-- Insertar datos en Productos

INSERT INTO Productos (Nombre, ID_Categoria, Precio) 
VALUES ('Hamburguesa Deluxe', 1, 9.99), ('Cheeseburger', 1, 7.99), ('Pizza Margarita', 10, 11.99),
('Pizza Pepperoni', 10, 12.99), ('Helado de Chocolate', 7, 2.99),
('Helado de Vainilla', 7, 2.99), ('Ensalada C�sar', 4, 5.99),
('Ensalada Griega', 4, 6.99), ('Pastel de Zanahoria', 2, 3.99), ('Brownie', 2, 2.99);

-- Insertar datos en Sucursales

INSERT INTO Sucursales (Nombre, Direccion) 
VALUES ('Sucursal Central', '1234 Main St'), ('Sucursal Norte', '5678 North St'),
('Sucursal Este', '9101 East St'), ('Sucursal Oeste', '1121 West St'), ('Sucursal Sur', '3141 South St'),
('Sucursal Playa', '1516 Beach St'), ('Sucursal Monta�a', '1718 Mountain St'),
('Sucursal Valle', '1920 Valley St'), ('Sucursal Lago', '2122 Lake St'), ('Sucursal Bosque', '2324 Forest St');

--Inserto el atributo rol en Empleados
ALTER TABLE Empleados
ADD Rol VARCHAR (300) ;

-- Insertar datos en Empleados

INSERT INTO Empleados (Nombre, Posicion, Departamento, ID_Sucursal, Rol ) 
VALUES ('John Doe', 'Gerente', 'Administraci�n', 1, 'Vendedor'),
('Jane Smith', 'Subgerente', 'Ventas', 1, 'Vendedor'),('Bill Jones', 'Cajero', 'Ventas', 1, 'Vendedor'),
('Alice Johnson', 'Cocinero', 'Cocina', 1, 'Vendedor'), ('Tom Brown', 'Barista', 'Cafeter�a', 1, 'Vendedor'),
('Emma Davis', 'Repartidor', 'Log�stica', 1, 'Mensajero'),
('Lucas Miller', 'Atenci�n al Cliente', 'Servicio', 1, 'Vendedor'),
('Olivia Garc�a', 'Encargado de Turno', 'Administraci�n', 1, 'Vendedor'),
('Ethan Martinez', 'Mesero', 'Restaurante', 1, 'Vendedor'),
('Sophia Rodriguez', 'Auxiliar de Limpieza', 'Mantenimiento', 1, 'Vendedor');

-- Insertar datos en Clientes

INSERT INTO Clientes (Nombre, Direccion) 
VALUES ('Cliente Uno', '1000 A Street'), ('Cliente Dos', '1001 B Street'), ('Cliente Tres', '1002 C Street'),
('Cliente Cuatro', '1003 D Street'), ('Cliente Cinco', '1004 E Street'),
('Cliente Seis', '1005 F Street'), ('Cliente Siete', '1006 G Street'), ('Cliente Ocho', '1007 H Street'),
('Cliente Nueve', '1008 I Street'), ('Cliente Diez', '1009 J Street');

-- Insertar datos en OrigenesOrden

INSERT INTO Origenes (Tipo_De_Origenes) VALUES
('En l�nea'), ('Presencial'), ('Tel�fono'), ('Drive Thru'), ('App M�vil'),
('Redes Sociales'), ('Correo Electr�nico'), ('Publicidad'), ('Recomendaci�n'), ('Evento');

-- Insertar datos en TiposPago

INSERT INTO Tipo_De_Pago (Descripcion) VALUES
('Efectivo'), ('Tarjeta de Cr�dito'), ('Tarjeta de D�bito'), ('PayPal'), ('Transferencia Bancaria'),
('Criptomonedas'), ('Cheque'), ('Vale de Comida'), ('Cup�n de Descuento'), ('Pago M�vil');

-- Insertar datos en Mensajeros

INSERT INTO Mensajero (Nombre, Es_Externo) VALUES
('Mensajero Uno', 0), ('Mensajero Dos', 1), ('Mensajero Tres', 0), ('Mensajero Cuatro', 1), ('Mensajero Cinco', 0),
('Mensajero Seis', 1), ('Mensajero Siete', 0), ('Mensajero Ocho', 1), ('Mensajero Nueve', 0), ('Mensajero Diez', 1);



--Modifico el tipo de dato de Horario_Venta y tambla ID_Productos
USE Fast_Food_DB

ALTER TABLE Ordenes
DROP COLUMN Horario_Venta;

ALTER TABLE Ordenes
ADD Horario_Venta VARCHAR (100)

ALTER TABLE Ordenes
DROP COLUMN ID_Producto;

ALTER TABLE Ordenes
ADD ID_Producto INT;



-- Insertar datos en Ordenes
INSERT INTO Ordenes (ID_Cliente,ID_Empleado, ID_Sucursal, ID_Mensajero,
ID_Tipo_De_Pago, ID_Origen, Horario_Venta, Total_Compra, Kilometros_Recorrer, Fecha_Despacho, Fecha_Entrega,
Fecha_Orden_Tomada, Fecha_Orden_Lista) VALUES
(1, 1, 1, 1, 1, 1, 'Ma�ana', 50.00, 5.5, '2023/01/10 08:30:00', '2023/01/10 09:00:00', '2023/01/10 08:00:00', '2023/01/10 08:15:00');

INSERT INTO Ordenes (ID_Cliente,ID_Empleado, ID_Sucursal, ID_Mensajero,
ID_Tipo_De_Pago, ID_Origen, Horario_Venta, Total_Compra, Kilometros_Recorrer, Fecha_Despacho, Fecha_Entrega,
Fecha_Orden_Tomada, Fecha_Orden_Lista) VALUES
(2, 2, 2, 2, 2, 2, 'Tarde', 75.00, 10.0, '2023/02/15 14:30:00', '2023/02/15 15:00:00', '2023/02/15 13:30:00', '2023/02/15 14:00:00'),
(3, 3, 3, 3, 3, 3, 'Noche', 20.00, 2.0, '2023/03/20 19:30:00', '2023/03/20 20:00:00', '2023/03/20 19:00:00', '2023/03/20 19:15:00'),
(4, 4, 4, 4, 4, 4, 'Ma�ana', 30.00, 0.5, '2023/04/25 09:30:00', '2023/04/25 10:00:00', '2023/04/25 09:00:00', '2023/04/25 09:15:00'),
(5, 5, 5, 5, 5, 5, 'Tarde', 55.00, 8.0, '2023/05/30 15:30:00', '2023/05/30 16:00:00', '2023/05/30 15:00:00', '2023/05/30 15:15:00'),
(6, 6, 6, 6, 6, 1, 'Noche', 45.00, 12.5, '2023/06/05 20:30:00', '2023/06/05 21:00:00', '2023/06/05 20:00:00', '2023/06/05 20:15:00'),
(7, 7, 7, 7, 7, 2, 'Ma�ana', 65.00, 7.5, '2023/07/10 08:30:00', '2023/07/10 09:00:00', '2023/07/10 08:00:00', '2023/07/10 08:15:00'),
(8, 8, 8, 8, 8, 3, 'Tarde', 85.00, 9.5, '2023/08/15 14:30:00', '2023/08/15 15:00:00', '2023/08/15 14:00:00', '2023/08/15 14:15:00'),
(9, 9, 9, 9, 9, 4, 'Noche', 95.00, 3.0, '2023/09/20 19:30:00', '2023/09/20 20:00:00', '2023/09/20 19:00:00', '2023/09/20 19:15:00'),
(10, 10, 10, 10, 10, 5, 'Ma�ana', 100.00, 15.0, '2023/10/25 09:30:00', '2023/10/25 10:00:00', '2023/10/25 09:00:00', '2023/10/25 09:15:00');



-- Insertar datos en Detalle_De_Ordenes
INSERT INTO Detalles_De_Ordenes (ID_Detalle_De_Orden,ID_Producto, Cantidad, Precio_Unitario) VALUES
(1,1, 3, 23.44),
(1,2, 5, 45.14),
(1,3, 4, 46.37),
(1,4, 4, 42.34),
(1,5, 1, 18.25),
(1,6, 4, 20.08),
(1,7, 2, 13.31),
(1,8, 2, 20.96);

--UPDATE Y DELETE

--ACTUALIZACIONES DE EJEMPLO (UPDATE)

-- Aumentar el precio de todos los productos en la categor�a 1
UPDATE Productos SET Precio = Precio + 1 WHERE ID_Categoria = 1;

-- Cambiar la posici�n de todos los empleados del departamento 'Cocina' a 'Chef'
UPDATE Empleados SET Posicion = 'Chef' WHERE Departamento = 'Cocina';

-- Actualizar la direcci�n de una sucursal espec�fica
UPDATE Sucursales SET Direccion = '1234 New Address St' WHERE ID_Sucursal = 1;

--ELIMINACIONES DE EJEMPLO (DELETE)

/*1. Eliminar una orden espec�fica
Imaginemos que quieres eliminar una orden espec�fica, 
por ejemplo, la orden con OrdenID = 10. 
Esta operaci�n eliminar�a la orden junto con sus detalles asociados 
(deber�as asegurarte de eliminar o actualizar cualquier dato relacionado 
para mantener la integridad referencial).*/

DELETE FROM Detalles_De_Ordenes WHERE ID_Detalle_De_Orden = 10;
DELETE FROM Ordenes WHERE ID_Orden = 10;

/*2. Eliminar todos los productos de una categor�a espec�fica
Si decides dejar de ofrecer todos los "Postres" 
(supongamos que Categorias.CategoriaID = 2 para "Postres"), 
podr�as querer eliminar todos los productos asociados a esa categor�a.*/

DELETE FROM Productos WHERE ID_Categoria = 2;
--Antes de ejecutar este comando, deber�as considerar si hay �rdenes que incluyen estos productos y decidir c�mo manejar esas referencias.

/*3. Eliminar empleados de una sucursal que cerr�
Si una sucursal cierra, por ejemplo, 
SucursalID = 10 (Sucursal Bosque), 
podr�as necesitar eliminar a todos los empleados asociados con esa sucursal.*/

DELETE FROM Empleados WHERE ID_Sucursal = 10;


------------------------------------------------CONSULTAS DE ACTIVIDAD 2-------------------------------------------------------
USE Fast_Food_DB
SELECT * FROM Productos
