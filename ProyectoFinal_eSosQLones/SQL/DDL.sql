/*
Script para la creación de la base de datos Zoologico 
*/

-- Creamos el esquema

DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

-------------TABLAS CON LLAVES PRIMARIAS-----------------
-- Definición de la tabla 'proveedor'
CREATE TABLE proveedor(
	RFC_Prov VARCHAR(13),
	Nombre VARCHAR(50),
	ApellidoPat VARCHAR(50),
	ApellidoMat VARCHAR(50),
	Calle VARCHAR(50),
	Colonia VARCHAR(50),
	Num_Ext INT,
	Num_Int INT,
	Estado VARCHAR(50),
	Fecha_Nac DATE,
	FechaIn_Con DATE,
	FechaFin_Con DATE,
	Costo_Serv FLOAT8,
	Producto VARCHAR(50),
	Frecuencia INT,
	Genero CHAR(1)
);

-- Comentario para la tabla 'proveedor'
COMMENT ON TABLE proveedor IS 'Tabla que contiene a los proveedores';

-- Comentarios para las columnas de la tabla 'proveedor'
COMMENT ON COLUMN proveedor.RFC_Prov IS 'RFC de el proveedor';
COMMENT ON COLUMN proveedor.Nombre IS 'Nombre de el proveedor';
COMMENT ON COLUMN proveedor.ApellidoPat IS 'Apellido paterno de el proveedor';
COMMENT ON COLUMN proveedor.ApellidoMat IS 'Apellido materno de el proveedor';
COMMENT ON COLUMN proveedor.Calle IS 'Calle donde reside el proveedor';
COMMENT ON COLUMN proveedor.Colonia IS 'Colonia o barrio donde reside el proveedor';
COMMENT ON COLUMN proveedor.Num_Ext IS 'Número exterior de la vivienda';
COMMENT ON COLUMN proveedor.Num_Int IS 'Número interior de la vivienda';
COMMENT ON COLUMN proveedor.Estado IS 'Estado o provincia donde reside el proveedor';
COMMENT ON COLUMN proveedor.Fecha_Nac IS 'Fecha de nacimiento de el proveedor';
COMMENT ON COLUMN proveedor.FechaIn_Con IS 'Fecha de inicio de contrato (si aplica)';
COMMENT ON COLUMN proveedor.FechaFin_Con IS 'Fecha de finalización de contrato (si aplica)';
COMMENT ON COLUMN proveedor.Costo_Serv IS 'Costo del servicio del proveedor';
COMMENT ON COLUMN proveedor.Producto IS 'Producto que ofrece el proveedor';
COMMENT ON COLUMN proveedor.Frecuencia IS 'Frecuencia';
COMMENT ON COLUMN proveedor.Genero IS 'Género del proveedor: M para hombre, F para mujer';

--Restricciones Proveedor
--Dominio
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d1
CHECK(LENGTH(RFC_Prov) = 12 OR LENGTH(RFC_Prov) = 13);
COMMENT ON CONSTRAINT proveedor_d1 ON proveedor IS 'El RFC_Prov debe tener longitud 12 o 13';

ALTER TABLE proveedor ADD CONSTRAINT proveedor_d2
CHECK(Nombre <> '');
COMMENT ON CONSTRAINT proveedor_d2 ON proveedor IS 'El nombre no debe estar vacío';

ALTER TABLE proveedor ADD CONSTRAINT proveedor_d3
CHECK(ApellidoPat <> '');
COMMENT ON CONSTRAINT proveedor_d3 ON proveedor IS 'El apellido paterno no debe estar vacío';

ALTER TABLE proveedor ADD CONSTRAINT proveedor_d4
CHECK(ApellidoMat <> '');
COMMENT ON CONSTRAINT proveedor_d4 ON proveedor IS 'El apellido materno no debe estar vacío';

ALTER TABLE proveedor ADD CONSTRAINT proveedor_d5
CHECK(Calle <> '');
COMMENT ON CONSTRAINT proveedor_d5 ON proveedor IS 'La calle no debe estar vacía';

ALTER TABLE proveedor ADD CONSTRAINT proveedor_d6
CHECK(Colonia <> '');
COMMENT ON CONSTRAINT proveedor_d6 ON proveedor IS 'La colonia no debe estar vacía';

ALTER TABLE proveedor ALTER COLUMN Num_Ext
SET NOT NULL;
COMMENT ON COLUMN proveedor.Num_Ext IS 'El número exterior no debe ser nulo';

ALTER TABLE proveedor ALTER COLUMN Num_Int
SET NOT NULL;
COMMENT ON COLUMN proveedor.Num_Int IS 'El número interior no debe ser nulo';

ALTER TABLE proveedor ADD CONSTRAINT proveedor_d7
CHECK(Estado <> '');
COMMENT ON CONSTRAINT proveedor_d7 ON proveedor IS 'El estado no debe estar vacío';

ALTER TABLE proveedor ALTER COLUMN Fecha_Nac
SET NOT NULL;
COMMENT ON COLUMN proveedor.Fecha_Nac IS 'La fecha de nacimiento del proveedor no debe ser nulo';

ALTER TABLE proveedor ALTER COLUMN FechaIn_Con
SET NOT NULL;
COMMENT ON COLUMN proveedor.FechaIn_Con IS 'La fecha de inicio de contrato del proveedor(si aplica) no debe ser nulo';

ALTER TABLE proveedor ALTER COLUMN FechaFin_Con
SET NOT NULL;
COMMENT ON COLUMN proveedor.FechaFin_Con IS 'La fecha de finalizacion de contrato del proveedor(si aplica) no debe ser nulo';

ALTER TABLE proveedor ALTER COLUMN Costo_Serv
SET NOT null;
COMMENT ON COLUMN proveedor.Costo_Serv IS 'El costo del servicio no debe ser nulo';

ALTER TABLE proveedor ADD CONSTRAINT proveedor_d8
CHECK(Producto <> ''); 
COMMENT ON CONSTRAINT proveedor_d8 ON proveedor IS 'El producto no debe estar vacío';

ALTER TABLE proveedor ALTER COLUMN Frecuencia
SET NOT null;
COMMENT ON COLUMN proveedor.Frecuencia IS 'La frecuencia no debe ser nulo';

ALTER TABLE proveedor ADD CONSTRAINT proveedor_d9
CHECK(Genero = 'M' OR Genero = 'F');
COMMENT ON CONSTRAINT proveedor_d9 ON proveedor IS 'El género debe ser M (hombre) o F (mujer)';

--Entidad
ALTER TABLE proveedor ADD CONSTRAINT proveedor_pkey
PRIMARY KEY(RFC_Prov);
COMMENT ON CONSTRAINT proveedor_pkey ON proveedor IS 'Llave primaria para la tabla proveedor basada en el RFC del proveedor';

-- Definición de la tabla 'cliente'
CREATE TABLE cliente(
	CURP CHAR(18),
	Nombre VARCHAR(50),
	ApellidoPat VARCHAR(50),
	ApellidoMat VARCHAR(50),
	Genero CHAR(1)
);

-- Comentario para la tabla 'cliente'
COMMENT ON TABLE cliente IS 'Tabla que contiene a los clientes';

-- Comentarios para las columnas de la tabla 'cliente'
COMMENT ON COLUMN cliente.CURP IS 'CURP de el cliente';
COMMENT ON COLUMN cliente.Nombre IS 'Nombre de el cliente';
COMMENT ON COLUMN cliente.ApellidoPat IS 'Apellido paterno de el cliente';
COMMENT ON COLUMN cliente.ApellidoMat IS 'Apellido materno de el cliente';
COMMENT ON COLUMN cliente.Genero IS 'Género de la persona: H para hombre, F para mujer';

--Restricciones Cliente
--Dominio
ALTER TABLE cliente ADD CONSTRAINT cliente_d1
CHECK(CURP <> '');
COMMENT ON CONSTRAINT cliente_d1 ON cliente IS 'El CURP no debe ser vacío';

ALTER TABLE cliente ADD CONSTRAINT cliente_d2
CHECK(Nombre <> '');
COMMENT ON CONSTRAINT cliente_d2 ON cliente IS 'El nombre no debe estar vacío';

ALTER TABLE cliente ADD CONSTRAINT cliente_d3
CHECK(ApellidoPat <> '');
COMMENT ON CONSTRAINT cliente_d3 ON cliente IS 'El apellido paterno no debe estar vacío';

ALTER TABLE cliente ADD CONSTRAINT cliente_d4
CHECK(ApellidoMat <> '');
COMMENT ON CONSTRAINT cliente_d4 ON cliente IS 'El apellido materno no debe estar vacío';

ALTER TABLE cliente ADD CONSTRAINT cliente_d5
CHECK(Genero = 'M' OR Genero  = 'F');
COMMENT ON CONSTRAINT cliente_d5 ON cliente IS 'El género debe ser M (hombre) o F (mujer)';

--Entidad
ALTER TABLE cliente ADD CONSTRAINT cliente_pkey
PRIMARY KEY(CURP);
COMMENT ON CONSTRAINT cliente_pkey ON cliente IS 'Llave primaria para la tabla cliente basada en la CURP';


-- Definición de la tabla 'veterinario'
CREATE TABLE veterinario(
	RFC_Vet VARCHAR(13),
	Nombre VARCHAR(50),
	ApellidoPat VARCHAR(50),
	ApellidoMat VARCHAR(50),
	Calle VARCHAR(50),
	Colonia VARCHAR(50),
	Num_Ext INT,
	Num_Int INT,
	Estado VARCHAR(50),
	Fecha_Nac DATE,
	FechaIn_Con DATE,
	FechaFin_Con DATE,
	Salario FLOAT8,
	Genero CHAR(1)
);

-- Comentario para la tabla 'veterinario'
COMMENT ON TABLE veterinario IS 'Tabla que contiene a los veterinario';

-- Comentarios para las columnas de la tabla 'veterinario'
COMMENT ON COLUMN veterinario.RFC_Vet IS 'RFC de el veterinario';
COMMENT ON COLUMN veterinario.Nombre IS 'Nombre de el veterinario';
COMMENT ON COLUMN veterinario.ApellidoPat IS 'Apellido paterno de el veterinario';
COMMENT ON COLUMN veterinario.ApellidoMat IS 'Apellido materno de el veterinario';
COMMENT ON COLUMN veterinario.Calle IS 'Calle donde reside el veterinario';
COMMENT ON COLUMN veterinario.Colonia IS 'Colonia o barrio donde reside el veterinario';
COMMENT ON COLUMN veterinario.Num_Ext IS 'Número exterior de la vivienda';
COMMENT ON COLUMN veterinario.Num_Int IS 'Número interior de la vivienda';
COMMENT ON COLUMN veterinario.Estado IS 'Estado o provincia donde reside el veterinario';
COMMENT ON COLUMN veterinario.Fecha_Nac IS 'Fecha de nacimiento de el veterinario';
COMMENT ON COLUMN veterinario.FechaIn_Con IS 'Fecha de inicio de contrato (si aplica)';
COMMENT ON COLUMN veterinario.FechaFin_Con IS 'Fecha de finalización de contrato (si aplica)';
COMMENT ON COLUMN veterinario.Salario IS 'Salario del veterinario';
COMMENT ON COLUMN veterinario.Genero IS 'Género del veterinario: H para hombre, F para mujer';

--Restricciones Veterinario
--Dominio
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d1
CHECK(LENGTH(RFC_Vet) = 12 OR LENGTH(RFC_Vet) = 13);
COMMENT ON CONSTRAINT veterinario_d1 ON veterinario IS 'El RFC_Vet no debe ser vacío';

ALTER TABLE veterinario ADD CONSTRAINT veterinario_d2
CHECK(Nombre <> '');
COMMENT ON CONSTRAINT veterinario_d2 ON veterinario IS 'El nombre no debe estar vacío';

ALTER TABLE veterinario ADD CONSTRAINT veterinario_d3
CHECK(ApellidoPat <> '');
COMMENT ON CONSTRAINT veterinario_d3 ON veterinario IS 'El apellido paterno no debe estar vacío';

