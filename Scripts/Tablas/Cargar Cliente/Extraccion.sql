

set define off;
set echo off;
set serveroutput on;
set sqlbl on;
set timing on;

alter session set Nls_Language = 'AMERICAN';
alter session set Nls_Territory = 'AMERICA';
alter session set Nls_Date_Format = 'DD/MM/YYYY';
alter session set Nls_Numeric_Characters = ".,";

/* Cargar Cliente  */

/* Extraer */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Gc_Clientes1' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Gc_Clientes1
(

MesId Varchar2(4000),
ClienteId Varchar2(4000),
TipoDocumento Varchar2(4000),
NumeroDocumento Varchar2(4000),
Segmento Varchar2(4000),
Edad Varchar2(4000),
Ingresobruto Varchar2(4000),
FuenteIngresobruto Varchar2(4000),
SituacionLaboral Varchar2(4000),
NivelServicio Varchar2(4000),
ClasificacionRiesgoibk Varchar2(4000),
RentabilidadPromedio Varchar2(4000),
SegmentoMercadoid Varchar2(4000),
Adelsuel Varchar2(4000),
Con Varchar2(4000),
Hip Varchar2(4000),
Libdis Varchar2(4000),
Tarcred Varchar2(4000),
ParqueTarcred Varchar2(4000),
SegundaTarcred Varchar2(4000),
SaldocorVigTarcred Varchar2(4000),
SaldocorTotTarcred Varchar2(4000),
ExtcasTarcred Varchar2(4000),
SaldocorVigExtcasTarcred Varchar2(4000),
SaldoPromvigExtcastarcred Varchar2(4000),
Veh Varchar2(4000),
Ahorcred Varchar2(4000),
Cts Varchar2(4000),
Inv Varchar2(4000),
Mil Varchar2(4000),
Plan Varchar2(4000),
PlanAbon Varchar2(4000),
SaldoCortotPlan Varchar2(4000),
PlazFij Varchar2(4000),
Tran Varchar2(4000),
Pagaut Varchar2(4000),
AsistenciaSeg Varchar2(4000),
ProteccionCreditoSeg Varchar2(4000),
SaludVidaSeg Varchar2(4000),
Castigado Varchar2(4000),
Fallecido Varchar2(4000),
Productos Varchar2(4000),
Gestionable Varchar2(4000) 

)

NoCache
NoLogging
NoMonitoring
PctFree 0;

select to_char( sysdate, 'DD/MM/YYYY HH:MI:SS AM' ) as FechaActual from sys.Dual;


exit;