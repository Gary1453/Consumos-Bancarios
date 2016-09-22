

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

/* Extraer */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Gc_Condicion1' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Gc_Condicion1
(

ClienteId varchar2(4000) null,
Flg_Robinson varchar2(4000) null,
Flg_No_Acepta_Uso_Datos varchar2(4000) null,
Flg_No_Ofrecer varchar2(4000) null

)

NoCache
NoLogging
NoMonitoring
PctFree 0;

select to_char( sysdate, 'DD/MM/YYYY HH:MI:SS AM' ) as FechaActual from sys.Dual;


exit;