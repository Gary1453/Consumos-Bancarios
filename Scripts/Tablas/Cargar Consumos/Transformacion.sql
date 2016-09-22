

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

/* Transformacion */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Gc_Consumos2' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Gc_Consumos2
as

Select

cast( trim( MesId ) as char(6) ) as MesId,
to_date( trim( fecha )  , 'yyyy/mm/dd hh24:mi:ss' ) as Fecha,
cast( trim( TransaccionId ) as  varchar2(20) ) as TransaccionId,
cast( trim( ClienteId ) as  char(10) ) as ClienteId,
cast( trim( NombreCliente ) as varchar2(100) ) as NombreCliente,
cast( trim( NumerocuentaOrigen ) as  varchar2(20) ) as NumerocuentaOrigen,
cast( trim( NumeroTarjeta ) as  varchar2(20) ) as NumeroTarjeta,
cast( trim( TipoTarjeta ) as  varchar2(30) ) as TipoTarjeta,
cast( trim( ImporteSoles ) as number(14,2) ) as ImporteSoles,
cast( trim( ClienteIdAbonado ) as  char(10) ) as ClienteIdAbonado,
cast( trim( NombreClienteAbonado ) as  varchar2(100) ) as NombreClienteAbonado,
cast( trim( Descripcion ) as  varchar2(100) ) as Descripcion,
cast( trim( Canal ) as  varchar2(20) ) as Canal,
cast( trim( Tipo ) as  varchar2(20) ) as Tipo,
cast( trim( NumerocuentaDestino ) as varchar2(20) ) as NumerocuentaDestino,
cast( trim( NombCatCom ) as  varchar2(100) ) as NombCatCom,
cast( trim( Visanet ) as  varchar2(100) ) as Visanet,
cast( trim( Familia ) as  varchar2(100) ) as Familia,
cast( trim( Subfamilia ) as  varchar2(100) ) as Subfamilia,
cast( trim( Local ) as  varchar2(100) ) as Local,
cast( trim( Institucion ) as  varchar2(100) ) as  Institucion,
cast( trim( TransaccionPropia ) as char(1) ) as TransaccionPropia,
cast( trim( Producto ) as  varchar2(100) ) as Producto,
cast( trim( Mil ) as  char(1) ) as Mil,
cast( trim( Inv ) as  char(1) ) as Inv,
cast( trim( PlazFij ) as  char(1) ) as PlazFij,
cast( trim( Flg_Ahorr ) as char(1) ) as Flg_Ahorr,
cast( trim( Flg_Cartera ) as char(1)  ) as Flg_Cartera,
cast( trim( Nfamilia ) as  varchar2(100) ) as Nfamilia

from 
Natan.Gc_Consumos1;



select to_char( sysdate, 'DD/MM/YYYY HH:MI:SS AM' ) as FechaActual from sys.Dual;


exit;