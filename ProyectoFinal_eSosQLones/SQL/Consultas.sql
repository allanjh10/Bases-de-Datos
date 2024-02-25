/*
 * Consulta 1
 * Obtener el listado de proveedores que han tenido contratos por 
 * más de 3 años, incluyendo la cantidad total que se ha gastado en 
 * sus servicios y el número de contratos que han tenido.
 */

SELECT 
    p.RFC_Prov,
    p.Nombre,
    p.ApellidoPat,
    p.ApellidoMat,
    COUNT(*) AS NumeroDeContratos,
    SUM(p.Costo_Serv) AS GastoTotal
FROM 
    proveedor p
WHERE 
    (p.FechaFin_Con::DATE - p.FechaIn_Con::DATE) / 365 > 3
GROUP BY 
    p.RFC_Prov, p.Nombre, p.ApellidoPat, p.ApellidoMat
ORDER BY 
    GastoTotal DESC;


/*
 * Consulta 2
 * Obtener el promedio de altura y peso para cada especie de animal en el zoológico
 */
SELECT 
    especie,
    AVG(altura) AS promedio_altura,
    AVG(peso) AS promedio_peso
FROM 
    animal
GROUP BY 
    especie;


/**
 * Consulta 3
 * Obtener una lista de todos los alimentos que requieren refrigeración
 * junto con la información del proveedor y la fecha de caducidad de estos alimentos.
 */

SELECT 
    a.tipoalimento,
    a.fecha_cad,
    p.nombre,
    p.apellidopat,
    p.apellidomat
FROM 
    alimento a
JOIN 
    proveedor p ON a.rfc_prov = p.rfc_prov
WHERE 
    a.serefrigera = TRUE
ORDER BY 
    a.fecha_cad;

/**
 * Consulta 4
 * Identificar los proveedores cuyos contratos están próximos a vencer en los próximos 180 días
 *  mostrando detalles del proveedor y la fecha de finalización del contrato
 */

SELECT 
    p.rfc_prov,
    p.nombre,
    p.apellidopat,
    p.apellidomat,
    p.costo_serv,
    p.fechafin_con
FROM 
    proveedor p
WHERE 
    p.fechafin_con BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '180 days';


/**
 * Consulta 5
 * Identificar los tipos de alimentos y medicamentos más distribuidos en cada tipo de bioma
 *  lo que puede ayudar a optimizar la logística y el inventario
 */

SELECT 
    b.tipo AS tipo_bioma,
    da.tipo AS tipo_alimento,
    COUNT(da.id_alimento) AS cantidad_alimentos_distribuidos,
    dm.tipo AS tipo_medicamento,
    COUNT(dm.lote) AS cantidad_medicamentos_distribuidos
FROM 
    bioma b
LEFT JOIN 
    distribuir_alim da ON b.tipo = da.tipo
LEFT JOIN 
    distribuir_med dm ON b.tipo = dm.tipo
GROUP BY 
    b.tipo, da.tipo, dm.tipo
ORDER BY 
    cantidad_alimentos_distribuidos DESC, cantidad_medicamentos_distribuidos DESC;

/**
 * Consulta 6
 * Calcular la cantidad promedio de animales asignados a cada cuidador y su salario promedio, para evaluar 
 * la relación entre la carga de trabajo y la compensación
 */

SELECT 
    cu.nombre,
    cu.apellidopat,
    cu.apellidomat,
    COUNT(a.id_animal) AS cantidad_animales_cuidados,
    AVG(cu.salario) AS salario_promedio
FROM 
    cuidador cu
JOIN 
    animal a ON cu.id_animal = a.id_animal
GROUP BY 
    cu.rfc_cuid, cu.nombre, cu.apellidopat, cu.apellidomat;

/**
 * Consulta 7
 * Para cada veterinario especializado en un tipo específico de animal, obtener el promedio de peso de los animales que ha atendido
 * Esto puede ayudar a entender qué tan equipados están los veterinarios para manejar diferentes tamaños y tipos de animales
 */

SELECT 
    v.nombre,
    v.apellidopat,
    v.apellidomat,
    t.tipo,
    AVG(a.peso) AS peso_promedio
FROM 
    veterinario v
JOIN 
    atender at ON v.rfc_vet = at.rfc_vet
JOIN 
    animal a ON at.id_animal = a.id_animal
JOIN 
    trabajar t ON v.rfc_vet = t.rfc_vet
WHERE 
    a.tipo = t.tipo
GROUP BY 
    v.rfc_vet, t.tipo
