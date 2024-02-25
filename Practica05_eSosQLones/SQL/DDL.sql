/*
Script para la creación de la base de datos Zoologico 
*/

-- Creamos el esquema

DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

-------------TABLAS CON LLAVES PRIMARIAS-----------------

CREATE TABLE servicio(
	Id_Servicio INT,
	Cantidad INT,
	tipoServicio TEXT,
	costoUnitario FLOAT8
);
 
 --Restricciones Servicio
 --Dominio
ALTER TABLE servicio ALTER COLUMN Id_Servicio 
SET NOT NULL;
ALTER TABLE servicio ALTER COLUMN Cantidad
SET NOT NULL;
ALTER TABLE servicio ADD CONSTRAINT servicio_d1
CHECK(tipoServicio <> '');
ALTER TABLE servicio ALTER COLUMN costoUnitario
SET NOT NULL;

--Entidad
ALTER TABLE servicio ADD CONSTRAINT servicio_pkey
PRIMARY KEY(Id_Servicio);

CREATE TABLE evento(
	Id_Evento INT,
	listaAsistentes TEXT,
	Capacidad INT,
	tipoEvento TEXT,
	Fecha DATE
);

 --Restricciones Evento
 --Dominio
ALTER TABLE evento ALTER COLUMN Id_Evento 
SET NOT NULL;
ALTER TABLE evento ADD CONSTRAINT evento_d1
CHECK(listaAsistentes <> '');
ALTER TABLE evento ALTER COLUMN Capacidad
SET NOT NULL;
ALTER TABLE evento ADD CONSTRAINT evento_d2
CHECK(tipoEvento <> '');

--Entidad
ALTER TABLE evento ADD CONSTRAINT evento_pkey
PRIMARY KEY(Id_Evento);

CREATE TABLE persona(
	Id_Persona INT,
	Nombre TEXT,
	ApellidoPat VARCHAR(50),
	ApellidoMat VARCHAR(50),
	Genero CHAR,
	Fecha_Nac DATE,
	FechaIn_Con DATE,
	FechaFin_Con DATE,
	Estado VARCHAR(50),
Num_Int INT,
	Num_Ext INT,
	Colonia TEXT,
	Calle TEXT
);

 --Restricciones Persona
 --Dominio
ALTER TABLE persona ALTER COLUMN Id_Persona
SET NOT NULL;
ALTER TABLE persona ADD CONSTRAINT persona_d1
CHECK(Nombre <> '');
ALTER TABLE persona ADD CONSTRAINT persona_d2
CHECK(ApellidoPat <> '');
ALTER TABLE persona ADD CONSTRAINT persona_d3
CHECK(ApellidoMat <> '');
ALTER TABLE persona ADD CONSTRAINT persona_d4
CHECK(Genero = 'H' OR Genero  = 'F');
ALTER TABLE persona ADD CONSTRAINT persona_d5
CHECK(Estado <> '');
ALTER TABLE persona ALTER COLUMN Num_Int
SET NOT NULL;
ALTER TABLE persona ALTER COLUMN Num_Ext
SET NOT NULL;
ALTER TABLE persona ADD CONSTRAINT persona_d6
CHECK(Colonia <> '');
ALTER TABLE persona ADD CONSTRAINT persona_d7
CHECK(Calle <> '');

--Entidad
ALTER TABLE persona ADD CONSTRAINT persona_pkey
PRIMARY KEY(Id_Persona);

CREATE TABLE insumo(
	Id_Insumo INT,
	fechaCad DATE,
	Proveedor VARCHAR(13),
	seRefrigera BOOL,
	Nombre TEXT,
	Cantidad FLOAT8
);

 --Restricciones Insumo
 --Dominio