ALTER TABLE veterinario ADD CONSTRAINT veterinario_d4
CHECK(ApellidoMat <> '');
COMMENT ON CONSTRAINT veterinario_d4 ON veterinario IS 'El apellido materno no debe estar vacío';

ALTER TABLE veterinario ADD CONSTRAINT veterinario_d5
CHECK(Calle <> '');
COMMENT ON CONSTRAINT veterinario_d5 ON veterinario IS 'La calle no debe estar vacía';

ALTER TABLE veterinario ADD CONSTRAINT veterinario_d6
CHECK(Colonia <> '');
COMMENT ON CONSTRAINT veterinario_d6 ON veterinario IS 'La colonia no debe estar vacía';

ALTER TABLE veterinario ALTER COLUMN Num_Ext
SET NOT NULL;
COMMENT ON COLUMN veterinario.Num_Ext IS 'El número exterior no debe ser nulo';

ALTER TABLE veterinario ALTER COLUMN Num_Int
SET NOT NULL;
COMMENT ON COLUMN veterinario.Num_Int IS 'El número interior no debe ser nulo';

ALTER TABLE veterinario ADD CONSTRAINT veterinario_d7
CHECK(Estado <> '');
COMMENT ON CONSTRAINT veterinario_d7 ON veterinario IS 'El estado no debe estar vacío';

ALTER TABLE veterinario ALTER COLUMN Fecha_Nac
SET NOT NULL;
COMMENT ON COLUMN veterinario.Fecha_Nac IS 'La fecha de nacimiento del proveedor no debe ser nulo';

ALTER TABLE veterinario ALTER COLUMN FechaIn_Con
SET NOT NULL;
COMMENT ON COLUMN veterinario.FechaIn_Con IS 'La fecha de inicio de contrato del proveedor(si aplica) no debe ser nulo';

ALTER TABLE veterinario ALTER COLUMN FechaFin_Con
SET NOT NULL;
COMMENT ON COLUMN veterinario.FechaFin_Con IS 'La fecha de finalizacion de contrato del proveedor(si aplica) no debe ser nulo';

ALTER TABLE veterinario ALTER COLUMN Salario
SET NOT NULL;
COMMENT ON COLUMN veterinario.Salario IS 'El salario no debe ser nulo';

ALTER TABLE veterinario ADD CONSTRAINT veterinario_d8
CHECK(Genero = 'M' OR Genero = 'F');
COMMENT ON CONSTRAINT veterinario_d8 ON veterinario IS 'El género debe ser M (hombre) o F (mujer)';

--Entidad
ALTER TABLE veterinario ADD CONSTRAINT veterinario_pkey
PRIMARY KEY(RFC_Vet);
COMMENT ON CONSTRAINT veterinario_pkey ON veterinario IS 'Llave primaria para la tabla proveedor basada en el RFC del veterinario';

-- Definición de la tabla 'bioma'
CREATE TABLE bioma(
	Tipo VARCHAR(50)
);

-- Comentario para la tabla 'bioma'
COMMENT ON TABLE bioma IS 'Tabla que contiene los tipos de biomas';

-- Comentarios para las columnas de la tabla 'indicacionesMed'
COMMENT ON COLUMN bioma.Tipo IS 'Tipo de bioma';

--Restricciones bioma
--Dominio
ALTER TABLE bioma ADD CONSTRAINT bioma_d1
CHECK(Tipo <> '');
COMMENT ON CONSTRAINT bioma_d1 ON bioma IS 'El tipo de bioma no debe ser vacío';

--Entidad
ALTER TABLE bioma ADD CONSTRAINT bioma_pkey
PRIMARY KEY(Tipo);
COMMENT ON CONSTRAINT bioma_pkey ON bioma IS 'Llave primaria para la tabla bioma basada en el tipo de bioma';


-- Definición de la tabla 'evento'
CREATE TABLE evento(
	Id_Evento INT,
	Capacidad INT,
	tipoEvento VARCHAR(50),
	Fecha DATE
);

-- Comentario para la tabla 'evento'
COMMENT ON TABLE evento IS 'Tabla que contiene informacion sobre los eventos';

-- Comentarios para las columnas de la tabla 'evento'
COMMENT ON COLUMN evento.Id_Evento IS 'Id del evento';
COMMENT ON COLUMN evento.Capacidad IS 'La capacidad que tendra el evento';
COMMENT ON COLUMN evento.tipoEvento IS 'El tipo de evento';
COMMENT ON COLUMN evento.Fecha IS 'La fecha del evento';

--Restricciones evento
--Dominio
ALTER TABLE evento ALTER COLUMN Id_Evento
SET NOT NULL;
COMMENT ON COLUMN evento.Id_Evento IS 'El id del evento no debe ser nulo';

ALTER TABLE evento ALTER COLUMN Capacidad
SET NOT NULL;
COMMENT ON COLUMN evento.Capacidad IS 'La capacidad del evento no debe ser nulo';

ALTER TABLE evento ADD CONSTRAINT evento_d1
CHECK(tipoEvento <> '');
COMMENT ON CONSTRAINT evento_d1 ON evento IS 'Los tipos de evento no deben ser vacíos';

ALTER TABLE evento ALTER COLUMN Fecha
SET NOT NULL;
COMMENT ON COLUMN evento.Fecha IS 'La fecha del evento no debe ser nulo';

ALTER TABLE evento ADD CONSTRAINT evento_d2
CHECK(Fecha >= CURRENT_DATE);
COMMENT ON CONSTRAINT evento_d2 ON evento IS 'La fecha no puede ser antes de la fecha de hoy';

--Entidad
ALTER TABLE evento ADD CONSTRAINT evento_pkey
PRIMARY KEY(Id_Evento);
COMMENT ON CONSTRAINT evento_pkey ON evento IS 'Llave primaria para la tabla evento basada en el Id del evento';

----------------------------------------------------- Termina tablas con PK -------------------------------------------------------------------------

------------TABLAS CON LLAVES PRIMARIAS Y FORANEAS---------------

-- Definición de la tabla 'animal'
CREATE TABLE animal(
	Id_Animal INT,
	Tipo VARCHAR(50),
	Especie VARCHAR(50),
	Num_Jaula INT,
	Nombre VARCHAR(50),
	Alimentacion VARCHAR(80),
	Sexo CHAR(1),
	Altura FLOAT8,
	Peso FLOAT8
);

-- Comentario para la tabla 'animal'
COMMENT ON TABLE animal IS 'Tabla que contiene a los animales';

-- Comentarios para las columnas de la tabla 'animal'
COMMENT ON COLUMN animal.Id_Animal IS 'Identificador único para el animal';
COMMENT ON COLUMN animal.Tipo IS 'Tipo de bioma del animal';
COMMENT ON COLUMN animal.Especie IS 'Especie del animal';
COMMENT ON COLUMN animal.Num_Jaula IS 'Número de la jaula del animal';
COMMENT ON COLUMN animal.Nombre IS 'Nombre del animal';
COMMENT ON COLUMN animal.Alimentacion IS 'Descripción de la alimentación del animal';
COMMENT ON COLUMN animal.Sexo IS 'Género del animal: M para hombre, F para mujer';
COMMENT ON COLUMN animal.Altura IS 'Altura del animal en metros';
COMMENT ON COLUMN animal.Peso IS 'Peso del animal en kilogramos';

--Restricciones Animal
--Dominio
ALTER TABLE animal ALTER COLUMN Id_Animal
SET NOT NULL;
COMMENT ON COLUMN animal.Id_Animal IS 'El Id_Animal no debe ser nulo';

ALTER TABLE animal ADD CONSTRAINT animal_d1
CHECK(Tipo <> '');
COMMENT ON COLUMN animal.Tipo IS 'El Tipo de bioma no debe ser nulo';

ALTER TABLE animal ALTER COLUMN Num_Jaula
SET NOT NULL;
COMMENT ON COLUMN animal.Num_Jaula IS 'El número de jaula no debe ser nulo';

ALTER TABLE animal ADD CONSTRAINT animal_d2
CHECK(Num_Jaula > 0);
COMMENT ON CONSTRAINT animal_d2 ON animal IS 'El número de jaula debe ser mayor que cero';

ALTER TABLE animal ADD CONSTRAINT animal_d3
CHECK(Nombre <> '');
COMMENT ON CONSTRAINT animal_d3 ON animal IS 'El nombre del animal no debe estar vacío';

ALTER TABLE animal ADD CONSTRAINT animal_d4
CHECK(Alimentacion <> '');
COMMENT ON CONSTRAINT animal_d4 ON animal IS 'La descripción de la alimentación no debe estar vacía';

ALTER TABLE animal ADD CONSTRAINT animal_d5
CHECK(Sexo = 'M' OR Sexo = 'F');
COMMENT ON CONSTRAINT animal_d5 ON animal IS 'El género debe ser M (hombre) o F (mujer)';

ALTER TABLE animal ALTER COLUMN Altura
SET NOT NULL;
COMMENT ON COLUMN animal.Altura IS 'La altura no debe ser nula';

ALTER TABLE animal ADD CONSTRAINT animal_d6
CHECK(Altura > 0);
COMMENT ON CONSTRAINT animal_d6 ON animal IS 'La altura debe ser mayor que cero';

ALTER TABLE animal ALTER COLUMN Peso
SET NOT NULL;
COMMENT ON COLUMN animal.Peso IS 'El peso no debe ser nulo';

ALTER TABLE animal ADD CONSTRAINT animal_d7
CHECK(Peso > 0);
COMMENT ON CONSTRAINT animal_d7 ON animal IS 'El peso debe ser mayor que cero';

ALTER TABLE animal ADD CONSTRAINT animal_d8
CHECK(Especie <> '');
COMMENT ON CONSTRAINT animal_d8 ON animal IS 'La especie del animal no debe estar vacía';

--Entidad
ALTER TABLE animal ADD CONSTRAINT animal_pkey
PRIMARY KEY(Id_Animal);
COMMENT ON CONSTRAINT animal_pkey ON animal IS 'Llave primaria para la tabla animal basada en el Id_Animal';

--Referencial
ALTER TABLE animal ADD CONSTRAINT animal_fkey
FOREIGN KEY(Tipo) REFERENCES bioma(Tipo);
COMMENT ON CONSTRAINT animal_fkey ON animal IS 'Llave foránea que relaciona el animal con un bioma en la tabla bioma mediante el Tipo';

-- Definición de la tabla 'cuidador'
CREATE TABLE cuidador(
	RFC_Cuid VARCHAR(13),
	Id_Animal INT,
	Tipo VARCHAR(50),
	Nombre VARCHAR(50),
	ApellidoPat VARCHAR(50),
	ApellidoMat VARCHAR(50),
	Calle VARCHAR(50),
	Colonia VARCHAR(50),
	Num_Ext INT,
	Num_Int INT,
	Estado VARCHAR(50),
	Fecha_Nac DATE,
	FechaIn_Con DATE,
	FechaFin_Con DATE,
	Hora_Entrada TIME,
	Hora_Salida TIME,
	Dias_Trab INT,
	Salario FLOAT8,
	Genero CHAR(1)
);

-- Comentario para la tabla 'cuidador'
COMMENT ON TABLE cuidador IS 'Tabla que contiene a los cuidadores';

