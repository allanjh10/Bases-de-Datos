-- Un trigger que se encargue de invertir el apellido paterno con el apellido materno de los proveedores.
-- 1. Crear una tabla para guardar los registros
CREATE TABLE persona1(
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

-- 2. Crear disparador
create or replace function invierte()
returns trigger 
as
$$
declare
	idN int;
	nombreN text;
	apellidopatN varchar(50);
	apellidomatN varchar(50);
	generoN char;
	fecha_nacN date;
	fechain_conN date;
	fechafin_conN date;
	estadoN varchar(50);
    num_intN int;
	num_extN int;
	coloniaN text;
	calleN text;
begin
	if TG_OP = 'INSERT' then
		idN := (select id_persona from trabajador t join proveedor p on t.rfc = p.rfc where new.rfc = p.rfc);
		nombreN := (select nombre from trabajador t join persona p on t.id_persona = p.id_persona where idN = p.id_persona);
		apellidopatN := (select apellidopat from trabajador t join persona p on t.id_persona = p.id_persona where idN = p.id_persona);
		apellidomatN := (select apellidomat from trabajador t join persona p on t.id_persona = p.id_persona where idN = p.id_persona);
		generoN := (select genero from trabajador t join persona p on t.id_persona = p.id_persona where idN = p.id_persona);
		fecha_nacN := (select fecha_nac from trabajador t join persona p on t.id_persona = p.id_persona where idN = p.id_persona);
		fechain_conN := (select fechain_con from trabajador t join persona p on t.id_persona = p.id_persona where idN = p.id_persona);
		fechafin_conN := (select fechafin_con from trabajador t join persona p on t.id_persona = p.id_persona where idN = p.id_persona);
		estadoN := (select estado from trabajador t join persona p on t.id_persona = p.id_persona where idN = p.id_persona);
		num_intN := (select num_int from trabajador t join persona p on t.id_persona = p.id_persona where idN = p.id_persona);
		num_extN := (select num_ext from trabajador t join persona p on t.id_persona = p.id_persona where idN = p.id_persona);
		coloniaN := (select colonia from trabajador t join persona p on t.id_persona = p.id_persona where idN = p.id_persona);
		calleN := (select calle from trabajador t join persona p on t.id_persona = p.id_persona where idN = p.id_persona);	
		insert into persona1 values(idN,nombreN,apellidomatN,apellidopatN,generoN,fecha_nacN,fechain_conN,fechafin_conN,estadoN,num_intN,num_extN,coloniaN,calleN);
		raise notice 'Se agrego al proveedor: %', nombreN;
	else
		raise exception 'No se inviertieron los apellidos, se invierten cuando se agrega un registro en la tabla proveedor';
	end if;
	return null;
end;
$$
language plpgsql;

-- 3. Habilitar disparador
create or replace trigger check_invierte
after insert on proveedor
for each row 
execute function invierte();

-- 4. Probar disparador, sin haber ejecutado DML
insert into proveedor (RFC, Costo_Serv, Producto, Frecuencia) values ('UXUny48u2mev', 10700.8, 'Allspice - Jamaican', 61);

-- * Registros originales
select id_persona,
	   nombre, 
	   apellidopat, 
	   apellidomat, 
	   genero, 
	   fecha_nac, 
	   fechain_con, 
	   fechafin_con, 
	   estado, 
	   num_int, 
	   num_ext, 
	   colonia, 
	   calle 
from (proveedor natural join trabajador) natural join persona;

-- * Ver registros con el intercambio de apellidos 
select * from persona1;

-- Un trigger que se encargue de contar las personas que asisten a un evento, y agregarlo como atributo en
-- evento. Cada vez que se inserte, se debera actualizar el campo.
-- 1. Crear tabla para guardar los registros
CREATE TABLE evento1(
	Id_Evento INT,
	listaAsistentes TEXT,
	Capacidad INT,
	tipoEvento TEXT,
	Fecha DATE,
	personasQueAsisten INT
);

-- 2. Crear disparador
create or replace function contar_asistentes()
returns trigger 
as
$$
declare 
	cont int;
	tam int;
	iter int;
	car char;	
begin
	if TG_OP = 'INSERT' then
		cont := 0;
		iter := 0;
		tam := pg_column_size(new.listaasistentes);
		car := substring(new.listaasistentes from 1 for 1);
		while (iter < tam)
			loop
				if (car = ';') then
					cont := cont + 1;
				end if;
				iter := iter + 1;
				car := substring(new.listaasistentes from iter for 1);
			end loop;		
		cont := cont + 1;
		insert into evento1 values(new.id_evento,new.listaasistentes,new.capacidad,new.tipoevento,new.fecha,cont);
		raise notice 'Se agrego al evento con id: %', new.id_evento;
		return null;
	end if;

	if TG_OP = 'DELETE' then		
		delete from evento1 where id_evento = old.id_evento;
		raise notice 'Se elimino al evento con id: %', old.id_evento;
	end if;

	if TG_OP = 'UPDATE' then
		cont := 0;
		iter := 0;
		tam := pg_column_size(new.listaasistentes);
		car := substring(new.listaasistentes from 1 for 1);
		while (iter < tam)
			loop
				if (car = ';') then
					cont := cont + 1;
				end if;
				iter := iter + 1;
				car := substring(new.listaasistentes from iter for 1);
			end loop;		
		cont := cont + 1;
		delete from evento1 where id_evento = old.id_evento;
		insert into evento1 values(old.id_evento,new.listaasistentes,new.capacidad,new.tipoevento,new.fecha,cont);
		raise notice 'Se actualizo el evento con id: %', old.id_evento;
	end if;
	return null;
end;
$$
language plpgsql;

-- 3. Habilitar disparador
create or replace trigger check_contar_asistentes
after insert or update or delete on evento
for each row 
execute function contar_asistentes();

-- 4. Probar disparador, actualizando un registro ya insertado
update evento set listaasistentes = 'Christopher Johnson Smith;Emily Davis Williams;Michael Taylor Brown;Sophia Miller Clark;Daniel Wilson Taylor;Oliver Taylor Adams;Emma Brooks Mitchell' 
where id_evento = 1;

-- * Registros originales
select *  
from evento;

-- * Registros con la cantidad de asistentes
select * 
from evento1;