ALTER TABLE insumo ALTER COLUMN Id_Insumo
SET NOT NULL;
ALTER TABLE insumo ADD CONSTRAINT insumo_d1
CHECK(Proveedor <> '');
ALTER TABLE insumo ALTER COLUMN seRefrigera
SET DEFAULT(true);
ALTER TABLE insumo ADD CONSTRAINT insumo_d2
CHECK(Nombre <> '');
ALTER TABLE insumo ALTER COLUMN Cantidad
SET NOT NULL;

--Entidad
ALTER TABLE insumo ADD CONSTRAINT insumo_pkey
PRIMARY KEY(Id_Insumo);


------------TABLAS CON LLAVES FORANEAS---------------
CREATE TABLE cliente(
	Id_Cliente INT,
	Id_Persona INT
);

--Restricciones Cliente
--Dominio
ALTER TABLE cliente ALTER COLUMN Id_Persona
SET NOT NULL;

--Entidad
ALTER TABLE cliente ADD CONSTRAINT cliente_pkey
PRIMARY KEY(Id_Cliente);

--Referencial
ALTER TABLE cliente ADD CONSTRAINT cliente_fkey
FOREIGN KEY(Id_Persona) REFERENCES persona(Id_Persona);

CREATE TABLE ticket(
	numTicket INT,
	Id_Cliente INT,
	costoTotal FLOAT8,
	Fecha DATE
);

 --Restricciones ticket
 --Dominio
ALTER TABLE ticket ALTER COLUMN numTicket
SET NOT NULL;
ALTER TABLE ticket ALTER COLUMN Id_Cliente
SET NOT NULL;
ALTER TABLE ticket ALTER COLUMN costoTotal
SET NOT NULL;
ALTER TABLE ticket ALTER COLUMN Fecha
SET NOT NULL;

--Entidad
ALTER TABLE ticket ADD CONSTRAINT ticket_pkey
PRIMARY KEY(numTicket);

--Referencial
ALTER TABLE ticket ADD CONSTRAINT ticket_fkey
FOREIGN KEY(Id_Cliente) REFERENCES cliente(Id_Cliente);

CREATE TABLE registrar(
	NumTicket INT,
	Id_Servicio INT
);

 --Restricciones Registrar
--Referencial
ALTER TABLE registrar ADD CONSTRAINT registrar_fkey1
FOREIGN KEY(NumTicket) REFERENCES ticket(NumTicket);
ALTER TABLE registrar ADD CONSTRAINT registrar_fkey2
FOREIGN KEY(Id_Servicio) REFERENCES servicio(Id_Servicio);

CREATE TABLE notificar(
	Id_Cliente INT,
	Id_Evento INT,
	Promocion TEXT,
	Descuento INT,
	Noti_evento TEXT
);

--Restricciones Notificar
--Dominio
ALTER TABLE notificar ADD CONSTRAINT notificar_d1
CHECK(Promocion <> '');
ALTER TABLE notificar ALTER COLUMN Descuento
SET NOT NULL;
ALTER TABLE notificar ADD CONSTRAINT notificar_d2
CHECK(Noti_evento <> '');

--Referencial
ALTER TABLE notificar ADD CONSTRAINT notificar_fkey1
FOREIGN KEY(Id_Cliente) REFERENCES cliente(Id_Cliente);
ALTER TABLE notificar ADD CONSTRAINT notificar_fkey2
FOREIGN KEY(Id_Evento) REFERENCES evento(Id_Evento);

CREATE TABLE trabajador(
	RFC VARCHAR(13),
	Id_Persona INT
);

 --Restricciones Trabajador
 --Dominio
ALTER TABLE trabajador ADD CONSTRAINT trabajador_d1
CHECK(LENGTH(RFC)=12 OR LENGTH(RFC)=13);
ALTER TABLE trabajador ALTER COLUMN Id_Persona 
SET NOT NULL;

--Entidad
ALTER TABLE trabajador ADD CONSTRAINT trabajador_pkey
PRIMARY KEY(RFC);

--Referencial
ALTER TABLE trabajador ADD CONSTRAINT trabajador_fkey
FOREIGN KEY(Id_Persona) REFERENCES persona(Id_Persona);

