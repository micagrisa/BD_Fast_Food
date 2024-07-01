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
FOREIGN KEY (ID_Sucursal) REFERENCES Sucursales (ID_Sucursal)

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Mensajeros
FOREIGN KEY (ID_Mensajero) REFERENCES Mensajeros (ID_Mensajero);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Tipo_De_Pagos
FOREIGN KEY (ID_Tipo_De_Pago) REFERENCES Tipo_De_Pago (ID_Tipo_De_Pago);

ALTER TABLE Ordenes 
ADD CONSTRAINT FK_Ordenes_Origen_De_Pagos
FOREIGN KEY (ID_Origen_De_Orden) REFERENCES Origenes_De_Ordenes (ID_Origen_De_Orden);

------------------------CARGA DE DATOS----------------------------------------------

-- Insertar datos en Categorias

INSERT INTO Categorias (Nombre) VALUES
('Comida Rápida'), ('Postres'), ('Bebidas'), ('Ensaladas'), ('Desayunos'),
('Cafetería'), ('Helados'), ('Comida Vegana'), ('Carnes'), ('Pizzas');

Select * from Categorias

-- Insertar datos en Productos

INSERT INTO Productos (Nombre, ID_Categoria, Precio) VALUES
('Hamburguesa Deluxe', 1, 9.99), ('Cheeseburger', 1, 7.99), ('Pizza Margarita', 10, 11.99),
('Pizza Pepperoni', 10, 12.99), ('Helado de Chocolate', 7, 2.99),
('Helado de Vainilla', 7, 2.99), ('Ensalada César', 4, 5.99),
('Ensalada Griega', 4, 6.99), ('Pastel de Zanahoria', 2, 3.99), ('Brownie', 2, 2.99);

Select * from Productos

-- Insertar datos en Sucursales

INSERT INTO Sucursales (Nombre, Direccion) VALUES
('Sucursal Central', '1234 Main St'), ('Sucursal Norte', '5678 North St'),
('Sucursal Este', '9101 East St'), ('Sucursal Oeste', '1121 West St'), ('Sucursal Sur', '3141 South St'),
('Sucursal Playa', '1516 Beach St'), ('Sucursal Montaña', '1718 Mountain St'),
('Sucursal Valle', '1920 Valley St'), ('Sucursal Lago', '2122 Lake St'), ('Sucursal Bosque', '2324 Forest St');

Select * from Sucursales

-- Insertar datos en Empleados

INSERT INTO Empleados (Nombre, Posicion, Departamento, ID_Sucursal, Rol) VALUES
('John Doe', 'Gerente', 'Administración', 1, 'Vendedor'), ('Jane Smith', 'Subgerente', 'Ventas', 1, 'Vendedor'),
('Bill Jones', 'Cajero', 'Ventas', 1, 'Vendedor'), ('Alice Johnson', 'Cocinero', 'Cocina', 1, 'Vendedor'),
('Tom Brown', 'Barista', 'Cafetería', 1, 'Vendedor'),
('Emma Davis', 'Repartidor', 'Logística', 1, 'Mensajero'),
('Lucas Miller', 'Atención al Cliente', 'Servicio', 1, 'Vendedor'),
('Olivia García', 'Encargado de Turno', 'Administración', 1, 'Vendedor'),
('Ethan Martinez', 'Mesero', 'Restaurante', 1, 'Vendedor'),
('Sophia Rodriguez', 'Auxiliar de Limpieza', 'Mantenimiento', 1, 'Vendedor');

Select * from Empleados

-- Insertar datos en Clientes

INSERT INTO Clientes (Nombre, Direccion) VALUES
('Cliente Uno', '1000 A Street'), ('Cliente Dos', '1001 B Street'), ('Cliente Tres', '1002 C Street'),
('Cliente Cuatro', '1003 D Street'), ('Cliente Cinco', '1004 E Street'),
('Cliente Seis', '1005 F Street'), ('Cliente Siete', '1006 G Street'), ('Cliente Ocho', '1007 H Street'),
('Cliente Nueve', '1008 I Street'), ('Cliente Diez', '1009 J Street');

Select * from Clientes

