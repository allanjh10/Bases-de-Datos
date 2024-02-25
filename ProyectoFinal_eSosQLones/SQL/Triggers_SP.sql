-- Disparadores que se encarguen de llevar la cuenta de los veterinarios, cuidadores y animales
-- Crear tabla para guardar los registros
CREATE TABLE cont_Bioma(
	Tipo_Bioma VARCHAR(50),
	Cant_Cuidador INT,
	Cant_Veterinario INT,
	Cant_Animal INT
);

-- Crear disparador que lleva la cuenta de los veterinarios
create or replace function contar_Veterinario()
returns trigger 
as
$$
declare 
	tipo_B VARCHAR(50);
begin	
	if TG_OP = 'INSERT' then		
		tipo_B := (select tipo from bioma where tipo = new.tipo);
		if tipo_B in (select Tipo_Bioma from cont_Bioma where Tipo_Bioma = new.tipo) then
			update cont_Bioma set Cant_Veterinario = Cant_Veterinario + 1 where Tipo_Bioma = tipo_B;		
		else
			insert into cont_Bioma (Tipo_Bioma, Cant_Cuidador, Cant_Veterinario, Cant_Animal) values (tipo_B, 0, 1, 0);
		end if;		
	end if;

	if TG_OP = 'DELETE' then		
		tipo_B := (select tipo from bioma where tipo = old.tipo);
		update cont_Bioma set Cant_Veterinario = Cant_Veterinario - 1 where Tipo_Bioma = tipo_B;
	end if;
	
	return null;
end;
$$
language plpgsql;

-- Habilitar disparador
create or replace trigger checa_contar_Veterinario
after insert or delete on trabajar
for each row 
execute function contar_Veterinario();


-- Probar disparador
/* Insertar:
insert into Veterinario (RFC_Vet, Nombre, ApellidoPat, ApellidoMat, Calle, Num_Ext, Num_Int, Estado, Fecha_Nac, FechaIn_Con, FechaFin_Con, Salario) values ('0Gb3Sp6iRO7X', 'Riva', 'Curzey', 'Brabham', 'Waxwing', '99491', '4478', 'Duanjia', '6/10/1987', '9/24/2010', '8/14/2024', 19685.21);
insert into bioma (Tipo) values ('Tundra');
insert into trabajar (RFC_Vet, Tipo) values ('0Gb3Sp6iRO7X', 'Tundra');

insert into Veterinario (RFC_Vet, Nombre, ApellidoPat, ApellidoMat, Calle, Num_Ext, Num_Int, Estado, Fecha_Nac, FechaIn_Con, FechaFin_Con, Salario) values ('knHD6SNm0iDC', 'Melisandra', 'Hambatch', 'Dimblebee', 'Fulton', '4190', '08', 'Gandu', '5/5/1972', '3/26/2016', '7/14/2024', 4069.75);
insert into trabajar (RFC_Vet, Tipo) values ('knHD6SNm0iDC', 'Tundra');
*/

/* Eliminar:
delete from trabajar where RFC_Vet = '0Gb3Sp6iRO7X';
*/

-- Crear disparador que lleva la cuenta de los cuidadores
create or replace function contar_Cuidador()
returns trigger 
as
$$
declare 
	tipo_B VARCHAR(50);
begin	
	if TG_OP = 'INSERT' then		
		tipo_B := (select tipo from bioma where tipo = new.tipo);
		if tipo_B in (select Tipo_Bioma from cont_Bioma where Tipo_Bioma = new.tipo) then
			update cont_Bioma set Cant_Cuidador = Cant_Cuidador + 1 where Tipo_Bioma = tipo_B;		
		else
			insert into cont_Bioma (Tipo_Bioma, Cant_Cuidador, Cant_Veterinario, Cant_Animal) values (tipo_B, 1, 0, 0);
		end if;		
	end if;

	if TG_OP = 'DELETE' then		
		tipo_B := (select tipo from bioma where tipo = old.tipo);
		update cont_Bioma set Cant_Cuidador = Cant_Cuidador - 1 where Tipo_Bioma = tipo_B;
	end if;
	
	return null;
end;
$$
language plpgsql;

-- Habilitar disparador
create or replace trigger checa_contar_Cuidador
after insert or delete on cuidador
for each row 
execute function contar_Cuidador();


