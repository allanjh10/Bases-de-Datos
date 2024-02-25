/*
Script para la creación de la base de datos Zoologico 
*/

-- Creamos el esquema

DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

-------------TABLAS CON LLAVES PRIMARIAS-----------------
-- Definición de la tabla 'servicio'
CREATE TABLE servicio(
	Id_Servicio INT,
	Cantidad INT,
	tipoServicio TEXT,
	costoUnitario FLOAT8
);

-- Comentario para la tabla 'servicio'
COMMENT ON TABLE servicio IS 'Tabla que contiene los servicios que son ofrecidos';                   

-- Comentarios para las columnas de la tabla 'servicio'
COMMENT ON COLUMN servicio.Id_Servicio IS 'Identificador único para el servicio';
COMMENT ON COLUMN servicio.Cantidad IS 'Cantidad de servicios';
COMMENT ON COLUMN servicio.tipoServicio IS 'Tipo o categoría del servicio ofrecido';
COMMENT ON COLUMN servicio.costoUnitario IS 'Costo por unidad del servicio';

--Restricciones Servicio
--Dominio
ALTER TABLE servicio ALTER COLUMN Id_Servicio 
SET NOT NULL;
COMMENT ON COLUMN  servicio.Id_Servicio IS 'El Id_Servicio no debe ser nulo';

ALTER TABLE servicio ALTER COLUMN Cantidad
SET NOT NULL;
COMMENT ON COLUMN servicio.Cantidad IS 'La cantidad no debe ser nula';

ALTER TABLE servicio ADD CONSTRAINT servicio_d1
CHECK(tipoServicio <> '');
COMMENT ON CONSTRAINT servicio_d1 ON servicio IS 'El tipo de servicio no debe estar vacío';

ALTER TABLE servicio ALTER COLUMN costoUnitario
SET NOT NULL;
COMMENT ON COLUMN servicio.costoUnitario IS 'El costo por unidad no debe ser nulo';

--Entidad
ALTER TABLE servicio ADD CONSTRAINT servicio_pkey
PRIMARY KEY(Id_Servicio);
COMMENT ON CONSTRAINT servicio_pkey ON servicio IS 'Llave primaria para la tabla servicio basada en el Id_Servicio';

-- Definición de la tabla 'evento'
CREATE TABLE evento(
	Id_Evento INT,
	listaAsistentes TEXT,
	Capacidad INT,
	tipoEvento TEXT,
	Fecha DATE
);

-- Comentario para la tabla 'evento'
COMMENT ON TABLE evento IS 'Tabla que contiene los eventos que se llevarán a cabo';

-- Comentarios para las columnas de la tabla 'evento'
COMMENT ON COLUMN evento.Id_Evento IS 'Identificador único para el evento';
COMMENT ON COLUMN evento.listaAsistentes IS 'Listado de asistentes al evento';
COMMENT ON COLUMN evento.Capacidad IS 'Capacidad máxima de asistentes permitidos en el evento';
COMMENT ON COLUMN evento.tipoEvento IS 'Tipo o categoría del evento';
COMMENT ON COLUMN evento.Fecha IS 'Fecha en la que se llevará a cabo el evento';

--Restricciones Evento
--Dominio
ALTER TABLE evento ALTER COLUMN Id_Evento 
SET NOT NULL;
COMMENT ON COLUMN evento.Id_Evento IS 'El Id_Evento no debe ser nulo';

ALTER TABLE evento ADD CONSTRAINT evento_d1
CHECK(listaAsistentes <> '');
COMMENT ON CONSTRAINT evento_d1 ON evento IS 'La lista de asistentes no debe estar vacía';

ALTER TABLE evento ALTER COLUMN Capacidad
SET NOT NULL;
COMMENT ON COLUMN evento.Capacidad IS 'La capacidad no debe ser nula';

ALTER TABLE evento ADD CONSTRAINT evento_d2
CHECK(tipoEvento <> '');
COMMENT ON CONSTRAINT evento_d2 ON evento IS 'El tipo de evento no debe estar vacío';

--Entidad
ALTER TABLE evento ADD CONSTRAINT evento_pkey
PRIMARY KEY(Id_Evento);
COMMENT ON CONSTRAINT evento_pkey ON evento IS 'Llave primaria para la tabla evento basada en el Id_Evento';

-- Definición de la tabla 'persona'
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

-- Comentario para la tabla 'persona'
COMMENT ON TABLE persona IS 'Tabla que contiene a las personas';

-- Comentarios para las columnas de la tabla 'persona'
COMMENT ON COLUMN persona.Id_Persona IS 'Identificador único para la persona';
COMMENT ON COLUMN persona.Nombre IS 'Nombre de la persona';
COMMENT ON COLUMN persona.ApellidoPat IS 'Apellido paterno de la persona';
COMMENT ON COLUMN persona.ApellidoMat IS 'Apellido materno de la persona';
COMMENT ON COLUMN persona.Genero IS 'Género de la persona: H para hombre, F para mujer';
COMMENT ON COLUMN persona.Fecha_Nac IS 'Fecha de nacimiento de la persona';
COMMENT ON COLUMN persona.FechaIn_Con IS 'Fecha de inicio de contrato (si aplica)';
COMMENT ON COLUMN persona.FechaFin_Con IS 'Fecha de finalización de contrato (si aplica)';
COMMENT ON COLUMN persona.Estado IS 'Estado o provincia donde reside la persona';
COMMENT ON COLUMN persona.Num_Int IS 'Número interior de la vivienda';
COMMENT ON COLUMN persona.Num_Ext IS 'Número exterior de la vivienda';
COMMENT ON COLUMN persona.Colonia IS 'Colonia o barrio donde reside la persona';
COMMENT ON COLUMN persona.Calle IS 'Calle donde reside la persona';

--Restricciones Persona
--Dominio
ALTER TABLE persona ALTER COLUMN Id_Persona
SET NOT NULL;
COMMENT ON COLUMN persona.Id_Persona IS 'El Id_Persona no debe ser nulo';

