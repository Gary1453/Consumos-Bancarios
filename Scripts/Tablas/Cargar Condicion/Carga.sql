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

/* Carga */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Gc_Condicion' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Gc_Condicion

as
Select

Condicion.*

from 
Natan.Gc_Condicion2 Condicion;


alter table Natan.Gc_Condicion add constraint Gc_Pk_Gc_Condicion primary key ( ClienteId );

/* Depuracion */

drop table Natan.Gc_Condicion1;
drop table Natan.Gc_Condicion2;


select to_char( sysdate, 'DD/MM/YYYY HH:MI:SS AM' ) as FechaActual from sys.Dual;


exit;