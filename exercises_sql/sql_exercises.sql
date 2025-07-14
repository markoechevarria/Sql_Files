-- PARTE 1

CREATE DATABASE BD_Venta
USE BD_Venta

CREATE TABLE Categoria
(
	idCategoria		INT	IDENTITY(1,1)	NOT NULL
	,descripcion	VARCHAR(100)		NOT NULL
	,estado			CHAR(1)	DEFAULT	'A'	NOT NULL
)
ALTER TABLE Categoria ADD PRIMARY KEY(idCategoria)

CREATE TABLE Producto
(
	idProducto		INT	IDENTITY(1,1)	NOT NULL
	,idCategoria	INT					NOT NULL
	,descripcion	VARCHAR(250)		NOT NULL
	,precio			DECIMAL(9,2)		
	,stock			INT	CHECK(stock>0)	NOT NULL
	,estado			CHAR(1) DEFAULT	'A'	NOT NULL
)
ALTER TABLE Producto ADD PRIMARY KEY(idProducto)
ALTER TABLE Producto ADD FOREIGN KEY(idCategoria) REFERENCES Categoria(idCategoria)

CREATE TABLE Cliente
(
	idCliente		INT	IDENTITY(1,1)	NOT NULL
	,nombres		VARCHAR(100)		NOT NULL
	,apellidos		VARCHAR(100)		NOT NULL
	,nroDocumento	VARCHAR(15)
	,estado			CHAR(1) DEFAULT	'A'	NOT NULL
)
ALTER TABLE Cliente ADD PRIMARY KEY(idCliente)

CREATE TABLE Venta
(
	idVenta			INT	IDENTITY(1,1)					NOT NULL
	,idCliente		INT									NOT NULL
	,montoTotal		DECIMAL(9,2)						NOT NULL
	,fechaVenta		SMALLDATETIME DEFAULT GETDATE()		NOT NULL
	,estado			CHAR(1) DEFAULT	'A'					NOT NULL
)
ALTER TABLE Venta ADD PRIMARY KEY(idVenta)
ALTER TABLE Venta ADD FOREIGN KEY(idCliente) REFERENCES Cliente(idCliente)

CREATE TABLE DetalleVenta
(
	idDetalleVenta	INT	IDENTITY(1,1)	NOT NULL
	,idProducto		INT					NOT NULL
	,idVenta		INT					NOT NULL
	,precioUnitario	DECIMAL(9,2)		NOT NULL
	,cantidad		INT					NOT NULL
	,monto			DECIMAL(9,2)		NOT NULL
	,estado			CHAR(1) DEFAULT	'A'	NOT NULL
)
ALTER TABLE DetalleVenta ADD PRIMARY KEY(idDetalleVenta)
ALTER TABLE DetalleVenta ADD FOREIGN KEY(idProducto) REFERENCES Producto(idProducto)
ALTER TABLE DetalleVenta ADD FOREIGN KEY(idVenta) REFERENCES Venta(idVenta)

INSERT INTO Categoria (descripcion)
			VALUES ('Televisores')
INSERT INTO Categoria (descripcion)
			VALUES ('VideoJuegos')
INSERT INTO Categoria (descripcion)
			VALUES ('Calzado')
INSERT INTO Categoria (descripcion)
			VALUES ('Lavadoras')
INSERT INTO Categoria (descripcion)
			VALUES ('Laptops')
INSERT INTO Categoria (descripcion)
			VALUES ('Celulares')

INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(1, 'TELEVISOR SAMSUNG 55 QLED 4K', 2200.00, 50)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(1, 'TELEVISOR SONY 65 UHD', 2500.00, 100)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(1, 'TELEVISOR LG 40 QLED', 1800.00, 80)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(1, 'TELEVISOR SAMSUNG 50 QLED 4K', 1500.00, 40)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(3, 'ZAPATO CALIMOD T41', 250.00, 50)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(3, 'ZAPATILLAS ADIDAS T40', 200.00, 90)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(3, 'ZAPATILLAS PUMA T40', 120.00, 30)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(3, 'ZAPATILLAS REEF T41', 150.00, 10)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(2, 'CRASH BANDICOOT', 100.00, 6)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(2, 'SUPER MARIO BROOS', 90.00, 4)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(2, 'BATMAN ARKAM KNIGHT', 80.00, 8)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(2, 'SPIDERMAN SPIDER ARMOR', 120.00, 2)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(5, 'LAPTOP LENOVO I5 8GB RAM', 3500.00, 7)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(5, 'LAPTOP LENOVO I7 16GB RAM', 4800.00, 4)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(5, 'LAPTOP ASUS I3 8GB RAM', 2000.00, 2)
INSERT INTO Producto (idCategoria, descripcion, precio, stock)
			VALUES(5, 'LAPTOP HP I5 8GB RAM', 2800.00, 2)

INSERT INTO Cliente (nombres, apellidos, nroDocumento)
		VALUES ('Richard', 'Rivas', '4485976')
INSERT INTO Cliente (nombres, apellidos, nroDocumento)
		VALUES ('Jahir', 'Otero', '5897985')
INSERT INTO Cliente (nombres, apellidos, nroDocumento)
		VALUES ('Daniel', 'Nonato', '589759874')
INSERT INTO Cliente (nombres, apellidos, nroDocumento)
		VALUES ('Ervin', 'Parra', '89757978')
INSERT INTO Cliente (nombres, apellidos, nroDocumento)
		VALUES ('Carlos', 'Sanchez', '6979784')


--Venta 1 
INSERT INTO Venta (idCliente, montoTotal)
			VALUES (4, 1800.00)
INSERT INTO DetalleVenta (idVenta, idProducto, precioUnitario, cantidad, monto)
			VALUES ( 1, 3, 1800.00, 1, 1800.00)

--Venta 2
INSERT INTO Venta (idCliente, montoTotal)
			VALUES (3, 6960.00)
INSERT INTO DetalleVenta (idVenta, idProducto, precioUnitario, cantidad, monto)
			VALUES ( 2, 1, 2000.00, 1, 2000.00)
INSERT INTO DetalleVenta (idVenta, idProducto, precioUnitario, cantidad, monto)
			VALUES ( 2, 11, 80.00, 2, 160.00)
INSERT INTO DetalleVenta (idVenta, idProducto, precioUnitario, cantidad, monto)
			VALUES ( 2, 14, 4800.00, 1, 4800.00)

--Venta 3
INSERT INTO Venta(idCliente, montoTotal, fechaVenta)
			VALUES (2, 330.00, GETDATE())
INSERT INTO DetalleVenta (idProducto, idVenta, precioUnitario, cantidad, monto)
			VALUES(7, 3 , 120.00, 2, 240.00)
INSERT INTO DetalleVenta (idProducto, idVenta, precioUnitario, cantidad, monto)
			VALUES(10, 3 , 90.00, 1, 90.00)

--Venta 4
INSERT INTO Venta(idCliente, montoTotal, fechaVenta)
			VALUES (3, 4680.00, GETDATE())
INSERT INTO DetalleVenta (idProducto, idVenta, precioUnitario, cantidad, monto)
			VALUES(2, 4 , 2500.00, 1, 2500.00)
INSERT INTO DetalleVenta (idProducto, idVenta, precioUnitario, cantidad, monto)
			VALUES(10, 4 , 50.00, 2, 100.00)
INSERT INTO DetalleVenta (idProducto, idVenta, precioUnitario, cantidad, monto)
			VALUES(11, 4 , 80.00, 1, 80.00)
INSERT INTO DetalleVenta (idProducto, idVenta, precioUnitario, cantidad, monto)
			VALUES(15, 4 , 2000.00, 1, 2000.00)

--Venta 5
INSERT INTO Venta (idCliente, montoTotal)
			VALUES (4, 300.00)
INSERT INTO DetalleVenta (idVenta, idProducto, precioUnitario, cantidad, monto)
			VALUES ( 5, 6, 100.00, 3, 300.00)

--Venta 6
INSERT INTO Venta (idCliente, montoTotal)
			VALUES (5, 140.00)
