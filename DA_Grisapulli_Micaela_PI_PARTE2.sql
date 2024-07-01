
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