-- Comentarios para las columnas de la tabla 'proveedor'
COMMENT ON COLUMN cuidador.RFC_Cuid IS 'RFC de el cuidador';
COMMENT ON COLUMN cuidador.Id_Animal IS 'Id del animal que cuida el cuidador';
COMMENT ON COLUMN cuidador.Tipo IS 'Tipo de bioma donde trabaja el cuidador';
COMMENT ON COLUMN cuidador.Nombre IS 'Nombre de el cuidador';
COMMENT ON COLUMN cuidador.ApellidoPat IS 'Apellido paterno de el cuidador';
COMMENT ON COLUMN cuidador.ApellidoMat IS 'Apellido materno de el cuidador';
COMMENT ON COLUMN cuidador.Calle IS 'Calle donde reside el cuidador';
COMMENT ON COLUMN cuidador.Colonia IS 'Colonia o barrio donde reside el cuidador';
COMMENT ON COLUMN cuidador.Num_Ext IS 'Número exterior de la vivienda';
COMMENT ON COLUMN cuidador.Num_Int IS 'Número interior de la vivienda';
COMMENT ON COLUMN cuidador.Estado IS 'Estado o provincia donde reside el cuidador';
COMMENT ON COLUMN cuidador.Fecha_Nac IS 'Fecha de nacimiento de el cuidador';
COMMENT ON COLUMN cuidador.FechaIn_Con IS 'Fecha de inicio de contrato (si aplica)';
COMMENT ON COLUMN cuidador.FechaFin_Con IS 'Fecha de finalización de contrato (si aplica)';
COMMENT ON COLUMN cuidador.Hora_Entrada IS 'Hora de entrada del cuidador';
COMMENT ON COLUMN cuidador.Hora_Salida IS 'Hora de salida del cuidador';
COMMENT ON COLUMN cuidador.Dias_Trab IS 'Dias que trabaja el cuidador';
COMMENT ON COLUMN cuidador.Salario IS 'Salario del cuidador';
COMMENT ON COLUMN cuidador.Genero IS 'Género del cuidador: H para hombre, F para mujer';

--Restricciones Cuidador
--Dominio
ALTER TABLE cuidador ALTER COLUMN Id_Animal
SET NOT NULL;
COMMENT ON COLUMN cuidador.Id_Animal IS 'El Id_Animal no debe ser nulo';

ALTER TABLE cuidador ADD CONSTRAINT cuidador_d1
CHECK(LENGTH(RFC_Cuid) = 12 OR LENGTH(RFC_Cuid) = 13);
COMMENT ON CONSTRAINT cuidador_d1 ON cuidador IS 'El RFC_Cuid debe tener longitud 12 o 13';

ALTER TABLE cuidador ADD CONSTRAINT cuidador_d2
CHECK(Tipo <> '');
COMMENT ON CONSTRAINT cuidador_d2 ON cuidador IS 'El Tipo de bioma no debe estar vacío';

ALTER TABLE cuidador ADD CONSTRAINT cuidador_d3
CHECK(Nombre <> '');
COMMENT ON CONSTRAINT cuidador_d3 ON cuidador IS 'El nombre no debe estar vacío';

ALTER TABLE cuidador ADD CONSTRAINT cuidador_d4
CHECK(ApellidoPat <> '');
COMMENT ON CONSTRAINT cuidador_d4 ON cuidador IS 'El apellido paterno no debe estar vacío';

ALTER TABLE cuidador ADD CONSTRAINT cuidador_d5
CHECK(ApellidoMat <> '');
COMMENT ON CONSTRAINT cuidador_d5 ON cuidador IS 'El apellido materno no debe estar vacío';

ALTER TABLE cuidador ADD CONSTRAINT cuidador_d6
CHECK(Calle <> '');
COMMENT ON CONSTRAINT cuidador_d6 ON cuidador IS 'La calle no debe estar vacía';

ALTER TABLE cuidador ADD CONSTRAINT cuidador_d7
CHECK(Colonia <> '');
COMMENT ON CONSTRAINT cuidador_d7 ON cuidador IS 'La colonia no debe estar vacía';

ALTER TABLE cuidador ALTER COLUMN Num_Ext
SET NOT NULL;
COMMENT ON COLUMN cuidador.Num_Ext IS 'El número exterior no debe ser nulo';

ALTER TABLE cuidador ALTER COLUMN Num_Int
SET NOT NULL;
COMMENT ON COLUMN cuidador.Num_Int IS 'El número interior no debe ser nulo';

ALTER TABLE cuidador ADD CONSTRAINT cuidador_d8
CHECK(Estado <> '');
COMMENT ON CONSTRAINT cuidador_d8 ON cuidador IS 'El estado no debe estar vacío';

ALTER TABLE cuidador ALTER COLUMN Fecha_Nac
SET NOT NULL;
COMMENT ON COLUMN cuidador.Fecha_Nac IS 'La fecha de nacimiento del cuidador no debe ser nulo';

ALTER TABLE cuidador ALTER COLUMN FechaIn_Con
SET NOT NULL;
COMMENT ON COLUMN cuidador.FechaIn_Con IS 'La fecha de inicio de contrato del cuidador(si aplica) no debe ser nulo';

ALTER TABLE cuidador ALTER COLUMN FechaFin_Con
SET NOT NULL;
COMMENT ON COLUMN cuidador.FechaFin_Con IS 'La fecha de finalizacion de contrato del cuidador(si aplica) no debe ser nulo';

ALTER TABLE cuidador ALTER COLUMN Hora_Entrada
SET NOT NULL;
COMMENT ON COLUMN cuidador.Hora_Entrada IS 'La hora de entrada no debe ser nulo';

ALTER TABLE cuidador ALTER COLUMN Hora_Salida
SET NOT NULL;
COMMENT ON COLUMN cuidador.Hora_Salida IS 'La hora de salida no debe ser nulo';

ALTER TABLE cuidador ALTER COLUMN Dias_Trab
SET NOT NULL;
COMMENT ON COLUMN cuidador.Dias_Trab IS 'Los Dias_Trab no deben ser nulos';

ALTER TABLE cuidador ALTER COLUMN Salario
SET NOT NULL;
COMMENT ON COLUMN cuidador.Salario IS 'El salario no debe ser nulo';

ALTER TABLE cuidador ADD CONSTRAINT cuidador_d9
UNIQUE(Id_Animal);
COMMENT ON CONSTRAINT cuidador_d9 ON cuidador IS 'El Id_Animal debe ser unico';

ALTER TABLE cuidador ADD CONSTRAINT cuidador_d10
CHECK(Genero = 'M' OR Genero = 'F');
COMMENT ON CONSTRAINT cuidador_d10 ON cuidador IS 'El género debe ser M (hombre) o F (mujer)';

--Entidad
ALTER TABLE cuidador ADD CONSTRAINT cuidador_pkey
PRIMARY KEY(RFC_Cuid);
COMMENT ON CONSTRAINT cuidador_pkey ON cuidador IS 'Llave primaria para la tabla cuidador basada en el RFC del cuidador';

--Referencial
ALTER TABLE cuidador ADD CONSTRAINT cuidador_fkey1
FOREIGN KEY(Id_Animal) REFERENCES animal(Id_Animal);
COMMENT ON CONSTRAINT cuidador_fkey1 ON cuidador IS 'Llave foránea que relaciona el cuidador con un animal en la tabla animal mediante el Id_Animal';

ALTER TABLE cuidador ADD CONSTRAINT cuidador_fkey2
FOREIGN KEY(Tipo) REFERENCES bioma(Tipo);
COMMENT ON CONSTRAINT cuidador_fkey2 ON cuidador IS 'Llave foránea que relaciona el cuidador con un bioma en la tabla bioma mediante el Tipo';

-- Definición de la tabla 'Especialidad'
CREATE TABLE especialidad(
	Especialidad VARCHAR(50),
	RFC_Vet VARCHAR(13)
);

-- Comentario para la tabla 'especialidad'
COMMENT ON TABLE especialidad IS 'Tabla que contiene las especialidades de los veterinario';

-- Comentarios para las columnas de la tabla 'veterinario'
COMMENT ON COLUMN especialidad.Especialidad IS 'Especialidad de el veterinario';
COMMENT ON COLUMN especialidad.RFC_Vet IS 'RFC de el veterinario';

--Restricciones Especialidad
--Dominio
ALTER TABLE especialidad ADD CONSTRAINT especialidad_d1
CHECK(LENGTH(RFC_Vet) = 12 OR LENGTH(RFC_Vet) = 13);
COMMENT ON CONSTRAINT especialidad_d1 ON especialidad IS 'El RFC_Vet no debe ser vacío';

ALTER TABLE especialidad ADD CONSTRAINT especialidad_d2
CHECK(Especialidad <> '');
COMMENT ON CONSTRAINT especialidad_d2 ON especialidad IS 'La especialidad no debe estar vacío';

--Entidad
ALTER TABLE especialidad ADD CONSTRAINT especialidad_pkey
PRIMARY KEY(Especialidad,RFC_Vet);
COMMENT ON CONSTRAINT especialidad_pkey ON especialidad IS 'Llaves primarias para la tabla proveedor basada en la especialidad';

--Referencial
ALTER TABLE especialidad ADD CONSTRAINT especialidad_fkey
FOREIGN KEY(RFC_Vet) REFERENCES veterinario(RFC_Vet) ON DELETE CASCADE;
COMMENT ON CONSTRAINT especialidad_fkey ON especialidad IS 'Llave foranea que referencia a veterinario';

-- Definición de la tabla 'CorreoClien'
CREATE TABLE correoClien(
	CURP CHAR(18),
	Correo_Clien VARCHAR(50)
);

-- Comentario para la tabla 'correoClien'
COMMENT ON TABLE correoClien IS 'Tabla que contiene los correos de los clientes';

-- Comentarios para las columnas de la tabla 'correoClien'
COMMENT ON COLUMN correoClien.CURP IS 'CURP de el cliente';
COMMENT ON COLUMN correoClien.Correo_Clien IS 'Correo de el cliente';

--Restricciones correoClien
--Dominio
ALTER TABLE correoClien ADD CONSTRAINT correoClien_d1
CHECK(CURP <> '');
COMMENT ON CONSTRAINT correoClien_d1 ON correoClien IS 'El CURP no debe ser vacío';

ALTER TABLE correoClien ADD CONSTRAINT correoClien_d2
CHECK(Correo_Clien <> '');
COMMENT ON CONSTRAINT correoClien_d2 ON correoClien IS 'El correo no debe estar vacío';

--Entidad
ALTER TABLE correoClien ADD CONSTRAINT correoClien_pkey
PRIMARY KEY(CURP,Correo_Clien);
COMMENT ON CONSTRAINT correoClien_pkey ON correoClien IS 'Llaves primarias para la tabla proveedor basada en el correoClien';

--Referencial
ALTER TABLE correoClien ADD CONSTRAINT correoClien_fkey
FOREIGN KEY(CURP) REFERENCES cliente(CURP) ON DELETE CASCADE;
COMMENT ON CONSTRAINT correoClien_fkey ON correoClien IS 'Llave foranea que referencia a cliente';

-- Definición de la tabla 'TelClien'
CREATE TABLE telClien(
	CURP CHAR(18),
	Tel_Clien VARCHAR(12)
);

-- Comentario para la tabla 'TelClien'
COMMENT ON TABLE telClien IS 'Tabla que contiene los telefono de los clientes';

-- Comentarios para las columnas de la tabla 'telClien'
COMMENT ON COLUMN telClien.CURP IS 'CURP de el cliente';
COMMENT ON COLUMN telClien.Tel_Clien IS 'Telefono de el cliente';

--Restricciones telClien
--Dominio
ALTER TABLE telClien ADD CONSTRAINT telClien_d1
CHECK(CURP <> '');
COMMENT ON CONSTRAINT telClien_d1 ON telClien IS 'El CURP no debe ser vacío';

ALTER TABLE telClien ADD CONSTRAINT telClien_d2
CHECK(Tel_Clien <> '');
COMMENT ON CONSTRAINT telClien_d2 ON telClien IS 'El telefono no debe estar vacío';

--Entidad
ALTER TABLE telClien ADD CONSTRAINT telClien_pkey
PRIMARY KEY(CURP,Tel_Clien);
COMMENT ON CONSTRAINT telClien_pkey ON telClien IS 'Llaves primarias para la tabla proveedor basada en el telClien';

--Referencial
ALTER TABLE telClien ADD CONSTRAINT telClien_fkey
FOREIGN KEY(CURP) REFERENCES cliente(CURP) ON DELETE CASCADE;
COMMENT ON CONSTRAINT telClien_fkey ON telClien IS 'Llave foranea que referencia a cliente';

-- Definición de la tabla 'CorreoVet'
CREATE TABLE correoVet(
	RFC_Vet VARCHAR(13),
	Correo_Vet VARCHAR(50)
);

-- Comentario para la tabla 'correoVet'
COMMENT ON TABLE correoVet IS 'Tabla que contiene los correos de los veterinarios';

-- Comentarios para las columnas de la tabla 'correoVet'
COMMENT ON COLUMN correoVet.RFC_Vet IS 'RFC de el veterinario';
COMMENT ON COLUMN correoVet.Correo_Vet IS 'Correo de el veterinario';