-- Probar disparador
/* Insertar:
insert into bioma (Tipo) values ('Aviario');
insert into bioma (Tipo) values ('Bosque Tropical');
insert into animal (Id_Animal, Tipo, Especie, Num_Jaula, Nombre, Alimentacion, Sexo, Altura, Peso) values (1, 'Bosque Tropical', 'Panner', 29, 'Arctic fox', 'Nectarívoro', 'F', 41.28, 274.64);
insert into cuidador (RFC_Cuid, Id_Animal, Tipo, Nombre, ApellidoPat, ApellidoMat, Calle, Colonia, Num_Ext, Num_Int, Estado, Fecha_Nac, FechaIn_Con, FechaFin_Con, Hora_Entrada, Hora_Salida, Dias_Trab, Salario) values ('Nt19hN1F2wqs', 1, 'Aviario', 'Angelina', 'Bench', 'Paull', 'Rigney', 'Way', '810', '58238', 'Solingen', '8/2/1989', '8/10/2020', '7/11/2023', '7:04 AM', '7:31 PM', 291, 14156);

insert into bioma (Tipo) values ('Arrecife de Coral');
insert into animal (Id_Animal, Tipo, Especie, Num_Jaula, Nombre, Alimentacion, Sexo, Altura, Peso) values (9, 'Arrecife de Coral', 'Marciek', 17, 'Wallaby, bennett''s', 'Insectívoro', 'M', 118.18, 261.43);
insert into cuidador (RFC_Cuid, Id_Animal, Tipo, Nombre, ApellidoPat, ApellidoMat, Calle, Colonia, Num_Ext, Num_Int, Estado, Fecha_Nac, FechaIn_Con, FechaFin_Con, Hora_Entrada, Hora_Salida, Dias_Trab, Salario) values ('2VHwej9yaR8D', 9, 'Aviario', 'Carmen', 'Bovaird', 'Petzolt', 'Goodland', 'Avenue', '15043', '15', 'Las Vegas', '8/18/1975', '3/28/2013', '5/7/2024', '7:06 AM', '7:11 PM', 23, 25522);
*/

/* Eliminar:
delete from cuidador where RFC_Cuid = 'Nt19hN1F2wqs';
*/

-- Crear disparador que lleva la cuenta de los animales
create or replace function contar_Animal()
returns trigger 
as
$$
declare 
	tipo_B VARCHAR(50);
begin	
	if TG_OP = 'INSERT' then		
		tipo_B := (select tipo from bioma where tipo = new.tipo);
		if tipo_B in (select Tipo_Bioma from cont_Bioma where Tipo_Bioma = new.tipo) then
			update cont_Bioma set Cant_Animal = Cant_Animal + 1 where Tipo_Bioma = tipo_B;		
		else
			insert into cont_Bioma (Tipo_Bioma, Cant_Cuidador, Cant_Veterinario, Cant_Animal) values (tipo_B, 0, 0, 1);
		end if;		
	end if;

	if TG_OP = 'DELETE' then		
		tipo_B := (select tipo from bioma where tipo = old.tipo);
		update cont_Bioma set Cant_Animal = Cant_Animal - 1 where Tipo_Bioma = tipo_B;
	end if;
	
	return null;
end;
$$
language plpgsql;

-- Habilitar disparador
create or replace trigger checa_contar_Animal
after insert or delete on animal
for each row 
execute function contar_Animal();


-- Probar disparador
/* Insertar:
insert into bioma (Tipo) values ('Bosque Tropical');
insert into animal (Id_Animal, Tipo, Especie, Num_Jaula, Nombre, Alimentacion, Sexo, Altura, Peso) values (1, 'Bosque Tropical', 'Panner', 29, 'Arctic fox', 'Nectarívoro', 'F', 41.28, 274.64);

insert into animal (Id_Animal, Tipo, Especie, Num_Jaula, Nombre, Alimentacion, Sexo, Altura, Peso) values (41, 'Bosque Tropical', 'Cathie', 30, 'Ring-tailed gecko', 'Folívoro', 'M', 65.73, 318.66);
*/

/* Eliminar:
delete from animal where Id_Animal = 1;
*/

-- Checar tabla
--select * from cont_Bioma;

-- Disparador que se encargue de insertar registros en la tabla atender
-- Crear disparador
create or replace function agrega_Atender()
returns trigger 
as
$$
declare 
	rfc_V VARCHAR(13);
	id_A INT;
	tipoB_A VARCHAR(50);
