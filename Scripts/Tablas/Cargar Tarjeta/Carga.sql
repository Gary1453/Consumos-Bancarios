set define off;
set echo off;
set serveroutput on;
set sqlbl on;
set timing on;

alter session set Nls_Language = 'AMERICAN';
alter session set Nls_Territory = 'AMERICA';
alter session set Nls_Date_Format = 'DD/MM/YYYY';
alter session set Nls_Numeric_Characters = ".,";

/* Cargar Tarjetas  */

/* Carga */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Gc_Tarjetas' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Gc_Tarjetas
as

Select 
    
    ClienteId,
	TipoTarjeta,
	NumeroCuenta,
	NumeroTarjeta,
	Marca,
	Tipo,
	Parque,
	Programa,
	FechaAltaCuenta,
	FechaAltaTarjeta,
	LineaCredito,
	MesIdExpiracion

	from 

	Natan.Gc_tarjetas2;


alter table Natan.Gc_Tarjetas add constraint Gc_Uk_Gc_Tarjetas unique( ClienteId , Numerocuenta , NumeroTarjeta );

/* Depuracion */

drop table Natan.Gc_Tarjetas1;
drop table Natan.Gc_Tarjetas2;


select to_char( sysdate, 'DD/MM/YYYY HH:MI:SS AM' ) as FechaActual from sys.Dual;


exit;