--Restricciones correoVet
--Dominio
ALTER TABLE correoVet ADD CONSTRAINT correoVet_d1
CHECK(LENGTH(RFC_Vet) = 12 OR LENGTH(RFC_Vet) = 13);
COMMENT ON CONSTRAINT correoVet_d1 ON correoVet IS 'El RFC no debe ser vacío';

ALTER TABLE correoVet ADD CONSTRAINT correoVet_d2
CHECK(Correo_Vet <> '');
COMMENT ON CONSTRAINT correoVet_d2 ON correoVet IS 'El correo no debe estar vacío';

--Entidad
ALTER TABLE correoVet ADD CONSTRAINT correoVet_pkey
PRIMARY KEY(RFC_Vet,Correo_Vet);
COMMENT ON CONSTRAINT correoVet_pkey ON correoVet IS 'Llaves primarias para la tabla proveedor basada en el correoVet';

--Referencial
ALTER TABLE correoVet ADD CONSTRAINT correoVet_fkey
FOREIGN KEY(RFC_Vet) REFERENCES veterinario(RFC_Vet) ON DELETE CASCADE;
COMMENT ON CONSTRAINT correoVet_fkey ON correoVet IS 'Llave foranea que referencia a veterinario';

-- Definición de la tabla 'TelVet'
CREATE TABLE telVet(
	RFC_Vet CHAR(18),
	Tel_Vet VARCHAR(12)
);

-- Comentario para la tabla 'TelVet'
COMMENT ON TABLE telVet IS 'Tabla que contiene los telefono de los veterinarios';

-- Comentarios para las columnas de la tabla 'telVet'
COMMENT ON COLUMN telVet.RFC_Vet IS 'RFC de el veterinario';
COMMENT ON COLUMN telVet.Tel_Vet IS 'Telefono de el veterinario';

--Restricciones telVet
--Dominio
ALTER TABLE telVet ADD CONSTRAINT telVet_d1
CHECK(LENGTH(RFC_Vet) = 12 OR LENGTH(RFC_Vet) = 13);
COMMENT ON CONSTRAINT telVet_d1 ON telVet IS 'El RFC no debe ser vacío';

ALTER TABLE telVet ADD CONSTRAINT telVet_d2
CHECK(Tel_Vet <> '');
COMMENT ON CONSTRAINT telVet_d2 ON telVet IS 'El telefono no debe estar vacío';

--Entidad
ALTER TABLE telVet ADD CONSTRAINT telVet_pkey
PRIMARY KEY(RFC_Vet,Tel_Vet);
COMMENT ON CONSTRAINT telVet_pkey ON telVet IS 'Llaves primarias para la tabla proveedor basada en el telVet';

--Referencial
ALTER TABLE telVet ADD CONSTRAINT telVet_fkey
FOREIGN KEY(RFC_Vet) REFERENCES veterinario(RFC_Vet) ON DELETE CASCADE;
COMMENT ON CONSTRAINT telVet_fkey ON telVet IS 'Llave foranea que referencia a veterinario';

-- Definición de la tabla 'CorreoCuid'
CREATE TABLE correoCuid(
	RFC_Cuid VARCHAR(13),
	Correo_Cuid VARCHAR(50)
);

-- Comentario para la tabla 'correoCuid'
COMMENT ON TABLE correoCuid IS 'Tabla que contiene los correos de los cuidadores';

-- Comentarios para las columnas de la tabla 'correoCuid'
COMMENT ON COLUMN correoCuid.RFC_Cuid IS 'RFC de el cuidador';
COMMENT ON COLUMN correoCuid.Correo_Cuid IS 'Correo de el cuidador';

--Restricciones correoCuid
--Dominio
ALTER TABLE correoCuid ADD CONSTRAINT correoCuid_d1
CHECK(LENGTH(RFC_Cuid) = 12 OR LENGTH(RFC_Cuid) = 13);
COMMENT ON CONSTRAINT correoCuid_d1 ON correoCuid IS 'El RFC no debe ser vacío';

ALTER TABLE correoCuid ADD CONSTRAINT correoCuid_d2
CHECK(Correo_Cuid <> '');
COMMENT ON CONSTRAINT correoCuid_d2 ON correoCuid IS 'El correo no debe estar vacío';

--Entidad
ALTER TABLE correoCuid ADD CONSTRAINT correoCuid_pkey
PRIMARY KEY(RFC_Cuid,Correo_Cuid);
COMMENT ON CONSTRAINT correoCuid_pkey ON correoCuid IS 'Llaves primarias para la tabla cuidador basada en el correoCuid';

--Referencial
ALTER TABLE correoCuid ADD CONSTRAINT correoCuid_fkey
FOREIGN KEY(RFC_Cuid) REFERENCES cuidador(RFC_Cuid) ON DELETE CASCADE;
COMMENT ON CONSTRAINT correoCuid_fkey ON correoCuid IS 'Llave foranea que referencia a cuidador';

-- Definición de la tabla 'TelCuid'
CREATE TABLE telCuid(
	RFC_Cuid CHAR(18),
	Tel_Cuid VARCHAR(12)
);

-- Comentario para la tabla 'TelCuid'
COMMENT ON TABLE telCuid IS 'Tabla que contiene los telefono de los cuidadores';

-- Comentarios para las columnas de la tabla 'telCuid'
COMMENT ON COLUMN telCuid.RFC_Cuid IS 'RFC de el cuidador';
COMMENT ON COLUMN telCuid.Tel_Cuid IS 'Telefono de el cuidador';

--Restricciones telCuid
--Dominio
ALTER TABLE telCuid ADD CONSTRAINT telCuid_d1
CHECK(LENGTH(RFC_Cuid) = 12 OR LENGTH(RFC_Cuid) = 13);
COMMENT ON CONSTRAINT telCuid_d1 ON telCuid IS 'El RFC no debe ser vacío';

ALTER TABLE telCuid ADD CONSTRAINT telCuid_d2
CHECK(Tel_Cuid <> '');
COMMENT ON CONSTRAINT telCuid_d2 ON telCuid IS 'El telefono no debe estar vacío';

--Entidad
ALTER TABLE telCuid ADD CONSTRAINT telCuid_pkey
PRIMARY KEY(RFC_Cuid,Tel_Cuid);
COMMENT ON CONSTRAINT telCuid_pkey ON telCuid IS 'Llaves primarias para la tabla proveedor basada en el telCuid';

--Referencial
ALTER TABLE telCuid ADD CONSTRAINT telCuid_fkey
FOREIGN KEY(RFC_Cuid) REFERENCES cuidador(RFC_Cuid) ON DELETE CASCADE;
COMMENT ON CONSTRAINT telCuid_fkey ON telCuid IS 'Llave foranea que referencia a cuidador';

-- Definición de la tabla 'CorreoProv'
CREATE TABLE correoProv(
	RFC_Prov VARCHAR(13),
	Correo_Prov VARCHAR(50)
);

-- Comentario para la tabla 'correoProv'
COMMENT ON TABLE correoProv IS 'Tabla que contiene los correos de los proveedores';

-- Comentarios para las columnas de la tabla 'correoProv'
COMMENT ON COLUMN correoProv.RFC_Prov IS 'RFC de el proveedor';
COMMENT ON COLUMN correoProv.Correo_Prov IS 'Correo de el proveedor';

--Restricciones correoProv
--Dominio
ALTER TABLE correoProv ADD CONSTRAINT correoProv_d1
CHECK(LENGTH(RFC_Prov) = 12 OR LENGTH(RFC_Prov) = 13);
COMMENT ON CONSTRAINT correoProv_d1 ON correoProv IS 'El RFC no debe ser vacío';

ALTER TABLE correoProv ADD CONSTRAINT correoProv_d2
CHECK(Correo_Prov <> '');
COMMENT ON CONSTRAINT correoProv_d2 ON correoProv IS 'El correo no debe estar vacío';

--Entidad
ALTER TABLE correoProv ADD CONSTRAINT correoProv_pkey
PRIMARY KEY(RFC_Prov,Correo_Prov);
COMMENT ON CONSTRAINT correoProv_pkey ON correoProv IS 'Llave primaria para la tabla proveedor basada en el correoProv';

--Referencial
ALTER TABLE correoProv ADD CONSTRAINT correoProv_fkey
FOREIGN KEY(RFC_Prov) REFERENCES proveedor(RFC_Prov) ON DELETE CASCADE;
COMMENT ON CONSTRAINT correoProv_fkey ON correoProv IS 'Llave foranea que referencia a proveedor';

-- Definición de la tabla 'TelProv'
CREATE TABLE telProv(
	RFC_Prov CHAR(18),
	Tel_Prov VARCHAR(12)
);

-- Comentario para la tabla 'TelProv'
COMMENT ON TABLE telProv IS 'Tabla que contiene los telefono de los proveedores';

-- Comentarios para las columnas de la tabla 'telProv'
COMMENT ON COLUMN telProv.RFC_Prov IS 'RFC de el proveedor';
COMMENT ON COLUMN telProv.Tel_Prov IS 'Telefono de el proveedor';

--Restricciones telProv
--Dominio
ALTER TABLE telProv ADD CONSTRAINT telProv_d1
CHECK(LENGTH(RFC_Prov) = 12 OR LENGTH(RFC_Prov) = 13);
COMMENT ON CONSTRAINT telProv_d1 ON telProv IS 'El RFC no debe ser vacío';

ALTER TABLE telProv ADD CONSTRAINT telProv_d2
CHECK(Tel_Prov <> '');
COMMENT ON CONSTRAINT telProv_d2 ON telProv IS 'El telefono no debe estar vacío';

--Entidad
ALTER TABLE telProv ADD CONSTRAINT telProv_pkey
PRIMARY KEY(RFC_Prov,Tel_Prov);
COMMENT ON CONSTRAINT telProv_pkey ON telProv IS 'Llaves primarias para la tabla proveedor basada en el telProv';

--Referencial
ALTER TABLE telProv ADD CONSTRAINT telProv_fkey
FOREIGN KEY(RFC_Prov) REFERENCES proveedor(RFC_Prov) ON DELETE CASCADE;
COMMENT ON CONSTRAINT telProv_fkey ON telProv IS 'Llave foranea que referencia a proveedor';

-- Definición de la tabla 'IndicacionesMed'
CREATE TABLE indicacionesMed(
	Id_Animal INT,
	IndicacionesMed VARCHAR(150)
);

-- Comentario para la tabla 'IndicacionesMed'
COMMENT ON TABLE indicacionesMed IS 'Tabla que contiene las indicaciones medicas';

-- Comentarios para las columnas de la tabla 'indicacionesMed'
COMMENT ON COLUMN indicacionesMed.Id_Animal IS 'Id del animal';
COMMENT ON COLUMN indicacionesMed.IndicacionesMed IS 'Indicaciones medicas del animal';

--Restricciones indicacionesMed
--Dominio
ALTER TABLE indicacionesMed ALTER COLUMN Id_Animal
SET NOT NULL;
COMMENT ON COLUMN indicacionesMed.Id_Animal IS 'El id del animal no debe ser nulo';

ALTER TABLE indicacionesMed ADD CONSTRAINT indicacionesMed_d1
CHECK(IndicacionesMed <> '');
COMMENT ON CONSTRAINT indicacionesMed_d1 ON indicacionesMed IS 'Las indicaciones medicas no deben ser vacías';

--Entidad
ALTER TABLE indicacionesMed ADD CONSTRAINT indicacionesMed_pkey
PRIMARY KEY(Id_Animal,IndicacionesMed);
COMMENT ON CONSTRAINT indicacionesMed_pkey ON indicacionesMed IS 'Llave primaria para la tabla indicacionesMed basada en el Id del animal';

--Referencial
ALTER TABLE indicacionesMed ADD CONSTRAINT indicacionesMed_fkey
FOREIGN KEY(Id_Animal) REFERENCES animal(Id_Animal) ON DELETE CASCADE;
COMMENT ON CONSTRAINT indicacionesMed_fkey ON indicacionesMed IS 'Llave foranea que referencia a animal';

