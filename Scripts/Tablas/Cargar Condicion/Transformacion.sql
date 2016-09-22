

set define off;
set echo off;
set serveroutput on;
set sqlbl on;
set timing on;

alter session set Nls_Language = 'AMERICAN';
alter session set Nls_Territory = 'AMERICA';
alter session set Nls_Date_Format = 'DD/MM/YYYY';
alter session set Nls_Numeric_Characters = ".,";

/* Cargar Condicion  */

/* Transformacion */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Gc_Condicion2' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Gc_Condicion2
as

Select

cast( trim( ClienteId ) as char(10) ) as ClienteId,
cast( trim( Flg_Robinson ) as char(1) ) as Flg_Robinson,
cast( trim( Flg_No_Acepta_Uso_Datos ) as char(1) ) as Flg_NO_Acepta_Uso_Datos,
cast( trim( Flg_No_Ofrecer ) as char(1) ) as Flg_No_Ofrecer

from 
Natan.Gc_Condicion1;



select to_char( sysdate, 'DD/MM/YYYY HH:MI:SS AM' ) as FechaActual from sys.Dual;


exit;