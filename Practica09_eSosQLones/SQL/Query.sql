/*
 * Una subconsulta es una sentencia "select" anidada en otra sentencia "Select", "INSERT", "UPDATE"
 * o "DELETE" (o en otra subconsulta).
 * Se suele utilizar cuando una consulta es muy compleja, entonces se le divide en varios pasos lógicos.
*/
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

--  1) Los veterinarios y cuidadores que comparten el apellido.
SELECT P.*
FROM persona AS P
WHERE P.apellidopat IN (SELECT P.apellidopat 
						from persona as P
						where P.id_persona in (select T.id_persona  
											   from trabajador as T
											   where T.rfc in (select rfc 
															   from trabajador
															   intersect
															   select rfc
															   from veterinario))
						intersect
						SELECT P.apellidopat 
						from persona as P
						where P.id_persona in (select T.id_persona  
											   from trabajador as T
											   where T.rfc in (select rfc 
															   from trabajador
															   intersect
															   select rfc
															   from cuidador)));
					   
-- Apellidos que se repiten					   
SELECT P.apellidopat 
from persona as P
where P.id_persona in (select T.id_persona  
					   from trabajador as T
					   where T.rfc in (select rfc 
									   from trabajador
									   intersect
									   select rfc
									   from veterinario))
intersect
SELECT P.apellidopat 
from persona as P
where P.id_persona in (select T.id_persona  
					   from trabajador as T
					   where T.rfc in (select rfc 
									   from trabajador
									   intersect
									   select rfc
									   from cuidador));

-- Informacion de los veterinarios
SELECT P.*
from persona as P
where P.id_persona in (select T.id_persona  
					   from trabajador as T
					   where T.rfc in (select rfc 
									   from trabajador
									   intersect
									   select rfc
									   from veterinario));

-- Informacion de los Cuidadores en la tabla Persona
SELECT P.*
from persona as P
where P.id_persona in (select T.id_persona  
					   from trabajador as T
					   where T.rfc in (select rfc 
									   from trabajador
									   intersect
									   select rfc
									   from cuidador));

-- Id de los Veterinarios en la tabla Trabajador
select T.id_persona  
from trabajador as T
where T.rfc in (select rfc 
				from trabajador
				intersect
				select rfc
				from veterinario); 

-- Id de los Veterinarios en la tabla Trabajador con natural join
select id_persona
from veterinario natural join trabajador

-- Id de los Cuidadores en la tabla Trabajador
select T.id_persona  
from trabajador as T
where T.rfc in (select rfc 
				from trabajador
				intersect
				select rfc
				from cuidador); 

-- Id de los Cuidadores en la tabla Trabajador con natural join
select id_persona
from cuidador natural join trabajador			
			
-- 2) Los animales herbivoros que pertenezcan al bioma bosque templado.
SELECT A.*
FROM animal as A
WHERE A.id_animal in (select id_animal 
 					  from animal
					  where alimentacion ilike 'herb_voro'
					  intersect 
					  select id_animal 
					  from bioma
					  where tipo ilike 'bosque templado');

-- Ids que son iguales					 
select id_animal 
from animal
where alimentacion ilike 'herb_voro'
intersect 
select id_animal 
from bioma
where tipo ilike 'bosque templado'

-- Id de los animales que son herbivoros 
select id_animal 
from animal
where alimentacion ilike 'herb_voro'

-- Consulta de tipos de bioma que sean bosque templado sin importar si esta en mayusculas o minusculas 
select id_animal 
from bioma
where tipo ilike 'bosque templado'

-- Consulta de tipos de bioma que sean bosque templado sin importar si esta en mayusculas o minusculas 
select * 
from bioma
where tipo ilike 'bosque templado'

-- 3) Alimentos de tipo semilla, que son distribuidos en el aviario.
select A.*
from alimento as A
where A.id_insumo in (select id_insumo
					  from alimento
					  intersect
					  select D.id_insumo
					  from distribuir as D
					  where D.id_insumo in (SELECT id_insumo
					  FROM Alimento
					  WHERE tipoAlimento ilike 'semilla%'
					  intersect 
					  SELECT id_insumo FROM distribuir)
		                  and 
					      D.id_bioma in (SELECT id_bioma
										 FROM bioma
										 WHERE tipo ilike 'aviario'
										 intersect 
										 SELECT id_bioma FROM distribuir))
intersect
SELECT *
FROM Alimento
WHERE tipoAlimento ilike 'semilla%';

select * from alimento

-- Ids de los alimentos	de tipo semilla, que son distribuidos en el aviario.				
select D.id_insumo
from distribuir as D
where D.id_insumo in (SELECT id_insumo
FROM Alimento
WHERE tipoAlimento ilike 'semilla'
intersect 
SELECT id_insumo FROM distribuir)
					        and 
						    D.id_bioma in (SELECT id_bioma
FROM bioma
WHERE tipo ilike 'aviario'
intersect 
SELECT id_bioma FROM distribuir);
					
-- Ids de los alimentos	de tipo semilla que son distribuidos.				
SELECT id_insumo
FROM Alimento
WHERE tipoAlimento ilike 'semilla'
intersect 
SELECT id_insumo FROM distribuir

-- Ids de los biomas de tipo aviario que se han distribuido insumos
SELECT id_bioma
FROM bioma
WHERE tipo ilike 'aviario'
intersect 
SELECT id_bioma FROM distribuir
					 
-- Ids de los alimentos que son de tipo semilla
SELECT id_insumo,tipoAlimento
FROM Alimento
WHERE tipoAlimento ilike 'semilla'

-- Ids de los biomas que son de tipo aviario
SELECT id_bioma,tipo
FROM bioma
WHERE tipo ilike 'aviario'
					 
-- 4) Los cuidadores y proveedores que vivan en el mismo estado.
select P.*
from persona as P
where P.estado in (SELECT P.estado
				   from persona as P
				   where P.id_persona in (select T.id_persona  
					  				      from trabajador as T
									      where T.rfc in (select rfc 
													      from trabajador
													      intersect
													      select rfc
													      from proveedor))
				   intersect
				   SELECT P.estado
				   from persona as P
				   where P.id_persona in (select T.id_persona  
									      from trabajador as T
									      where T.rfc in (select rfc 
													      from trabajador
													      intersect
													      select rfc
													      from cuidador)));

-- Estados donde viven los proveedores
SELECT P.estado
from persona as P
where P.id_persona in (select T.id_persona  
					   from trabajador as T
					   where T.rfc in (select rfc 
									   from trabajador
									   intersect
									   select rfc
									   from proveedor));

-- Estados donde viven los cuidadores
SELECT P.estado
from persona as P
where P.id_persona in (select T.id_persona  
					   from trabajador as T
					   where T.rfc in (select rfc 
									   from trabajador
									   intersect
									   select rfc
									   from cuidador));

-- Informacion de los cuidadores
SELECT P.*
from persona as P
where P.id_persona in (select T.id_persona  
					   from trabajador as T
					   where T.rfc in (select rfc 
									   from trabajador
									   intersect
									   select rfc
									   from cuidador));

-- 5) Biomas que posean al menos 10 animales.
SELECT tipo, COUNT(*) as num_animales
FROM bioma 
GROUP by tipo having COUNT(*)>=10

-- Ocurrencias de cada tipo de bioma
SELECT tipo, COUNT(*) as num_animales
FROM bioma 
GROUP by tipo

-- Cuenta las tuplas que tienen como tipo de bioma bosque templado  
select count(*) 
from bioma
where tipo ilike 'bosque templado'     