ALTER TABLE persona ADD CONSTRAINT persona_d1
CHECK(Nombre <> '');
COMMENT ON CONSTRAINT persona_d1 ON persona IS 'El nombre no debe estar vacío';

ALTER TABLE persona ADD CONSTRAINT persona_d2
CHECK(ApellidoPat <> '');
COMMENT ON CONSTRAINT persona_d2 ON persona IS 'El apellido paterno no debe estar vacío';

ALTER TABLE persona ADD CONSTRAINT persona_d3
CHECK(ApellidoMat <> '');
COMMENT ON CONSTRAINT persona_d3 ON persona IS 'El apellido materno no debe estar vacío';

ALTER TABLE persona ADD CONSTRAINT persona_d4
CHECK(Genero = 'M' OR Genero  = 'F');
COMMENT ON CONSTRAINT persona_d4 ON persona IS 'El género debe ser M (hombre) o F (mujer)';

ALTER TABLE persona ADD CONSTRAINT persona_d5
CHECK(Estado <> '');
COMMENT ON CONSTRAINT persona_d5 ON persona IS 'El estado no debe estar vacío';

ALTER TABLE persona ALTER COLUMN Num_Int
SET NOT NULL;
COMMENT ON COLUMN persona.Num_Int IS 'El número interior no debe ser nulo';

ALTER TABLE persona ALTER COLUMN Num_Ext
SET NOT NULL;
COMMENT ON COLUMN persona.Num_Ext IS 'El número exterior no debe ser nulo';

ALTER TABLE persona ADD CONSTRAINT persona_d6
CHECK(Colonia <> '');
COMMENT ON CONSTRAINT persona_d6 ON persona IS 'La colonia no debe estar vacía';

ALTER TABLE persona ADD CONSTRAINT persona_d7
CHECK(Calle <> '');
COMMENT ON CONSTRAINT persona_d7 ON persona IS 'La calle no debe estar vacía';

--Entidad
ALTER TABLE persona ADD CONSTRAINT persona_pkey
PRIMARY KEY(Id_Persona);
COMMENT ON CONSTRAINT persona_pkey ON persona IS 'Llave primaria para la tabla persona basada en el Id_Persona';


-- Definición de la tabla 'insumo'
CREATE TABLE insumo(
	Id_Insumo INT,
	fechaCad DATE,
	Proveedor VARCHAR(13),
	seRefrigera BOOL,
	Nombre TEXT,
	Cantidad FLOAT8
);

-- Comentario para la tabla 'insumo'
COMMENT ON TABLE insumo IS 'Tabla que contiene los insumos';

-- Comentarios para las columnas de la tabla 'insumo'
COMMENT ON COLUMN insumo.Id_Insumo IS 'Identificador único para el insumo';
COMMENT ON COLUMN insumo.fechaCad IS 'Fecha de caducidad del insumo';
COMMENT ON COLUMN insumo.Proveedor IS 'Proveedor del insumo';
COMMENT ON COLUMN insumo.seRefrigera IS 'Indica si el insumo requiere refrigeración';
COMMENT ON COLUMN insumo.Nombre IS 'Nombre del insumo';
COMMENT ON COLUMN insumo.Cantidad IS 'Cantidad disponible del insumo';

--Restricciones Insumo
--Dominio
ALTER TABLE insumo ALTER COLUMN Id_Insumo
SET NOT NULL;
COMMENT ON COLUMN insumo.Id_Insumo IS 'El Id_Insumo no debe ser nulo';

ALTER TABLE insumo ADD CONSTRAINT insumo_d1
CHECK(Proveedor <> '');
COMMENT ON CONSTRAINT insumo_d1 ON insumo IS 'El proveedor no debe estar vacío';

ALTER TABLE insumo ALTER COLUMN seRefrigera
SET DEFAULT(true);
-- No se necesita un comentario específico para una definición de valor predeterminado, ya que esto no crea una restricción con un nombre específico.

ALTER TABLE insumo ADD CONSTRAINT insumo_d2
CHECK(Nombre <> '');
COMMENT ON CONSTRAINT insumo_d2 ON insumo IS 'El nombre del insumo no debe estar vacío';

ALTER TABLE insumo ALTER COLUMN Cantidad
SET NOT NULL;
COMMENT ON COLUMN insumo.Cantidad IS 'La cantidad del insumo no debe ser nula';

--Entidad
ALTER TABLE insumo ADD CONSTRAINT insumo_pkey
PRIMARY KEY(Id_Insumo);
COMMENT ON CONSTRAINT insumo_pkey ON insumo IS 'Llave primaria para la tabla insumo basada en el Id_Insumo';


------------TABLAS CON LLAVES FORANEAS---------------
-- Definición de la tabla 'cliente'
CREATE TABLE cliente(
	Id_Cliente INT,
	Id_Persona INT
);

-- Comentario para la tabla 'cliente'
COMMENT ON TABLE cliente IS 'Tabla que contiene a los clientes';

-- Comentarios para las columnas de la tabla 'cliente'
COMMENT ON COLUMN cliente.Id_Cliente IS 'Identificador único para el cliente';
COMMENT ON COLUMN cliente.Id_Persona IS 'Identificador que relaciona al cliente con una persona en la tabla persona';

--Restricciones Cliente
--Dominio
ALTER TABLE cliente ALTER COLUMN Id_Persona
SET NOT NULL;
COMMENT ON COLUMN cliente.Id_Persona IS 'El Id_Persona no debe ser nulo';

--Entidad
ALTER TABLE cliente ADD CONSTRAINT cliente_pkey
PRIMARY KEY(Id_Cliente);
COMMENT ON CONSTRAINT cliente_pkey ON cliente IS 'Llave primaria para la tabla cliente basada en el Id_Cliente';

--Referencial
ALTER TABLE cliente ADD CONSTRAINT cliente_fkey
FOREIGN KEY(Id_Persona) REFERENCES persona(Id_Persona);
COMMENT ON CONSTRAINT cliente_fkey ON cliente IS 'Llave foránea que relaciona a un cliente con una persona en la tabla persona mediante el Id_Persona';


