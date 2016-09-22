

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

/* Extraer */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Gc_Tarjetas1' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Gc_Tarjetas1
(

  ClienteId varchar2(4000) null,
  TipoTarjeta varchar2(4000) null,
  NumeroCuenta varchar2(4000) null,
  NumeroTarjeta varchar2(4000) null,
  Marca varchar2(4000) null,
  Tipo varchar2(4000) null,
  Parque varchar2(4000) null,
  Programa varchar2(4000) null,
  FechaAltaCuenta varchar2(4000) null,
  FechaAltaTarjeta varchar2(4000) null,
  FechaAcuse varchar2(4000) null,
  LineaCredito varchar2(4000) null,
  MesIdExpiracion varchar2(4000) null

)

NoCache
NoLogging
NoMonitoring
PctFree 0;

select to_char( sysdate, 'DD/MM/YYYY HH:MI:SS AM' ) as FechaActual from sys.Dual;


exit;