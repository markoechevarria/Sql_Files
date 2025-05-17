USE Northwind;

SELECT * FROM Products;

-- VISTA PARA UNA TABLA
CREATE VIEW verProductos AS
SELECT ProductName, UnitPrice
FROM Products;

SELECT * FROM verProductos;

-- VISTA PARA DOS TABLAS

SELECT * FROM Products;
SELECT * FROM Categories;

CREATE VIEW verProductoCategoria AS
SELECT p.ProductName, p.UnitPrice, c.CategoryName, c.Description
FROM Products AS p
INNER JOIN Categories AS c
ON p.CategoryID = c.CategoryID;

CREATE VIEW verProductoAgrupadoCategoria AS
SELECT p.ProductName AS Nombre, p.UnitPrice AS Precio, c.CategoryName AS Categoria, c.Description AS Descripcion
FROM Products AS p
INNER JOIN Categories AS c
ON p.CategoryID = c.CategoryID;

SELECT * FROM verProductoAgrupadoCategoria;

CREATE VIEW verCantidadProductosPorCategoria AS 
SELECT Categories.CategoryName, COUNT(*) AS Cantidad
FROM Products 
INNER JOIN Categories 
ON Products.CategoryID = Categories.CategoryID
GROUP BY CategoryName;

SELECT * FROM verProductoCategoria;
SELECT * FROM verCantidadProductosPorCategoria;

-- ELIMINAR VISTAS

DROP VIEW verProductos;
DROP VIEW verCantidadProductosPorCategoria;
DROP VIEW verProductoAgrupadoCategoria;
DROP VIEW verProductoCategoria;

-- MODIFICAR VISTAS

ALTER VIEW verProductos AS
SELECT ProductName, UnitPrice, Discontinued
FROM Products;

SELECT * FROM verProductos;

ALTER VIEW verProductoCategoria AS
SELECT p.ProductName, p.UnitPrice, c.CategoryName
FROM Products AS p
INNER JOIN Categories AS c
ON p.CategoryID = c.CategoryID;

SELECT * FROM verProductoCategoria;

ALTER VIEW verCantidadProductosPorCategoria AS 
SELECT CategoryName
FROM Categories

SELECT * FROM verCantidadProductosPorCategoria;

SELECT * FROM Region;
SELECT * FROM Territories;

SELECT * FROM Region;

CREATE VIEW verRegionTerritorio AS
SELECT Territories.TerritoryDescription AS Territorio, Region.RegionDescription AS Region
FROM Region 
INNER JOIN Territories
ON Region.RegionID = Territories.RegionID;

SELECT * FROM verRegionTerritorio;


CREATE VIEW Territorios AS
SELECT TerritoryDescription AS td, RegionID AS rid 
FROM Territories;
SELECT * FROM Territorios;

CREATE VIEW verRegionTerritorio2 AS
SELECT Territorios.td AS Territorio, Region.RegionDescription AS Region
FROM Territorios
INNER JOIN Region 
ON Territorios.rid = Region.RegionID;

SELECT * FROM verRegionTerritorio;
SELECT * FROM verRegionTerritorio2;


-- EJERCICIOS
-- Mostrar productos con menos de 10 unidades en inventario, nombre del producto, cantidad en stock y nombre del proveedor

CREATE VIEW Vista_Productos_Bajo_Stock AS
SELECT Products.ProductName, Products.UnitsInStock, Suppliers.ContactName
FROM Products
INNER JOIN Suppliers
ON Products.SupplierID = Suppliers.SupplierID
WHERE Products.UnitsInStock < 10;

SELECT * FROM Vista_Productos_Bajo_Stock ORDER BY UnitsInStock;

-- Mostrar la cantidad total de productos vendidos y el total de ingresos generados por categoria
-- Categories, Products, Order Details

CREATE VIEW VistaConsolidado AS
SELECT c.CategoryName, Consolidado = ((o.UnitPrice*o.Quantity) - o.Discount)
FROM [Order Details] AS o
INNER JOIN Products AS p
ON o.ProductID = p.ProductID
INNER JOIN Categories AS c
ON c.CategoryID = p.CategoryID

CREATE VIEW IngresosPorCategoria AS
SELECT CategoryName, SUM(Consolidado) AS IngresosPorCategoria FROM VistaConsolidado GROUP BY CategoryName;

CREATE VIEW CantidadVendidaTotal AS
SELECT SUM(o.Quantity) AS CantidadVendidaTotal
FROM [Order Details] AS o
INNER JOIN Products AS p
ON o.ProductID = p.ProductID
INNER JOIN Categories AS c
ON c.CategoryID = p.CategoryID;

CREATE VIEW Vista_Venta_Por_Categoria AS
SELECT IngresosPorCategoria.CategoryName, ROUND(IngresosPorCategoria.IngresosPorCategoria, 2) AS IngresosPorCategoria,CantidadVendidaTotal.CantidadVendidaTotal
FROM IngresosPorCategoria
CROSS JOIN CantidadVendidaTotal;

SELECT * FROM Vista_Venta_Por_Categoria;

-- mostrar clientes que han realizado pedidos en los ultimos 3 meses 

CREATE VIEW Vistas_Clientes_Recientes AS
SELECT c.ContactName, c.Country, CAST(o.OrderDate AS DATE) AS FechaDeOrden
FROM Customers AS c
INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
WHERE CAST(o.OrderDate AS DATE )> '1998-02-06';

SELECT * FROM Vistas_Clientes_Recientes ORDER BY FechaDeOrden;