-- Definición de la tabla 'alimento'
CREATE TABLE alimento(
	Id_Alimento INT,
	RFC_Prov VARCHAR(13),
	Cantidad INT,
	seRefrigera BOOLEAN,
	Fecha_Cad DATE,
	tipoAlimento VARCHAR(50)
);

-- Comentario para la tabla 'alimento'
COMMENT ON TABLE alimento IS 'Tabla que contiene los alimentos';

-- Comentarios para las columnas de la tabla 'alimento'
COMMENT ON COLUMN alimento.Id_Alimento IS 'Identificador del alimento';
COMMENT ON COLUMN alimento.RFC_Prov IS 'RFC del proveedor';
COMMENT ON COLUMN alimento.Cantidad IS 'Cantidad que hay del alimento';
COMMENT ON COLUMN alimento.seRefrigera IS 'Si se refrigera el alimento';
COMMENT ON COLUMN alimento.Fecha_Cad IS 'Fecha de caducidad del alimento';
COMMENT ON COLUMN alimento.tipoAlimento IS 'Tipo de alimento';

--Restricciones Alimento
--Dominio
ALTER TABLE alimento ALTER COLUMN Id_Alimento
SET NOT NULL;
COMMENT ON COLUMN alimento.Id_Alimento IS 'El Id_Alimento no debe ser nulo';

ALTER TABLE alimento ADD CONSTRAINT alimento_d1
CHECK(LENGTH(RFC_Prov) = 12 OR LENGTH(RFC_Prov) = 13);
COMMENT ON CONSTRAINT alimento_d1 ON alimento IS 'El RFC_Prov debe tener longitud 12 o 13';

ALTER TABLE alimento ALTER COLUMN Cantidad
SET NOT NULL;
COMMENT ON COLUMN alimento.Cantidad IS 'La Cantidad no debe ser nula';

ALTER TABLE alimento ALTER COLUMN seRefrigera
SET NOT NULL;
COMMENT ON COLUMN alimento.seRefrigera IS 'Se refrigera no debe ser nulo';

ALTER TABLE alimento ALTER COLUMN Fecha_Cad
SET NOT NULL;
COMMENT ON COLUMN alimento.Fecha_Cad IS 'La fecha de caducidad del alimento no debe ser nulo';

ALTER TABLE alimento ADD CONSTRAINT alimento_d2
CHECK(tipoAlimento <> '');
COMMENT ON CONSTRAINT alimento_d2 ON alimento IS 'El tipo de alimento no debe estar vacío';

ALTER TABLE alimento ADD CONSTRAINT alimento_d3
UNIQUE(RFC_Prov);
COMMENT ON CONSTRAINT alimento_d3 ON alimento IS 'El RFC_Prov debe ser unico';

--Entidad
ALTER TABLE alimento ADD CONSTRAINT alimento_pkey
PRIMARY KEY(Id_Alimento);
COMMENT ON CONSTRAINT alimento_pkey ON alimento IS 'Llave primaria para la tabla alimento basada en el Id_Alimento';

--Referencial
ALTER TABLE alimento ADD CONSTRAINT alimento_fkey
FOREIGN KEY(RFC_Prov) REFERENCES proveedor(RFC_Prov) ON DELETE CASCADE;
COMMENT ON CONSTRAINT alimento_fkey ON alimento IS 'Llave foránea que relaciona el alimento con su proveedor mediante el RFC_Prov';

-- Definición de la tabla 'medicina'
CREATE TABLE medicina(
	Lote VARCHAR(12),
	RFC_Prov VARCHAR(13),
	Cantidad INT,
	seRefrigera BOOLEAN,
	Fecha_Cad DATE,
	labProcedencia VARCHAR(50)
);

-- Comentario para la tabla 'medicina'
COMMENT ON TABLE medicina IS 'Tabla que contiene las medicina';

-- Comentarios para las columnas de la tabla 'medicina'
COMMENT ON COLUMN medicina.Lote IS 'Identificador de la medicina';
COMMENT ON COLUMN medicina.RFC_Prov IS 'RFC del proveedor';
COMMENT ON COLUMN medicina.Cantidad IS 'Cantidad que hay de la medicina';
COMMENT ON COLUMN medicina.seRefrigera IS 'Si se refrigera la medicina';
COMMENT ON COLUMN medicina.Fecha_Cad IS 'Fecha de caducidad de la medicina';
COMMENT ON COLUMN medicina.labProcedencia IS 'Tipo de medicina';

--Restricciones Medicina
--Dominio
ALTER TABLE medicina ADD CONSTRAINT medicina_d1
CHECK(LENGTH(Lote) >= 4 AND LENGTH(Lote) <= 12);
COMMENT ON CONSTRAINT medicina_d1 ON medicina IS 'El Lote debe tener longitud entre 4 y 12';

ALTER TABLE medicina ADD CONSTRAINT medicina_d2
CHECK(LENGTH(RFC_Prov) = 12 OR LENGTH(RFC_Prov) = 13);
COMMENT ON CONSTRAINT medicina_d2 ON medicina IS 'El RFC_Prov debe tener longitud 12 o 13';

ALTER TABLE medicina ALTER COLUMN Cantidad
SET NOT NULL;
COMMENT ON COLUMN medicina.Cantidad IS 'La Cantidad no debe ser nula';

ALTER TABLE medicina ALTER COLUMN seRefrigera
SET NOT NULL;
COMMENT ON COLUMN medicina.seRefrigera IS 'Se refrigera no debe ser nulo';

ALTER TABLE medicina ALTER COLUMN Fecha_Cad
SET NOT NULL;
COMMENT ON COLUMN medicina.Fecha_Cad IS 'La fecha de caducidad del la medicina no debe ser nulo';

ALTER TABLE medicina ADD CONSTRAINT medicina_d3
CHECK(labProcedencia <> '');
COMMENT ON CONSTRAINT medicina_d3 ON medicina IS 'El laboratorio de procedencia de la medicina no debe estar vacío';

ALTER TABLE medicina ADD CONSTRAINT medicina_d4
UNIQUE(RFC_Prov);
COMMENT ON CONSTRAINT medicina_d4 ON medicina IS 'El RFC_Prov debe ser unico';

--Entidad
ALTER TABLE medicina ADD CONSTRAINT medicina_pkey
PRIMARY KEY(Lote);
COMMENT ON CONSTRAINT medicina_pkey ON medicina IS 'Llave primaria para la tabla medicina basada en el Lote';

--Referencial
ALTER TABLE medicina ADD CONSTRAINT medicina_fkey
FOREIGN KEY(RFC_Prov) REFERENCES proveedor(RFC_Prov) ON DELETE CASCADE;
COMMENT ON CONSTRAINT medicina_fkey ON medicina IS 'Llave foránea que relaciona la medicina con su proveedor mediante el RFC_Prov';

-- Definición de la tabla 'articulo'
CREATE TABLE articulo(
	Id_Articulo INT,
	RFC_Prov VARCHAR(13),
	Cantidad INT
);

-- Comentario para la tabla 'articulo'
COMMENT ON TABLE articulo IS 'Tabla que contiene los articulos';

-- Comentarios para las columnas de la tabla 'articulo'
COMMENT ON COLUMN articulo.Id_Articulo IS 'Identificador del articulo';
COMMENT ON COLUMN articulo.RFC_Prov IS 'RFC del proveedor';
COMMENT ON COLUMN articulo.Cantidad IS 'Cantidad que hay del articulo';

--Restricciones Articulo
--Dominio
ALTER TABLE articulo ALTER COLUMN Id_Articulo
SET NOT NULL;
COMMENT ON COLUMN articulo.Id_Articulo IS 'El Id_Articulo no debe ser nulo';

ALTER TABLE articulo ADD CONSTRAINT articulo_d1
CHECK(LENGTH(RFC_Prov) = 12 OR LENGTH(RFC_Prov) = 13);
COMMENT ON CONSTRAINT articulo_d1 ON articulo IS 'El RFC_Prov debe tener longitud 12 o 13';

ALTER TABLE articulo ADD CONSTRAINT articulo_d2
UNIQUE(RFC_Prov);
COMMENT ON CONSTRAINT articulo_d2 ON articulo IS 'El RFC_Prov debe ser unico';

ALTER TABLE articulo ALTER COLUMN Cantidad
SET NOT NULL;
COMMENT ON COLUMN articulo.Cantidad IS 'La Cantidad no debe ser nula';

--Entidad
ALTER TABLE articulo ADD CONSTRAINT articulo_pkey
PRIMARY KEY(Id_Articulo);
COMMENT ON CONSTRAINT articulo_pkey ON articulo IS 'Llave primaria para la tabla articulo basada en el Id_Articulo';

--Referencial
ALTER TABLE articulo ADD CONSTRAINT articulo_fkey
FOREIGN KEY(RFC_Prov) REFERENCES proveedor(RFC_Prov) ON DELETE CASCADE;
COMMENT ON CONSTRAINT articulo_fkey ON articulo IS 'Llave foránea que relaciona el articulo con su proveedor mediante el RFC_Prov';

-- Definición de la tabla 'servicio'
CREATE TABLE servicio(
	Id_Servicio INT,
	RFC_Prov VARCHAR(13)
);

-- Comentario para la tabla 'servicio'
COMMENT ON TABLE servicio IS 'Tabla que contiene los servicios';

-- Comentarios para las columnas de la tabla 'servicio'
COMMENT ON COLUMN servicio.Id_Servicio IS 'Identificador del servicio';
COMMENT ON COLUMN servicio.RFC_Prov IS 'RFC del proveedor';

--Restricciones Servicio
--Dominio
ALTER TABLE servicio ALTER COLUMN Id_Servicio
SET NOT NULL;
COMMENT ON COLUMN servicio.Id_Servicio IS 'El Id_Servicio no debe ser nulo';

ALTER TABLE servicio ADD CONSTRAINT servicio_d1
CHECK(LENGTH(RFC_Prov) = 12 OR LENGTH(RFC_Prov) = 13);
COMMENT ON CONSTRAINT servicio_d1 ON servicio IS 'El RFC_Prov debe tener longitud 12 o 13';

ALTER TABLE servicio ADD CONSTRAINT servicio_d2
UNIQUE(RFC_Prov);
COMMENT ON CONSTRAINT servicio_d2 ON servicio IS 'El RFC_Prov debe ser unico';

--Entidad
ALTER TABLE servicio ADD CONSTRAINT servicio_pkey
PRIMARY KEY(Id_Servicio);
COMMENT ON CONSTRAINT servicio_pkey ON servicio IS 'Llave primaria para la tabla servicio basada en el Id_Servicio';

--Referencial
ALTER TABLE servicio ADD CONSTRAINT servicio_fkey
FOREIGN KEY(RFC_Prov) REFERENCES proveedor(RFC_Prov) ON DELETE CASCADE;
COMMENT ON CONSTRAINT servicio_fkey ON servicio IS 'Llave foránea que relaciona el servicio con su proveedor mediante el RFC_Prov';

-- Definición de la tabla 'ticket_Serv'
CREATE TABLE ticket_Serv(
	Num_Ticket_Serv INT,
	CURP CHAR(18),
	Id_Servicio INT,
	Descuento INT,
	Cantidad INT,	
	Fecha DATE
);

-- Comentario para la tabla 'ticket_Serv'
COMMENT ON TABLE ticket_Serv IS 'Tabla que contiene los tickets de los servicios';

-- Comentarios para las columnas de la tabla 'ticket_Serv'
COMMENT ON COLUMN ticket_Serv.Num_Ticket_Serv IS 'Número único para el ticket';
COMMENT ON COLUMN ticket_Serv.CURP IS 'CURP del cliente';
COMMENT ON COLUMN ticket_Serv.Id_Servicio IS 'Identificador del servicio';
COMMENT ON COLUMN ticket_Serv.Descuento IS 'Descuento del ticket';
COMMENT ON COLUMN ticket_Serv.Cantidad IS 'Cantidad del ticket';
COMMENT ON COLUMN ticket_Serv.Fecha IS 'Fecha de emisión del ticket';