begin	
	rfc_V := (select rfc_vet from veterinario where rfc_vet = new.rfc_vet);
	id_A := (select id_animal from animal where id_animal = new.id_animal);
	tipoB_A := (select tipo from animal where id_animal = id_A);
	if tipoB_A not in (select tipo from veterinario v join trabajar t on v.rfc_vet = t.rfc_vet where v.rfc_vet = rfc_V) then
		raise exception 'No se puede insertar: el veterinario y el animal deben de pertenecer en el mismo bioma';		
	end if;		

	return new;
end;
$$
language plpgsql;

-- Habilitar disparador
create or replace trigger checa_agrega_Atender
before insert on atender
for each row 
execute function agrega_Atender();


-- Probar disparador
/* Insertar, no se puede porque no pertenecen al mismo bioma:
insert into Veterinario (RFC_Vet, Nombre, ApellidoPat, ApellidoMat, Calle, Num_Ext, Num_Int, Estado, Fecha_Nac, FechaIn_Con, FechaFin_Con, Salario) values ('0Gb3Sp6iRO7X', 'Riva', 'Curzey', 'Brabham', 'Waxwing', '99491', '4478', 'Duanjia', '6/10/1987', '9/24/2010', '8/14/2024', 19685.21);
insert into bioma (Tipo) values ('Tundra');
insert into trabajar (RFC_Vet, Tipo) values ('0Gb3Sp6iRO7X', 'Tundra');
insert into bioma (Tipo) values ('Bosque Tropical');
insert into animal (Id_Animal, Tipo, Especie, Num_Jaula, Nombre, Alimentacion, Sexo, Altura, Peso) values (1, 'Bosque Tropical', 'Panner', 29, 'Arctic fox', 'Nectarívoro', 'F', 41.28, 274.64);
insert into atender (RFC_Vet, Id_Animal) values ('0Gb3Sp6iRO7X', 1);
*/


/* Insertar:
insert into Veterinario (RFC_Vet, Nombre, ApellidoPat, ApellidoMat, Calle, Num_Ext, Num_Int, Estado, Fecha_Nac, FechaIn_Con, FechaFin_Con, Salario) values ('I16QYx61Hna6', 'Amery', 'Pirdy', 'Cromer', 'Gina', '3', '20', 'Turt', '1/15/1987', '1/28/2019', '10/13/2024', 10797.5);
insert into bioma (Tipo) values ('Estepa');
insert into trabajar (RFC_Vet, Tipo) values ('I16QYx61Hna6', 'Estepa');
insert into animal (Id_Animal, Tipo, Especie, Num_Jaula, Nombre, Alimentacion, Sexo, Altura, Peso) values (101, 'Estepa', 'Guillain', 22, 'Puffin, horned', 'Folívoro', 'M', 99.97, 293.63);
insert into atender (RFC_Vet, Id_Animal) values ('I16QYx61Hna6', 101);
*/

-- Checar tabla
--select * from atender;

-- Disparadores que se encarguen de insertar registros en la tablas Alimento, Medicina, Servicio y Articulo
-- Crear disparador que inserta en Alimento
create or replace function agrega_Alimento()
returns trigger 
as
$$
declare 
	rfc_P VARCHAR(13);
begin	
	rfc_P := (select rfc_prov from proveedor where rfc_prov = new.rfc_prov);
	if rfc_P in (select m.rfc_prov from proveedor p join medicina m on p.rfc_prov = m.rfc_prov where p.rfc_prov = rfc_P) then
		raise exception 'No se puede insertar: el proveedor solo puede proveer un producto';		
	end if;

	if rfc_P in (select s.rfc_prov from proveedor p join servicio s on p.rfc_prov = s.rfc_prov where p.rfc_prov = rfc_P) then
		raise exception 'No se puede insertar: el proveedor solo puede proveer un producto';		
	end if;

	if rfc_P in (select a.rfc_prov from proveedor p join articulo a on p.rfc_prov = a.rfc_prov where p.rfc_prov = rfc_P) then
		raise exception 'No se puede insertar: el proveedor solo puede proveer un producto';		
	end if;

	return new;
end;
$$
language plpgsql;

-- Habilitar disparador
create or replace trigger checa_agrega_Alimento
before insert on alimento
for each row 
execute function agrega_Alimento();


