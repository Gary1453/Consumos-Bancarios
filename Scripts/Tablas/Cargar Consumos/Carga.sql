set define off;
set echo off;
set serveroutput on;
set sqlbl on;
set timing on;

alter session set Nls_Language = 'AMERICAN';
alter session set Nls_Territory = 'AMERICA';
alter session set Nls_Date_Format = 'DD/MM/YYYY';
alter session set Nls_Numeric_Characters = ".,";

/* Cargar Consumos  */

/* Carga */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Gc_Consumos' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Gc_Consumos
as

Select 

MesId,
nvl ( ClienteId , ClienteIdAbonado ) as ClienteId,
Descripcion,
Tipo,
(case when Familia in ('-') then NFamilia else Familia end) as Familia,
SubFamilia,
Producto,
Canal,
TransaccionPropia,
sum(ImporteSoles) as ImporteSoles

from 
Natan.Gc_consumos2

group by 

MesId,
nvl ( ClienteId , ClienteIdAbonado ),
Descripcion,
Tipo,
(case when Familia in ('-') then NFamilia else Familia end),
SubFamilia,
Producto,
Canal,
TransaccionPropia;


alter table Natan.Consumos add constraint Gc_Uk_Gc_Tarjetas unique( ClienteId , Numerocuenta , NumeroTarjeta );

/* Se crea una tabla que contiene el primer nombre de los clientes */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Gc_NombreClientes' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Gc_NombreClientes
as

Select
nombrecliente,
clienteid

from 
Natan.gc_consumos2

where clienteid is not null

group by 

nombrecliente,
clienteid;

alter table Gc_NombreClientes add constraint Gc_Pk_Gc_NombreClientes primary key( clienteid );

/* Depuracion */

drop table Natan.Gc_Consumos1;
--drop table Natan.Gc_Consumos2;


select to_char( sysdate, 'DD/MM/YYYY HH:MI:SS AM' ) as FechaActual from sys.Dual;


exit;