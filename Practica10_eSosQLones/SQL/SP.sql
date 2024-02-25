--1.- Un SP el cual se encarga de registrar un cliente, en este SP, debes introducir la información del cliente y se debe encargar de insertar en la tabla
--correspondiente, es importante que no permita la inserción de números o símbolos cuando sean campos relacionados a nombres.
create or replace procedure registrar_cliente(id_persona int, nombre varchar, apellidopat varchar, apellidomat varchar,
											  genero char, fecha_nac date, fechain_con date, fechafin_con date, estado varchar, num_int int,
											  num_ext int, colonia varchar, calle varchar, id_cliente int)
as $$
begin
	if(nombre ~* '[^A-Za-z]' or apellidopat ~* '[^A-Za-z]' or apellidomat ~* '[^A-Za-z]') then
	   	raise exception 'Algun apellido o nombre contiene caracteres especiales o numeros';
	else
	    insert into persona values (id_persona,nombre,apellidopat,apellidomat,genero,fecha_nac,fechain_con,fechafin_con,estado,num_int,num_ext,colonia,calle);
		insert into cliente values (id_cliente,id_persona);
	end if;
end;
$$
language plpgsql;

--Hacemos la llamada al SP.
call registrar_cliente(301, 'Fernando', 'Hernandez', 'Pau', 'M', '9/24/2012', '12/21/2013', '12/6/2023', 'Castro', '8', '08', 'Point', 'Rowland',101);

--Elimina al cliente insertado de persona y cliente para poder volver a probar el SP con los mismos datos.
delete from cliente where id_cliente = 101;
delete from persona where id_persona = 301;

--2.- Un SP que se encargue de eliminar un proveedor a traves de su id, en este SP, se debera eliminar todas las referencias del proveedor de las demas tablas.
create or replace procedure eliminar_proveedor(id_proveedor varchar)
as $$
begin
	delete from proveedor where rfc = id_proveedor;
	delete from trabajador where rfc = id_proveedor;
end;
$$
language plpgsql;

--Insertamos un proveedor de prueba para el SP.
insert into persona values (301, 'Fernando', 'Hernandez', 'Pau', 'M', '9/24/2012', '12/21/2013', '12/6/2023', 'Castro', '8', '08', 'Point', 'Rowland');
insert into trabajador values ('ul34V19uGtR2', 301);
insert into proveedor values ('ul34V19uGtR2', 1070.8, 'Jamaica', 30);

--Hacemos la llamada al SP.
call eliminar_proveedor('ul34V19uGtR2');

--Esto elimina al proveedor de la tabla persona igualmente. Solo es necesario hacerlo si se quiere volver a probar el SP con los mismos datos.
delete from persona where id_persona = 301;