-- Probar disparador
/* Insertar, no se puede porque el proveedor provee otro producto:
insert into proveedor (RFC_Prov, Nombre, ApellidoPat, ApellidoMat, Calle, Colonia, Num_Ext, Num_Int, Estado, Fecha_Nac, FechaIn_Con, FechaFin_Con, Costo_Serv, Producto, Frecuencia) values ('MZSMEj7fZ2uH', 'Merridie', 'Mandres', 'Jovis', 'Shelley', 'Lane', '4', '4519', 'Ogwashi-Uku', '2/1/1972', '11/13/2020', '7/14/2023', 17933.07, 'Lobster - Baby, Boiled', 65);
insert into medicina (Lote, RFC_Prov, Cantidad, seRefrigera, Fecha_Cad, labProcedencia) values ('999hy0uLKsLS', 'MZSMEj7fZ2uH', 2, true, '12/8/2023', 'Mills, Price and McDermott');
insert into alimento (Id_Alimento, RFC_Prov, Cantidad, seRefrigera, Fecha_Cad, tipoAlimento) values (1, 'MZSMEj7fZ2uH', 20, true, '5/13/2024', 'Pescados');
*/

/* Insertar:
insert into proveedor (RFC_Prov, Nombre, ApellidoPat, ApellidoMat, Calle, Colonia, Num_Ext, Num_Int, Estado, Fecha_Nac, FechaIn_Con, FechaFin_Con, Costo_Serv, Producto, Frecuencia) values ('Ugip20x9VT6g', 'Jessamine', 'Fierro', 'Thunderchief', 'Iowa', 'Court', '1', '1179', 'Villazón', '1/28/1994', '12/23/2015', '5/12/2023', 7614.58, 'Squash - Acorn', 57);
insert into alimento (Id_Alimento, RFC_Prov, Cantidad, seRefrigera, Fecha_Cad, tipoAlimento) values (2, 'Ugip20x9VT6g', 28, false, '12/5/2025', 'Semillas');
*/

-- Checar tabla
--select * from articulo;

-- Crear disparador que inserta en Medicina
create or replace function agrega_Medicina()
returns trigger 
as
$$
declare 
	rfc_P VARCHAR(13);
begin	
	rfc_P := (select rfc_prov from proveedor where rfc_prov = new.rfc_prov);
	if rfc_P in (select a.rfc_prov from proveedor p join alimento a on p.rfc_prov = a.rfc_prov where p.rfc_prov = rfc_P) then
		raise exception 'No se puede insertar: el proveedor solo puede proveer un producto';		
	end if;

	if rfc_P in (select s.rfc_prov from proveedor p join servicio s on p.rfc_prov = s.rfc_prov where p.rfc_prov = rfc_P) then
		raise exception 'No se puede insertar: el proveedor solo puede proveer un producto';		
	end if;

	if rfc_P in (select a.rfc_prov from proveedor p join articulo a on p.rfc_prov = a.rfc_prov where p.rfc_prov = rfc_P) then
		raise exception 'No se puede insertar: el proveedor solo puede proveer un producto';		
	end if;

	return new;
end;
$$
language plpgsql;

-- Habilitar disparador
create or replace trigger checa_agrega_Medicina
before insert on medicina
for each row 
execute function agrega_Medicina();

-- Crear disparador que inserta en Servicio
create or replace function agrega_Servicio()
returns trigger 
as
$$
declare 
	rfc_P VARCHAR(13);
begin	
	rfc_P := (select rfc_prov from proveedor where rfc_prov = new.rfc_prov);
	if rfc_P in (select a.rfc_prov from proveedor p join alimento a on p.rfc_prov = a.rfc_prov where p.rfc_prov = rfc_P) then
		raise exception 'No se puede insertar: el proveedor solo puede proveer un producto';		
	end if;

	if rfc_P in (select m.rfc_prov from proveedor p join medicina m on p.rfc_prov = m.rfc_prov where p.rfc_prov = rfc_P) then
		raise exception 'No se puede insertar: el proveedor solo puede proveer un producto';		
	end if;

	if rfc_P in (select a.rfc_prov from proveedor p join articulo a on p.rfc_prov = a.rfc_prov where p.rfc_prov = rfc_P) then
		raise exception 'No se puede insertar: el proveedor solo puede proveer un producto';		
	end if;

	return new;
end;
$$
language plpgsql;

-- Habilitar disparador
create or replace trigger checa_agrega_Servicio
before insert on servicio
for each row 
execute function agrega_Servicio();

-- Crear disparador que inserta en Articulo
create or replace function agrega_Articulo()
returns trigger 
as
$$
declare 
	rfc_P VARCHAR(13);
