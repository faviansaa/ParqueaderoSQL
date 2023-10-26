CREATE DATABASE Parqueadero;
USE Parqueadero;

CREATE TABLE categoria(
    id SMALLINT  PRIMARY KEY NOT NULL AUTO_INCREMENT,
    tipovehiculo VARCHAR (100) NOT NULL
);

CREATE TABLE cliente(
    id SMALLINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Documento_id INT (10) NOT NULL,
    nombre VARCHAR (50) NOT NULL,
    apellido VARCHAR (50) NOT NULL,
    ntelefono BIGINT (10) NOT NULL,
    correo VARCHAR (100)  
);

CREATE TABLE vehiculo(
    id SMALLINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_cliente SMALLINT NOT NULL ,
    placavehiculo VARCHAR (50) NOT NULL,
    marca VARCHAR (100) NOT NULL,
    modelo VARCHAR (100) NOT NULL,
    año SMALLINT NOT NULL,
    color VARCHAR (50) NOT NULL,

    FOREIGN KEY (id_cliente) REFERENCES cliente (id)
     
);

CREATE TABLE tarifa (
    id SMALLINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_categoria SMALLINT NOT NULL,
    id_vehiculo SMALLINT NOT NULL,
    tarifaporhora FLOAT NOT NULL,
    tarifapordia INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria (id),
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id)

);


CREATE TABLE entradaYsalida(
    id SMALLINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_vehiculo SMALLINT NOT NULL,
    fechahoradentada DATETIME,
    fechahorasalida  DATETIME,
    tarifaplicada INT (100),
    estado VARCHAR (100) NOT NULL ,    

    
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculo (id)
);

CREATE TABLE HistorialPago(
    id SMALLINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_entradaYsalida SMALLINT NOT NULL,
    fechadepago VARCHAR (100) NOT NULL,
    montopagado FLOAT NOT NULL,
    metododepago VARCHAR (50),

    FOREIGN KEY (id_entradaYsalida) REFERENCES entradaYsalida (id)
);


INSERT INTO categoria (tipovehiculo) VALUES
('Automóvil'),
('Motocicleta'),
('Camión'),
('Autobús'),
('Bicicleta'),
('Scooter'),
('Triciclo'),
('Van'),
('Caminoneta'),
('Ciclomotor');


INSERT INTO cliente (Documento_id, nombre, apellido, ntelefono, correo) VALUES
(1111423435, 'Juan', 'Pérez', 9876543210, 'juan@email.com'),
(2932326789, 'María', 'González', 5551234567, 'maria@email.com'),
(1653101112, 'Carlos', 'López', 9998887770, 'carlos@email.com'),
(1006131415, 'Ana', 'Martínez', 4445556661, 'ana@email.com'),
(1642441718, 'Pedro', 'Sánchez', 3332221112, 'pedro@email.com'),
(1923232021, 'Luisa', 'Hernández', 1110002223, 'luisa@email.com'),
(2223243223, 'Roberto', 'Ramírez', 7776665554, 'roberto@email.com'),
(2526274356, 'Laura', 'Torres', 8889990005, 'laura@email.com'),
(2829305444, 'Sofía', 'Díaz', 2223334446, 'sofia@email.com'),
(3132334244, 'Diego', 'Rodríguez', 6667778887, 'diego@email.com');


INSERT INTO vehiculo (id_cliente, placavehiculo, marca, modelo, año, color) VALUES
(1,  'ABC123', 'Toyota', 'Corolla', 2019, 'Rojo'),
(2,  'XYZ789', 'Honda', 'Civic', 2020, 'Azul'),
(3,  'DEF456', 'Ford', 'Focus', 2018, 'Blanco'),
(4,  'GHI789', 'Chevrolet', 'Silverado', 2017, 'Negro'),
(5,  'JKL012', 'GW', 'Grizzly', 2021, 'Plata'),
(6,  'MNO345', 'Hyundai', 'Elantra', 2019, 'Gris'),
(7,  'PQR678', 'Dodge', 'Ram', 2016, 'Verde'),
(8,  'STU901', 'Mazda', 'Mazda3', 2022, 'Blanco'),
(9,  'VWX234', 'Volkswagen', 'Jetta', 2020, 'Azul'),
(10, 'YZA567', 'Kia', 'Optima', 2017, 'Negro');



INSERT INTO tarifa (id_categoria, id_vehiculo, tarifaporhora, tarifapordia) VALUES
(1, 1, 5.000, 30000),
(2, 2, 4.000, 25000),
(3, 3, 6.000, 35000),
(4, 4, 7.500, 40000),
(5, 5, 3.500, 20000),
(6, 6, 5.500, 32000),
(7, 7, 8.000, 45000),
(8, 8, 4.500, 28000),
(9, 9, 5.000, 30000),
(10, 10, 4.000, 25000);