CREATE TABLE telefono(
	Id_Persona INT,
	Telefono INT
);

 --Dominio
ALTER TABLE telefono ALTER COLUMN Telefono 
SET NOT NULL;

--Referencial
ALTER TABLE telefono ADD CONSTRAINT telefono_fkey
FOREIGN KEY(Id_Persona) REFERENCES persona(Id_Persona);

CREATE TABLE correo(
	Id_Persona INT,
	Correo TEXT
);

 --Restricciones Correo
 --Dominio
 ALTER TABLE correo ADD CONSTRAINT correo_d1
 CHECK (correo LIKE '%_@_%._%' );

--Referencial
ALTER TABLE correo ADD CONSTRAINT correo_fkey
FOREIGN KEY(Id_Persona) REFERENCES persona(Id_Persona);

CREATE TABLE veterinario(
	RFC VARCHAR(13),
	Salario FLOAT8
);

 --Restricciones Veterinario
 --Dominio
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d1
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);
 ALTER TABLE veterinario ALTER COLUMN Salario
 SET NOT NULL;

--Entidad
ALTER TABLE veterinario ADD CONSTRAINT veterinario_pkey
PRIMARY KEY(RFC);

--Referencial
ALTER TABLE veterinario ADD CONSTRAINT veterinario_fkey
FOREIGN KEY(RFC) REFERENCES trabajador(RFC);

CREATE TABLE cuidador(
	RFC VARCHAR(13),
	Animal_Enc INT,
	Dias_Trab INT,
	Salario FLOAT8
);

 --Restricciones Cuidador
 --Dominio
ALTER TABLE cuidador ALTER COLUMN Animal_Enc
SET NOT NULL;
ALTER TABLE cuidador ALTER COLUMN Dias_Trab
SET NOT NULL;
ALTER TABLE cuidador ALTER COLUMN Salario
SET NOT NULL;
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d1
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);

--Entidad
ALTER TABLE cuidador ADD CONSTRAINT cuidador_pkey
PRIMARY KEY(RFC);

--Referencial
ALTER TABLE cuidador ADD CONSTRAINT cuidador_fkey
FOREIGN KEY(RFC) REFERENCES trabajador(RFC);

CREATE TABLE animal(
	Id_Animal INT,
	RFC VARCHAR(13),
	Num_Jaula INT,
	Nombre TEXT,
	Alimentacion TEXT,
	Sexo CHAR,
	Altura FLOAT,
	Peso FLOAT,
	Especie TEXT
);

 --Restricciones Animal
 --Dominio
ALTER TABLE animal ADD CONSTRAINT animal_d1
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);
ALTER TABLE animal ALTER COLUMN Id_Animal
SET NOT NULL;
ALTER TABLE animal ALTER COLUMN Num_Jaula
SET NOT NULL;
ALTER TABLE animal ADD CONSTRAINT animal_d2
CHECK(Num_Jaula > 0);
ALTER TABLE animal ADD CONSTRAINT animal_d3
CHECK(Nombre <> '');
ALTER TABLE animal ADD CONSTRAINT animal_d4
CHECK(Alimentacion <> '');
ALTER TABLE animal ADD CONSTRAINT animal_d5
CHECK(Sexo = 'H' OR Sexo = 'F');
ALTER TABLE animal ALTER COLUMN Altura
SET NOT NULL;
ALTER TABLE animal ADD CONSTRAINT animal_d6
CHECK(Altura > 0);
ALTER TABLE animal ALTER COLUMN Peso
SET NOT NULL;
ALTER TABLE animal ADD CONSTRAINT animal_d7
CHECK(Peso > 0);
ALTER TABLE animal ADD CONSTRAINT animal_d8
CHECK(Especie <> '');

--Entidad
ALTER TABLE animal ADD CONSTRAINT animal_pkey
PRIMARY KEY(Id_Animal);