-- Definición de la tabla 'ticket'
CREATE TABLE ticket(
	numTicket INT,
	Id_Cliente INT,
	costoTotal FLOAT8,
	Fecha DATE
);

-- Comentario para la tabla 'ticket'
COMMENT ON TABLE ticket IS 'Tabla que contiene los tickets';

-- Comentarios para las columnas de la tabla 'ticket'
COMMENT ON COLUMN ticket.numTicket IS 'Número único para el ticket';
COMMENT ON COLUMN ticket.Id_Cliente IS 'Identificador que relaciona el ticket con un cliente en la tabla cliente';
COMMENT ON COLUMN ticket.costoTotal IS 'Costo total del ticket';
COMMENT ON COLUMN ticket.Fecha IS 'Fecha de emisión del ticket';

--Restricciones ticket
--Dominio
ALTER TABLE ticket ALTER COLUMN numTicket
SET NOT NULL;
COMMENT ON COLUMN ticket.numTicket IS 'El número de ticket no debe ser nulo';

ALTER TABLE ticket ALTER COLUMN Id_Cliente
SET NOT NULL;
COMMENT ON COLUMN ticket.Id_Cliente IS 'El identificador del cliente no debe ser nulo';

ALTER TABLE ticket ALTER COLUMN costoTotal
SET NOT NULL;
COMMENT ON COLUMN ticket.costoTotal IS 'El costo total no debe ser nulo';

ALTER TABLE ticket ALTER COLUMN Fecha
SET NOT NULL;
COMMENT ON COLUMN ticket.Fecha IS 'La fecha de emisión no debe ser nula';

--Entidad
ALTER TABLE ticket ADD CONSTRAINT ticket_pkey
PRIMARY KEY(numTicket);
COMMENT ON CONSTRAINT ticket_pkey ON ticket IS 'Llave primaria para la tabla ticket basada en el número de ticket';

--Referencial
ALTER TABLE ticket ADD CONSTRAINT ticket_fkey
FOREIGN KEY(Id_Cliente) REFERENCES cliente(Id_Cliente);
COMMENT ON CONSTRAINT ticket_fkey ON ticket IS 'Llave foránea que relaciona un ticket con un cliente en la tabla cliente mediante el Id_Cliente';


-- Definición de la tabla 'registrar'
CREATE TABLE registrar(
	NumTicket INT,
	Id_Servicio INT
);

-- Comentario para la tabla 'registrar'
COMMENT ON TABLE registrar IS 'Tabla que contiene los registros a los servicios ofrecidos';

-- Comentarios para las columnas de la tabla 'registrar'
COMMENT ON COLUMN registrar.NumTicket IS 'Número del ticket que se está registrando';
COMMENT ON COLUMN registrar.Id_Servicio IS 'Identificador del servicio que se está registrando';

--Restricciones Registrar
--Referencial
ALTER TABLE registrar ADD CONSTRAINT registrar_fkey1
FOREIGN KEY(NumTicket) REFERENCES ticket(NumTicket);
COMMENT ON CONSTRAINT registrar_fkey1 ON registrar IS 'Llave foránea que relaciona el registro con un ticket en la tabla ticket mediante el NumTicket';

ALTER TABLE registrar ADD CONSTRAINT registrar_fkey2
FOREIGN KEY(Id_Servicio) REFERENCES servicio(Id_Servicio);
COMMENT ON CONSTRAINT registrar_fkey2 ON registrar IS 'Llave foránea que relaciona el registro con un servicio en la tabla servicio mediante el Id_Servicio';

-- Definición de la tabla 'notificar'
CREATE TABLE notificar(
	Id_Cliente INT,
	Id_Evento INT,
	Promocion TEXT,
	Descuento INT,
	Noti_evento TEXT
);

-- Comentario para la tabla 'notificar'
COMMENT ON TABLE notificar IS 'Tabla que contiene las notificaciones para los clientes';

-- Comentarios para las columnas de la tabla 'notificar'
COMMENT ON COLUMN notificar.Id_Cliente IS 'Identificador del cliente al que se notifica';
COMMENT ON COLUMN notificar.Id_Evento IS 'Identificador del evento sobre el que se notifica';
COMMENT ON COLUMN notificar.Promocion IS 'Texto de la promoción que se notifica';
COMMENT ON COLUMN notificar.Descuento IS 'Porcentaje o cantidad del descuento ofrecido en la notificación';
COMMENT ON COLUMN notificar.Noti_evento IS 'Texto o detalles adicionales sobre el evento en la notificación';

--Restricciones Notificar
--Dominio
ALTER TABLE notificar ADD CONSTRAINT notificar_d1
CHECK(Promocion <> '');
COMMENT ON CONSTRAINT notificar_d1 ON notificar IS 'La promoción no debe estar vacía';

ALTER TABLE notificar ALTER COLUMN Descuento
SET NOT NULL;
COMMENT ON COLUMN notificar.Descuento IS 'El descuento no debe ser nulo';

ALTER TABLE notificar ADD CONSTRAINT notificar_d2
CHECK(Noti_evento <> '');
COMMENT ON CONSTRAINT notificar_d2 ON notificar IS 'La notificación del evento no debe estar vacía';

--Referencial
ALTER TABLE notificar ADD CONSTRAINT notificar_fkey1
FOREIGN KEY(Id_Cliente) REFERENCES cliente(Id_Cliente);
COMMENT ON CONSTRAINT notificar_fkey1 ON notificar IS 'Llave foránea que relaciona la notificación con un cliente en la tabla cliente mediante el Id_Cliente';

ALTER TABLE notificar ADD CONSTRAINT notificar_fkey2
FOREIGN KEY(Id_Evento) REFERENCES evento(Id_Evento);
COMMENT ON CONSTRAINT notificar_fkey2 ON notificar IS 'Llave foránea que relaciona la notificación con un evento en la tabla evento mediante el Id_Evento';


-- Definición de la tabla 'trabajador'
CREATE TABLE trabajador(
	RFC VARCHAR(13),
	Id_Persona INT
);