INSERT INTO entradaYsalida (id_vehiculo, fechahoradentada, fechahorasalida, tarifaplicada, estado) VALUES
(1, '2023-10-25 08:00:00', '2023-10-25 12:00:00', 20000, 'Retirado'),
(2, '2023-10-25 01:00:00', '2023-10-25 09:00:00', 40000, 'Retirado'),
(3, '2023-10-25 10:30:00', NULL, NULL, 'Estacionado'),
(4, '2023-10-25 11:45:00', NULL, NULL, 'Estacionado'),
(5, '2023-10-25 13:00:00', NULL, NULL, 'Estacionado'),
(6, '2023-10-25 14:15:00', NULL, NULL, 'Estacionado'),
(7, '2023-10-25 15:30:00', NULL, NULL, 'Estacionado'),
(8, '2023-10-25 16:45:00', NULL, NULL, 'Estacionado'),
(9, '2023-10-25 18:00:00', '2023-10-25 20:30:00', 10000, 'Retirado'),
(10, '2023-10-25 19:15:00', '2023-10-25 19:15:00', 30000, 'Retirado');


INSERT INTO HistorialPago (id_entradaYsalida, fechadepago, montopagado, metododepago) VALUES
(1, '2023-10-25', 20000, 'Tarjeta de crédito'),
(2, '2023-10-26', 40000, 'Efectivo'),
(3, '2023-10-27', NULL, 'Tarjeta de débito'),
(4, '2023-10-28', NULL, 'Efectivo'),
(5, '2023-10-29', NULL, 'Tarjeta de crédito'),
(6, '2023-10-30', NULL, 'Efectivo'),
(7, '2023-10-31', NULL, 'Tarjeta de débito'),
(8, '2023-11-01', NULL, 'Tarjeta de crédito'),
(9, '2023-11-02', 10000, 'Efectivo'),
(10, '2023-11-03', 30000, 'Tarjeta de crédito');

desc categoria;
desc cliente;
desc entradaysalida;
desc historialpago;
desc tarifa;
desc vehiculo;

select * from categoria;
select * from cliente;
select * from entradaYsalida;
select * from historialpago;
select * from tarifa;
select * from vehiculo;

SELECT cliente.id,cliente.nombre, vehiculo.marca,vehiculo.modelo FROM cliente, vehiculo WHERE cliente.id = vehiculo.id_cliente;

--CANTIDAD DE VEHICULOS EN ESA FECHA
SELECT c.tipovehiculo AS Categoria, COUNT(v.id) AS CantidadDeVehiculos
FROM entradaYsalida e
JOIN vehiculo v ON e.id_vehiculo = v.id
JOIN tarifa t ON v.id = t.id_vehiculo
JOIN categoria c ON t.id_categoria = c.id
WHERE e.fechahoradentada BETWEEN '2023-10-25' AND '2023-10-26' 
GROUP BY c.tipovehiculo;


-- ENTRADA DIARIAS

SELECT DATE(e.fechahoradentada) AS fecha, COUNT(*) AS total_ingresos
FROM entradaYsalida e
WHERE DATE(e.fechahoradentada) BETWEEN '2023-10-25' AND '2023-11-03'
GROUP BY DATE(e.fechahoradentada)
ORDER BY fecha;

-- BUSCAR POR ATRIBUTOS

SELECT * FROM vehiculo WHERE color LIKE '%azul%' OR marca LIKE '%Toyota%' ;

-- TIEMPO VEHICULO EN EL PARQUEADERO

SELECT id_vehiculo, TIMESTAMPDIFF(MINUTE, fechahoradentada, fechahorasalida) AS tiempo_en_minutos
FROM entradaYsalida
WHERE fechahoradentada IS NOT NULL
AND fechahorasalida IS NOT NULL;

-- LOS QUE MAS HAN UTILIZADO EL PARQUEADERO FRECUENTEMENTE

SELECT c.nombre, c.apellido, COUNT(e.id) AS total_usos
FROM cliente AS c
JOIN vehiculo AS v ON c.id = v.id_cliente
JOIN entradaYsalida AS e ON v.id = e.id_vehiculo
WHERE e.fechahoradentada >= DATE_SUB(NOW(), INTERVAL 30 DAY)
GROUP BY c.id
ORDER BY total_usos DESC
LIMIT 2;

--INGRESO POR DIA

SELECT e.fechahoradentada AS fecha_entrada, c.tipovehiculo AS categoria, SUM(t.tarifaporhora + t.tarifapordia) AS tarifa
FROM entradaYsalida e
INNER JOIN vehiculo v ON e.id_vehiculo = v.id
INNER JOIN categoria c ON v.id_cliente = c.id
INNER JOIN tarifa t ON c.id = t.id_categoria
GROUP BY e.fechahoradentada, c.tipovehiculo;

-- PROMEDIO INGRESO POR VEHICULO

SELECT AVG(total_ingresos) AS promedio_ingresos_por_vehiculo
FROM (
    SELECT v.id AS id_vehiculo, SUM(t.tarifaporhora + t.tarifapordia) AS total_ingresos
    FROM entradaYsalida e
    INNER JOIN vehiculo v ON e.id_vehiculo = v.id
    INNER JOIN tarifa t ON v.id = t.id_vehiculo
    WHERE e.fechahoradentada BETWEEN DATE_SUB(NOW(), INTERVAL 7 DAY) AND NOW()
    GROUP BY v.id
) AS ingresos_por_vehiculo;