--Restricciones ticket_Serv
--Dominio
ALTER TABLE ticket_Serv ALTER COLUMN Num_Ticket_Serv
SET NOT NULL;
COMMENT ON COLUMN ticket_Serv.Num_Ticket_Serv IS 'El número de ticket de un servicio no debe ser nulo';

ALTER TABLE ticket_Serv ADD CONSTRAINT ticket_Serv_d1
CHECK(CURP <> '');
COMMENT ON CONSTRAINT ticket_Serv_d1 ON ticket_Serv IS 'El CURP del cliente no debe ser nulo';

ALTER TABLE ticket_Serv ALTER COLUMN Id_Servicio
SET NOT NULL;
COMMENT ON COLUMN ticket_Serv.Id_Servicio IS 'El identificador del servicio no debe ser nulo';

ALTER TABLE ticket_Serv ALTER COLUMN Cantidad
SET NOT NULL;
COMMENT ON COLUMN ticket_Serv.Cantidad IS 'La cantidad no debe ser nulo';

ALTER TABLE ticket_Serv ALTER COLUMN Fecha
SET NOT NULL;
COMMENT ON COLUMN ticket_Serv.Fecha IS 'La fecha de emisión no debe ser nula';

ALTER TABLE ticket_Serv ADD CONSTRAINT ticket_Serv_d2
CHECK(Cantidad > 0);
COMMENT ON CONSTRAINT ticket_Serv_d2 ON ticket_Serv IS 'La cantidad debe ser mayor que cero';

--Entidad
ALTER TABLE ticket_Serv ADD CONSTRAINT ticket_Serv_pkey
PRIMARY KEY(Num_Ticket_Serv);
COMMENT ON CONSTRAINT ticket_Serv_pkey ON ticket_Serv IS 'Llave primaria para la tabla ticket de articulo basada en el número de ticket';

--Referencial
ALTER TABLE ticket_Serv ADD CONSTRAINT ticket_Serv_fkey
FOREIGN KEY(CURP) REFERENCES cliente(CURP);
COMMENT ON CONSTRAINT ticket_Serv_fkey ON ticket_Serv IS 'Llave foránea que relaciona un ticket de articulo con un cliente en la tabla cliente mediante el CURP';

-- Definición de la tabla 'ticket_Art'
CREATE TABLE ticket_Art(
	Num_Ticket_Art INT,
	CURP CHAR(18),
	Cantidad INT,	
	Fecha DATE
);

-- Comentario para la tabla 'ticket_Art'
COMMENT ON TABLE ticket_Art IS 'Tabla que contiene los tickets de los articulos';

-- Comentarios para las columnas de la tabla 'ticket_Art'
COMMENT ON COLUMN ticket_Art.Num_Ticket_Art IS 'Número único para el ticket';
COMMENT ON COLUMN ticket_Art.CURP IS 'CURP del cliente';
COMMENT ON COLUMN ticket_Art.Cantidad IS 'Cantidad del ticket';
COMMENT ON COLUMN ticket_Art.Fecha IS 'Fecha de emisión del ticket';

--Restricciones ticket_Art
--Dominio
ALTER TABLE ticket_Art ALTER COLUMN Num_Ticket_Art
SET NOT NULL;
COMMENT ON COLUMN ticket_Art.Num_Ticket_Art IS 'El número de ticket de un articulo no debe ser nulo';

ALTER TABLE ticket_Art ADD CONSTRAINT ticket_Art_d1
CHECK(CURP <> '');
COMMENT ON CONSTRAINT ticket_Art_d1 ON ticket_Art IS 'El CURP del cliente no debe ser nulo';

ALTER TABLE ticket_Art ALTER COLUMN Cantidad
SET NOT NULL;
COMMENT ON COLUMN ticket_Art.Cantidad IS 'La cantidad no debe ser nulo';

ALTER TABLE ticket_Art ALTER COLUMN Fecha
SET NOT NULL;
COMMENT ON COLUMN ticket_Art.Fecha IS 'La fecha de emisión no debe ser nula';

ALTER TABLE ticket_Art ADD CONSTRAINT ticket_Art_d2
CHECK(Cantidad > 0);
COMMENT ON CONSTRAINT ticket_Art_d2 ON ticket_Art IS 'La cantidad debe ser mayor que cero';

--Entidad
ALTER TABLE ticket_Art ADD CONSTRAINT ticket_Art_pkey
PRIMARY KEY(Num_Ticket_Art);
COMMENT ON CONSTRAINT ticket_Art_pkey ON ticket_Art IS 'Llave primaria para la tabla ticket de articulo basada en el número de ticket';

--Referencial
ALTER TABLE ticket_Art ADD CONSTRAINT ticket_Art_fkey
FOREIGN KEY(CURP) REFERENCES cliente(CURP);
COMMENT ON CONSTRAINT ticket_Art_fkey ON ticket_Art IS 'Llave foránea que relaciona un ticket de articulo con un cliente en la tabla cliente mediante el CURP';

-- Definición de la tabla 'descuento'
CREATE TABLE descuento(		
	Id_Desc INT,
	Id_Articulo INT,
	Porcentaje_Desc INT,
	Fecha_Inicio DATE,
	Fecha_Fin DATE
);

-- Comentario para la tabla 'descuento'
COMMENT ON TABLE descuento IS 'Tabla que contiene los descuentos';

-- Comentarios para las columnas de la tabla 'descuento'
COMMENT ON COLUMN descuento.Id_Desc IS 'Identificador del descuento';
COMMENT ON COLUMN descuento.Id_Articulo IS 'Identificador del articulo';
COMMENT ON COLUMN descuento.Porcentaje_Desc IS 'Procentaje del descuento';
COMMENT ON COLUMN descuento.Fecha_Inicio IS 'Fecha de inicio del descuento';
COMMENT ON COLUMN descuento.Fecha_Fin IS 'Fecha de fin del descuento';

--Restricciones descuento
--Dominio
ALTER TABLE descuento ALTER COLUMN Id_Desc
SET NOT NULL;
COMMENT ON COLUMN descuento.Id_Desc IS 'El identificador del descuento no debe ser nulo';

ALTER TABLE descuento ALTER COLUMN Id_Articulo
SET NOT NULL;
COMMENT ON COLUMN descuento.Id_Articulo IS 'El identificador del articulo no debe ser nulo';

ALTER TABLE descuento ALTER COLUMN Porcentaje_Desc
SET NOT NULL;
COMMENT ON COLUMN descuento.Porcentaje_Desc IS 'El porcentaje del descuento no debe ser nulo';

ALTER TABLE descuento ALTER COLUMN Fecha_Inicio
SET NOT NULL;
COMMENT ON COLUMN descuento.Fecha_Inicio IS 'La fecha de inicio del descuento no debe ser nulo';

ALTER TABLE descuento ALTER COLUMN Fecha_Fin
SET NOT NULL;
COMMENT ON COLUMN descuento.Fecha_Fin IS 'La fecha de fin del descuento no debe ser nulo';

ALTER TABLE descuento ADD CONSTRAINT descuento_d1
UNIQUE(Id_Articulo);
COMMENT ON CONSTRAINT descuento_d1 ON descuento IS 'El Id_Articulo debe ser unico';

--Entidad
ALTER TABLE descuento ADD CONSTRAINT descuento_pkey
PRIMARY KEY(Id_Desc);
COMMENT ON CONSTRAINT descuento_pkey ON descuento IS 'Llave primaria para la tabla descuento basada en el Id_Desc';

--Referencial
ALTER TABLE descuento ADD CONSTRAINT descuento_fkey
FOREIGN KEY(Id_Articulo) REFERENCES articulo(Id_Articulo);
COMMENT ON CONSTRAINT descuento_fkey ON descuento IS 'Llave foránea que relaciona descuento en la tabla articulo mediante el Id_Articulo';

-- Definición de la tabla 'promocion'
CREATE TABLE promocion(		
	Id_Promo INT,
	Id_Articulo INT,
	Tipo_Promo VARCHAR(50),
	Fecha_Inicio DATE,
	Fecha_Fin DATE
);

-- Comentario para la tabla 'promocion'
COMMENT ON TABLE promocion IS 'Tabla que contiene las promociones';

-- Comentarios para las columnas de la tabla 'promocion'
COMMENT ON COLUMN promocion.Id_Promo IS 'Identificador de la promocion';
COMMENT ON COLUMN promocion.Id_Articulo IS 'Identificador del articulo';
COMMENT ON COLUMN promocion.Tipo_Promo IS 'Tipo de la promocion';
COMMENT ON COLUMN promocion.Fecha_Inicio IS 'Fecha de inicio de la promocion';
COMMENT ON COLUMN promocion.Fecha_Fin IS 'Fecha de fin de la promocion';

--Restricciones promocion
--Dominio
ALTER TABLE promocion ALTER COLUMN Id_Promo
SET NOT NULL;
COMMENT ON COLUMN promocion.Id_Promo IS 'El identificador de la promocion no debe ser nulo';

ALTER TABLE promocion ALTER COLUMN Id_Articulo
SET NOT NULL;
COMMENT ON COLUMN promocion.Id_Articulo IS 'El identificador del articulo no debe ser nulo';

ALTER TABLE promocion ADD CONSTRAINT promocion_d1
CHECK(Tipo_Promo <> '');
COMMENT ON CONSTRAINT promocion_d1 ON promocion IS 'El tipo de promocion no debe ser nulo';

ALTER TABLE promocion ALTER COLUMN Fecha_Inicio
SET NOT NULL;
COMMENT ON COLUMN promocion.Fecha_Inicio IS 'La fecha de inicio de la promocion no debe ser nulo';

ALTER TABLE promocion ALTER COLUMN Fecha_Fin
SET NOT NULL;
COMMENT ON COLUMN promocion.Fecha_Fin IS 'La fecha de fin de la promocion no debe ser nulo';

ALTER TABLE promocion ADD CONSTRAINT promocion_d2
UNIQUE(Id_Articulo);
COMMENT ON CONSTRAINT promocion_d2 ON promocion IS 'El Id_Articulo debe ser unico';

--Entidad
ALTER TABLE promocion ADD CONSTRAINT promocion_pkey
PRIMARY KEY(Id_Promo);
COMMENT ON CONSTRAINT promocion_pkey ON promocion IS 'Llave primaria para la tabla promocion basada en el Id_Promo';

--Referencial
ALTER TABLE promocion ADD CONSTRAINT promocion_fkey
FOREIGN KEY(Id_Articulo) REFERENCES articulo(Id_Articulo);
COMMENT ON CONSTRAINT promocion_fkey ON promocion IS 'Llave foránea que relaciona promocion en la tabla articulo mediante el Id_Articulo';

-- Definición de la tabla 'noti_Evento'
CREATE TABLE noti_Evento(
	Id_Noti_Evento INT,
	Id_Evento INT
);

-- Comentario para la tabla 'noti_Evento'
COMMENT ON TABLE noti_Evento IS 'Tabla que contiene las notificaciones de los eventos';

-- Comentarios para las columnas de la tabla 'noti_Evento'
COMMENT ON COLUMN noti_Evento.Id_Noti_Evento IS 'Identificador de la notificacion del evento';
COMMENT ON COLUMN noti_Evento.Id_Evento IS 'Identificador del evento sobre el que se notifica';

--Restricciones Noti_Evento
--Dominio
ALTER TABLE noti_Evento ALTER COLUMN Id_Noti_Evento
SET NOT NULL;
COMMENT ON COLUMN noti_Evento.Id_Noti_Evento IS 'El Id_Noti_Evento no debe ser nulo';

ALTER TABLE noti_Evento ALTER COLUMN Id_Evento
SET NOT NULL;
COMMENT ON COLUMN noti_Evento.Id_Evento IS 'El Id_Evento no debe ser nulo';

ALTER TABLE noti_Evento ADD CONSTRAINT noti_Evento_d1
UNIQUE(Id_Evento);
COMMENT ON CONSTRAINT noti_Evento_d1 ON noti_Evento IS 'El Id_Evento debe ser unico';

--Entidad
ALTER TABLE noti_Evento ADD CONSTRAINT noti_Evento_pkey
PRIMARY KEY(Id_Noti_Evento);
COMMENT ON CONSTRAINT noti_Evento_pkey ON noti_Evento IS 'Llave primaria para la tabla noti_Evento basada en el Id del noti_evento';