-- Comentario para la tabla 'trabajador'
COMMENT ON TABLE trabajador IS 'Tabla que contiene a los trabajadores';

-- Comentarios para las columnas de la tabla 'trabajador'
COMMENT ON COLUMN trabajador.RFC IS 'Registro Federal de Contribuyentes (RFC) del trabajador';
COMMENT ON COLUMN trabajador.Id_Persona IS 'Identificador de la persona relacionada con el trabajador';

--Restricciones Trabajador
--Dominio
ALTER TABLE trabajador ADD CONSTRAINT trabajador_d1
CHECK(LENGTH(RFC)=12 OR LENGTH(RFC)=13);
COMMENT ON CONSTRAINT trabajador_d1 ON trabajador IS 'El RFC debe tener una longitud válida de 12 o 13 caracteres';

ALTER TABLE trabajador ALTER COLUMN Id_Persona 
SET NOT NULL;
COMMENT ON COLUMN trabajador.Id_Persona IS 'El Id_Persona no debe ser nulo';

--Entidad
ALTER TABLE trabajador ADD CONSTRAINT trabajador_pkey
PRIMARY KEY(RFC);
COMMENT ON CONSTRAINT trabajador_pkey ON trabajador IS 'Llave primaria para la tabla trabajador basada en el RFC';

--Referencial
ALTER TABLE trabajador ADD CONSTRAINT trabajador_fkey
FOREIGN KEY(Id_Persona) REFERENCES persona(Id_Persona);
COMMENT ON CONSTRAINT trabajador_fkey ON trabajador IS 'Llave foránea que relaciona el trabajador con una persona en la tabla persona mediante el Id_Persona';

-- Definición de la tabla 'telefono'
CREATE TABLE telefono(
	Id_Persona INT,
	Telefono INT
);

-- Comentario para la tabla 'telefono'
COMMENT ON TABLE telefono IS 'Tabla que contiene los telefonos';

-- Comentarios para las columnas de la tabla 'telefono'
COMMENT ON COLUMN telefono.Id_Persona IS 'Identificador de la persona relacionada con el número de teléfono';
COMMENT ON COLUMN telefono.Telefono IS 'Número de teléfono';

--Dominio
ALTER TABLE telefono ALTER COLUMN Telefono 
SET NOT NULL;
COMMENT ON COLUMN telefono.Telefono IS 'El número de teléfono no debe ser nulo';

--Referencial
ALTER TABLE telefono ADD CONSTRAINT telefono_fkey
FOREIGN KEY(Id_Persona) REFERENCES persona(Id_Persona);
COMMENT ON CONSTRAINT telefono_fkey ON telefono IS 'Llave foránea que relaciona el número de teléfono con una persona en la tabla persona mediante el Id_Persona';

-- Definición de la tabla 'correo'
CREATE TABLE correo(
	Id_Persona INT,
	Correo TEXT
);

-- Comentario para la tabla 'correo'
COMMENT ON TABLE correo IS 'Tabla que contiene las direcciones de correo';

-- Comentarios para las columnas de la tabla 'correo'
COMMENT ON COLUMN correo.Id_Persona IS 'Identificador de la persona relacionada con la dirección de correo';
COMMENT ON COLUMN correo.Correo IS 'Dirección de correo electrónico';

--Restricciones Correo
--Dominio
ALTER TABLE correo ADD CONSTRAINT correo_d1
CHECK (correo LIKE '%_@_%._%' );
COMMENT ON CONSTRAINT correo_d1 ON correo IS 'El formato del correo electrónico debe ser válido';

--Referencial
ALTER TABLE correo ADD CONSTRAINT correo_fkey
FOREIGN KEY(Id_Persona) REFERENCES persona(Id_Persona);
COMMENT ON CONSTRAINT correo_fkey ON correo IS 'Llave foránea que relaciona la dirección de correo con una persona en la tabla persona mediante el Id_Persona';


-- Definición de la tabla 'veterinario'
CREATE TABLE veterinario(
	RFC VARCHAR(13),
	Salario FLOAT8
);

-- Comentario para la tabla 'veterinario'
COMMENT ON TABLE veterinario IS 'Tabla que contiene a los veterinarios';

-- Comentarios para las columnas de la tabla 'veterinario'
COMMENT ON COLUMN veterinario.RFC IS 'Registro Federal de Contribuyentes (RFC) del veterinario';
COMMENT ON COLUMN veterinario.Salario IS 'Salario del veterinario';

--Restricciones Veterinario
--Dominio
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d1
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);
COMMENT ON CONSTRAINT veterinario_d1 ON veterinario IS 'El RFC debe tener una longitud válida de 12 o 13 caracteres';

ALTER TABLE veterinario ALTER COLUMN Salario
SET NOT NULL;
COMMENT ON COLUMN veterinario.Salario IS 'El salario no debe ser nulo';

--Entidad
ALTER TABLE veterinario ADD CONSTRAINT veterinario_pkey
PRIMARY KEY(RFC);
COMMENT ON CONSTRAINT veterinario_pkey ON veterinario IS 'Llave primaria para la tabla veterinario basada en el RFC';

--Referencial
ALTER TABLE veterinario ADD CONSTRAINT veterinario_fkey
FOREIGN KEY(RFC) REFERENCES trabajador(RFC);
COMMENT ON CONSTRAINT veterinario_fkey ON veterinario IS 'Llave foránea que relaciona el veterinario con un trabajador en la tabla trabajador mediante el RFC';

-- Definición de la tabla 'cuidador'
CREATE TABLE cuidador(
	RFC VARCHAR(13),
	Animal_Enc INT,
	Dias_Trab INT,
	Salario FLOAT8
);

-- Comentario para la tabla 'cuidador'
COMMENT ON TABLE cuidador IS 'Tabla que contiene a los cuidadores';