-- Insertar datos en OrigenesOrden

INSERT INTO Origenes_De_Ordenes (Descripcion) VALUES
('En línea'), ('Presencial'), ('Teléfono'), ('Drive Thru'), ('App Móvil'),
('Redes Sociales'), ('Correo Electrónico'), ('Publicidad'), ('Recomendación'), ('Evento');

Select * from Origenes_De_Ordenes

-- Insertar datos en TiposPago

INSERT INTO Tipo_De_Pago (Descripcion) VALUES
('Efectivo'), ('Tarjeta de Crédito'), ('Tarjeta de Débito'), ('PayPal'), ('Transferencia Bancaria'),
('Criptomonedas'), ('Cheque'), ('Vale de Comida'), ('Cupón de Descuento'), ('Pago Móvil');

Select * from Tipo_De_Pago

-- Insertar datos en Mensajeros

INSERT INTO Mensajeros (Nombre, ES_Externo) VALUES
('Mensajero Uno', 0), ('Mensajero Dos', 1), ('Mensajero Tres', 0), ('Mensajero Cuatro', 1), ('Mensajero Cinco', 0),
('Mensajero Seis', 1), ('Mensajero Siete', 0), ('Mensajero Ocho', 1), ('Mensajero Nueve', 0), ('Mensajero Diez', 1);

Select * from Mensajeros

-- Insertar datos en Ordenes

INSERT INTO Ordenes (ID_Cliente, ID_Empleado, ID_Sucursal, ID_Mensajero, ID_Tipo_De_Pago,ID_Origen_De_Orden,
Horario_Venta,Total_Compra,Kilometros_Recorren,Fecha_De_Despacho,Fecha_De_Enetrega,Fecha_Orden_Tomada,	Fecha_Orden_Lista) VALUES
(1, 1, 1, 1, 1, 1, 'Mañana', 50.00, 5.5, '2023-01-10 08:30:00', '2023-01-10 09:00:00', '2023-01-10 08:00:00', '2023-01-10 08:15:00'),
(2, 2, 2, 2, 2, 2, 'Tarde', 75.00, 10.0, '2023-02-15 14:30:00', '2023-02-15 15:00:00', '2023-02-15 13:30:00', '2023-02-15 14:00:00'),
(3, 3, 3, 3, 3, 3, 'Noche', 20.00, 2.0, '2023-03-20 19:30:00', '2023-03-20 20:00:00', '2023-03-20 19:00:00', '2023-03-20 19:15:00'),
(4, 4, 4, 4, 4, 4, 'Mañana', 30.00, 0.5, '2023-04-25 09:30:00', '2023-04-25 10:00:00', '2023-04-25 09:00:00', '2023-04-25 09:15:00'),
(5, 5, 5, 5, 5, 5, 'Tarde', 55.00, 8.0, '2023-05-30 15:30:00', '2023-05-30 16:00:00', '2023-05-30 15:00:00', '2023-05-30 15:15:00'),
(6, 6, 6, 6, 6, 1, 'Noche', 45.00, 12.5, '2023-06-05 20:30:00', '2023-06-05 21:00:00', '2023-06-05 20:00:00', '2023-06-05 20:15:00'),
(7, 7, 7, 7, 7, 2, 'Mañana', 65.00, 7.5, '2023-07-10 08:30:00', '2023-07-10 09:00:00', '2023-07-10 08:00:00', '2023-07-10 08:15:00'),
(8, 8, 8, 8, 8, 3, 'Tarde', 85.00, 9.5, '2023-08-15 14:30:00', '2023-08-15 15:00:00', '2023-08-15 14:00:00', '2023-08-15 14:15:00'),
(9, 9, 9, 9, 9, 4, 'Noche', 95.00, 3.0, '2023-09-20 19:30:00', '2023-09-20 20:00:00', '2023-09-20 19:00:00', '2023-09-20 19:15:00'),
(10, 10, 10, 10, 10, 5, 'Mañana', 100.00, 15.0, '2023-10-25 09:30:00', '2023-10-25 10:00:00', '2023-10-25 09:00:00', '2023-10-25 09:15:00');

Select * from Ordenes

