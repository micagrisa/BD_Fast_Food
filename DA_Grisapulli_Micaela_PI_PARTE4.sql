--1�C�mo puedo obtener una lista de todos los productos junto con sus categor�as?

SELECT P.Nombre [Producto],
       C.Nombre [Categoria]
FROM Productos P
INNER JOIN Categorias C ON P.ID_Categoria = C.ID_Caregoria;

--2�C�mo puedo saber a qu� sucursal est� asignado cada empleado?

SELECT E.Nombre [Empleado],
       S.Nombre [Sucursal]
FROM Empleados	E
INNER JOIN Sucursales S ON E.ID_Sucursal = S.ID_Sucursal;

--3�Existen productos que no tienen una categor�a asignada?

 SELECT P.Nombre AS Sin_Categoria
FROM Productos P
LEFT JOIN Categorias C ON P.ID_Categoria = C.ID_Caregoria
WHERE C.ID_Caregoria IS NULL;

/*4�C�mo puedo obtener un detalle completo de las �rdenes,
incluyendo cliente, empleado que tom� la orden, y el mensajero que la entreg�?*/

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

--5�Cu�ntos productos de cada tipo se han vendido en cada sucursal?

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