-- Comentarios para las columnas de la tabla 'cuidador'
COMMENT ON COLUMN cuidador.RFC IS 'Registro Federal de Contribuyentes (RFC) del cuidador';
COMMENT ON COLUMN cuidador.Animal_Enc IS 'Identificador del animal a cargo del cuidador';
COMMENT ON COLUMN cuidador.Dias_Trab IS 'Cantidad de días trabajados por el cuidador';
COMMENT ON COLUMN cuidador.Salario IS 'Salario del cuidador';

--Restricciones Cuidador
--Dominio
ALTER TABLE cuidador ALTER COLUMN Animal_Enc
SET NOT NULL;
COMMENT ON COLUMN cuidador.Animal_Enc IS 'El identificador del animal no debe ser nulo';

ALTER TABLE cuidador ALTER COLUMN Dias_Trab
SET NOT NULL;
COMMENT ON COLUMN cuidador.Dias_Trab IS 'La cantidad de días trabajados no debe ser nula';

ALTER TABLE cuidador ALTER COLUMN Salario
SET NOT NULL;
COMMENT ON COLUMN cuidador.Salario IS 'El salario no debe ser nulo';

ALTER TABLE cuidador ADD CONSTRAINT cuidador_d1
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);
COMMENT ON CONSTRAINT cuidador_d1 ON cuidador IS 'El RFC debe tener una longitud válida de 12 o 13 caracteres';

--Entidad
ALTER TABLE cuidador ADD CONSTRAINT cuidador_pkey
PRIMARY KEY(RFC);
COMMENT ON CONSTRAINT cuidador_pkey ON cuidador IS 'Llave primaria para la tabla cuidador basada en el RFC';

--Referencial
ALTER TABLE cuidador ADD CONSTRAINT cuidador_fkey
FOREIGN KEY(RFC) REFERENCES trabajador(RFC);
COMMENT ON CONSTRAINT cuidador_fkey ON cuidador IS 'Llave foránea que relaciona el cuidador con un trabajador en la tabla trabajador mediante el RFC';


-- Definición de la tabla 'animal'
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

-- Comentario para la tabla 'animal'
COMMENT ON TABLE animal IS 'Tabla que contiene a los animales';

-- Comentarios para las columnas de la tabla 'animal'
COMMENT ON COLUMN animal.Id_Animal IS 'Identificador único para el animal';
COMMENT ON COLUMN animal.RFC IS 'Registro Federal de Contribuyentes (RFC) del veterinario responsable del animal';
COMMENT ON COLUMN animal.Num_Jaula IS 'Número de la jaula del animal';
COMMENT ON COLUMN animal.Nombre IS 'Nombre del animal';
COMMENT ON COLUMN animal.Alimentacion IS 'Descripción de la alimentación del animal';
COMMENT ON COLUMN animal.Sexo IS 'Género del animal: H para hombre, F para mujer';
COMMENT ON COLUMN animal.Altura IS 'Altura del animal en metros';
COMMENT ON COLUMN animal.Peso IS 'Peso del animal en kilogramos';
COMMENT ON COLUMN animal.Especie IS 'Especie del animal';

--Restricciones Animal
--Dominio
ALTER TABLE animal ADD CONSTRAINT animal_d1
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);
COMMENT ON CONSTRAINT animal_d1 ON animal IS 'El RFC debe tener una longitud válida de 12 o 13 caracteres';

ALTER TABLE animal ALTER COLUMN Id_Animal
SET NOT NULL;
COMMENT ON COLUMN animal.Id_Animal IS 'El Id_Animal no debe ser nulo';

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
FOREIGN KEY(RFC) REFERENCES veterinario(RFC);
COMMENT ON CONSTRAINT animal_fkey ON animal IS 'Llave foránea que relaciona el animal con un veterinario en la tabla veterinario mediante el RFC';


-- Definición de la tabla 'bioma'
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

-- Comentario para la tabla 'bioma'
COMMENT ON TABLE bioma IS 'Tabla que contiene los biomas';

-- Comentarios para las columnas de la tabla 'bioma'
COMMENT ON COLUMN bioma.Tipo IS 'Tipo de bioma';
COMMENT ON COLUMN bioma.RFC IS 'Registro Federal de Contribuyentes (RFC) del cuidador responsable del bioma';
COMMENT ON COLUMN bioma.Id_Animal IS 'Identificador del animal asociado al bioma';
COMMENT ON COLUMN bioma.Num_Cuid IS 'Número de cuidadores asignados al bioma';
COMMENT ON COLUMN bioma.Num_Vet IS 'Número de veterinarios asignados al bioma';
COMMENT ON COLUMN bioma.Num_Anim IS 'Número de animales en el bioma';
COMMENT ON COLUMN bioma.Servicio IS 'Descripción del servicio brindado en el bioma';
COMMENT ON COLUMN bioma.Num_Jaulas IS 'Número de jaulas en el bioma';

--Restricciones Bioma
--Dominio
ALTER TABLE bioma ADD CONSTRAINT bioma_d1
CHECK(Tipo <> '');
COMMENT ON CONSTRAINT bioma_d1 ON bioma IS 'El tipo de bioma no debe estar vacío';

ALTER TABLE bioma ADD CONSTRAINT bioma_d2
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);
COMMENT ON CONSTRAINT bioma_d2 ON bioma IS 'El RFC debe tener una longitud válida de 12 o 13 caracteres';

ALTER TABLE bioma ALTER COLUMN Id_Animal
SET NOT NULL;
COMMENT ON COLUMN bioma.Id_Animal IS 'El Id_Animal no debe ser nulo';

ALTER TABLE bioma ADD CONSTRAINT bioma_d3
CHECK(Servicio <> '');
COMMENT ON CONSTRAINT bioma_d3 ON bioma IS 'La descripción del servicio no debe estar vacía';

ALTER TABLE bioma ALTER COLUMN Num_Cuid
SET NOT NULL;
COMMENT ON COLUMN bioma.Num_Cuid IS 'El número de cuidadores no debe ser nulo';

ALTER TABLE bioma ADD CONSTRAINT bioma_d4
CHECK(Num_Cuid > 0);
COMMENT ON CONSTRAINT bioma_d4 ON bioma IS 'El número de cuidadores debe ser mayor que cero';