-- Insertar datos en DetalleOrdenes

INSERT INTO Detalles_De_Ordenes (ID_Orden, ID_Producto, Cantidad, Precio) VALUES
(1, 1, 3, 23.44),
(1, 2, 5, 45.14),
(1, 3, 4, 46.37),
(1, 4, 4, 42.34),
(1, 5, 1, 18.25),
(1, 6, 4, 20.08),
(1, 7, 2, 13.31),
(1, 8, 2, 20.96),
(1, 9, 4, 30.13),
(1, 10, 3, 38.34);

Select * from Detalles_De_Ordenes

--UPDATE Y DELETE

--ACTUALIZACIONES DE EJEMPLO (UPDATE)

-- Aumentar el precio de todos los productos en la categoría 1

UPDATE Productos SET Precio = Precio + 1 WHERE ID_Categoria = 1;

-- Cambiar la posición de todos los empleados del departamento 'Cocina' a 'Chef'

UPDATE Empleados SET Posicion = 'Chef' WHERE Departamento = 'Cocina';

-- Actualizar la dirección de una sucursal específica

UPDATE Sucursales SET Direccion = '1234 New Address St' WHERE ID_Sucursal = 1;

--ELIMINACIONES DE EJEMPLO (DELETE)

/*1. Eliminar una orden específica
Imaginemos que quieres eliminar una orden específica, 
por ejemplo, la orden con OrdenID = 10. 
Esta operación eliminaría la orden junto con sus detalles asociados 
(deberías asegurarte de eliminar o actualizar cualquier dato relacionado 
para mantener la integridad referencial).*/

DELETE FROM Detalles_De_Ordenes WHERE ID_Orden = 10;
DELETE FROM Ordenes WHERE ID_Orden

/*2. Eliminar todos los productos de una categoría específica
Si decides dejar de ofrecer todos los "Postres" 
(supongamos que Categorias.CategoriaID = 2 para "Postres"), 
podrías querer eliminar todos los productos asociados a esa categoría.*/

DELETE FROM Productos WHERE ID_Categoria = 2; --Se decide no eliminar las categorias, ya que hay una relacion realizada con esos productos.

--Antes de ejecutar este comando, deberías considerar si hay órdenes que incluyen estos productos y decidir cómo manejar esas referencias.

/*3. Eliminar empleados de una sucursal que cerró
Si una sucursal cierra, por ejemplo, 
SucursalID = 10 (Sucursal Bosque), 
podrías necesitar eliminar a todos los empleados asociados con esa sucursal.*/

DELETE FROM Empleados WHERE ID_Sucursal = 10;






------------------------RESPUESTAS A CONSULTAS--------------------------------------------------
--¿Cuál es la cantidad total de registros únicos en la tabla de órdenes?


SELECT COUNT (ID_Orden) FROM Ordenes;

--¿Cuántos empleados existen en cada departamento?
SELECT Departamento, COUNT (ID_Empleado) AS Cantidad_Empleados
   FROM Empleados
   GROUP BY Departamento;

--¿Cuántos productos hay por código de categoría?

SELECT ID_Categoria, COUNT (ID_Producto) AS Cantidad_Productos
   FROM Productos
   GROUP BY ID_Categoria;

--¿Cuántos clientes se han importado a la tabla de clientes?

SELECT COUNT (ID_Cliente) FROM Clientes AS Total_Clientes;

/*¿Cuáles son las sucursales con un promedio de ventas por orden superior a un valor específico
, ordenadas por el promedio de kilómetros recorridos para las entregas de mayor a menor?*/

SELECT ID_Sucursal,
    AVG (Total_Compra) AS Proedio_Venta_Por_Orden,
	AVG (Kilometros_Recorren) AS Promedio_Kilometros
	FROM Ordenes
	GROUP BY ID_Sucursal;

--------------------CONSULTAS EN AVANCE NUMERO3-----------------------------------
USE Fast_Food;
--1¿Cuál es el total de ventas (TotalCompra) a nivel global?

SELECT SUM (Total_Compra) 
   FROM Ordenes;

--2¿Cuál es el precio promedio de los productos dentro de cada categoría?