--Referencial
ALTER TABLE noti_Evento ADD CONSTRAINT noti_Evento_fkey1
FOREIGN KEY(Id_Evento) REFERENCES evento(Id_Evento);
COMMENT ON CONSTRAINT noti_Evento_fkey1 ON noti_Evento IS 'Llave foránea que relaciona la notificación con un evento en la tabla evento mediante el Id_Evento';

------------TABLAS CON LLAVES FORANEAS---------------

-- Definición de la tabla 'distribuir_Serv'
CREATE TABLE distribuir_Serv(	
	Id_Servicio INT,
	Tipo VARCHAR(50)	
);

-- Comentario para la tabla 'distribuir_Serv'
COMMENT ON TABLE distribuir_Serv IS 'Tabla que contiene los servicios distribuidos en biomas';

-- Comentarios para las columnas de la tabla 'distribuir_Serv'
COMMENT ON COLUMN distribuir_Serv.Id_Servicio IS 'Identificador del servicio';
COMMENT ON COLUMN distribuir_Serv.Tipo IS 'Tipo de Bioma';

--Restricciones distribuir_Serv
--Dominio
ALTER TABLE distribuir_Serv ALTER COLUMN Id_Servicio
SET NOT NULL;
COMMENT ON COLUMN distribuir_Serv.Id_Servicio IS 'El identificador del servicio no debe ser nulo';

ALTER TABLE distribuir_Serv ADD CONSTRAINT distribuir_Serv_d1
CHECK(Tipo <> '');
COMMENT ON CONSTRAINT distribuir_Serv_d1 ON distribuir_Serv IS 'El Tipo de bioma no debe estar vacío';

ALTER TABLE distribuir_Serv ADD CONSTRAINT distribuir_Serv_d2
UNIQUE(Id_Servicio, Tipo);
COMMENT ON CONSTRAINT distribuir_Serv_d2 ON distribuir_Serv is 'La pareja de llaves es unica';

--Referencial
ALTER TABLE distribuir_Serv ADD CONSTRAINT distribuir_Serv_fkey1
FOREIGN KEY(Id_Servicio) REFERENCES servicio(Id_Servicio);
COMMENT ON CONSTRAINT distribuir_Serv_fkey1 ON distribuir_Serv IS 'Llave foránea que relaciona el servicio distribuido en la tabla servicio mediante el Id_Servicio';

ALTER TABLE distribuir_Serv ADD CONSTRAINT distribuir_Serv_fkey2
FOREIGN KEY(Tipo) REFERENCES bioma(Tipo) ON DELETE CASCADE;
COMMENT ON CONSTRAINT distribuir_Serv_fkey2 ON distribuir_Serv IS 'Llave foránea que relaciona el tipo de bioma en la tabla bioma mediante el Tipo';

-- Definición de la tabla 'distribuir_Alim'
CREATE TABLE distribuir_Alim(	
	Id_Alimento INT,
	Tipo VARCHAR(50)	
);

-- Comentario para la tabla 'distribuir_Alim'
COMMENT ON TABLE distribuir_Alim IS 'Tabla que contiene los alimentos distribuidos en biomas';

-- Comentarios para las columnas de la tabla 'distribuir_Alim'
COMMENT ON COLUMN distribuir_Alim.Id_Alimento IS 'Identificador del alimento';
COMMENT ON COLUMN distribuir_Alim.Tipo IS 'Tipo de Bioma';

--Restricciones distribuir_Alim
--Dominio
ALTER TABLE distribuir_Alim ALTER COLUMN Id_Alimento
SET NOT NULL;
COMMENT ON COLUMN distribuir_Alim.Id_Alimento IS 'El identificador del alimento no debe ser nulo';

ALTER TABLE distribuir_Alim ADD CONSTRAINT distribuir_Alim_d1
CHECK(Tipo <> '');
COMMENT ON CONSTRAINT distribuir_Alim_d1 ON distribuir_Alim IS 'El Tipo de bioma no debe estar vacío';

ALTER TABLE distribuir_Alim ADD CONSTRAINT distribuir_Alim_d2
UNIQUE(Id_Alimento, Tipo);
COMMENT ON CONSTRAINT distribuir_Alim_d2 ON distribuir_Alim is 'La pareja de llaves es unica';

--Referencial
ALTER TABLE distribuir_Alim ADD CONSTRAINT distribuir_Alim_fkey1
FOREIGN KEY(Id_Alimento) REFERENCES alimento(Id_Alimento);
COMMENT ON CONSTRAINT distribuir_Alim_fkey1 ON distribuir_Alim IS 'Llave foránea que relaciona el alimento distribuido en la tabla alimento mediante el Id_Alimento';

ALTER TABLE distribuir_Alim ADD CONSTRAINT distribuir_Alim_fkey2
FOREIGN KEY(Tipo) REFERENCES bioma(Tipo) ON DELETE CASCADE;
COMMENT ON CONSTRAINT distribuir_Alim_fkey2 ON distribuir_Alim IS 'Llave foránea que relaciona el tipo de bioma en la tabla bioma mediante el Tipo';

-- Definición de la tabla 'distribuir_Med'
CREATE TABLE distribuir_Med(	
	Lote VARCHAR(12),
	Tipo VARCHAR(50)	
);

-- Comentario para la tabla 'distribuir_Med'
COMMENT ON TABLE distribuir_Med IS 'Tabla que contiene las medicinas distribuidos en biomas';

-- Comentarios para las columnas de la tabla 'distribuir_Med'
COMMENT ON COLUMN distribuir_Med.Lote IS 'Identificador de la medicina';
COMMENT ON COLUMN distribuir_Med.Tipo IS 'Tipo de Bioma';

--Restricciones distribuir_Med
--Dominio
ALTER TABLE distribuir_Med ADD CONSTRAINT distribuir_Med_d1
CHECK(LENGTH(Lote) >= 4 AND LENGTH(Lote) <= 12);
COMMENT ON CONSTRAINT distribuir_Med_d1 ON distribuir_Med IS 'El Lote debe tener longitud entre 4 y 12';

ALTER TABLE distribuir_Med ADD CONSTRAINT distribuir_Med_d2
CHECK(Tipo <> '');
COMMENT ON CONSTRAINT distribuir_Med_d2 ON distribuir_Med IS 'El Tipo de bioma no debe estar vacío';

ALTER TABLE distribuir_Med ADD CONSTRAINT distribuir_Med_d3
UNIQUE(Lote, Tipo);
COMMENT ON CONSTRAINT distribuir_Med_d3 ON distribuir_Med is 'La pareja de llaves es unica';

--Referencial
ALTER TABLE distribuir_Med ADD CONSTRAINT distribuir_Med_fkey1
FOREIGN KEY(Lote) REFERENCES medicina(Lote);
COMMENT ON CONSTRAINT distribuir_Med_fkey1 ON distribuir_Med IS 'Llave foránea que relaciona la medicina distribuida en la tabla medicina mediante el Lote';

ALTER TABLE distribuir_Med ADD CONSTRAINT distribuir_Med_fkey2
FOREIGN KEY(Tipo) REFERENCES bioma(Tipo) ON DELETE CASCADE;
COMMENT ON CONSTRAINT distribuir_Med_fkey2 ON distribuir_Med IS 'Llave foránea que relaciona el tipo de bioma en la tabla bioma mediante el Tipo';

-- Definición de la tabla 'distribuir_Art'
CREATE TABLE distribuir_Art(	
	Id_Articulo INT,
	Tipo VARCHAR(50)	
);

-- Comentario para la tabla 'distribuir_Art'
COMMENT ON TABLE distribuir_Art IS 'Tabla que contiene los articulos distribuidos en biomas';

-- Comentarios para las columnas de la tabla 'distribuir_Art'
COMMENT ON COLUMN distribuir_Art.Id_Articulo IS 'Identificador del articulo';
COMMENT ON COLUMN distribuir_Art.Tipo IS 'Tipo de Bioma';

--Restricciones distribuir_Art
--Dominio
ALTER TABLE distribuir_Art ALTER COLUMN Id_Articulo
SET NOT NULL;
COMMENT ON COLUMN distribuir_Art.Id_Articulo IS 'El identificador del articulo no debe ser nulo';

ALTER TABLE distribuir_Art ADD CONSTRAINT distribuir_Art_d1
CHECK(Tipo <> '');
COMMENT ON CONSTRAINT distribuir_Art_d1 ON distribuir_Art IS 'El Tipo de bioma no debe estar vacío';

ALTER TABLE distribuir_Art ADD CONSTRAINT distribuir_Art_d2
UNIQUE(Id_Articulo, Tipo);
COMMENT ON CONSTRAINT distribuir_Art_d2 ON distribuir_Art is 'La pareja de llaves es unica';

--Referencial
ALTER TABLE distribuir_Art ADD CONSTRAINT distribuir_Art_f1key
FOREIGN KEY(Id_Articulo) REFERENCES articulo(Id_Articulo);
COMMENT ON CONSTRAINT distribuir_Art_f1key ON distribuir_Art IS 'Llave foránea que relaciona el articulo distribuido en la tabla articulo mediante el Id_Artiuclo';

ALTER TABLE distribuir_Art ADD CONSTRAINT distribuir_Art_f2key
FOREIGN KEY(Tipo) REFERENCES bioma(Tipo) ON DELETE CASCADE;
COMMENT ON CONSTRAINT distribuir_Art_f2key ON distribuir_Art IS 'Llave foránea que relaciona el tipo de bioma en la tabla bioma mediante el Tipo';

-- Definición de la tabla 'trabajar'
CREATE TABLE trabajar(
	RFC_Vet VARCHAR(13),
	Tipo VARCHAR(50)
);

-- Comentario para la tabla 'trabajar'
COMMENT ON TABLE trabajar IS 'Tabla que contiene los trabajos de veterinarios en biomas';

-- Comentarios para las columnas de la tabla 'trabajar'
COMMENT ON COLUMN trabajar.RFC_Vet IS 'RFC del veterinario';
COMMENT ON COLUMN trabajar.Tipo IS 'Tipo de bioma';

--Restricciones Trabajar
--Dominio
ALTER TABLE trabajar ADD CONSTRAINT trabajar_d1
CHECK(LENGTH(RFC_Vet) = 12 OR LENGTH(RFC_Vet) = 13);
COMMENT ON CONSTRAINT trabajar_d1 ON trabajar IS 'El RFC debe tener una longitud válida de 12 o 13 caracteres';

ALTER TABLE trabajar ADD CONSTRAINT trabajar_d2
CHECK(Tipo <> '');
COMMENT ON CONSTRAINT trabajar_d2 ON trabajar IS 'El Tipo de bioma no debe estar vacío';

ALTER TABLE trabajar ADD CONSTRAINT trabajar_d3
UNIQUE(RFC_Vet, Tipo);
COMMENT ON CONSTRAINT trabajar_d3 ON trabajar is 'La pareja de llaves es unica';

--Referencial
ALTER TABLE trabajar ADD CONSTRAINT trabajar_fkey1
FOREIGN KEY(RFC_Vet) REFERENCES veterinario(RFC_Vet) ON DELETE CASCADE;
COMMENT ON CONSTRAINT trabajar_fkey1 ON trabajar IS 'Llave foránea que relaciona el trabajo con un veterinario en la tabla veterinario mediante el RFC';

ALTER TABLE trabajar ADD CONSTRAINT trabajar_fkey2
FOREIGN KEY(Tipo) REFERENCES bioma(Tipo) ON DELETE CASCADE;
COMMENT ON CONSTRAINT trabajar_fkey2 ON trabajar IS 'Llave foránea que relaciona el trabajo con un bioma en la tabla bioma mediante el Identificador';

-- Definición de la tabla 'atender'
CREATE TABLE atender(
	RFC_Vet VARCHAR(13),
	Id_Animal INT
);

-- Comentario para la tabla 'atender'
COMMENT ON TABLE atender IS 'Tabla que contiene los animales que atiende un veterinario';

-- Comentarios para las columnas de la tabla 'atender'
COMMENT ON COLUMN atender.RFC_Vet IS 'RFC del veterinario';
COMMENT ON COLUMN atender.Id_Animal IS 'Identificador del animal';