begin	
	rfc_P := (select rfc_prov from proveedor where rfc_prov = new.rfc_prov);
	if rfc_P in (select a.rfc_prov from proveedor p join alimento a on p.rfc_prov = a.rfc_prov where p.rfc_prov = rfc_P) then
		raise exception 'No se puede insertar: el proveedor solo puede proveer un producto';		
	end if;

	if rfc_P in (select m.rfc_prov from proveedor p join medicina m on p.rfc_prov = m.rfc_prov where p.rfc_prov = rfc_P) then
		raise exception 'No se puede insertar: el proveedor solo puede proveer un producto';		
	end if;

	if rfc_P in (select s.rfc_prov from proveedor p join servicio s on p.rfc_prov = s.rfc_prov where p.rfc_prov = rfc_P) then
		raise exception 'No se puede insertar: el proveedor solo puede proveer un producto';		
	end if;

	return new;
end;
$$
language plpgsql;

-- Habilitar disparador
create or replace trigger checa_agrega_Articulo
before insert on articulo
for each row 
execute function agrega_Articulo();

-- Disparador que se encarga de insertar registros en la tabla Trabajar
-- Crear disparador que inserta en Trabajar
create or replace function agrega_Trabajar()
returns trigger 
as
$$
declare 
	rfc_V VARCHAR(13);
	tipoB_V VARCHAR(50);
	cont INT;
begin	
	cont := (select cantidad from (select count(t.rfc_vet) as cantidad from trabajar t where t.rfc_vet = new.rfc_vet));
	if cont = 2 then
		raise exception 'No se puede insertar: el veterinario a lo mas puede trabajar en dos biomas';		
	end if;

	return new;
end;
$$
language plpgsql;

-- Habilitar disparador
create or replace trigger checa_agrega_Trabajar
before insert on trabajar
for each row 
execute function agrega_Trabajar();


-- Probar disparador
/* Insertar, el veterinario a lo mas puede trabajar en dos biomas:
insert into Veterinario (RFC_Vet, Nombre, ApellidoPat, ApellidoMat, Calle, Num_Ext, Num_Int, Estado, Fecha_Nac, FechaIn_Con, FechaFin_Con, Salario) values ('0Gb3Sp6iRO7X', 'Riva', 'Curzey', 'Brabham', 'Waxwing', '99491', '4478', 'Duanjia', '6/10/1987', '9/24/2010', '8/14/2024', 19685.21);
insert into bioma (Tipo) values ('Tundra');
insert into bioma (Tipo) values ('Estepa');
insert into bioma (Tipo) values ('Desierto');
insert into trabajar (RFC_Vet, Tipo) values ('0Gb3Sp6iRO7X', 'Tundra');
insert into trabajar (RFC_Vet, Tipo) values ('0Gb3Sp6iRO7X', 'Estepa');
insert into trabajar (RFC_Vet, Tipo) values ('0Gb3Sp6iRO7X', 'Desierto');
*/

/* Insertar, ya se agrego ese registro a la tabla:
insert into Veterinario (RFC_Vet, Nombre, ApellidoPat, ApellidoMat, Calle, Num_Ext, Num_Int, Estado, Fecha_Nac, FechaIn_Con, FechaFin_Con, Salario) values ('I16QYx61Hna6', 'Amery', 'Pirdy', 'Cromer', 'Gina', '3', '20', 'Turt', '1/15/1987', '1/28/2019', '10/13/2024', 10797.5);
insert into bioma (Tipo) values ('Manglar');
insert into trabajar (RFC_Vet, Tipo) values ('I16QYx61Hna6', 'Manglar');
insert into trabajar (RFC_Vet, Tipo) values ('I16QYx61Hna6', 'Manglar');

delete from trabajar where rfc_vet = 'I16QYx61Hna6';
*/

/* Insertar:
insert into Veterinario (RFC_Vet, Nombre, ApellidoPat, ApellidoMat, Calle, Num_Ext, Num_Int, Estado, Fecha_Nac, FechaIn_Con, FechaFin_Con, Salario) values ('eT8M7HrYQV6V', 'Lizzie', 'Mawd', 'Heigold', 'Del Mar', '95740', '68', 'Chimichagua', '3/16/1994', '1/5/2015', '9/5/2024', 30391.64);
insert into bioma (Tipo) values ('Bosque Templado');
insert into trabajar (RFC_Vet, Tipo) values ('eT8M7HrYQV6V', 'Bosque Templado');
*/

-- Checar tabla
--select * from trabajar;


