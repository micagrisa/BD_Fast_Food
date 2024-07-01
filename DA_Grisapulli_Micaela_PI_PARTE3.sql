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