--Restricciones Atender
--Dominio
ALTER TABLE atender ADD CONSTRAINT atender_d1
CHECK(LENGTH(RFC_Vet) = 12 OR LENGTH(RFC_Vet) = 13);
COMMENT ON CONSTRAINT atender_d1 ON atender IS 'El RFC debe tener una longitud válida de 12 o 13 caracteres';

ALTER TABLE atender ADD CONSTRAINT atender_d2
UNIQUE(RFC_Vet, Id_Animal);
COMMENT ON CONSTRAINT atender_d2 ON atender is 'La pareja de llaves es unica';

ALTER TABLE atender ALTER COLUMN Id_Animal
SET NOT NULL;
COMMENT ON COLUMN atender.Id_Animal IS 'El identificador del animal no debe ser nulo';

--Referencial
ALTER TABLE atender ADD CONSTRAINT atender_fkey1
FOREIGN KEY(RFC_Vet) REFERENCES veterinario(RFC_Vet) ON DELETE CASCADE;
COMMENT ON CONSTRAINT atender_fkey1 ON atender IS 'Llave foránea que relaciona un veterinario en la tabla veterinario que atiende a algun animal mediante el RFC';

ALTER TABLE atender ADD CONSTRAINT atender_fkey2
FOREIGN KEY(Id_Animal) REFERENCES animal(Id_Animal) ON DELETE CASCADE;
COMMENT ON CONSTRAINT atender_fkey2 ON atender IS 'Llave foránea que relaciona el animal que es atendido mediante el Identificador';

-- Definición de la tabla 'asociar'
CREATE TABLE asociar(	
	Id_Articulo INT,
	Num_Ticket_Art INT	
);

-- Comentario para la tabla 'asociar'
COMMENT ON TABLE asociar IS 'Tabla que contiene los articulos asociados con tickets';

-- Comentarios para las columnas de la tabla 'asociar'
COMMENT ON COLUMN asociar.Id_Articulo IS 'Identificador del articulo';
COMMENT ON COLUMN asociar.Num_Ticket_Art IS 'Numero de ticket';

--Restricciones asociar
--Dominio
ALTER TABLE asociar ADD CONSTRAINT asociar_d1
UNIQUE(Id_Articulo, Num_Ticket_Art);
COMMENT ON CONSTRAINT asociar_d1 ON asociar is 'La pareja de llaves es unica';

ALTER TABLE asociar ALTER COLUMN Id_Articulo
SET NOT NULL;
COMMENT ON COLUMN asociar.Id_Articulo IS 'El identificador del articulo no debe ser nulo';

ALTER TABLE asociar ALTER COLUMN Num_Ticket_Art
SET NOT NULL;
COMMENT ON COLUMN asociar.Num_Ticket_Art IS 'El numero de ticket no debe ser nulo';

--Referencial
ALTER TABLE asociar ADD CONSTRAINT asociar_fkey1
FOREIGN KEY(Id_Articulo) REFERENCES articulo(Id_Articulo);
COMMENT ON CONSTRAINT asociar_fkey1 ON asociar IS 'Llave foránea que relaciona el articulo asociado en la tabla articulo mediante el Id_Artiuclo';

ALTER TABLE asociar ADD CONSTRAINT asociar_fkey2
FOREIGN KEY(Num_Ticket_Art) REFERENCES ticket_Art(Num_Ticket_Art);
COMMENT ON CONSTRAINT asociar_fkey2 ON asociar IS 'Llave foránea que relaciona el numero de ticket en la tabla ticket_Art mediante el Num_Ticket_Art';

-- Definición de la tabla 'recibir_Desc'
CREATE TABLE recibir_Desc(	
	CURP CHAR(18),
	Id_Desc INT
);

-- Comentario para la tabla 'recibir_Desc'
COMMENT ON TABLE recibir_Desc IS 'Tabla que contiene los descuentos que lo reciben los clientes';

-- Comentarios para las columnas de la tabla 'recibir_Desc'
COMMENT ON COLUMN recibir_Desc.CURP IS 'CURP del cliente';
COMMENT ON COLUMN recibir_Desc.Id_Desc IS 'Identificador del descuento';

--Restricciones recibir_Desc
--Dominio
ALTER TABLE recibir_Desc ADD CONSTRAINT recibir_Desc_d1
CHECK(CURP <> '');
COMMENT ON CONSTRAINT recibir_Desc_d1 ON recibir_Desc IS 'El CURP del cliente no debe ser nulo';

ALTER TABLE recibir_Desc ADD CONSTRAINT recibir_Desc_d2
UNIQUE(CURP, Id_Desc);
COMMENT ON CONSTRAINT recibir_Desc_d2 ON recibir_Desc is 'La pareja de llaves es unica';

ALTER TABLE recibir_Desc ALTER COLUMN Id_Desc
SET NOT NULL;
COMMENT ON COLUMN recibir_Desc.Id_Desc IS 'El identificador de un descuento no debe ser nulo';

--Referencial
ALTER TABLE recibir_Desc ADD CONSTRAINT recibir_Desc_fkey1
FOREIGN KEY(CURP) REFERENCES cliente(CURP);
COMMENT ON CONSTRAINT recibir_Desc_fkey1 ON recibir_Desc IS 'Llave foránea que relaciona el descuento en la tabla cliente mediante el CURP';

ALTER TABLE recibir_Desc ADD CONSTRAINT recibir_Desc_fkey2
FOREIGN KEY(Id_Desc) REFERENCES descuento(Id_Desc);
COMMENT ON CONSTRAINT recibir_Desc_fkey2 ON recibir_Desc IS 'Llave foránea que relaciona el descuento recibida a un cliente en la tabla promocion mediante el Id_Desc';

-- Definición de la tabla 'recibir_Promo'
CREATE TABLE recibir_Promo(	
	CURP CHAR(18),
	Id_Promo INT
);

-- Comentario para la tabla 'recibir_Promo'
COMMENT ON TABLE recibir_Promo IS 'Tabla que contiene las promociones que reciben los clientes';

-- Comentarios para las columnas de la tabla 'recibir_Promo'
COMMENT ON COLUMN recibir_Promo.CURP IS 'CURP del cliente';
COMMENT ON COLUMN recibir_Promo.Id_Promo IS 'Identificador de la promocion';

--Restricciones recibir_Promo
--Dominio
ALTER TABLE recibir_Promo ADD CONSTRAINT recibir_Promo_d1
CHECK(CURP <> '');
COMMENT ON CONSTRAINT recibir_Promo_d1 ON recibir_Promo IS 'El CURP del cliente no debe ser nulo';

ALTER TABLE recibir_Promo ADD CONSTRAINT recibir_Promo_d2
UNIQUE(CURP, Id_Promo);
COMMENT ON CONSTRAINT recibir_Promo_d2 ON recibir_Promo is 'La pareja de llaves es unica';

ALTER TABLE recibir_Promo ALTER COLUMN Id_Promo
SET NOT NULL;
COMMENT ON COLUMN recibir_Promo.Id_Promo IS 'El identificador de una promocion no debe ser nulo';

--Referencial
ALTER TABLE recibir_Promo ADD CONSTRAINT recibir_Promo_fkey1
FOREIGN KEY(CURP) REFERENCES cliente(CURP);
COMMENT ON CONSTRAINT recibir_Promo_fkey1 ON recibir_Promo IS 'Llave foránea que relaciona la promocion en la tabla cliente mediante el CURP';

ALTER TABLE recibir_Promo ADD CONSTRAINT recibir_Promo_fkey2
FOREIGN KEY(Id_Promo) REFERENCES promocion(Id_Promo);
COMMENT ON CONSTRAINT recibir_Promo_fkey2 ON recibir_Promo IS 'Llave foránea que relaciona la promocion recibida a un cliente en la tabla promocion mediante el Id_Promo';

-- Definición de la tabla 'recibir_Noti_Even'
CREATE TABLE recibir_Noti_Even(	
	CURP CHAR(18),
	Id_Noti_Evento INT
);

-- Comentario para la tabla 'recibir_Noti_Even'
COMMENT ON TABLE recibir_Noti_Even IS 'Tabla que contiene las notificaciones de eventos que reciben los clientes';

-- Comentarios para las columnas de la tabla 'recibir_Noti_Even'
COMMENT ON COLUMN recibir_Noti_Even.CURP IS 'CURP del cliente';
COMMENT ON COLUMN recibir_Noti_Even.Id_Noti_Evento IS 'Identificador de la notificacion de un evento';

--Restricciones recibir_Noti_Even
--Dominio
ALTER TABLE recibir_Noti_Even ADD CONSTRAINT recibir_Noti_Even_d1
CHECK(CURP <> '');
COMMENT ON CONSTRAINT recibir_Noti_Even_d1 ON recibir_Noti_Even IS 'El CURP del cliente no debe ser nulo';

ALTER TABLE recibir_Noti_Even ADD CONSTRAINT recibir_Noti_Even_d2
UNIQUE(CURP, Id_Noti_Evento);
COMMENT ON CONSTRAINT recibir_Noti_Even_d2 ON recibir_Noti_Even is 'La pareja de llaves es unica';

ALTER TABLE recibir_Noti_Even ALTER COLUMN Id_Noti_Evento
SET NOT NULL;
COMMENT ON COLUMN recibir_Noti_Even.Id_Noti_Evento IS 'El identificador de una notificacion de evento no debe ser nulo';

--Referencial
ALTER TABLE recibir_Noti_Even ADD CONSTRAINT recibir_Noti_Even_fkey1
FOREIGN KEY(CURP) REFERENCES cliente(CURP);
COMMENT ON CONSTRAINT recibir_Noti_Even_fkey1 ON recibir_Noti_Even IS 'Llave foránea que relaciona la notificacion de un evento en la tabla cliente mediante el CURP';

ALTER TABLE recibir_Noti_Even ADD CONSTRAINT recibir_Noti_Even_fkey2
FOREIGN KEY(Id_Noti_Evento) REFERENCES noti_evento(Id_Noti_Evento);
COMMENT ON CONSTRAINT recibir_Noti_Even_fkey2 ON recibir_Noti_Even IS 'Llave foránea que relaciona la notificacion recibida a un cliente en la tabla noti_Evento mediante el Id_Noti_Even';

-- Definición de la tabla 'asistir'
CREATE TABLE asistir(
	Id_Evento INT,
	CURP CHAR(18)
);

-- Comentario para la tabla 'asistir'
COMMENT ON TABLE asistir IS 'Tabla que contiene los clientes que asisten a los eventos';

-- Comentarios para las columnas de la tabla 'asistir'
COMMENT ON COLUMN asistir.Id_Evento IS 'Identificador del evento';
COMMENT ON COLUMN asistir.CURP IS 'CURP del cliente';

--Restricciones asistir
--Dominio
ALTER TABLE asistir ALTER COLUMN Id_Evento
SET NOT NULL;
COMMENT ON COLUMN asistir.Id_Evento IS 'El identificador de un evento no debe ser nulo';

ALTER TABLE asistir ADD CONSTRAINT asistir_d1
CHECK(CURP <> '');
COMMENT ON CONSTRAINT asistir_d1 ON asistir IS 'El CURP del cliente no debe ser nulo';

ALTER TABLE asistir ADD CONSTRAINT asistir_d2
UNIQUE(Id_Evento, CURP);
COMMENT ON CONSTRAINT asistir_d2 ON asistir is 'La pareja de llaves es unica';

--Referencial
ALTER TABLE asistir ADD CONSTRAINT asistir_fkey1
FOREIGN KEY(CURP) REFERENCES cliente(CURP);
COMMENT ON CONSTRAINT asistir_fkey1 ON asistir IS 'Llave foránea que relaciona la asistencia de un cliente en la tabla cliente mediante el CURP';

ALTER TABLE asistir ADD CONSTRAINT asistir_fkey2
FOREIGN KEY(Id_Evento) REFERENCES evento(Id_Evento);
COMMENT ON CONSTRAINT asistir_fkey2 ON asistir IS 'Llave foránea que relaciona los clientes que asistiran a un evento mediante el Id_Evento';