SELECT ID_Categoria, SUM (Precio) AS Precio_Promedio
   FROM Productos
   GROUP BY ID_Categoria;

--3¿Cuál es el valor de la orden mínima y máxima por cada sucursal?

SELECT ID_Sucursal, MAX (Total_Compra) AS Maximo_De_Compra, MIN (Total_Compra) AS Minimo_De_Compra
  FROM Ordenes
  GROUP BY ID_Sucursal;

--4¿Cuál es el mayor número de kilómetros recorridos para una entrega?

SELECT MAX (Kilometros_Recorren) AS Maximo_Kilometros_Recorridos
  FROM Ordenes;

--5¿Cuál es la cantidad promedio de productos por orden?

SELECT  ID_Orden, AVG(Cantidad) AS Cantidad_Promedio_Productos
  FROM Detalles_De_Ordenes
  GROUP BY ID_Orden;

--6¿Cuál es el total de ventas por cada tipo de pago?

SELECT ID_Tipo_De_Pago, SUM(Total_Compra) AS Total_Ventas
FROM Ordenes
GROUP BY ID_Tipo_De_Pago;

--7¿Cuál sucursal tiene la venta promedio más alta?

SELECT TOP 1 ID_Sucursal, AVG(Total_Compra) AS Promedio_Compra
FROM Ordenes
GROUP BY ID_Sucursal
ORDER BY Promedio_Compra DESC;

/*8¿Cuáles son las sucursales que han generado ventas por orden por encima de $100,
y cómo se comparan en términos del total de ventas?*/

SELECT SUM(Total_Compra) AS ValorDeVentas, ID_Sucursal
FROM Ordenes
GROUP BY ID_Sucursal
HAVING SUM(Total_Compra) > 65 --Se le cambia el valor de superior ya que no hay ninguna orden que supere los $100
ORDER BY ValorDeVentas ASC;

--9¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?

SELECT
    CASE 
        WHEN Fecha_Orden_Tomada < '2023-07-01' THEN 'Antes del 1 de julio de 2023'
        ELSE 'Después del 1 de julio de 2023'
    END AS Periodo,
    AVG(Total_Compra) AS Promedio_Venta
FROM 
    Ordenes
GROUP BY 
    CASE 
        WHEN Fecha_Orden_Tomada < '2023-07-01' THEN 'Antes del 1 de julio de 2023'
        ELSE 'Después del 1 de julio de 2023'
    END;

/*10¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas
, cuál es el valor promedio de estas ventas, y cuál ha sido la venta máxima alcanzada?*/

SELECT
    CASE 
        WHEN DATEPART(HOUR, Fecha_Venta) >= 6 AND DATEPART(HOUR, Fecha_Venta) < 12 THEN 'Mañana'
        WHEN DATEPART(HOUR, Fecha_Venta) >= 12 AND DATEPART(HOUR, Fecha_Venta) < 18 THEN 'Tarde'
        ELSE 'Noche'
    END AS Horario,
    COUNT(*) AS Cantidad_Ventas,
    AVG(Total_Venta) AS Valor_Promedio_Ventas,
    MAX(Total_Venta) AS Venta_Maxima
FROM 
    Ventas
GROUP BY 
    CASE 
        WHEN DATEPART(HOUR, Fecha_Venta) >= 6 AND DATEPART(HOUR, Fecha_Venta) < 12 THEN 'Mañana'
        WHEN DATEPART(HOUR, Fecha_Venta) >= 12 AND DATEPART(HOUR, Fecha_Venta) < 18 THEN 'Tarde'
        ELSE 'Noche'
    END;

--------------------------------AVANCE 4---------------------------------------------------------------------------
--1¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?

SELECT P.Nombre [Producto],
       C.Nombre [Categoria]
FROM Productos P
INNER JOIN Categorias C ON P.ID_Categoria = C.ID_Caregoria;

--2¿Cómo puedo saber a qué sucursal está asignado cada empleado?

SELECT E.Nombre [Empleado],
       S.Nombre [Sucursal]
FROM Empleados	E
INNER JOIN Sucursales S ON E.ID_Sucursal = S.ID_Sucursal;

