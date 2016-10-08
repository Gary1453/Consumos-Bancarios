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

/* Carga */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Gc_Clientes' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Gc_Clientes
as

Select 

	Nom.nombrecliente as Nombre,
	Clien.clienteid,
	Clien.TipoDocumento,
	Clien.NumeroDocumento,
	Clien.Edad,
	Clien.IngresoBruto,
	Clien.SituacionLaboral,
	Clien.NivelServicio,
	Clien.RentabilidadPromedio as Rentabilidad,
	Clien.Hip,
	Clien.LibDis,
	Clien.TarCred,
	Clien.SegundaTarCred,
	Clien.SaldoCorVigTarCred,
	Clien.Veh,
	Clien.Cts,
	Clien.Inv,
	Clien.Mil,
	Clien.PLan,
	Clien.PLanAbon,
	Clien.SaldoCortotPlan,
	Clien.SaldoCorTotPas,
	Clien.PLazFij,
	Clien.Tran,
	Clien.PagAut,
	Clien.AsistenciaSeg,
	Clien.ProteccionCreditoSeg,
	Clien.SaludVidaSeg,
	Clien.Productos,
	Clien.Gestionable

from 
Natan.Gc_Clientes2 Clien 

inner join 
Natan.Gc_NombreClientes  Nom on
Clien.clienteid = Nom.clienteid;


alter table Natan.Gc_CLientes add constraint Gc_Pk_Gc_Clientes primary key ( ClienteId );


/* Creamos la tabla para el login de clientes */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Gc_Validacion' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Gc_Validacion
as

Select 

Cli.ClienteId,
Cli.TipoDocumento,
Cli.NumeroDocumento,
Cli.Nombre as NombreCliente,
'123' as Password

from 

Natan.Gc_Clientes Cli 

inner join 
(

	Select 

	ClienteId

	from 
	Natan.Gc_Consumos 

	group by 
	ClienteId ) Con 

on
Cli.clienteid = Con.clienteid;


alter table Natan.Gc_Validacion add constraint Gc_Pk_Gc_Validacion primary key ( ClienteId );


/* Depuracion */

drop table Natan.Gc_Clientes1;
drop table Natan.Gc_Clientes2;


select to_char( sysdate, 'DD/MM/YYYY HH:MI:SS AM' ) as FechaActual from sys.Dual;


exit;