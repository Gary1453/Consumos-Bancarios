

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

/* Transformacion */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Gc_Tarjetas2' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Gc_Tarjetas2
as

Select

cast( trim( ClienteId ) as char(10) ) as ClienteId,
cast( trim( TipoTarjeta ) as varchar2(30) ) as TipoTarjeta,
cast( trim( NumeroCuenta ) as varchar2(30) ) as NumeroCuenta,
cast( trim( NumeroTarjeta ) as varchar2(30) ) as NumeroTarjeta,
cast( trim( Marca ) as varchar2 (30) ) as Marca,
cast( trim( Tipo ) as varchar2 (30) ) as Tipo,
cast( trim( Parque ) as varchar2(20) ) as Parque,
cast( trim( Programa ) as varchar2(5) ) as Programa,
cast( trim( FechaAltaCuenta ) as date ) as FechaAltaCuenta,
cast( trim( FechaAltaTarjeta ) as date ) as FechaAltaTarjeta,
cast( trim( FechaAcuse ) as date ) as FechaAcuse,
cast( trim( LineaCredito ) as number(12) ) as LineaCredito,
cast( trim( MesIdExpiracion ) as char(6) ) as  MesIdExpiracion

from 
Natan.Gc_Tarjetas1;



select to_char( sysdate, 'DD/MM/YYYY HH:MI:SS AM' ) as FechaActual from sys.Dual;


exit;