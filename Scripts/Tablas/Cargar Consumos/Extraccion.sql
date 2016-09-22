

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

/* Extraer */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Gc_Consumos1' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Gc_Consumos1
(

MesId varchar2(4000) null ,
Fecha varchar2(4000) null ,
TransaccionId varchar2(4000) null ,
ClienteId varchar2(4000) null ,
NombreCliente varchar2(4000) null ,
NumerocuentaOrigen varchar2(4000) null ,
NumeroTarjeta varchar2(4000) null ,
TipoTarjeta varchar2(4000) null ,
ImporteSoles varchar2(4000) null ,
ClienteIdAbonado varchar2(4000) null ,
NombreClienteAbonado varchar2(4000) null ,
Descripcion varchar2(4000) null ,
Canal varchar2(4000) null ,
Tipo varchar2(4000) null ,
NumerocuentaDestino varchar2(4000) null ,
NombCatCom varchar2(4000) null ,
Visanet varchar2(4000) null ,
Familia varchar2(4000) null ,
Subfamilia varchar2(4000) null ,
Local varchar2(4000) null ,
Institucion varchar2(4000) null ,
TransaccionPropia varchar2(4000) null ,
Producto varchar2(4000) null ,
Mil varchar2(4000) null ,
Inv varchar2(4000) null ,
PlazFij varchar2(4000) null ,
Flg_Ahorr varchar2(4000) null ,
Flg_Cartera varchar2(4000) null ,
Nfamilia varchar2(4000) null 

)

NoCache
NoLogging
NoMonitoring
PctFree 0;

select to_char( sysdate, 'DD/MM/YYYY HH:MI:SS AM' ) as FechaActual from sys.Dual;


exit;