INSERT INTO DetalleVenta (idVenta, idProducto, precioUnitario, cantidad, monto)
			VALUES ( 6, 9, 140.00, 1, 140.00)



-- PARTE 2

-- CREATE and DROP (crear y eliminar bases de datos)
CREATE DATABASE empresa;
USE empresa;

-- CREATE TABLE and DROP TABLE (crear y eliminar tablas)
-- TRUNCATE TABLE (elimina el contenido de la tabla pero no a la tabla)
/* CONTRAINTS:
	NOT NULL - Ensures that a column cannot have a NULL value
	UNIQUE - Ensures that all values in a column are different
	PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
	FOREIGN KEY - Prevents actions that would destroy links between tables		FOREIGN KEY () REFRENCES datatable(column)
	CHECK - Ensures that the values in a column satisfies a specific condition
	DEFAULT - Sets a default value for a column if no value is specified
	CREATE INDEX - Used to create and retrieve data from the database very quickly
*/
CREATE TABLE empleados (
	id int NOT NULL AUTO_INCREMENT,
    apellido varchar(50) NOT NULL,
    nombre varchar(50) NOT NULL,
    edad int,
    distrito varchar(50),
    cargo varchar(50) NOT NULL DEFAULT 'desconocido',
    fecha_ingreso date,
    UNIQUE(id), 
    PRIMARY KEY (id),
    CHECK (edad>18)
);

-- ALTTER TABLE: ADD , DROP COLUMN, RENAME COLUMN ... to ... , ALTER COLUMN, MODIFY COLUMN

-- INSERT INTO agregar valores en la tabla

INSERT INTO empleados ( apellido, nombre, edad, distrito, cargo, fecha_ingreso )
VALUES ( 'Echevarria', 'Marko', 20, 'Villa Maria del Triunfo', 'alumno', '2024-09-04');

INSERT INTO empleados ( apellido, nombre, edad, distrito, cargo, fecha_ingreso )
VALUES
('Rojas', 'Lucia', 25, 'San Juan de Miraflores', 'vendedora', '2023-03-15'),
('Gonzales', 'Raul', 30, 'Villa El Salvador', 'administrador', '2022-11-01'),
('Perez', 'Carla', 28, 'San Borja', 'supervisora', '2021-06-20'),
('Torres', 'Luis', 22, 'Chorrillos', 'almacenero', '2024-02-10'),
('Flores', 'Ana', 24, 'Barranco', 'secretaria', '2023-08-05'),
('Ramirez', 'Jorge', 35, 'Miraflores', 'gerente', '2020-04-12'),
('Sanchez', 'Maria', 27, 'Surco', 'diseñadora', '2023-01-25'),
('Mendoza', 'Carlos', 29, 'San Isidro', 'analista', '2021-12-05'),
('Quispe', 'Veronica', 32, 'Pueblo Libre', 'coordinadora', '2022-07-19'),
('Diaz', 'Pedro', 40, 'La Molina', 'jefe de logística', '2019-09-30');

-- SELECT ... FROM ... 

SELECT * FROM empleados;
SELECT id, apellido,cargo FROM empleados;
SELECT DISTINCT cargo FROM empleados;
SELECT COUNT(DISTINCT cargo) FROM empleados;

-- WHERE

SELECT * FROM empleados WHERE edad>30;
SELECT * FROM empleados WHERE id=3;

-- ORDER BY 

SELECT * FROM empleados ORDER BY edad DESC;
SELECT * FROM empleados ORDER BY edad ASC, nombre DESC;

-- AND and OR

SELECT * FROM empleados WHERE edad>30 AND nombre LIKE 'J%';
SELECT * FROM empleados WHERE edad<25 OR nombre LIKE 'J%';

-- NOT 
SELECT * FROM empleados WHERE edad<25 AND NOT nombre LIKE 'M%';

-- IS NULL and IS NOT NULL
SELECT * FROM empleados WHERE id IS NULL;
SELECT * FROM empleados WHERE id IS NOT NULL;