ALTER TABLE bioma ALTER COLUMN Num_Vet
SET NOT NULL;
COMMENT ON COLUMN bioma.Num_Vet IS 'El número de veterinarios no debe ser nulo';

ALTER TABLE bioma ADD CONSTRAINT bioma_d5
CHECK(Num_Vet > 0);
COMMENT ON CONSTRAINT bioma_d5 ON bioma IS 'El número de veterinarios debe ser mayor que cero';

ALTER TABLE bioma ALTER COLUMN Num_Anim
SET NOT NULL;
COMMENT ON COLUMN bioma.Num_Anim IS 'El número de animales no debe ser nulo';

ALTER TABLE bioma ADD CONSTRAINT bioma_d6
CHECK(Num_Anim > 0);
COMMENT ON CONSTRAINT bioma_d6 ON bioma IS 'El número de animales debe ser mayor que cero';

ALTER TABLE bioma ALTER COLUMN Num_Jaulas
SET NOT NULL;
COMMENT ON COLUMN bioma.Num_Jaulas IS 'El número de jaulas no debe ser nulo';

ALTER TABLE bioma ADD CONSTRAINT bioma_d7
CHECK(Num_Jaulas > 0);
COMMENT ON CONSTRAINT bioma_d7 ON bioma IS 'El número de jaulas debe ser mayor que cero';

--Entidad
ALTER TABLE bioma ADD CONSTRAINT bioma_pkey
PRIMARY KEY(Tipo);
COMMENT ON CONSTRAINT bioma_pkey ON bioma IS 'Llave primaria para la tabla bioma basada en el Tipo';

--Referencial
ALTER TABLE bioma ADD CONSTRAINT bioma_fkey1
FOREIGN KEY(RFC) REFERENCES cuidador(RFC);
COMMENT ON CONSTRAINT bioma_fkey1 ON bioma IS 'Llave foránea que relaciona el bioma con un cuidador en la tabla cuidador mediante el RFC';

ALTER TABLE bioma ADD CONSTRAINT bioma_fkey2
FOREIGN KEY(Id_Animal) REFERENCES animal(Id_Animal);
COMMENT ON CONSTRAINT bioma_fkey2 ON bioma IS 'Llave foránea que relaciona el bioma con un animal en la tabla animal mediante el Id_Animal';


-- Definición de la tabla 'trabajar'
CREATE TABLE trabajar(
	RFC VARCHAR(13),
	Tipo TEXT
);

-- Comentario para la tabla 'trabajar'
COMMENT ON TABLE trabajar IS 'Tabla que contiene los trabajos';

-- Comentarios para las columnas de la tabla 'trabajar'
COMMENT ON COLUMN trabajar.RFC IS 'Registro Federal de Contribuyentes (RFC) del trabajador';
COMMENT ON COLUMN trabajar.Tipo IS 'Tipo de trabajo que realiza el trabajador';

--Restricciones Trabajar
--Dominio
ALTER TABLE trabajar ADD CONSTRAINT trabajar_d1
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);
COMMENT ON CONSTRAINT trabajar_d1 ON trabajar IS 'El RFC debe tener una longitud válida de 12 o 13 caracteres';

ALTER TABLE trabajar ADD CONSTRAINT trabajar_d2
CHECK(Tipo <> '');
COMMENT ON CONSTRAINT trabajar_d2 ON trabajar IS 'El tipo de trabajo no debe estar vacío';

--Referencial
ALTER TABLE trabajar ADD CONSTRAINT trabajar_fkey1
FOREIGN KEY(RFC) REFERENCES veterinario(RFC);
COMMENT ON CONSTRAINT trabajar_fkey1 ON trabajar IS 'Llave foránea que relaciona el trabajo con un veterinario en la tabla veterinario mediante el RFC';

ALTER TABLE trabajar ADD CONSTRAINT trabajar_fkey2
FOREIGN KEY(Tipo) REFERENCES bioma(Tipo);
COMMENT ON CONSTRAINT trabajar_fkey2 ON trabajar IS 'Llave foránea que relaciona el trabajo con un bioma en la tabla bioma mediante el Tipo';

-- Definición de la tabla 'proveedor'
CREATE TABLE proveedor(
	RFC VARCHAR(13),
	Costo_Serv FLOAT8,
	Producto TEXT,
	Frecuencia INT
);

-- Comentario para la tabla 'proveedor'
COMMENT ON TABLE proveedor IS 'Tabla que contiene a los proveedores';

-- Comentarios para las columnas de la tabla 'proveedor'
COMMENT ON COLUMN proveedor.RFC IS 'Registro Federal de Contribuyentes (RFC) del proveedor';
COMMENT ON COLUMN proveedor.Costo_Serv IS 'Costo del servicio proporcionado por el proveedor';
COMMENT ON COLUMN proveedor.Producto IS 'Nombre del producto proporcionado por el proveedor';
COMMENT ON COLUMN proveedor.Frecuencia IS 'Frecuencia de los servicios proporcionados por el proveedor';

--Restricciones Proveedor
--Dominio
ALTER TABLE proveedor ALTER COLUMN Costo_Serv
SET NOT NULL;
COMMENT ON COLUMN proveedor.Costo_Serv IS 'El costo del servicio no debe ser nulo';

ALTER TABLE proveedor ALTER COLUMN Frecuencia
SET NOT NULL;
COMMENT ON COLUMN proveedor.Frecuencia IS 'La frecuencia no debe ser nula';

ALTER TABLE proveedor ADD CONSTRAINT proveedor_d1
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);
COMMENT ON CONSTRAINT proveedor_d1 ON proveedor IS 'El RFC debe tener una longitud válida de 12 o 13 caracteres';

ALTER TABLE proveedor ADD CONSTRAINT proveedor_d2
CHECK(Producto <> '');
COMMENT ON CONSTRAINT proveedor_d2 ON proveedor IS 'El nombre del producto no debe estar vacío';