--Referencial
ALTER TABLE animal ADD CONSTRAINT animal_fkey
FOREIGN KEY(RFC) REFERENCES veterinario(RFC);

CREATE TABLE bioma(
	Tipo TEXT,
	RFC VARCHAR(13),
	Id_Animal INT,
	Num_Cuid INT,
	Num_Vet INT,
	Num_Anim INT,
	Servicio TEXT,
	Num_Jaulas INT
);

 --Restricciones Bioma
 --Dominio
ALTER TABLE bioma ADD CONSTRAINT bioma_d1
CHECK(Tipo <> '');
ALTER TABLE bioma ADD CONSTRAINT bioma_d2
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);
ALTER TABLE bioma ALTER COLUMN Id_Animal
SET NOT NULL;
ALTER TABLE bioma ADD CONSTRAINT bioma_d3
CHECK(Servicio <> '');
ALTER TABLE bioma ALTER COLUMN Num_Cuid
SET NOT NULL;
ALTER TABLE bioma ADD CONSTRAINT bioma_d4
CHECK(Num_Cuid > 0);
ALTER TABLE bioma ALTER COLUMN Num_Vet
SET NOT NULL;
ALTER TABLE bioma ADD CONSTRAINT bioma_d5
CHECK(Num_Vet > 0);
ALTER TABLE bioma ALTER COLUMN Num_Anim
SET NOT NULL;
ALTER TABLE bioma ADD CONSTRAINT bioma_d6
CHECK(Num_Anim > 0);
ALTER TABLE bioma ALTER COLUMN Num_Jaulas
SET NOT NULL;
ALTER TABLE bioma ADD CONSTRAINT bioma_d7
CHECK(Num_Jaulas > 0);

--Entidad
ALTER TABLE bioma ADD CONSTRAINT bioma_pkey
PRIMARY KEY(Tipo);

--Referencial
ALTER TABLE bioma ADD CONSTRAINT bioma_fkey1
FOREIGN KEY(RFC) REFERENCES cuidador(RFC);
ALTER TABLE bioma ADD CONSTRAINT bioma_fkey2
FOREIGN KEY(Id_Animal) REFERENCES animal(Id_Animal);

CREATE TABLE trabajar(
	RFC VARCHAR(13),
	Tipo TEXT
);

 --Restricciones Trabajar
 --Dominio
ALTER TABLE trabajar ADD CONSTRAINT trabajar_d1
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);
ALTER TABLE trabajar ADD CONSTRAINT trabajar_d2
CHECK(Tipo <> '');

--Referencial
ALTER TABLE trabajar ADD CONSTRAINT trabajar_fkey1
FOREIGN KEY(RFC) REFERENCES veterinario(RFC);
ALTER TABLE trabajar ADD CONSTRAINT trabajar_fkey2
FOREIGN KEY(Tipo) REFERENCES bioma(Tipo);

CREATE TABLE proveedor(
	RFC VARCHAR(13),
	Costo_Serv FLOAT8,
	Producto TEXT,
	Frecuencia INT
);

 --Restricciones Proveedor
 --Dominio
ALTER TABLE proveedor ALTER COLUMN Costo_Serv
SET NOT NULL;
ALTER TABLE proveedor ALTER COLUMN Frecuencia
SET NOT NULL;
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d1
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d2
CHECK(Producto <> '');

--Referencial
ALTER TABLE proveedor ADD CONSTRAINT proveedor_fkey
FOREIGN KEY(RFC) REFERENCES trabajador(RFC);

CREATE TABLE distribuir(
	Id_Insumo INT,
	Tipo TEXT
);

 --Restricciones Distribuir
 --Dominio
ALTER TABLE distribuir ALTER COLUMN Id_Insumo
SET NOT NULL;
ALTER TABLE distribuir ADD CONSTRAINT distribuir_d1
CHECK(Tipo <> '');

