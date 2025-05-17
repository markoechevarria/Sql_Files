CREATE DATABASE relaciones;
USE relaciones;

-- RELACION 1:1
CREATE TABLE paises (
	idPais INT PRIMARY KEY,
	nombre VARCHAR(50),
	idioma VARCHAR(50)
)

CREATE TABLE bandera (
	idBandera INT PRIMARY KEY,
	colores VARCHAR(50),
	idPais INT,
	FOREIGN KEY (idPais) REFERENCES paises(idPais)
)

-- RELACION 1:N

CREATE TABLE clientes (
	idCliente INT PRIMARY KEY,
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	cuenta VARCHAR(50)
)

CREATE TABLE pedidos (
	idPedido INT PRIMARY KEY,
	producto VARCHAR(50),
	precio INT,
	idCliente INT,
	FOREIGN KEY (idCliente) REFERENCES clientes(idCliente)
)

-- RELACION N:N

CREATE TABLE alumnos (
	idAlumno INT PRIMARY KEY, 
	nombre VARCHAR(50),
	apellido VARCHAR(50)
)
CREATE TABLE cursos (
	idCurso INT PRIMARY KEY,
	nombreCurso VARCHAR(50),
	profesor VARCHAR(50),
	aula INT
)
CREATE TABLE cursosAlumnos (
	idAlumno INT,
	idCurso INT,
	FOREIGN KEY (idAlumno) REFERENCES alumnos(idAlumno), 
	FOREIGN KEY (idCurso) REFERENCES cursos(idCurso)
)

/*
Tablas base:
	Libros:
		id_libro (entero, clave primaria).
		titulo (texto, 100 caracteres).
		id_autor (entero, clave foránea).
	Autores:
		id_autor (entero, clave primaria).
		nombre (texto, 100 caracteres).
	Prestamos:
		id_prestamo (entero, clave primaria).
		id_libro (entero, clave foránea).
		id_usuario (entero).
		fecha_prestamo (fecha).
Instrucciones:
	Crea las tablas y define las claves primarias y foráneas.
	Inserta al menos 5 autores, 10 libros y 15 préstamos.
Realiza las siguientes consultas:
	Encuentra el autor que más libros tiene en la biblioteca.
	Muestra los libros que no han sido prestados.
	Encuentra los usuarios que han tomado prestado más de 3 libros en el último mes.
	Calcula el número total de préstamos por autor.
*/
CREATE TABLE libros (
	id_libro INT PRIMARY KEY, 
	titulo VARCHAR(100),
	id_autor INT,
	FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);
CREATE TABLE autores (
	id_autor INT PRIMARY KEY,
	nombre VARCHAR(100)
);
CREATE TABLE prestamos(
	id_prestamo INT PRIMARY KEY,
	id_libro INT,
	id_usuario INT,
	fecha_prestamo DATE
	FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

-- INSERTAR REGISTROS

INSERT INTO autores (id_autor, nombre) VALUES
(1, 'Gabriel García Márquez'),
(2, 'Mario Vargas Llosa'),
(3, 'Isabel Allende'),
(4, 'J.K. Rowling'),
(5, 'J.R.R. Tolkien'),
(6, 'George Orwell'),
(7, 'Leo Tolstoy'),
(8, 'Charles Dickens'),
(9, 'Virginia Woolf'),
(10, 'Franz Kafka');

INSERT INTO libros (id_libro, titulo, id_autor) VALUES
(1, 'Cien años de soledad', 1),
(2, 'La ciudad y los perros', 2),
(3, 'La casa de los espíritus', 3),
(4, 'Harry Potter y la piedra filosofal', 4),
(5, 'El hobbit', 5),
(6, '1984', 6),
(7, 'Guerra y paz', 7),
(8, 'Oliver Twist', 8),
(9, 'Mrs. Dalloway', 9),
(10, 'La metamorfosis', 10);

INSERT INTO prestamos (id_prestamo, id_libro, id_usuario, fecha_prestamo) VALUES
(1, 1, 101, '2025-01-10'),
(2, 2, 102, '2025-01-11'),
(3, 3, 103, '2025-01-12'),
(4, 4, 104, '2025-01-13'),
(5, 5, 105, '2025-01-14'),
(6, 6, 106, '2025-01-15'),
(7, 7, 107, '2025-01-16'),
(8, 8, 108, '2025-01-17'),
(9, 9, 109, '2025-01-18'),
(10, 10, 110, '2025-01-19');

CREATE DATABASE aviacion;
USE aviacion;

CREATE TABLE pasajero (
	idpasajero INT PRIMARY KEY,
	nombre VARCHAR(100),
	apellido VARCHAR(100),
	num_documento VARCHAR(10),
	fecha_nacimiento DATE,
	idpais INT,
	telefono VARCHAR(10),
	FOREIGN KEY (idpais) REFERENCES pais(idpais)
);
CREATE TABLE pago (
	idpago INT PRIMARY KEY,
	idreserva INT,
	fecha DATE,
	idpasajero INT,
	monto INT,
	FOREIGN KEY (idreserva) REFERENCES reserva(idreserva),
	FOREIGN KEY (idpasajero) REFERENCES pasajero(idpasajero)
);
CREATE TABLE reserva (
	idreserva INT PRIMARY KEY,
	costo INT, 
	fecha DATE,
);
CREATE TABLE pais(
	idpais INT PRIMARY KEY,
	nombre VARCHAR(100)
);
CREATE TABLE aeropuerto(
	idaeropuerto INT PRIMARY KEY,
	nombre VARCHAR(100),
	idpais INT,
	FOREIGN KEY (idpais) REFERENCES pais(idpais)
);
CREATE TABLE aerolinea (
	idaerolinea INT PRIMARY KEY,
	ruc VARCHAR(100),
	nombre VARCHAR(100)
);
CREATE TABLE avion (
	idavion INT PRIMARY KEY,
	idaerolinea INT,
	fabricante VARCHAR(100),
	tipo VARCHAR(20),
	capacidad INT,
	FOREIGN KEY (idaerolinea) REFERENCES aerolinea(idaerolinea)
);
CREATE TABLE vuelo (
	idasiento INT,
	idaeropuerto INT, 
	idreserva INT,
	idavion INT,
	FOREIGN KEY (idasiento) REFERENCES asiento(idasiento),
	FOREIGN KEY (idaeropuerto) REFERENCES aeropuerto(idaeropuerto),
	FOREIGN KEY (idreserva) REFERENCES reserva(idreserva),
	FOREIGN KEY (idavion) REFERENCES avion(idavion) 
);
ALTER TABLE vuelo ADD idtarifa INT;
ALTER TABLE vuelo ADD CONSTRAINT FK_vuelo FOREIGN KEY (idtarifa) REFERENCES tarifa(idtarifa);

CREATE TABLE asiento (
	idasiento INT PRIMARY KEY,
	letra VARCHAR(20),
	fila INT
);
CREATE TABLE tarifa (
	idtarifa INT PRIMARY KEY,
	clase INT,
	precio INT,
	impuesto INT,
);

DROP TABLE avion;
DROP TABLE aeropuerto;
DROP TABLE vuelo;