-- Disparador que se encargue de llevar la cuenta de la cantidad de asistentes que asisten a los eventos 
-- Crear tabla para guardar los registros
CREATE TABLE cantidad_Asistente(
	Id_Evento INT,
	Lista_Asistente VARCHAR(10000),
	Cant_Asistente INT
);

-- Crear disparador que lleva la cuenta de los veterinarios
create or replace function contar_Asistente()
returns trigger 
as
$$
declare 
	Id_E INT;
	Nombre_C VARCHAR(50);
	ApellidoP_C VARCHAR(50);
	ApellidoM_C VARCHAR(50);
	NombreCom_C VARCHAR(150);
begin	
	if TG_OP = 'INSERT' then		
		Id_E := (select id_evento from evento where id_evento = new.id_evento);
		Nombre_C := (select nombre from cliente where curp = new.curp);
		ApellidoP_C := (select apellidopat from cliente where curp = new.curp);
		ApellidoM_C := (select apellidomat from cliente where curp = new.curp);
		if Id_E in (select id_evento from cantidad_Asistente where id_evento = new.id_evento) then
			update cantidad_Asistente set Lista_Asistente = concat(Lista_Asistente, ' ; ', Nombre_C, ' ', ApellidoP_C, ' ', ApellidoM_C) , Cant_Asistente = Cant_Asistente + 1 where id_evento = Id_E;		
		else
			insert into cantidad_Asistente (Id_Evento, Lista_Asistente, Cant_Asistente) values (Id_E, concat(Nombre_C, ' ', ApellidoP_C, ' ', ApellidoM_C), 1);
		end if;		
	end if;

	
	if TG_OP = 'DELETE' then		
		Id_E := (select id_evento from evento where id_evento = old.id_evento);
		Nombre_C := (select nombre from cliente where curp = old.curp);
		ApellidoP_C := (select apellidopat from cliente where curp = old.curp);
		ApellidoM_C := (select apellidomat from cliente where curp = old.curp);
		NombreCom_C := concat(Nombre_C, ' ', ApellidoP_C, ' ', ApellidoM_C);
		raise notice 'Tam: %', NombreCom_C;
		update cantidad_Asistente set Lista_Asistente = substring(Lista_Asistente FROM 1 FOR position(NombreCom_C IN Lista_Asistente) - 1) || SUBSTRING(Lista_Asistente FROM POSITION(NombreCom_C IN Lista_Asistente) + LENGTH(NombreCom_C)), Cant_Asistente = Cant_Asistente - 1 where id_evento = Id_E;
	end if;
	
	return null;
end;
$$
language plpgsql;

-- Habilitar disparador
create or replace trigger checa_contar_Asistente
after insert or delete on asistir
for each row 
execute function contar_Asistente();


-- Probar disparador
/* Insertar:
INSERT INTO evento(Id_Evento,Capacidad,tipoEvento,Fecha) VALUES (43,73,'Social','12/19/2023');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('IRPS913715XIBLUH97', 'Rowland', 'Beeres', 'Skune', 'M');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('PPZX494266TGCNQF11', 'Harald', 'Ludgrove', 'Rassell', 'M');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('KNUD230727QKLAJJ47', 'Harley', 'Wiggin', 'Jeans', 'F');
INSERT INTO asistir(Id_Evento,CURP) VALUES (43,'IRPS913715XIBLUH97');
INSERT INTO asistir(Id_Evento,CURP) VALUES (43,'PPZX494266TGCNQF11');
INSERT INTO asistir(Id_Evento,CURP) VALUES (43,'KNUD230727QKLAJJ47');
*/

/* Eliminar:
delete from asistir where CURP = 'PPZX494266TGCNQF11';
*/

-- Checar tabla
--select * from cantidad_Asistente;


-- Disparador que se encargue de insertar en la tabla asistir
-- Crear disparador que lleva la cuenta de los veterinarios
create or replace function agrega_Asistir()
returns trigger 
as
$$
declare 
	Id_E INT;
	Cap_E INT;
	Cant_A INT;
begin				
	Id_E := (select id_evento from evento where id_evento = new.id_evento);
	Cap_E := (select capacidad from evento where id_evento = new.id_evento);
	Cant_A := (select cant_asistente from cantidad_Asistente where id_evento = new.id_evento);
	if Cap_E < Cant_A + 1 then
		raise exception 'No se puede insertar: ya no tiene mas capacidad para mas asistentes';
	end if;		
	
	return new;
