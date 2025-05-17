CREATE DATABASE semana2;
USE semana2;

CREATE TABLE clientes (
	id INT, 
	nombre VARCHAR(20), 
	email VARCHAR(40),
	telefono VARCHAR(9)
);

-- OPERACION CREATE

INSERT INTO clientes ( id, nombre, email, telefono )
VALUES ( 1, 'Juan Perez', 'juan@example.com', '123456789' );

INSERT INTO clientes ( id, nombre ) VALUES (5, 'Luis Ernesto');

INSERT INTO clientes ( id, nombre, email, telefono )
VALUES ( 2, 'Juan Sebastian', 'juan@gmail.com', '999111999' );

INSERT INTO clientes ( id, nombre, email, telefono )
VALUES
(3, 'Pedro', 'pedro@gmail.com', '123' ),
(4, 'Luis', 'luis@gmail.com', '999' ),
(5, 'Angel', 'angel@gmail.com', '123456');

-- OPERACION READ

SELECT * FROM clientes;
SELECT nombre FROM clientes;
SELECT nombre, telefono FROM clientes;
SELECT id, nombre FROM clientes WHERE nombre='Marko';

-- OPERACION UPDATE

UPDATE clientes SET telefono='55555555' WHERE id=4;
UPDATE clientes SET email='ernesto@gmail.com', telefono='100001' WHERE nombre='Luis Ernesto'
UPDATE clientes SET telefono='0' WHERE id=5;
UPDATE clientes SET id=6 WHERE nombre='Luis Ernesto';

-- OPERACION DELETE

DELETE FROM clientes WHERE nombre='Luis Ernesto';

-- OPERACIONES DE FILTRADO CON WHERE

SELECT * FROM clientes WHERE id=4;	 -- Igualdad: = 
SELECT * FROM clientes WHERE id>=4;  -- Comparaciones: <, >, <=, >=
SELECT * FROM clientes WHERE id!=2;  -- No igual: != o <>
SELECT * FROM clientes WHERE id BETWEEN 3 AND 5; -- Rango: BETWEEN ... AND ...
SELECT * FROM clientes WHERE id IN (1,2,5,8); -- Conjunto: IN (...)
SELECT * FROM clientes WHERE nombre LIKE 'J%'; -- Texto: LIKE 'patrón%'


/*
EJERCICIO 1
Crea una tabla llamada productos con las columnas:
	id (entero, clave primaria).
	nombre (texto, 50 caracteres).
	precio (decimal, 2 decimales).
	stock (entero).
Inserta al menos 3 productos en la tabla.
Realiza las siguientes consultas:
	Mostrar todos los productos.
	Actualizar el precio de un producto específico.
	Eliminar un producto con id = 3.
*/

CREATE TABLE productos (
	id INT,
	nombre VARCHAR(50),
	precio FLOAT,
	stock INT, 
)

INSERT INTO productos (id, nombre, precio, stock)
VALUES ( 1, 'arroz', 3.5, 100 ),
( 2, 'verdura', 2, 50 ),
( 3, 'pan', 1, 200 ),
( 4, 'ropa', 30, 50 ),
( 5, 'juguete', 10, 80 );

SELECT * FROM productos;  -- Mostrar todos los productos.
UPDATE productos SET precio=1.5 WHERE nombre='verdura'; -- Actualizar el precio de un producto específico.
DELETE FROM productos WHERE id=3; -- Eliminar un producto con id = 3.


/*
EJERCICIO 2
Usa la tabla productos creada previamente.
Filtra productos que cumplan las siguientes condiciones:
	Precio mayor a 50.
	Stock entre 10 y 50.
	Nombre que comience con la letra "A".
*/

SELECT * FROM productos WHERE precio>50;
SELECT * FROM productos WHERE stock BETWEEN 10 AND 50;
SELECT * FROM productos WHERE nombre LIKE 'a%';

/*
EJERCICIO 3
Crea una tabla llamada inventario con las siguientes columnas:
	id_producto (entero, clave primaria)
	nombre_producto (texto, 100 caracteres)
	categoria (texto, 50 caracteres)
	precio (decimal, 2 decimales)
	stock (entero)
	fecha_ingreso (fecha)
Inserta los siguientes datos:
	(1, 'Laptop', 'Electrónica', 1200.99, 15, '2025-01-01’),
	(2, 'Teclado', 'Accesorios', 45.50, 30, '2025-01-05’),
	(3, 'Monitor', 'Electrónica', 300.00, 10, '2025-01-07’),
	(4, 'Mouse', 'Accesorios', 20.99, 50, '2025-01-02’),
	(5, 'Impresora', 'Oficina', 150.75, 5, '2025-01-10’);
Realiza las siguientes consultas:
	Obtén los productos cuyo precio sea mayor a 100 y el stock sea menor a 20.
	Selecciona los productos que pertenecen a las categorías Electrónica o Oficina.
	Encuentra los productos agregados después del 2025-01-03.
	Actualiza el precio de todos los productos en la categoría "Accesorios", incrementándolo en un 10%.
	Elimina los productos cuyo stock sea menor o igual a 5.
*/

CREATE TABLE inventario (
	id_producto INT,
	nombre_producto VARCHAR(100),
	categoria VARCHAR(50),
	precio FLOAT,
	stock INT, 
	fecha_ingreso DATE
)

INSERT INTO inventario (id_producto, nombre_producto, categoria, precio, stock, fecha_ingreso)
VALUES 
(1, 'Laptop', 'Electrónica', 1200.99, 15, '2025-01-01'),
(2, 'Teclado', 'Accesorios', 45.50, 30, '2025-01-05'),
(3, 'Monitor', 'Electrónica', 300.00, 10, '2025-01-07'),
(4, 'Mouse', 'Accesorios', 20.99, 50, '2025-01-02'),
(5, 'Impresora', 'Oficina', 150.75, 5, '2025-01-10');

SELECT * FROM inventario;

SELECT * FROM inventario WHERE precio>100 AND stock<10;
SELECT * FROM inventario WHERE categoria IN ( 'Electrónica', 'Oficina');
SELECT * FROM inventario WHERE fecha_ingreso>'2025-01-03';
UPDATE inventario SET precio=(precio*1.1) WHERE categoria='Accesorios';
DELETE FROM inventario WHERE stock<=5;