-- UPDATE 
UPDATE empleados SET edad=30 WHERE id=2;

-- DELETE
DELETE FROM empleados WHERE id=11;

-- SELECT TOP
SELECT * FROM empleados WHERE id IS NOT NULL ORDER BY edad LIMIT 5;

-- MIN and MAX
SELECT MIN(edad) FROM empleados;
SELECT MAX(id) FROM empleados;

-- COUNT 
SELECT count(*) FROM empleados WHERE id>6;
SELECT count( DISTINCT edad) FROM empleados WHERE id IS NOT NULL;

-- SUM 
SELECT sum(id) FROM empleados WHERE id IS NOT NULL;

-- WHERE 
SELECT avg(edad) FROM empleados WHERE id IS NOT NULL;
SELECT * FROM empleados WHERE edad>( SELECT avg(edad) FROM empleados);

-- LIKE  ( __ significa espacio en blanco, % no especifica la cantidad de caracteres  )
SELECT * FROM empleados WHERE nombre LIKE '___k%';

-- IN and NOT IN 
SELECT * FROM empleados WHERE nombre IN ('Marko','Maria');
SELECT * FROM empleados WHERE nombre NOT IN ( SELECT nombre FROM empleados );

-- BETWEEN and NOT BETWEEN 
SELECT * FROM empleados WHERE edad BETWEEN 20 AND 30;
SELECT * FROM empleados WHERE edad NOT BETWEEN 20 AND 30;
SELECT * FROM empleados WHERE edad BETWEEN 20 AND 30 AND nombre IN ( SELECT nombre FROM empleados );
SELECT * FROM empleados WHERE fecha_ingreso BETWEEN '2022-01-01' AND '2024-01-01' AND nombre IN ( SELECT nombre FROM empleados );

-- AS ( alias )
SELECT id AS 'ID cliente' ,CONCAT(nombre,' ',apellido) AS 'Nombre Completo' FROM empleados;
SELECT a.id, a.nombre FROM empleados AS a WHERE a.nombre IS NOT NULL ORDER BY nombre;

-- Usaod para relaciones 1:1
CREATE DATABASE aea;
USE aea;
CREATE TABLE animal(
	id int NOT NULL auto_increment,
    nombre varchar(100),
    edad int,
    PRIMARY KEY(id)
);
CREATE TABLE mamifero(
	id int NOT NULL auto_increment,
    patas int,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES animal(id)
);
CREATE TABLE ave(
	id int NOT NULL auto_increment,
	color varchar(100),
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES animal(id)
);
DROP DATABASE aea;

DROP TABLE IF EXISTS a;
CREATE TABLE IF NOT EXISTS a (
	id int NOT NULL auto_increment,
    aea varchar(30),
    PRIMARY KEY (id) 
);
DESC a;

DROP TABLE a2;
CREATE TABLE a2
SELECT id, nombre FROM a;
DESC a2;

TRUNCATE TABLE a2;
ALTER TABLE a2 ADD COLUMN edad int;
ALTER TABLE a2 ADD COLUMN (
	pais varchar(100),
    nota int
);

ALTER TABLE a2 MODIFY pais varchar(255);
ALTER TABLE a2 
MODIFY pais varchar(10),
MODIFY nota float;

ALTER TABLE a2 DROP COLUMN nota;
ALTER TABLE a2 CHANGE COLUMN pais continente varchar(100);
ALTER TABLE a2 RENAME TO alumno;

DESC alumno;
.
-- TABLE EJEMPLO PARA LOS INNERS

CREATE DATABASE tienda;
USE tienda;
-- Tabla Cliente
CREATE TABLE cliente (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(255)
);

-- Tabla Producto
CREATE TABLE producto (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);

-- Tabla Pedido
CREATE TABLE pedido (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha DATETIME NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id)
);

-- Tabla intermedia Pedido_Producto (relación muchos a muchos)
CREATE TABLE pedido_producto (
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (pedido_id, producto_id),
    FOREIGN KEY (pedido_id) REFERENCES pedido(pedido_id),
    FOREIGN KEY (producto_id) REFERENCES producto(producto_id)
);


