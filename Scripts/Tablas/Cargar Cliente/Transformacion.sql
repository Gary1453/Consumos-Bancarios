

set define off;
set echo off;
set serveroutput on;
set sqlbl on;
set timing on;

alter session set Nls_Language = 'AMERICAN';
alter session set Nls_Territory = 'AMERICA';
alter session set Nls_Date_Format = 'DD/MM/YYYY';
alter session set Nls_Numeric_Characters = ".,";

/* Cargar Clientes  */

/* Transformacion */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Gc_Clientes2' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Gc_Clientes2
as

Select

cast ( trim ( MesId ) as char(6) ) as MesId,
cast ( trim ( ClienteId ) as char(10) ) as ClienteId ,
cast ( trim ( TipoDocumento ) as char(1) ) as TipoDocumento,
cast ( trim ( NumeroDocumento ) as varchar2(20) ) as NumeroDocumento,
cast ( trim ( Segmento ) as varchar2(5) ) as Segmento,
cast ( trim ( Edad ) as number ) as Edad,
cast ( trim ( Ingresobruto ) as number( 14 , 2 ) ) as Ingresobruto,
cast ( trim ( FuenteIngresobruto ) as varchar2(30) ) as FuenteIngresobruto,
cast ( trim ( SituacionLaboral ) as varchar2(30) ) as SituacionLaboral,
cast ( trim ( NivelServicio ) as varchar2(30) ) as NivelServicio,
cast ( trim ( ClasificacionRiesgoibk ) as varchar2(30) ) as ClasificacionRiesgoibk,
cast ( trim ( RentabilidadPromedio ) as number( 14 ,2 ) ) as RentabilidadPromedio,
cast ( trim ( SegmentoMercadoid ) as char(3) ) as SegmentoMercadoid,
cast ( trim ( Adelsuel ) as char(1) ) as Adelsuel,
cast ( trim ( Con ) as char(1) ) as Con,
cast ( trim ( Hip ) as char(1) ) as Hip,
cast ( trim ( Libdis ) as char(1) ) as Libdis,
cast ( trim ( TarCred ) as char(1) ) as TarCred,
cast ( trim ( ParqueTarCred ) as char(1) ) as ParqueTarCred,
cast ( trim ( SegundaTarCred ) as char(1) ) as SegundaTarcred,
cast ( trim ( SaldoCorVigTarCred ) as number ( 14 , 2) ) as SaldoCorVigTarCred,
cast ( trim ( SaldoCorTotTarCred ) as number ( 14 , 2) ) as SaldoCorTotTarCred,
cast ( trim ( Extcastarcred ) as char(1) ) as Extcastarcred,
cast ( trim ( SaldoCorVigExtcasTarCred ) as  number( 14 , 2 ) )  as SaldoCorVigExtcasTarCred,
cast ( trim ( SaldoPromVigExtcasTarCred ) as number( 14 , 2 ) )  as SaldoPromVigExtcasTarCred,
cast ( trim ( Veh ) as char(1) ) as Veh,
cast ( trim ( AhorCred ) as char(1) ) as AhorCred,
cast ( trim ( Cts ) as char(1) ) as Cts,
cast ( trim ( Inv ) as char(1) ) as Inv,
cast ( trim ( Mil ) as char(1) ) as Mil,
cast ( trim ( Plan ) as char(1) ) as Plan,
cast ( trim ( PlanAbon ) as char(1) ) as PlanAbon,
cast ( trim ( SaldoCorTotPlan ) as number( 14 , 2 ) ) as SaldoCorTotPlan,
cast ( trim ( SaldoCorTotPas ) as number( 14 , 2 ) ) as SaldoCorTotPas,
cast ( trim ( PlazFij ) as char(1) ) as PlazFij,
cast ( trim ( Tran ) as char(1) ) as Tran,
cast ( trim ( Pagaut ) as char(1) ) as Pagaut,
cast ( trim ( AsistenciaSeg ) as char(1) ) as AsistenciaSeg,
cast ( trim ( ProteccionCreditoSeg ) as char(1) ) as ProteccionCreditoSeg,
cast ( trim ( SaludVidaSeg ) as char(1) ) as SaludVidaSeg,
cast ( trim ( Castigado ) as char(1) ) as Castigado,
cast ( trim ( Fallecido ) as char(1) ) as Fallecido,
cast ( trim ( Productos ) as number ) as Productos,
cast ( trim ( Gestionable ) as char(1) ) as Gestionable


from 
Natan.Gc_Clientes1;



select to_char( sysdate, 'DD/MM/YYYY HH:MI:SS AM' ) as FechaActual from sys.Dual;


exit;