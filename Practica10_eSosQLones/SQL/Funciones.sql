-- 1.- Una función que reciba el identificador de veterinarios y regrese la edad del mismo.

CREATE OR REPLACE FUNCTION calcular_edad_veterinario(id_veterinario INT) RETURNS INT AS $$
DECLARE
    fecha_nacimiento DATE;
BEGIN
    -- Encuentra la fecha de nacimiento del veterinario a partir del id_veterinario
    SELECT p.fecha_nac INTO fecha_nacimiento
    FROM persona p
    JOIN trabajador t ON p.id_persona = t.id_persona
    JOIN veterinario v ON t.rfc = v.rfc
    WHERE p.id_persona = id_veterinario;

    -- Calcula la edad del veterinario basándose en la fecha actual y la fecha de nacimiento
    RETURN EXTRACT(YEAR FROM age(CURRENT_DATE, fecha_nacimiento));
END;
$$ LANGUAGE plpgsql;

SELECT calcular_edad_veterinario(1) AS edad_veterinario;

-- 2.- Una función que reciba el bioma y calcule el n ́umero de animales en ese bioma.

CREATE OR REPLACE FUNCTION calcular_numero_animales_bioma(tipo_bioma VARCHAR) RETURNS INT AS $$
DECLARE
    numero_animales INT;
BEGIN
    -- Obtiene el número de animales del bioma especificado por el tipo
    SELECT num_anim INTO numero_animales
    FROM bioma
    WHERE tipo = tipo_bioma;

    RETURN numero_animales;
END;
$$ LANGUAGE plpgsql;

SELECT calcular_numero_animales_bioma('Selva') AS numero_animales;

