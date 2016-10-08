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


/* Red Neuroal */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Rn_Tarjetas1' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Rn_Tarjetas1
as
Select 

Tar.ClienteId,

(case  

when Tar.TipoTarjeta in ('TARJETA CRÉDITO','TARJETA CRÉDITO ADICIONAL') then 1
when Tar.TipoTarjeta in ('TARJETA DÉBITO')  then 2

end) as TipoTarjeta,

(case 

    when Tar.marca = 'AMEX' and  Tar.tipo = 'BLACK' then  1 
    when Tar.marca = 'AMEX' and  Tar.tipo = 'JOVEN' then  13
    when Tar.marca = 'AMEX' and  Tar.tipo = 'GOLD'   then   6
    when Tar.marca = 'AMEX' and  Tar.tipo = 'GREEN'  then   9
    when Tar.marca = 'AMEX' and  Tar.tipo = 'PLATINUM' then  3
    when Tar.marca = 'AMEX' and  Tar.tipo = 'ELITE'  then  12
    when Tar.marca = 'MASTERCARD' and  Tar.tipo = 'GOLD' then  8
    when Tar.marca = 'MASTERCARD' and  Tar.tipo = 'PLATINUM' then  5
    when Tar.marca = 'MASTERCARD' and  Tar.tipo = 'CLÁSICA' then 11 
    when Tar.marca = 'VISA' and  Tar.tipo = 'CLÁSICA' then   10
    when Tar.marca = 'VISA' and  Tar.tipo = 'GOLD' then  7
    when Tar.marca = 'VISA' and  Tar.tipo = 'PLATINUM' then  4
    when Tar.marca = 'VISA' and  Tar.tipo = 'MEGAPLAZA' then  14
    when Tar.marca = 'VISA' and  Tar.tipo = 'SIGNATURE' then  2 
    when Tar.marca = 'VISA' and  Tar.tipo is null then   15
    when Tar.marca = 'CERRADA' and  Tar.tipo = 'CERRADA' then  16 
  
    else 17

end) as Prioridad,
nvl2( Tar.Programa , 1 ,0) as Programa,

count(1) as cantidad,
nvl( sum( lineaCredito ) , 0 ) as lineaCredito

from 
Natan.Gc_Tarjetas Tar

where
Tar.MesIdExpiracion >='201606'

group by 
Tar.ClienteId,
Tar.TipoTarjeta,
Tar.Marca,
Tar.Tipo,
Tar.Programa;



declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Rn_Tarjetas' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Rn_Tarjetas
as

Select 
ClienteId,
TipoTarjeta,
Prioridad,
Programa,
sum( cantidad ) as cantidad,
sum( LineaCredito ) as LineaCredito

from 
Natan.Rn_Tarjetas1 Tar

group by 
ClienteId,
TipoTarjeta,
Prioridad,
Programa;

alter table Natan.Rn_Tarjetas add constraint Gc_Pk_Rn_Tarjetas primary key ( ClienteId , TipoTarjeta , Prioridad , Programa );

select to_char( sysdate, 'DD/MM/YYYY HH:MI:SS AM' ) as FechaActual from sys.Dual;


exit;