end;
$$
language plpgsql;

-- Habilitar disparador
create or replace trigger checa_agrega_Asistir
before insert on asistir
for each row 
execute function agrega_Asistir();


-- Probar disparador
/* Insertar:
INSERT INTO evento(Id_Evento,Capacidad,tipoEvento,Fecha) VALUES (93,20,'Social','2/17/2024');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('IRPS913715XIBLUH97', 'Rowland', 'Beeres', 'Skune', 'M');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('PPZX494266TGCNQF11', 'Harald', 'Ludgrove', 'Rassell', 'M');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('KNUD230727QKLAJJ47', 'Harley', 'Wiggin', 'Jeans', 'F');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('XHKN967348VEKJEK02', 'Sabine', 'Rivalland', 'Somerton', 'F');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('GZYL371625TXGPNC51', 'Thurston', 'Stroband', 'Aldwinckle', 'M');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('IONC919934QJOWYD53', 'Bogart', 'Waugh', 'Colebourn', 'M');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('YUWE822425ZPTZHX45', 'Charo', 'Blazynski', 'Haslin', 'F');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('XOOP595603XCYDPZ72', 'Viv', 'Bruhnsen', 'Ribbens', 'F');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('ZPYC793203MDLPCA50', 'Dorette', 'McKernan', 'Ditzel', 'F');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('AWVT436113DFZWMS23', 'Hunt', 'Sperry', 'Wallentin', 'M');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('DADK477291QIMUKB45', 'Shell', 'Toffler', 'McGeown', 'M');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('LYYK143730PXMFMV42', 'Leann', 'Whitman', 'Bryer', 'F');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('MUPY156740MHHJLQ06', 'Reamonn', 'Hyrons', 'Crowest', 'M');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('FKWN319629ORUINV81', 'Doug', 'Hollidge', 'Aime', 'M');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('CKQT416923FTJOOG79', 'Florette', 'Spraberry', 'Frosch', 'F');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('UDNB658138GLCXWK17', 'Maxim', 'Leadstone', 'Wanne', 'M');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('SGGC538211YLECJT60', 'Jenilee', 'Tremayle', 'Woodus', 'F');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('SGXN532205TPTAHI13', 'Ian', 'Ceci', 'Goldwater', 'M');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('TBNT133724DGBJJT10', 'Ralina', 'Sweet', 'Taberner', 'F');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('OOGS321614BKYFEV65', 'Reina', 'Cardoo', 'Lobell', 'F');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('OUUN259373WQOXNB07', 'Lionello', 'Brimblecomb', 'Goadby', 'M');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('KYDE625409UKWHRW68', 'Vera', 'Quinnell', 'Rowan', 'F');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('LKXB754121YKMFWH30', 'Nonnah', 'Calvey', 'Faragher', 'F');
insert into cliente (CURP, Nombre, ApellidoPat, ApellidoMat, Genero) values ('JWWF687250ADJAFR47', 'Cherrita', 'Cooper', 'Dudley', 'F');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'IRPS913715XIBLUH97');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'PPZX494266TGCNQF11');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'KNUD230727QKLAJJ47');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'XHKN967348VEKJEK02');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'GZYL371625TXGPNC51');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'IONC919934QJOWYD53');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'YUWE822425ZPTZHX45');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'XOOP595603XCYDPZ72');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'ZPYC793203MDLPCA50');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'AWVT436113DFZWMS23');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'DADK477291QIMUKB45');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'LYYK143730PXMFMV42');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'MUPY156740MHHJLQ06');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'FKWN319629ORUINV81');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'CKQT416923FTJOOG79');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'UDNB658138GLCXWK17');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'SGGC538211YLECJT60');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'SGXN532205TPTAHI13');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'TBNT133724DGBJJT10');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'OOGS321614BKYFEV65');
-- Error ->
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'OUUN259373WQOXNB07');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'KYDE625409UKWHRW68');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'LKXB754121YKMFWH30');
INSERT INTO asistir(Id_Evento,CURP) VALUES (93,'JWWF687250ADJAFR47');
*/

-- Checar tabla
--select * from asistir;

-- Procedimiento almacenado que muestra una lista de articulos de un bioma, que tengan mayor del 50% de descuento
create or replace procedure lista_articulos(tipo_B VARCHAR(50))
as
$$
declare 
	id_Art INT;