ORDER BY 
    peso_promedio DESC;


/**
 * Consulta 8
 * Encontrar la proporción de animales atendidos por cada veterinario en comparación con la duración de su contrato
 * para evaluar la eficiencia del veterinario en relación con su experiencia en el zoológico
 */
SELECT 
    v.nombre,
    v.apellidopat,
    v.apellidomat,
    AGE(CURRENT_DATE, v.fechain_con) AS duracion_contrato,
    (COUNT(at.id_animal) / EXTRACT(YEAR FROM AGE(CURRENT_DATE, v.fechain_con))) AS promedio_anual_atendidos
FROM 
    veterinario v
JOIN 
    atender at ON v.rfc_vet = at.rfc_vet
GROUP BY 
    v.rfc_vet
HAVING 
    AGE(CURRENT_DATE, v.fechain_con) > INTERVAL '1 year'
ORDER BY 
    promedio_anual_atendidos DESC;

/**
 * Consulta 9
 * Encontrar clientes que han recibido promociones pero que no han asistido a eventos 
 * lo que puede indicar oportunidades perdidas para aumentar la participación en eventos futuros
 */
SELECT 
    cl.nombre,
    cl.apellidopat,
    cl.apellidomat,
    COUNT(rp.id_promo) AS promociones_recibidas,
    COUNT(DISTINCT asist.id_evento) AS eventos_asistidos
FROM 
    cliente cl
LEFT JOIN 
    recibir_promo rp ON cl.curp = rp.curp
LEFT JOIN 
    asistir asist ON cl.curp = asist.curp
GROUP BY 
    cl.curp
HAVING 
    COUNT(rp.id_promo) > 0 AND COUNT(asist.id_evento) = 0;

/**
 * Consulta 10
 * Listar los clientes según el número de notificaciones de eventos que han recibido
 * lo que puede ser un indicador de su interés en las actividades del zoológico 
 * y una oportunidad para dirigir promociones futuras
 */
SELECT 
    cl.nombre,
    cl.apellidopat,
    cl.apellidomat,
    COUNT(ne.id_noti_evento) AS cantidad_notificaciones_recibidas
FROM 
    cliente cl
LEFT JOIN 
    recibir_noti_even ne ON cl.curp = ne.curp
GROUP BY 
    cl.curp
ORDER BY 
    cantidad_notificaciones_recibidas DESC
LIMIT 15;


/**
 * Consulta 11
 * Encontrar los alimentos que se distribuyen en el Bioma 'Bosque Templado', 'Bosque Tropical' y 'Desierto'
 * y ordenarlos por la cantidad
 */
select a.*, distal.Tipo
from alimento as a join distribuir_alim as distal on a.Id_Alimento = distal.Id_Alimento
	join Bioma as b ON distal.Tipo = b.Tipo
where b.Tipo in ('Bosque Templado', 'Bosque Tropical', 'Desierto')
order by a.Cantidad desc;

/**
 * Consulta 12
 * Devolver el RFC de veterinarios que atienden a animales
 * cuya altura es mayor a 50 
 */
select distinct v.RFC_Vet
from Veterinario as v join atender as aten on v.RFC_Vet = aten.RFC_Vet
	join animal as a on aten.Id_Animal = a.Id_Animal
where a.altura > 50;

/**
 * Consulta 13
 * Devolver el laboratorio de procedencia de todas las medicinas 
 * que se distribuyan en algun tipo de Bosque
 */
select distinct m.labProcedencia
from medicina as m join distribuir_med as distmed on m.Lote = distmed.Lote
	join bioma as b on distmed.Tipo = b.Tipo
where b.Tipo like 'Bosque%';
	
/**
 * Consulta 14
 * Devolver el RFC y el nombre de los proveedores cuya frecuencias es mayor a 15 
 * y ordenarlos de manera ascendiente
 */
select RFC_Prov, Nombre
from Proveedor
where Frecuencia > 15 order by RFC_Prov asc;


/**
 * Consulta 15
 * Animales, devolver su nombre y su id, que son atendidos por veterinarios 
 * cuyo salario es mayor que 800 y que nacieron en la segunda mitad del año.
 * Devolver el nombre del veterinario y su fecha de nacimiento
 */
select a.Id_Animal, a.Nombre, v.Nombre as vet_nombre, v.Fecha_Nac
from animal as a join atender as aten on a.Id_Animal = aten.Id_Animal
	join veterinario as v on aten.RFC_Vet = v.RFC_Vet
where v.salario > 800 and extract(month from v.Fecha_Nac) > 6;