INSERT INTO cliente (nombre, email, telefono, direccion)
VALUES 
('Juan Pérez', 'juan.perez@email.com', '555-1234', 'Calle Falsa 123'),
('María López', 'maria.lopez@email.com', '555-5678', 'Avenida Siempre Viva 456'),
('Carlos García', 'carlos.garcia@email.com', '555-9101', 'Boulevard Central 789'),
('Laura Fernández', 'laura.fernandez@email.com', '555-1122', 'Plaza del Sol 101'),
('Pedro Martínez', 'pedro.martinez@email.com', '555-3344', 'Calle Luna 202');

INSERT INTO producto (nombre, descripcion, precio, stock)
VALUES 
('Laptop', 'Laptop de alta gama', 1200.99, 10),
('Smartphone', 'Teléfono inteligente con pantalla AMOLED', 799.50, 25),
('Teclado Mecánico', 'Teclado mecánico con retroiluminación', 150.00, 50),
('Monitor 24 pulgadas', 'Monitor LED Full HD de 24 pulgadas', 299.99, 20);

INSERT INTO pedido (cliente_id, fecha, total)
VALUES 
(1, '2024-09-01 10:30:00', 1999.50),   -- Pedido de Juan Pérez (Laptop y Smartphone)
(2, '2024-09-02 12:15:00', 149.99),    -- Pedido de María López (Monitor)
(3, '2024-09-03 14:45:00', 150.00),    -- Pedido de Carlos García (Teclado Mecánico)
(4, '2024-09-04 09:30:00', 949.50),    -- Pedido de Laura Fernández (Smartphone y Teclado Mecánico)
(5, '2024-09-05 16:20:00', 599.98),    -- Pedido de Pedro Martínez (2 Monitores)
(6, '2024-09-06 11:00:00', 150.00),    -- Segundo pedido de Juan Pérez (Teclado Mecánico)
(7, '2024-09-07 13:10:00', 1200.99);   -- Segundo pedido de María López (Laptop)

INSERT INTO pedido_producto (pedido_id, producto_id, cantidad)
VALUES 
(1, 1, 1),
(1, 2, 1),
(2, 4, 1),
(3, 3, 1),
(4, 2, 1),
(4, 3, 1),
(5, 4, 2),
(6, 3, 1),
(7, 1, 1);

SELECT * FROM pedido_producto;
DELETE FROM pedido WHERE pedido_id>20;
ALTER TABLE pedido auto_increment=1;

-- INNER JOIN
SELECT cliente.nombre, pedido.fecha, cliente.cliente_id, pedido.cliente_id
FROM pedido 
JOIN cliente 
ON pedido.cliente_id=cliente.cliente_id;


-- LEFT JOIN

SELECT cliente.nombre, pedido.pedido_id, cliente.cliente_id, total
FROM cliente 
LEFT JOIN pedido 
ON cliente.cliente_id = pedido.cliente_id;

-- RIGHT JOIN 

DELETE FROM cliente WHERE cliente_id >= 8;

SELECT cliente.nombre, pedido.pedido_id, cliente.cliente_id, total
FROM cliente
RIGHT JOIN pedido 
ON cliente.cliente_id = pedido.cliente_id;

-- UNION 

SELECT * FROM pedido;
SELECT * FROM producto;
SELECT * FROM cliente;
SELECT * FROM pedido_producto ;

SELECT * FROM cliente WHERE cliente_id<5
UNION
SELECT * FROM producto;

SELECT a.nombre AS 'Nombre del cliente', b.telefono AS 'Medio de contacto'
FROM cliente a, cliente b
WHERE a.nombre <> b.nombre
AND a.telefono <> b.telefono
ORDER BY a.nombre;

SELECT COUNT(a.nombre)
FROM cliente a, cliente b
WHERE a.nombre <> b.nombre
AND a.telefono <> b.telefono;

-- GROUP BY

SELECT pedido_id, COUNT(cantidad) AS cantidad FROM pedido_producto GROUP BY pedido_id;


-- HAVING

