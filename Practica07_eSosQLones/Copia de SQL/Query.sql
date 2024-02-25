-- Veterinarios cuyo nombre empiece con la letra C.
SELECT *
FROM persona NATURAL JOIN trabajador NATURAL JOIN veterinario
WHERE nombre LIKE 'C%';

-- Clientes que hayan nacido en el mes de Junio
SELECT *
FROM cliente NATURAL JOIN persona
WHERE EXTRACT(MONTH FROM Fecha_Nac) = 6;

-- Alimentos cuya fecha de caducidad este entre el 1 de enero de 2023 y del 18 de octubre del 2023
SELECT *
FROM insumo NATURAL JOIN alimento
WHERE fechaCad BETWEEN '2023-01-01' and '2023-10-18';

-- Animales cuya alimentacion sea carnivoro
SELECT *
FROM animal
WHERE alimentacion LIKE 'Carnívoro';

-- Todos los clientes registrados en el zoologico de Huitziltepec
SELECT *
FROM cliente NATURAL JOIN persona;
