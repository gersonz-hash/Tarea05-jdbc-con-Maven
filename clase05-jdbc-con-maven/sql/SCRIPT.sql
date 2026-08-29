-- Creamos la base de datos donde almacenaremos toda la información
-- correspondiente a la tarea 5. 
CREATE DATABASE tarea5_db;

-- Seleccionamos la base de datos para indicar que las siguientes
-- tablas y operaciones se realizarán dentro de ella.
USE tarea5_db;

-- Creamos la tabla estudiantes para almacenar la información 
-- de los estudiantes que forman parte de la base de datos.
-- El id es la clave primaria y el carnet es único para evitar
-- que dos estudiantes tengan el mismo número de identificación.

CREATE TABLE estudiantes (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(100) NOT NULL,
carnet VARCHAR(20) UNIQUE NOT NULL,
edad INT
);

-- Creamos la tabla cursos para almacenar
-- la información de los cursos.
-- El id es la clave primaria y el código identifica de forma única
-- cada curso.

CREATE TABLE cursos (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(100) NOT NULL,
codigo VARCHAR(20) UNIQUE NOT NULL,
creditos INT NOT NULL
);

-- Insertamos 5 estudiantes de la tabla estudiantes. 
-- Cada registro contiene nombre, carnet y edad.
-- Correspondiente de cada estudiante.

INSERT INTO estudiantes (nombre, carnet, edad) VALUES
('Carlos Pérez', '20905-25-0001', 20),
('Alondra Marroquín', '0905-25-0002', 21),
('German Morales', '0905-25-0003', 19),
('Maria Gimenez', '0905-25-0004', 22),
('Gerson Zeceña', '0905-25-0005', 19);

-- Insertamos 5 cursos de la tabla cursos
-- Cada registro contiene nombre, codigo y creditos.

INSERT INTO cursos (nombre, codigo, creditos) VALUES
('Programación I', 'PRO001', 5),
('Microeconomía', 'MIC002', 9),
('Física II', 'FIS013', 4),
('Cálculo II', 'CAL014', 2),
('Estadística', 'EST015', 5);

-- Agregamos los nuevos campos solicitados por el ingeniero.
-- activo: 1 significa activo y 0 significa inactivo.
-- tipo indica si el estudiante es de pregrado o posgrado.

-- Usamos la base de datos que vamos a alterar 
USE tarea5_db;
ALTER TABLE estudiantes
ADD activo TINYINT NOT NULL DEFAULT 1,
ADD TIPO ENUM('pregrado', 'posgrado') NOT NULL DEFAULT 'pregrado';

-- actualizamos los estudiantes existentes 
-- Indicando si están activos y su tipo
UPDATE estudiantes
SET activo =1, TIPO ='pregrado'
WHERE id =1;

UPDATE estudiantes
SET activo=0, TIPO ='posgrado'
WHERE id =2;

UPDATE estudiantes
SET activo=1, TIPO ='posgrado'
WHERE id=3;

UPDATE estudiantes 
SET activo=1, TIPO ='pregrado'
WHERE id=4;

UPDATE estudiantes
SET activo=1, TIPO ='posgrado'
WHERE id=5;

-- Insertamos un nuevo estudiante utilizando todos los campos solicitados.
-- activo = 1 indica que el estudiante está activo.
-- TIPO indica si pertenece a pregrado o posgrado.

INSERT INTO estudiantes (nombre, carnet, edad, activo, TIPO)
VALUES('Luis López', '0905-25-0006', 20, 1, 'pregrado');

-- Mostramos los estudiantes que tienen 19 años que están activos.
-- activo =1 significa que el estudiante está activo. 
-- WHERE se utiliza para filtrar los registros que cumplen 
-- con la condición.

SELECT *
FROM estudiantes
WHERE edad =19
AND activo=1;

-- Comprobamos los datos actualizados de los estudiantes.
SELECT id, nombre, edad, activo, TIPO
FROM estudiantes;

-- Mostramos todos los estudiantes ordenados de mayor a menor edad
-- ORDER BY se utiliza para organizar los resultados según
-- la columna edad, usando DESC para mostrar primero las edades mayores.

SELECT *
FROM estudiantes
WHERE activo=1
ORDER BY edad DESC;

SELECT *
FROM estudiantes
WHERE activo=0;

-- Comprobamos que el nuevo estudiante fue almacenado correctamente.
SELECT *
FROM estudiantes;

SELECT COUNT(*) AS total_estudiantes
FROM estudiantes;

DESCRIBE estudiantes