--Referencial
ALTER TABLE proveedor ADD CONSTRAINT proveedor_fkey
FOREIGN KEY(RFC) REFERENCES trabajador(RFC);
COMMENT ON CONSTRAINT proveedor_fkey ON proveedor IS 'Llave foránea que relaciona el proveedor con un trabajador en la tabla trabajador mediante el RFC';


-- Definición de la tabla 'distribuir'
CREATE TABLE distribuir(
	Id_Insumo INT,
	Tipo TEXT
);

-- Comentario para la tabla 'distribuir'
COMMENT ON TABLE distribuir IS 'Tabla que contiene a las distribuciones de insumos';

-- Comentarios para las columnas de la tabla 'distribuir'
COMMENT ON COLUMN distribuir.Id_Insumo IS 'Identificador del insumo a distribuir';
COMMENT ON COLUMN distribuir.Tipo IS 'Tipo de distribución';

--Restricciones Distribuir
--Dominio
ALTER TABLE distribuir ALTER COLUMN Id_Insumo
SET NOT NULL;
COMMENT ON COLUMN distribuir.Id_Insumo IS 'El Id_Insumo no debe ser nulo';

ALTER TABLE distribuir ADD CONSTRAINT distribuir_d1
CHECK(Tipo <> '');
COMMENT ON CONSTRAINT distribuir_d1 ON distribuir IS 'El tipo de distribución no debe estar vacío';

--Referencial
ALTER TABLE distribuir ADD CONSTRAINT distribuir_fkey1
FOREIGN KEY(Id_Insumo) REFERENCES insumo(Id_Insumo);
COMMENT ON CONSTRAINT distribuir_fkey1 ON distribuir IS 'Llave foránea que relaciona la distribución con un insumo en la tabla insumo mediante el Id_Insumo';

ALTER TABLE distribuir ADD CONSTRAINT distribuir_fkey2
FOREIGN KEY(Tipo) REFERENCES bioma(Tipo);
COMMENT ON CONSTRAINT distribuir_fkey2 ON distribuir IS 'Llave foránea que relaciona la distribución con un bioma en la tabla bioma mediante el Tipo';

-- Definición de la tabla 'indicacionMed'
CREATE TABLE indicacionMed(
	Id_Animal INT,
	IndicacionMed TEXT
);

-- Comentario para la tabla 'indicacionMed'
COMMENT ON TABLE indicacionMed IS 'Tabla que contiene las indicaciones medicas para los animales';

-- Comentarios para las columnas de la tabla 'indicacionMed'
COMMENT ON COLUMN indicacionMed.Id_Animal IS 'Identificador del animal asociado a la indicación médica';
COMMENT ON COLUMN indicacionMed.IndicacionMed IS 'Descripción de la indicación médica';

--Restricciones IndicacionMed
--Dominio
ALTER TABLE indicacionMed ALTER COLUMN Id_Animal
SET NOT NULL;
COMMENT ON COLUMN indicacionMed.Id_Animal IS 'El Id_Animal no debe ser nulo';

ALTER TABLE indicacionMed ADD CONSTRAINT indicacionMed_d1
CHECK(IndicacionMed <> '');
COMMENT ON CONSTRAINT indicacionMed_d1 ON indicacionMed IS 'La descripción de la indicación médica no debe estar vacía';

--Referencial
ALTER TABLE indicacionMed ADD CONSTRAINT indicacionMed_fkey
FOREIGN KEY(Id_Animal) REFERENCES animal(Id_Animal);
COMMENT ON CONSTRAINT indicacionMed_fkey ON indicacionMed IS 'Llave foránea que relaciona la indicación médica con un animal en la tabla animal mediante el Id_Animal';


-- Definición de la tabla 'alimento'
CREATE TABLE alimento(
	Id_Insumo INT,
	tipoAlimento TEXT
);

-- Comentario para la tabla 'alimento'
COMMENT ON TABLE alimento IS 'Tabla que contiene los alimentos';

-- Comentarios para las columnas de la tabla 'alimento'
COMMENT ON COLUMN alimento.Id_Insumo IS 'Identificador del insumo de alimento';
COMMENT ON COLUMN alimento.tipoAlimento IS 'Tipo de alimento';

--Restricciones Alimento
--Dominio
ALTER TABLE alimento ALTER COLUMN Id_Insumo
SET NOT NULL;
COMMENT ON COLUMN alimento.Id_Insumo IS 'El Id_Insumo no debe ser nulo';

ALTER TABLE alimento ADD CONSTRAINT alimento_d1
CHECK(tipoAlimento <> '');
COMMENT ON CONSTRAINT alimento_d1 ON alimento IS 'El tipo de alimento no debe estar vacío';

--Referencial
ALTER TABLE alimento ADD CONSTRAINT alimento_fkey
FOREIGN KEY(Id_Insumo) REFERENCES insumo(Id_Insumo);
COMMENT ON CONSTRAINT alimento_fkey ON alimento IS 'Llave foránea que relaciona el alimento con un insumo en la tabla insumo mediante el Id_Insumo';

-- Definición de la tabla 'medicina'
CREATE TABLE medicina(
	Id_Insumo INT,
	labProcedencia TEXT,
	Lote INT
);

-- Comentario para la tabla 'medicina'
COMMENT ON TABLE medicina IS 'Tabla que contiene las medicinas';

-- Comentarios para las columnas de la tabla 'medicina'
COMMENT ON COLUMN medicina.Id_Insumo IS 'Identificador del insumo de medicina';
COMMENT ON COLUMN medicina.labProcedencia IS 'Laboratorio de procedencia de la medicina';
COMMENT ON COLUMN medicina.Lote IS 'Número de lote de la medicina';

--Restricciones Medicina
--Dominio
ALTER TABLE medicina ALTER COLUMN Id_Insumo
SET NOT NULL;
COMMENT ON COLUMN medicina.Id_Insumo IS 'El Id_Insumo no debe ser nulo';

ALTER TABLE medicina ALTER COLUMN Lote
SET NOT NULL;
COMMENT ON COLUMN medicina.Lote IS 'El número de lote de medicina no debe ser nulo';