--Referencial
ALTER TABLE distribuir ADD CONSTRAINT distribuir_fkey1
FOREIGN KEY(Id_Insumo) REFERENCES insumo(Id_Insumo);
ALTER TABLE distribuir ADD CONSTRAINT distribuir_fkey2
FOREIGN KEY(Tipo) REFERENCES bioma(Tipo);

CREATE TABLE indicacionMed(
	Id_Animal INT,
	IndicacionMed TEXT
);

 --Restricciones IndicacionMed
 --Dominio
ALTER TABLE indicacionMed ALTER COLUMN Id_Animal
SET NOT NULL;
ALTER TABLE indicacionMed ADD CONSTRAINT indicacionMed_d1
CHECK(IndicacionMed <> '');

--Referencial
ALTER TABLE indicacionMed ADD CONSTRAINT indicacionMed_fkey
FOREIGN KEY(Id_Animal) REFERENCES animal(Id_Animal);

CREATE TABLE alimento(
	Id_Insumo INT,
	tipoAlimento TEXT
);

 --Restricciones Alimento
 --Dominio
ALTER TABLE alimento ALTER COLUMN Id_Insumo
SET NOT NULL;
ALTER TABLE alimento ADD CONSTRAINT alimento_d1
CHECK(tipoAlimento <> '');

--Referencial
ALTER TABLE alimento ADD CONSTRAINT alimento_fkey
FOREIGN KEY(Id_Insumo) REFERENCES insumo(Id_Insumo);

CREATE TABLE medicina(
	Id_Insumo INT,
	labProcedencia TEXT,
	Lote INT
);

 --Restricciones Medicina
 --Dominio
ALTER TABLE medicina ALTER COLUMN Id_Insumo
SET NOT NULL;
ALTER TABLE medicina ALTER COLUMN Lote
SET NOT NULL;
ALTER TABLE medicina ADD CONSTRAINT medicina_d1
CHECK(labProcedencia <> '');

--Referencial
ALTER TABLE medicina ADD CONSTRAINT medicina_fkey
FOREIGN KEY(Id_Insumo) REFERENCES insumo(Id_Insumo);

CREATE TABLE atender(
	RFC VARCHAR(13),
	Id_Animal INT,
	mismoBioma  BOOLEAN
);

 --Restricciones Atender
 --Dominio
ALTER TABLE atender ADD CONSTRAINT atender_d1
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);
ALTER TABLE atender ALTER COLUMN Id_Animal
SET NOT NULL;
ALTER TABLE atender ALTER COLUMN mismoBioma
SET DEFAULT (false);

--Referencial
ALTER TABLE atender ADD CONSTRAINT atender_fkey1
FOREIGN KEY(RFC) REFERENCES veterinario(RFC);
ALTER TABLE atender ADD CONSTRAINT atender_fkey2
FOREIGN KEY(Id_Animal) REFERENCES animal(Id_Animal);

CREATE TABLE especialidad(
	RFC VARCHAR(13),
	Especialidad TEXT
);

--Restricciones Especialidad
--Dominio
ALTER TABLE especialidad ADD CONSTRAINT especialidad_d1
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);
ALTER TABLE especialidad ADD CONSTRAINT especialidad_d2
CHECK(Especialidad <> '');

--Referencial
ALTER TABLE especialidad ADD CONSTRAINT especialidad_fkey
FOREIGN KEY(RFC) REFERENCES veterinario(RFC);

CREATE TABLE cuidar(
	Id_Animal INT,
	RFC VARCHAR(13)
);

--Restricciones Cuidar
--Dominio
ALTER TABLE cuidar ALTER COLUMN Id_Animal
SET NOT NULL;
ALTER TABLE cuidar ADD CONSTRAINT cuidar_d1
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);

--Referencial
ALTER TABLE cuidar ADD CONSTRAINT cuidar_fkey1
FOREIGN KEY(RFC) REFERENCES cuidador(RFC);
ALTER TABLE cuidar ADD CONSTRAINT cuidar_fkey2
FOREIGN KEY(Id_Animal) REFERENCES animal(Id_Animal);