SELECT pedido_id AS 'Pedido', SUM(cantidad) AS 'Cantidad total' FROM pedido_producto GROUP BY pedido_id HAVING SUM(cantidad)>AVG(cantidad);
SELECT * FROM pedido WHERE total > ( SELECT AVG(total) FROM pedido );

-- COUNT 

SELECT COUNT(DISTINCT telefono) FROM cliente;
SELECT COUNT(pedido_id) FROM pedido;

-- SUM 

SELECT SUM(stock) FROM producto;
SELECT SUM(cantidad) FROM pedido_producto;

-- LIKE

SELECT * FROM cliente WHERE nombre LIKE 'J%';
SELECT * FROM cliente WHERE nombre LIKE '__r%';

--

USE tienda;
CREATE TABLE empleados (
	id INT NOT NULL auto_increment,
    name varchar(30),
    manager_id int,
    PRIMARY KEY(id)
);

INSERT INTO empleados (name, manager_id) VALUES
('marko1',4), 
('marko2',5);

INSERT INTO empleados (name) VALUES
('marko3'), 
('marko4'), 
('marko5'), 
('marko6');

INSERT INTO empleados (name, manager_id) VALUES 
('marko7',5);

SELECT * FROM empleados;

SELECT a.name AS 'empleado', b.name AS 'manager' 
FROM empleados a 
LEFT JOIN empleados b
ON a.manager_id = b.id;

SELECT * FROM producto; 
SELECT * FROM pedido_producto;
SELECT * FROM pedido; 
SELECT * FROM cliente; 



-- PARTE 3

USE Rusia2018;
SELECT posicion AS Posicion, COUNT(*) AS cantidad
FROM Jugador GROUP BY posicion ORDER BY cantidad DESC;

SELECT nomTecnico AS 'Tecnico', nacionalidad, ( YEAR(GETDATE()) - YEAR(fechaNacimiento) ) AS Edad FROM Tecnico WHERE 
(YEAR(GETDATE()) - YEAR(fechaNacimiento)) > (SELECT YEAR(GETDATE()) - AVG(YEAR(fechaNacimiento)) FROM Tecnico) ORDER BY Edad;

SELECT YEAR(GETDATE()) - AVG(YEAR(fechaNacimiento))  FROM Tecnico;
SELECT YEAR(GETDATE()) - YEAR(fechaNacimiento) FROM Tecnico ORDER BY fechaNacimiento;

SELECT j.nomJugador AS 'Nombre', p.nomPais AS 'Pais', c.descripcion AS 'Continente' 
FROM Jugador as j 
INNER JOIN Pais AS p ON p.idPais = j.idPais
INNER JOIN Continente AS c ON p.idContinente = c.idContinente
WHERE j.nomJugador LIKE '_u%' AND c.descripcion = 'América';

CREATE VIEW vista AS
SELECT * FROM Jugador WHERE edad > 30 AND club ='Barcelona';

DROP VIEW vista;

ALTER VIEW vista AS 
SELECT * FROM Jugador WHERE edad>33;

SELECT * FROM vista ORDER BY edad DESC;

CREATE PROCEDURE buscarJugador @nombre AS varchar(50) AS
BEGIN 
	SELECT * FROM Jugador WHERE nomJugador LIKE CONCAT('%', @nombre , '%')
END

EXEC buscarJugador 'Pepe'

IF EXITS (SELECT * FROM Procedures)

SELECT * FROM Rusia2018.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE='PROCEDURE' AND SPECIFIC_CATALOG = @nameProcedure

ALTER PROCEDURE buscarProcedure @nameProcedure AS varchar(50) AS
BEGIN 
	SELECT * FROM Rusia2018.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE='PROCEDURE' AND SPECIFIC_NAME = @nameProcedure
END

EXEC buscarProcedure buscarJugador

-- PROCEDURE PARA ELIMINAR PROCEDURES