ALTER TABLE medicina ADD CONSTRAINT medicina_d1
CHECK(labProcedencia <> '');
COMMENT ON CONSTRAINT medicina_d1 ON medicina IS 'El laboratorio de procedencia de la medicina no debe estar vacío';

--Referencial
ALTER TABLE medicina ADD CONSTRAINT medicina_fkey
FOREIGN KEY(Id_Insumo) REFERENCES insumo(Id_Insumo);
COMMENT ON CONSTRAINT medicina_fkey ON medicina IS 'Llave foránea que relaciona la medicina con un insumo en la tabla insumo mediante el Id_Insumo';

-- Definición de la tabla 'atender'
CREATE TABLE atender(
	RFC VARCHAR(13),
	Id_Animal INT,
	mismoBioma BOOLEAN
);

-- Comentario para la tabla 'atender'
COMMENT ON TABLE atender IS 'Tabla que contiene los atendiminetos de los veterinarios a los animales';

-- Comentarios para las columnas de la tabla 'atender'
COMMENT ON COLUMN atender.RFC IS 'Registro Federal de Contribuyentes (RFC) del veterinario que atiende';
COMMENT ON COLUMN atender.Id_Animal IS 'Identificador del animal atendido';
COMMENT ON COLUMN atender.mismoBioma IS 'Indica si el veterinario atiende animales del mismo bioma';

--Restricciones Atender
--Dominio
ALTER TABLE atender ADD CONSTRAINT atender_d1
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);
COMMENT ON CONSTRAINT atender_d1 ON atender IS 'El RFC debe tener una longitud válida de 12 o 13 caracteres';

ALTER TABLE atender ALTER COLUMN Id_Animal
SET NOT NULL;
COMMENT ON COLUMN atender.Id_Animal IS 'El Id_Animal no debe ser nulo';

ALTER TABLE atender ALTER COLUMN mismoBioma
SET DEFAULT (false);
COMMENT ON COLUMN atender.mismoBioma IS 'El valor predeterminado para mismoBioma es falso';

--Referencial
ALTER TABLE atender ADD CONSTRAINT atender_fkey1
FOREIGN KEY(RFC) REFERENCES veterinario(RFC);
COMMENT ON CONSTRAINT atender_fkey1 ON atender IS 'Llave foránea que relaciona la atención con un veterinario en la tabla veterinario mediante el RFC';

ALTER TABLE atender ADD CONSTRAINT atender_fkey2
FOREIGN KEY(Id_Animal) REFERENCES animal(Id_Animal);
COMMENT ON CONSTRAINT atender_fkey2 ON atender IS 'Llave foránea que relaciona la atención con un animal en la tabla animal mediante el Id_Animal';


-- Definición de la tabla 'especialidad'
CREATE TABLE especialidad(
	RFC VARCHAR(13),
	Especialidad TEXT
);

-- Comentario para la tabla 'especialidad'
COMMENT ON TABLE especialidad IS 'Tabla que contiene las especialidades de los veterinarios';

-- Comentarios para las columnas de la tabla 'especialidad'
COMMENT ON COLUMN especialidad.RFC IS 'Registro Federal de Contribuyentes (RFC) del veterinario con especialidad';
COMMENT ON COLUMN especialidad.Especialidad IS 'Especialidad del veterinario';

--Restricciones Especialidad
--Dominio
ALTER TABLE especialidad ADD CONSTRAINT especialidad_d1
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);
COMMENT ON CONSTRAINT especialidad_d1 ON especialidad IS 'El RFC debe tener una longitud válida de 12 o 13 caracteres';

ALTER TABLE especialidad ADD CONSTRAINT especialidad_d2
CHECK(Especialidad <> '');
COMMENT ON CONSTRAINT especialidad_d2 ON especialidad IS 'La especialidad no debe estar vacía';

--Referencial
ALTER TABLE especialidad ADD CONSTRAINT especialidad_fkey
FOREIGN KEY(RFC) REFERENCES veterinario(RFC);
COMMENT ON CONSTRAINT especialidad_fkey ON especialidad IS 'Llave foránea que relaciona la especialidad con un veterinario en la tabla veterinario mediante el RFC';

-- Definición de la tabla 'cuidar'
CREATE TABLE cuidar(
	Id_Animal INT,
	RFC VARCHAR(13)
);

-- Comentario para la tabla 'cuidar'
COMMENT ON TABLE cuidar IS 'Tabla que contiene los cuidados de los cuidadores a los animales';

-- Comentarios para las columnas de la tabla 'cuidar'
COMMENT ON COLUMN cuidar.Id_Animal IS 'Identificador del animal cuidado';
COMMENT ON COLUMN cuidar.RFC IS 'Registro Federal de Contribuyentes (RFC) del cuidador del animal';

--Restricciones Cuidar
--Dominio
ALTER TABLE cuidar ALTER COLUMN Id_Animal
SET NOT NULL;
COMMENT ON COLUMN cuidar.Id_Animal IS 'El Id_Animal no debe ser nulo';

ALTER TABLE cuidar ADD CONSTRAINT cuidar_d1
CHECK(LENGTH(RFC) = 12 OR LENGTH(RFC) = 13);
COMMENT ON CONSTRAINT cuidar_d1 ON cuidar IS 'El RFC debe tener una longitud válida de 12 o 13 caracteres';

--Referencial
ALTER TABLE cuidar ADD CONSTRAINT cuidar_fkey1
FOREIGN KEY(RFC) REFERENCES cuidador(RFC);
COMMENT ON CONSTRAINT cuidar_fkey1 ON cuidar IS 'Llave foránea que relaciona el cuidado con un cuidador en la tabla cuidador mediante el RFC';

ALTER TABLE cuidar ADD CONSTRAINT cuidar_fkey2
FOREIGN KEY(Id_Animal) REFERENCES animal(Id_Animal);
COMMENT ON CONSTRAINT cuidar_fkey2 ON cuidar IS 'Llave foránea que relaciona el cuidado con un animal en la tabla animal mediante el Id_Animal';