--3¿Existen productos que no tienen una categoría asignada?

 SELECT P.Nombre AS Sin_Categoria
FROM Productos P
LEFT JOIN Categorias C ON P.ID_Categoria = C.ID_Caregoria
WHERE C.ID_Caregoria IS NULL;

/*4¿Cómo puedo obtener un detalle completo de las órdenes,
incluyendo cliente, empleado que tomó la orden, y el mensajero que la entregó?*/

 SELECT 
     O.ID_Orden,
	 C.Nombre AS Cliente,
	 E.Nombre AS Empleado,
	 S.Nombre AS Sucursal,
	 M.Nombre AS Mensajero,
	 T.Descripcion AS Medio_De_Pago,
	 OD.Descripcion AS Origen_De_Orden
       FROM Ordenes O
 INNER JOIN Clientes C ON O.ID_Cliente = C.ID_Cliente
 INNER JOIN Empleados E ON O.ID_Empleado = E.ID_Empleado
 INNER JOIN Sucursales S ON O.ID_Sucursal = S.ID_Sucursal
 INNER JOIN Mensajeros M ON O.ID_Mensajero = M.ID_Mensajero
 INNER JOIN Tipo_De_Pago T ON O.ID_Tipo_De_Pago = T.ID_Tipo_De_Pago
 INNER JOIN Origenes_De_Ordenes OD ON O.ID_Origen_De_Orden = OD.ID_Origen_De_Orden;

--5¿Cuántos productos de cada tipo se han vendido en cada sucursal?

SELECT S.Nombre AS Sucursal, 
       C.Nombre AS Categoria,
	   SUM (Cantidad)AS Total_Articulos_Vendidos
	FROM Ordenes AS O
	 INNER JOIN Detalles_De_Ordenes AS D
	   ON O.ID_Orden = D.ID_Orden
	INNER JOIN Sucursales AS S
	   ON O.ID_Sucursal = S.ID_Sucursal
	INNER JOIN Productos AS P
	  ON D.ID_Producto = P.ID_Producto
	INNER JOIN Categorias C
	  ON P.ID_Categoria = C.ID_Caregoria
 GROUP BY C.Nombre, S.Nombre;


---------------Preguntas Informe-----------------------------------------------

--1¿Cuál es el tiempo promedio desde el despacho hasta la entrega de los pedidos por los mensajeros?
 SELECT AVG
        (DATEDIFF
        (MINUTE, Fecha_De_Despacho,Fecha_De_Enetrega)) 
     AS Tiempo_Promedio_Entrega
	 FROM Ordenes;
--2¿Qué canal de ventas genera más ingresos?

SELECT SUM (O.Total_Compra) AS Total_Compra, Ori.Descripcion
    FROM Ordenes AS O
	 INNER JOIN Origenes_De_Ordenes AS Ori
	  ON O.ID_Origen_De_Orden = Ori.ID_Origen_De_Orden
	GROUP BY Ori.Descripcion
	ORDER BY Total_Compra ASC;

--3¿Cuál es el volumen de ventas promedio gestionado por empleado?

SELECT E.Nombre AS Empleado, COUNT (O.ID_Orden) AS Promedio_Ventas
  FROM Ordenes AS O
  INNER JOIN Empleados AS E 
   ON O.ID_Empleado = E.ID_Empleado
 GROUP BY E.Nombre;
--4¿Cómo varía la demanda de productos a lo largo del día? 

SELECT Horario_Venta ,COUNT (ID_Orden) AS Numero_Orden
  FROM Ordenes AS Horario_De_Venta
	 GROUP BY Horario_Venta;

--5¿Cómo se comparan las ventas mensuales de este año con el año anterior?

SELECT SUM(Total_Compra) AS Ventas, FORMAT(Fecha_De_Despacho, 'yyyy-MM') AS Mes
FROM Ordenes
GROUP BY FORMAT(Fecha_De_Despacho, 'yyyy-MM');

--6¿Qué porcentaje de clientes son recurrentes versus nuevos clientes cada mes?

SELECT ID_Cliente, COUNT (ID_Orden) AS Numero_Ordenes
  FROM Ordenes
  GROUP BY ID_Cliente;