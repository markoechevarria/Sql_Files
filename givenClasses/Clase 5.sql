USE Northwind;

SELECT * FROM Orders ORDER BY CustomerID;	-- 830 registros
SELECT * FROM Customers;					-- 91 registros

-- INNER JOIN

SELECT o.OrderId, c.ContactName
FROM Orders AS o
INNER JOIN Customers AS c
ON o.CustomerID = c.CustomerID
ORDER BY o.CustomerID;

SELECT * FROM Products;
SELECT * FROM Categories;
SELECT * FROM Suppliers;

SELECT p.ProductName, c.CategoryName, c.Description, s.CompanyName, s.Country
FROM Products AS p
INNER JOIN Categories AS c ON p.CategoryID = c.CategoryID
INNER JOIN Suppliers AS s ON p.SupplierID = s.SupplierID;

-- Left Join

SELECT * FROM Region;
SELECT * FROM Territories;

INSERT INTO Region(RegionID, RegionDescription) VALUES (5, 'Centro'), (6, 'Desconocido');

SELECT r.RegionID, t.TerritoryDescription, r.RegionDescription
FROM Region AS r
LEFT JOIN Territories AS t
ON r.RegionID = t.RegionID
ORDER BY RegionID;


-- RIGHT JOIN

SELECT r.RegionID, t.TerritoryDescription, r.RegionDescription
FROM Region AS r
RIGHT JOIN Territories AS t
ON r.RegionID = t.RegionID
ORDER BY RegionID;


-- FULL OUTER JOIN

SELECT * FROM Region;
SELECT * FROM Territories;

SELECT *
FROM Region AS r
FULL OUTER JOIN Territories AS t
ON r.RegionID = t.RegionID
ORDER BY r.RegionID;


-- Muestra el nombre de los clientes junto con el número total de pedidos que han realizado.

SELECT * FROM Customers;
SELECT * FROM Orders;

SELECT COUNT(c.CustomerID) AS 'numPedidos' ,c.ContactName
FROM Customers AS c
INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID
GROUP BY c.ContactName
ORDER BY numPedidos;

-- Encuentra los clientes que no tienen pedidos registrados.

SELECT * FROM Customers;
SELECT * FROM Orders;

SELECT c.ContactName, c.City, o.OrderDate
FROM Customers AS c
LEFT JOIN Orders AS o
ON c.CustomerID = o.CustomerID
WHERE o.OrderDate IS NULL;

-- Lista los pedidos (ID y fecha) que incluyen productos cuyo precio es mayor a $50.

SELECT * FROM Orders;
SELECT * FROM [Order Details];
SELECT * FROM Products;

SELECT o.OrderID ,o.OrderDate, o.CustomerID, p.ProductName, p.UnitPrice
FROM Orders AS o 
INNER JOIN [Order Details] AS od ON o.OrderID = od.OrderID
INNER JOIN Products AS p ON od.ProductID = p.ProductID 
WHERE p.UnitPrice > 50
ORDER BY p.UnitPrice DESC;

-- Calcula el ingreso total generado por cada cliente (considerando las cantidades y precios unitarios de los productos en sus pedidos). 

