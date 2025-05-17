-- CREAR NUESTRO PRIMER PROCEDIMIENTO ALMACENADO 

CREATE PROCEDURE mostrarIdCompany
AS 
BEGIN
	SELECT CustomerID, CompanyName FROM Customers;
END;

EXEC mostrarIdCompany;

SELECT * FROM Orders;



-- CREAR NUESTRO PRIMER PROCEDIMIENTO ALMACENADO CON PARAMETRO

CREATE PROCEDURE buscarOrdersDeEmployeeID @id_employee INT
AS
BEGIN 
	SELECT EmployeeID, OrderID, ShipName, OrderDate FROM Orders WHERE EmployeeID = @id_employee ;
END

EXEC buscarOrdersDeEmployeeID 1;


-- CREAR NUESTRO PRIMER PROCEDIMIENTO ALMACENADO CON VALOR POR DEFECTO

CREATE PROCEDURE BuscarTerritorioPorRegion @nombre_region VARCHAR(15) = 'Desconocido'
AS
BEGIN
	SELECT r.RegionDescription, t.TerritoryDescription
	FROM Region AS r
	INNER JOIN Territories AS t
	ON r.RegionID = t.RegionID
	WHERE r.RegionDescription = @nombre_region;
END

EXEC BuscarTerritorioPorRegion;



-- CREAR NUESTRO PRIMER PROCEDIMIENTO ALMACENADO CON VARIOS PARAMETROS Y VALORES POR DEFECTO

SELECT * FROM Products ORDER BY UnitsInStock;

CREATE PROCEDURE buscarProductoPorUnitYDiscontinued 
						@discont INT,
						@units INT = 126
AS
BEGIN
	SELECT * FROM Products WHERE UnitsInStock < @units AND Discontinued= @discont;
END;

EXEC buscarProductoPorUnitYDiscontinued 0, 30;

-- CREAR NUESTRO  PRIMER PROCEDIMIENTO ALMACENADO CON PARAMETRO DE SALIDA

CREATE PROCEDURE contarProductoPorUnitYDiscontinued
						@discont INT,
						@units INT = 126,
						@cantidadProductos INT OUTPUT
AS
BEGIN
	SET @cantidadProductos = ( SELECT COUNT(*) FROM Products WHERE UnitsInStock < @units AND Discontinued= @discont );
	SELECT @cantidadProductos AS cantidadProductos;
END;

DECLARE @cantidad INT;
EXEC contarProductoPorUnitYDiscontinued @discont = 0, @units = 30, @cantidadProductos = @cantidad OUTPUT;


-- CREAR NUESTRO PRIMER PROCEDIMIENTO ALAMCENADO CON IF Y ELSE

SELECT * FROM Products;

CREATE PROCEDURE buscarDiscontinuados
				@valor VARCHAR(15) = ' '
AS
BEGIN
	IF @valor = 'verdadero'
		BEGIN
			SELECT * FROM Products WHERE Discontinued = 0;
		END
	ELSE 
		BEGIN
			SELECT * FROM Products WHERE Discontinued = 1;
		END
END;

EXEC buscarDiscontinuados 'verdadero';
EXEC buscarDiscontinuados ' ';



-- CREAMOS NUESTRO PRIMER TRY CATCH

SELECT * FROM Products;

CREATE PROCEDURE consultarTabla 
AS
BEGIN
	BEGIN TRY
		DECLARE @numero INT = 10 / 0;
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER(), ERROR_MESSAGE();
	END CATCH;
END

EXEC consultarTabla;