begin	
	
	raise notice 'Lista de articulos que tienen mayor a 50 de descuento en el tipo de bioma % :',$1;

	for id_Art in select id_articulo from ((select id_articulo from descuento where porcentaje_desc > 50) natural join (select id_articulo from distribuir_art where tipo = $1))
		loop
			raise notice '- %', id_Art;
		end loop;
end;
$$
language plpgsql;

-- Ejecutar procedimiento:
--call lista_articulos('Selva');
--call lista_articulos('Bosque Templado');
--call lista_articulos('Bosque Tropical');
--call lista_articulos('Desierto');
--call lista_articulos('Pastizales');

-- Procedimiento almacenado que muestre el RFC de los veterinarios, que tienen un salario mayor a $15,000.00, que trabajan en un bioma y que tienen cierta especialidad
create or replace procedure lista_veterinarios(tipo_B VARCHAR(50), especialidad_V VARCHAR(30))
as
$$
declare 	
	RFC_V VARCHAR(13);
begin	
	
	raise notice 'Lista de RFC de los veterinarios que tienen un salario mayor a $15,000.00, trabajan en el bioma % y su especialidad es %:',$1,$2;

	for RFC_V in select * from ((select rfc_vet from especialidad where especialidad = $2) natural join (select rfc_vet from ((select rfc_vet from veterinario where salario > 15000) natural join (select rfc_vet from trabajar where tipo = $1))))
		loop
			raise notice '- %', RFC_V;
		end loop;
	
	if RFC_V not in (select * from ((select rfc_vet from especialidad where especialidad = $2) natural join (select rfc_vet from ((select rfc_vet from veterinario where salario > 15000) natural join (select rfc_vet from trabajar where tipo = $1))))) then
		raise notice '--> No hay veterinarios que cumplan con los requisitos, que trabajen en el bioma % y su especialidad sea %', $1, $2;
	end if;
	
end;
$$
language plpgsql;

-- Ejecutar procedimiento:
--call lista_veterinarios('Tundra', 'Especialidad en Animales Exóticos');
--call lista_veterinarios('Chaparral', 'Especialidad en Felinos');

--/SP2, Elimina un animal y los registro en las tablas que contienen llave foranea correspodiente a la tupla, ademas solo se puede eliminar animales on id mayor a 50/
CREATE OR REPLACE PROCEDURE delete_animal (p_Id_Animal INT)
LANGUAGE plpgsql
AS $$
BEGIN
    IF p_Id_Animal <= 50 THEN
        RAISE EXCEPTION 'El ID del animal debe ser mayor a 50. ID proporcionado: %', p_Id_Animal;
    END IF;

 -- Primero eliminar referencias en tablas con claves foráneas que apuntan a 'animal'
    DELETE FROM atender WHERE Id_Animal = p_Id_Animal;
    DELETE FROM indicacionesMed WHERE Id_Animal = p_Id_Animal;
    DELETE FROM cuidador WHERE Id_Animal = p_Id_Animal;

    --eliminar el animal de la tabla 'animal'
    DELETE FROM animal WHERE Id_Animal = p_Id_Animal;
END;
$$;

-- Probar procedimiento:
--CALL delete_animal(51); 

/*
SELECT * FROM animal WHERE Id_Animal = 51;
SELECT * FROM cuidador WHERE Id_Animal = 51;
SELECT * FROM indicacionesMed WHERE Id_Animal = 51;
SELECT * FROM atender WHERE Id_Animal = 51;
*/

--/SP QUE PERMITE AGREGAR UN NUEVO ANIMAL/
CREATE OR REPLACE PROCEDURE añadir_animal (
    p_Id_Animal INT, 
    p_Tipo VARCHAR(50), 
    p_Especie VARCHAR(50),
    p_Num_Jaula INT, 
    p_Nombre VARCHAR(50), 
    p_Alimentacion VARCHAR(50), 
    p_Sexo CHAR, 
    p_Altura FLOAT8, 
    p_Peso FLOAT8)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO animal (Id_Animal, Tipo, Especie, Num_Jaula, Nombre, Alimentacion, Sexo, Altura, Peso)
    VALUES (p_Id_Animal, p_Tipo, p_Especie, p_Num_Jaula, p_Nombre, p_Alimentacion, p_Sexo, p_Altura, p_Peso);
END;
$$;


-- Probar procedimiento:
--CALL añadir_animal(200, 'Desierto', 'Elefante', 10, 'Dumbo', 'Hierbas', 'M', 3.5, 6000);
--SELECT * FROM animal WHERE Id_Animal = 200;