ALTER PROCEDURE eliminarProcedure @nameProcedure AS varchar(100) = 'Nothing' AS
BEGIN 
	IF EXISTS (SELECT * FROM Rusia2018.INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE='PROCEDURE' AND SPECIFIC_NAME=@nameProcedure)	
	BEGIN
		DECLARE @statment AS NVARCHAR(100) 
		SET @statment = 'DROP PROCEDURE ' + @nameProcedure
		EXEC sp_executesql @statment
	END
	ELSE
	BEGIN
		IF @nameProcedure = 'Nothing' BEGIN PRINT 'EXPECTED ARGUMENTS' END
		ELSE BEGIN PRINT 'PROCEDURE NOT FOUND' END
	END
END

EXEC eliminarProcedure 'buscarProcedure'



ALTER PROCEDURE buscarTecnico @anio AS VARCHAR(4) AS
BEGIN
	--DECLARE @nacion AS VARCHAR(10)
	--SET @nacion = t.SUBSTRING(nacionalidad, 1,3)
	SELECT t.nomTecnico AS 'Nombre tecnico', t.fechaNacimiento, c.descripcion, p.nomPais AS 'Pais del tecnico' 
	FROM Tecnico t
	INNER JOIN Pais p ON SUBSTRING(t.nacionalidad, 1,3) = SUBSTRING(p.nomPais,1,3)
	INNER JOIN Continente c ON p.idContinente = c.idContinente
	WHERE NOT YEAR(GETDATE()) - YEAR(fechaNacimiento) = @anio 
END

EXEC buscarTecnico 75

SELECT nomTecnico, YEAR(GETDATE()) - YEAR(fechaNacimiento)AS Edad FROM Tecnico ORDER BY Edad;
SELECT nomTecnico  FROM Tecnico ORDER BY nacionalidad;

ALTER PROCEDURE buscarArbitroMinuto @minutoinf AS int = 0, @minutosup AS int = 200  AS
BEGIN
	SELECT a.nomArbitro AS 'Nombre Arbitro', CONVERT(VARCHAR(10),e.fecha, 103) AS 'Fecha del encuentro',CONCAT(p1.nomPais, ' - ',p2.nomPais) AS 'Partido',j.nomJugador AS 'Jugador', CONCAT(g.minuto,' - ', g.dePenal) AS 'Minuto - Penal'
	FROM Encuentro e
	INNER JOIN Arbitro a ON a.idArbitro = e.idArbitro
	INNER JOIN Gol g ON g.idEncuentro = e.idEncuentro
	INNER JOIN Pais p1 ON p1.idPais = e.idPaisL
	INNER JOIN Pais p2 ON p2.idPais = e.idPaisV
	INNER JOIN Jugador j ON g.idJugador = j.idJugador
	WHERE g.minuto BETWEEN @minutoinf AND @minutosup
END
EXEC buscarArbitroMinuto 10, 30
CREATE PROCEDURE encuentrosEstadio @estadio AS VARCHAR(100) AS
BEGIN
	SELECT es.nomEstadio AS 'Estadio' , CONCAT(p1.nomPais, ' - ',p2.nomPais) AS 'Partido', ( en.golesPaisL + en.golesPaisV ) AS 'Goles'  
	FROM Estadio es
	INNER JOIN Encuentro en ON En.idEstadio = Es.idEstadio
	INNER JOIN Pais p1 ON p1.idPais = en.idPaisL
	INNER JOIN Pais p2 ON p2.idPais = en.idPaisV
	WHERE es.nomEstadio = @estadio
END

EXEC encuentrosEstadio 'Luzhniki'




-- PARTE 4

USE Rusia2018;

SELECT * FROM Jugador

CREATE TABLE #tablaTemporal (
	id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	jugador VARCHAR(50),
	tecnico VARCHAR(50)
)

INSERT INTO #tablaTemporal (jugador, tecnico) 
SELECT j.nomJugador, t.nomTecnico
FROM Jugador j 
INNER JOIN Pais p ON j.idPais = p.idPais
INNER JOIN Tecnico t ON p.idTecnico = t.idTecnico
WHERE j.posicion LIKE 'Portero';

SELECT * FROM #tablaTemporal;

DROP TABLE #tablaTemporal;
