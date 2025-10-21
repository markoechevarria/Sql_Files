show databases
use @namedatabase
show collections
db.createCollections('@namecollections')

db.@collection.insertOne({name:'name1'})
db.@collection.insertMany([{name:'name1'},{name:'name2'}])
db.@collection.insertOne({name:'name1', country:'country1', object:{ object1: 1, object2: 2}, array:['ar1', 'ar2', 'ar3']})

db.@collection.updateOne({name:'name1'}, {$set:{condition:['condition1']}} )
db.@collection.updateMany({name:'name1'}, {$set:{condition:['condition1']}} )

db.@collection.deleteOne({condition: 'condition1'})
db.@collection.deleteMany({condition: 'condition1'})

db.@collection.find()
db.@collection.find().count()
db.@collection.find({ campo :{$operador: valor}, campo2: /^imp/i })
db.@collection.find({ campo :{$operador: valor}, campo2: {$regex:/^imp/ , $options:"i"} })

db.Inventario.find({ Categoría: {$in:[ 'Periféricos', 'Oficina' ]} } ).count()
db.Inventario.find({ $or: [{Categoría:'Periféricos'} , {Categoría: 'Oficina'}] } ).count()


db.Ciudades.find({ "consejeros.edad": {$gt: 80} }).count()
db.Ciudades.find( {telefonos: {$size: 7} } )
db.Ciudades.find( {$where: "this.telefono.length == 7"} ) 
db.Ciudades.find( { $where :"this.consejero.reduce((sum, c) => sum+c.edad, 0)>200" } )
db.Ciudades.find( {telefonos: /^ \(92/i}).count()
db.Ciudades.find( {telefonos: {$regex: /^ \(92/}}).count()
db.Ciudades.find( {telefonos: {$regex: /^ \(92/}}).projection({codigo: 1, nombre: 1, telefono: { $filter: {input: "$telefonos", as: "telefonos", cond: { $regexMatch: {input: "$$telefonos", regex: /^ \(92/ } } } } })
db.Ciudades.find( {"consejeros.nombre": /an/i } )
db.Personas.find({ "direccion.ciudad": "The Pas"})

db.Personas.find({ colores: "black" })
db.Personas.find({ colores: "black" }).projection( {nombre: 1, ingresos: 1, color: {$filter: {input: "$colores", as: "colores", cond: {$eq: ["$$colores", "black"]} }}})
db.Personas.find({ "colores.0": "black" }).projection( {nombre: 1, ingresos: 1, color: {$filter: {input: "$colores", as: "colores", cond: {$eq: ["$$colores", "black"]} }}})
db.Personas.find( {$expr: { $gt: [ {$size: "$colores"}, 5 ]  } } )
db.Personas.find( { $where: "this.colores.length > 5" } )



// Buscar productos con stock mayor a 40
db.inventario.find({Stock: {$gt: 40}})
// Buscar productos con strock mayor 10 y menor que 15
db.inventario.find({Stock: {$gte: 10, $lte: 15}})
// Buscar productos con strock mayor 10 y menor que 15 y Precio Unitario Mayor a 1300
db.inventario.find({Stock: {$gte: 10, $lte: 15}, "Precio Unitario":{ $gte:1300}})
// Buscar productos cuyo nombre comiencen con Imp usando expresiones regulares
db.inventario.find({ Producto: /^imp/i})
db.inventario.find({ Producto: {$regex:/^imp/, $options:"i"}})
// Buscar productos de categorías Periférico o Electrónico
db.inventario.find({ Categoría: { $in:["Periféricos", "Electrónica"]}})
// Buscar productos por categoría Oficina o que tengan un proveedor que tengo la palabra hub
db.inventario.find({ $or:[ {Categoría: "Oficina"}, {Proveeedor: /hub/i}]})
// Buscar productos con fecha de Ingreso anterior al 31 de Enero 2024
db.inventario.find({ "Fecha de Ingreso": { $lt: ISODate("2024-01-31")}})
// Buscar productos en el rango de fecha del 1 al 31 de Enero 2024
db.inventario.find({ "Fecha de Ingreso": { $gte:  ISODate("2024-01-01"), $lte: ISODate("2024-01-31")}}).sort({"Fecha de Ingreso":1})
// Buscar productos cuyo nombre comience con T o I y tengan precio menor a 200
db.inventario.find({ Producto:/^[TI]/i, "Precio Unitario": {$lt: 200}})


/*
Ejercicios de SQL

Base de datos para MySQL
DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;


CREATE TABLE fabricante (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);


CREATE TABLE producto (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  id_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);


INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');


INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);



Convert SQL to MongoDB
*/

show databases
use database Industria
db.createCollections("producto")
db.producto.insertMany([
	{ _id: 1, nombre: "Disco duro SATA3 1TB" , precio: 86.99, fabricante_id: 5 },
	{ _id: 2, nombre: "Memoria RAN DDR4 8GB" , precio: 120, fabricante_id: 6 },
	{ _id: 3, nombre: "Disco SSD 1 TB" , precio: 150.99, fabricante_id: 4 },
	{ _id: 4, nombre: "GeForce GTX 1050Ti" , precio: 185, fabricante_id: 7 },
	{ _id: 5, nombre: "GeForce GTX 1080 Xtreme" , precio: 755, fabricante_id: 6},
	{ _id: 6, nombre: "Monito 24 LED Full HD" , precio: 202, fabricante_id: 1 },
	{ _id: 7, nombre: "Monito 27 LED Full HD" , precio: 245.99, fabricante_id: 1 },
	{ _id: 8, nombre: "Portatil Yoga 520" , precio: 559, fabricante_id: 2 },
	{ _id: 9, nombre: "Portatil Ideapd 320" , precio: 444, fabricante_id: 2},
	{ _id: 10, nombre: "Impresora HP Deskjet 3720" , precio: 59.99, fabricante_id: 3},
	{ _id: 11, nombre: "Impresora HP Laserjet Pro M26nw" , precio: 180, fabricante_id: 3 }, 
])

db.createCollections("fabricante")
db.fabricante.insertMany([
	{ _id: 1, nombre: "Asus"},
	{ _id: 2, nombre: "Lenovo"},
	{ _id: 3, nombre: "Hewlett-Packard"},
	{ _id: 4, nombre: "Samsung"},
	{ _id: 5, nombre: "Seagate"},
	{ _id: 6, nombre: "Crucial"},
	{ _id: 7, nombre: "Gigabyte"},
	{ _id: 8, nombre: "Huawei"},
	{ _id: 9, nombre: "Xiaomi"},
])

// Consultas
// Lista el nombre de todos los productos que hay en la tabla producto.
db.producto.find( {}, { _id: 0, "Producto": "$nombre"} )
// Lista los nombres y los precios de todos los productos de la tabla producto.
db.producto.find( {}, {_id:0, nombre:1, precio:1} )
// Lista todas las columnas de la tabla producto.
db.producto.find( {}, { _id: 0,"id":"$_id", "Producto":"$nombre", "Precio":"$precio", "ID de fabricante":"$fabricante_id" })
// Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).   
db.producto.find( {}, { _id: 0, "Producto": "$nombre", "Dolares":"$precio", "Euros": {$multiply: ["$precio", 2]} } )
// Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares. ).  
db.producto.find( {}, { _id: 0, "Nombre de producto": "$nombre", "Dolares":"$precio", "Euros": {$multiply: ["$precio", 2]} } )
// Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula. 
db.producto.find( {}, {_id: 0, producto:{$toUpper:"$nombre"}, "Precio":"$precio"})
// Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
db.producto.find( {}, {_id: 0, producto:{$toLower:"$nombre"}, "Precio":"$precio"})
// Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante. 
db.fabricante.find( {}, {_id:0, "Fabricante": {$toUpper: { $substr: ["$nombre",0,2] } } } )
// Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio. 
db.producto.find( {}, {_id:0, nombre:1, precio: {$round: ["$precio", 0] } } )
// Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal. 
db.producto.find( {}, {_id:0, nombre:1, precio: {$trunc: ["$precio", 0] } } )
// Lista el identificador de los fabricantes que tienen productos en la tabla producto. 
db.producto.find({}, {_id:0, "id del fabricante": "$fabricante_id"})
// Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos. 
db.producto.distinct("fabricante_id")
// Lista los nombres de los fabricantes ordenados de forma ascendente.
db.fabricante.find( {}, {_id:0, nombre:1} ).sort({nombre:1})
// Lista los nombres de los fabricantes ordenados de forma descendente.
db.fabricante.find( {}, {_id:0, nombre:1} ).sort({nombre:-1})
// Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
db.producto.find( {}, {_id:0,nombre:1, precio:1} ).sort({nombre:1, precio:-1})
// Devuelve una lista con las 5 primeras filas de la tabla fabricante.
db.fabricante.find( {},{_id:0, nombre:1} ).sort({"nombre":1}).limit(5)
// Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
db.fabricante.find( {},{_id:0, nombre:1} ).sort({"nombre":1}).skip(3).limit(2)
// Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
db.producto.find( {},{_id:0, nombre:1, precio:1} ).sort({"precio":1}).limit(1)
// Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
db.producto.find( {},{_id:0, nombre:1, precio:1} ).sort({"precio":-1}).limit(1)
// Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
db.producto.find( {fabricante_id:2},{_id:0, nombre:1, precio:1} )
// Lista el nombre de los productos que tienen un precio menor o igual a 120€.
db.producto.find( {$where: "this.precio <= 120"}, {_id:0, nombre:1, precio:1}).sort({precio:1})
// Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
db.producto.find( {$where: "this.precio >= 400"}, {_id:0, nombre:1, precio:1}).sort({precio:1})
// Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
db.producto.find( {$where: "this.precio < 400"}, {_id:0, nombre:1, precio:1}).sort({precio:1})
// Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
db.producto.find( {precio: {$gt: 80, $lt: 300} }, {_id:0, nombre:1, precio:1}).sort({precio:1})
// Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
db.producto.find( {precio: {$gt: 60, $lt: 200} }, {_id:0, nombre:1, precio:1}).sort({precio:1})
// Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
db.producto.find( {precio: {$gt: 200}, fabricante_id:6}, {_id:0, nombre:1, precio:1, fabricante_id:1}).sort({precio:1})
// Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
db.producto.find({ $or: [ {fabricante_id:1},{fabricante_id:3},{fabricante_id:5} ] }, { _id: 0, nombre: 1,fabricante_id: 1 })
// Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
db.producto.find({ fabricante_id: {$in: [1,3,5]} }, { _id: 0, nombre: 1,fabricante_id: 1 })
// Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
db.producto.find({}, { _id:0,nombre:1,precio:1, centimos:{ $multiply: ["$precio", 100] } })
// Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
db.fabricante.find( {nombre: /^s/i}, {_id:0, nombre: 1} )
// Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
db.fabricante.find( {nombre: /e$/i}, {_id:0, nombre: 1} )
// Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
db.fabricante.find( {nombre: /w/i}, {_id:0, nombre: 1} )
// Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
db.fabricante.find( {$where: "this.nombre.length == 4"}, {_id:0, nombre: 1})
// Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
db.producto.find( {nombre: /portatil/i}, {_id:0, nombre: 1} )
// Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
db.producto.find( {nombre: /monito/i, $where: "this.precio < 215"}, { _id:0, nombre:1, precio:1})
// Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
db.producto.find( { precio: {$gte: 180 } }, {_id:0, nombre:1, precio:1} ).sort({precio:-1}, {nombre:1})

// Agregación
// Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. 
db.producto.aggregate(
  [
    {
      $project: {
        _id: 0,
        nombre: 1,
        precio: { $multiply: ['$precio', 5] },
        fabricante_id: 1
      }
    }
  ]
);
// Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
db.producto.aggregate (
  [
    {
      $lookup: {
        from: 'fabricante',
        localField: 'fabricante_id',
        foreignField: '_id',
        as: 'fabricante'
      }
    },
    { $sort: { nombre: 1 } },
    {
      $project: {
        _id: 0,
        nombre: 1,
        precio: 1,
        fabricante: {
          $arrayElemAt: ['$fabricante.nombre', 0]
        }
      }
    }
  ]
);
// Devuelve una lista de todos los productos del fabricante Lenovo.
db.producto.aggregate(
  [
    {
      $lookup: {
        from: 'fabricante',
        localField: 'fabricante_id',
        foreignField: '_id',
        as: 'fabricante'
      }
    },
    { $sort: { nombre: 1 } },
    {
      $project: {
        _id: 0,
        nombre: 1,
        precio: 1,
        fabricante: {
          $arrayElemAt: ['$fabricante.nombre', 0]
        }
      }
    },
    {
      $match: {
        fabricante: RegExp('lenovo', 'i')
      }
    }
  ]
);
// Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e. 
db.producto.aggregate(
  [
    {
      $lookup: {
        from: 'fabricante',
        localField: 'fabricante_id',
        foreignField: '_id',
        as: 'fabricante'
      }
    },
    { $sort: { nombre: 1 } },
    {
      $project: {
        _id: 0,
        nombre: 1,
        precio: 1,
        fabricante: {
          $arrayElemAt: ['$fabricante.nombre', 0]
        }
      }
    },
    { $match: { fabricante: RegExp('e$', 'i') } }
  ]
);
// Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre. 
db.producto.aggregate(
  [
    {
      $lookup: {
        from: 'fabricante',
        localField: 'fabricante_id',
        foreignField: '_id',
        as: 'fabricante'
      }
    },
    { $sort: { nombre: 1 } },
    {
      $project: {
        _id: 0,
        nombre: 1,
        precio: 1,
        fabricante: {
          $arrayElemAt: ['$fabricante.nombre', 0]
        }
      }
    },
    { $match: { fabricante: RegExp('w', 'i') } }
  ]
);
// Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente) 
db.producto.aggregate(
  [
    {
      $lookup: {
        from: 'fabricante',
        localField: 'fabricante_id',
        foreignField: '_id',
        as: 'fabricante'
      }
    },
    {
      $project: {
        _id: 0,
        nombre: 1,
        precio: 1,
        fabricante: {
          $arrayElemAt: ['$fabricante.nombre', 0]
        }
      }
    },
    { $match: { precio: { $gte: 180 } } },
    { $sort: { precio: -1, nombre: 1 } }
  ]
);
// Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
db.producto.aggregate(
  [
    { $group: { _id: '$fabricante_id' } },
    {
      $lookup: {
        from: 'fabricante',
        localField: '_id',
        foreignField: '_id',
        as: 'fabricante_name'
      }
    },
    {
      $project: {
        _id: 1,
        Nombre: {
          $arrayElemAt: [
            '$fabricante_name.nombre',
            0
          ]
        }
      }
    },
    { $sort: { _id: 1 } }
  ]
);


/*
Gestión de ventas
Modelo entidad/relación

Base de datos para MySQL
DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas CHARACTER SET utf8mb4;
USE ventas;

CREATE TABLE cliente (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  ciudad VARCHAR(100),
  categoria INT UNSIGNED
);

CREATE TABLE comercial (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  comision FLOAT
);

CREATE TABLE pedido (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  total DOUBLE NOT NULL,
  fecha DATE,
  id_cliente INT UNSIGNED NOT NULL,
  id_comercial INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id),
  FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);

INSERT INTO cliente VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO cliente VALUES(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO cliente VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO cliente VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO cliente VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO cliente VALUES(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO cliente VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO cliente VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO cliente VALUES(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO cliente VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

INSERT INTO comercial VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO comercial VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO comercial VALUES(3, 'Diego','Flores', 'Salas', 0.11);
INSERT INTO comercial VALUES(4, 'Marta','Herrera', 'Gil', 0.14);
INSERT INTO comercial VALUES(5, 'Antonio','Carretero', 'Ortega', 0.12);
INSERT INTO comercial VALUES(6, 'Manuel','Domínguez', 'Hernández', 0.13);
INSERT INTO comercial VALUES(7, 'Antonio','Vega', 'Hernández', 0.11);
INSERT INTO comercial VALUES(8, 'Alfredo','Ruiz', 'Flores', 0.05);

INSERT INTO pedido VALUES(1, 150.5, '2017-10-05', 5, 2);
INSERT INTO pedido VALUES(2, 270.65, '2016-09-10', 1, 5);
INSERT INTO pedido VALUES(3, 65.26, '2017-10-05', 2, 1);
INSERT INTO pedido VALUES(4, 110.5, '2016-08-17', 8, 3);
INSERT INTO pedido VALUES(5, 948.5, '2017-09-10', 5, 2);
INSERT INTO pedido VALUES(6, 2400.6, '2016-07-27', 7, 1);
INSERT INTO pedido VALUES(7, 5760, '2015-09-10', 2, 1);
INSERT INTO pedido VALUES(8, 1983.43, '2017-10-10', 4, 6);
INSERT INTO pedido VALUES(9, 2480.4, '2016-10-10', 8, 3);
INSERT INTO pedido VALUES(10, 250.45, '2015-06-27', 8, 2);
INSERT INTO pedido VALUES(11, 75.29, '2016-08-17', 3, 7);
INSERT INTO pedido VALUES(12, 3045.6, '2017-04-25', 2, 1);
INSERT INTO pedido VALUES(13, 545.75, '2019-01-25', 6, 1);
INSERT INTO pedido VALUES(14, 145.82, '2017-02-02', 6, 1);
INSERT INTO pedido VALUES(15, 370.85, '2019-03-11', 1, 5);
INSERT INTO pedido VALUES(16, 2389.23, '2019-03-11', 1, 5);

Convert SQL to MongoDB
*/

db.cliente.insertMany([
{ _id: 1, nombre: 'Aarón', apellido1: 'Rivero', apellido2: 'Gómez', ciudad: 'Almería', saldo: 100 }, 
{ _id: 2, nombre: 'Adela', apellido1: 'Salas', apellido2: 'Díaz', ciudad: 'Granada', saldo: 200 }, 
{ _id: 3, nombre: 'Adolfo', apellido1: 'Rubio', apellido2: 'Flores', ciudad: 'Sevilla', saldo: null },
{ _id: 4, nombre: 'Adrián', apellido1: 'Suárez', apellido2: null, ciudad: 'Jaén', saldo: 300 }, 
{ _id: 5, nombre: 'Marcos', apellido1: 'Loyola', apellido2: 'Méndez', ciudad: 'Almería', saldo: 200 }, 
{ _id: 6, nombre: 'María', apellido1: 'Santana', apellido2: 'Moreno', ciudad: 'Cádiz', saldo: 100 }, 
{ _id: 7, nombre: 'Pilar', apellido1: 'Ruiz', apellido2: null, ciudad: 'Sevilla', saldo: 300 }, 
{ _id: 8, nombre: 'Pepe', apellido1: 'Ruiz', apellido2: 'Santana', ciudad: 'Huelva', saldo: 200 }, 
{ _id: 9, nombre: 'Guillermo', apellido1: 'López', apellido2: 'Gómez', ciudad: 'Granada', saldo: 225 }, 
{ _id: 10, nombre: 'Daniel', apellido1: 'Santana', apellido2: 'Loyola', ciudad: 'Sevilla', saldo: 125 } 
]);

db.comercial.insertMany([ 
{ _id: 1, nombre: 'Daniel', apellido1: 'Sáez', apellido2: 'Vega', comision: 0.15 }, 
{ _id: 2, nombre: 'Juan', apellido1: 'Gómez', apellido2: 'López', comision: 0.13 }, 
{ _id: 3, nombre: 'Diego', apellido1: 'Flores', apellido2: 'Salas', comision: 0.11 }, 
{ _id: 4, nombre: 'Marta', apellido1: 'Herrera', apellido2: 'Gil', comision: 0.14 }, 
{ _id: 5, nombre: 'Antonio', apellido1: 'Carretero', apellido2: 'Ortega', comision: 0.12 }, 
{ _id: 6, nombre: 'Manuel', apellido1: 'Domínguez', apellido2: 'Hernández', comision: 0.13 }, 
{ _id: 7, nombre: 'Antonio', apellido1: 'Vega', apellido2: 'Hernández', comision: 0.11 }, 
{ _id: 8, nombre: 'Alfredo', apellido1: 'Ruiz', apellido2: 'Flores', comision: 0.05 } 
]);

db.pedido.insertMany([ 
{ _id: 1, total: 150.5, fecha: ISODate("2017-10-05T00:00:00Z"), cliente_id: 5, comercial_id: 2 }, 
{ _id: 2, total: 270.65, fecha: ISODate("2016-09-10T00:00:00Z"), cliente_id: 1, comercial_id: 5 },
{ _id: 3, total: 65.26, fecha: ISODate("2017-10-05T00:00:00Z"), cliente_id: 2, comercial_id: 1 }, 
{ _id: 4, total: 110.5, fecha: ISODate("2016-08-17T00:00:00Z"), cliente_id: 8, comercial_id: 3 }, 
{ _id: 5, total: 948.5, fecha: ISODate("2017-09-10T00:00:00Z"), cliente_id: 5, comercial_id: 2 }, 
{ _id: 6, total: 2400.6, fecha: ISODate("2016-07-27T00:00:00Z"), cliente_id: 7, comercial_id: 1 },
{ _id: 7, total: 5760, fecha: ISODate("2015-09-10T00:00:00Z"), cliente_id: 2, comercial_id: 1 }, 
{ _id: 8, total: 1983.43, fecha: ISODate("2017-10-10T00:00:00Z"), cliente_id: 4, comercial_id: 6 }, 
{ _id: 9, total: 2480.4, fecha: ISODate("2016-10-10T00:00:00Z"), cliente_id: 8, comercial_id: 3 }, 
{ _id: 10, total: 250.45, fecha: ISODate("2015-06-27T00:00:00Z"), cliente_id: 8, comercial_id: 2 }, 
{ _id: 11, total: 75.29, fecha: ISODate("2016-08-17T00:00:00Z"), cliente_id: 3, comercial_id: 7 }, 
{ _id: 12, total: 3045.6, fecha: ISODate("2017-04-25T00:00:00Z"), cliente_id: 2, comercial_id: 1 },
{ _id: 13, total: 545.75, fecha: ISODate("2019-01-25T00:00:00Z"), cliente_id: 6, comercial_id: 1 }, 
{ _id: 14, total: 145.82, fecha: ISODate("2017-02-02T00:00:00Z"), cliente_id: 6, comercial_id: 1 }, 
{ _id: 15, total: 370.85, fecha: ISODate("2019-03-11T00:00:00Z"), cliente_id: 1, comercial_id: 5 }, 
{ _id: 16, total: 2389.23, fecha: ISODate("2019-03-11T00:00:00Z"), cliente_id: 1, comercial_id: 5 } 
]);

/*
Consultas sobre una tabla
Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
Devuelve todos los datos de los dos pedidos de mayor valor.
Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.
*/

// Consultas multitabla (Composición interna)
// Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.).
db.pedido.aggregate(
  [
    { $group: { _id: '$cliente_id' } },
    {
      $lookup: {
        from: 'cliente',
        localField: '_id',
        foreignField: '_id',
        as: 'cliente_'
      }
    },
    {
      $project: {
        _id: 0,
        ID_cliente: '$_id',
        'Nombres y apellidos': {
          $concat: [
            {
              $arrayElemAt: [
                '$cliente_.nombre',
                0
              ]
            },
            ' ',
            {
              $arrayElemAt: [
                '$cliente_.apellido1',
                0
              ]
            },
            ' ',
            {
              $arrayElemAt: [
                '$cliente_.apellido2',
                0
              ]
            }
          ]
        }
      }
    },
    { $sort: { ID_cliente: 1 } }
  ]
);
// Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
db.cliente.aggregate(
  [
    {
      $lookup: {
        from: 'pedido',
        localField: '_id',
        foreignField: 'cliente_id',
        as: 'pedid'
      }
    },
    { $unwind: { path: '$pedid' } },
    {
      $project: {
        _id: 0,
        'ID del cliente': '$_id',
        Cliente_name: {
          $concat: [
            '$nombre',
            ' ',
            '$apellido1',
            ' ',
            '$apellido2'
          ]
        },
        'ID del pedido': '$pedid._id',
        'Fecha del pedido': '$pedid.fecha'
      }
    }
  ]
);
