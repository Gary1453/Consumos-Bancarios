sset define off;
set echo off;
set serveroutput on;
set sqlbl on;
set timing on;

alter session set Nls_Language = 'AMERICAN';
alter session set Nls_Territory = 'AMERICA';
alter session set Nls_Date_Format = 'DD/MM/YYYY';
alter session set Nls_Numeric_Characters = ".,";

/* Cargar Consumos  */

/* Carga */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Gc_Consumos' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Gc_Consumos
as

Select 

MesId,
Fecha,
nvl ( ClienteId , '0000000000' ) as ClienteId,
nvl ( ClienteIdAbonado , '0000000000' ) as ClienteIdAbonado,
Descripcion,
Tipo,
(case when Familia in ('-') then NFamilia else Familia end) as Familia,
SubFamilia,

( case (case when Familia in ('-') then NFamilia else Familia end) 


      when upper( 'Transferencias' ) then upper( 'Transferencias' ) 
      when upper( 'Pagos Financieros' ) then upper( 'Pagos Financieros' ) 
      when upper( 'Restaurantes' ) then upper( 'Restaurantes' )
      when upper( 'Tienda Por Departamentos' ) then upper( 'Tienda Por Departamentos' )
      when upper( 'Pagos Varios' ) then upper( 'Pagos Varios' )
      when upper( 'Educacion' ) then upper( 'Educacion' )
      when upper( 'Salud' ) then upper( 'Salud' )
      when upper( 'Estaciones De Servicio' ) then upper( 'Estaciones De Servicio' )
      when upper( 'Servicios Especializados' ) then upper( 'Servicios Especializados' )
      when upper( 'Pago DE Sservicios' ) then upper( 'Pago DE Sservicios' )
      when upper( 'Supermercados' ) then upper( 'Supermercados' )
      when upper( 'Transporte' ) then upper( 'Transporte' )
      when upper( 'Retiro De Efectivo' ) then upper( 'Retiro De Efectivo' )
      when upper( 'Casinos y Juegos De Azar' ) then upper( 'Entretenimiento' )
      when upper( 'Hoteles' ) then upper( 'Entretenimiento' )
      when upper( 'Recreación' ) then upper( 'Entretenimiento' )
      when upper( 'Agencias De Viaje y Alquiler De Autos' ) then upper( 'Entretenimiento' )
      when upper( 'Equipos y Repuestos' ) then upper( 'Entretenimiento' )
      when upper( 'Tiendas y Bazares' ) then upper( 'Entretenimiento' )
      when upper( 'Aerolíneas' ) then upper( 'Entretenimiento' )
      else upper('Otros')


    end) as FamiliaGeneral,

Producto,
Canal,
TransaccionPropia,
sum(ImporteSoles) as ImporteSoles

from 
Natan.Gc_consumos2

group by 

MesId,
Fecha,
nvl ( ClienteId , '0000000000' ),
nvl ( ClienteIdAbonado , '0000000000' ),
Descripcion,
Tipo,
(case when Familia in ('-') then NFamilia else Familia end),
SubFamilia,
Producto,
Canal,
TransaccionPropia;


--alter table Natan.Consumos add constraint Gc_Uk_Gc_Consumos unique( ClienteId , Numerocuenta , NumeroTarjeta );

/* Se crea una tabla que contiene el primer nombre de los clientes */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Gc_NombreClientes' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Gc_NombreClientes
as

Select
nombrecliente,
clienteid

from 
Natan.gc_consumos2

where clienteid is not null

group by 

nombrecliente,
clienteid;

alter table Gc_NombreClientes add constraint Gc_Pk_Gc_NombreClientes primary key( clienteid );

/* Depuracion */

drop table Natan.Gc_Consumos1;
--drop table Natan.Gc_Consumos2;


/* Red Neuronal */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Rn_Consumos1' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Rn_Consumos1
as

Select 

Con.ClienteId,
Con.MesId,
Con.FamiliaGeneral as Familia,

round(

      ( 
      
        cast ( '01' || '/' ||  to_char( sysdate ,'MM') || '/' ||  to_char( sysdate ,'YYYY')  as date) -
        cast ( ( '01' || '/' ||  substr( Con.MesId , 5 , 2 ) || '/' ||  substr( Con.MesId , 1 , 4 ) )  as date ) 
      ) / 30 
  
    )  as Recencia,
    
count(1) as cantidad,
sum(importeSoles) as ImporteSoles

from 
Natan.gc_consumos Con

where
Con.tipo in upper('cargos')

group by 

Con.clienteid,
Con.MesId,
Con.FamiliaGeneral,
round(

      ( 
      cast ( '01' || '/' ||  to_char( sysdate ,'MM') || '/' ||  to_char( sysdate ,'YYYY')  as date) -
      cast ( ( '01' || '/' ||  substr( Con.MesId , 5 , 2 ) || '/' ||  substr(  Con.MesId , 1 , 4 ) )  as date ) 
      ) / 30 
  
    );

alter table Rn_Consumos1 add constraint Gc_Pk_Rn_Consumos1 primary key( ClienteId , MesId , Familia) ;



/* Red Neuronal */

declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Rn_Consumos2' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Rn_Consumos2
as

Select

RedNeur.ClienteId,
RedNeur.MesId,
RedNeur.Familia,

( case 
  
  when RedNeur.Recencia <= 15 then  3
  when RedNeur.Recencia between 16 and 30 then  2
  when RedNeur.Recencia >= 31 then  1

  end) as Recencia,

( case 
  
  when RedNeur.Cantidad < 5 then 1
  when RedNeur.Cantidad between 5 and 20 then 2
  when RedNeur.Cantidad >=21 then 3

  end) as Frecuencia,

( case 
  
  when RedNeur.ImporteSoles < 100 then 1
  when RedNeur.ImporteSoles between 100 and 1000  then 2
  when RedNeur.ImporteSoles between 1001 and 3000  then 3
  when RedNeur.ImporteSoles >= 3001  then 4

  end) as ImporteSoles,

( case 
  
  when Cli.SaldoCorTotPas < 1000 then 1
  when Cli.SaldoCorTotPas between 1000 and 7000 then 2
  when Cli.SaldoCorTotPas between 7001 and 20000 then 3
  when Cli.SaldoCorTotPas >= 20001 then 4

  end) as SaldoCorTotPas

from
Natan.Rn_Consumos1 RedNeur


left join 
Natan.Gc_Clientes Cli on 
RedNeur.ClienteId = CLi.ClienteId;


alter table Rn_Consumos2 add constraint Gc_Pk_Rn_Consumos2 primary key( ClienteId , MesId ,Familia );


declare
  does_not_exist exception;
  pragma exception_init ( does_not_exist, -942 );
begin
  dbms_utility.Exec_Ddl_Statement( 'drop table Natan.Rn_Consumos' );
    exception
      when does_not_exist then null;
end;
/

create table Natan.Rn_Consumos
as

Select

RedNeur.ClienteId,
RedNeur.MesId,
RedNeur.Familia,
RedNeur.Recencia,
RedNeur.Frecuencia,
RedNeur.ImporteSoles,
RedNeur.SaldoCorTotPas,

RedNeur.Recencia * RedNeur.Frecuencia *  RedNeur.ImporteSoles * RedNeur.SaldoCorTotPas as ValorCorriente,


( case 

  when ( RedNeur.Recencia * RedNeur.Frecuencia *  RedNeur.ImporteSoles * RedNeur.SaldoCorTotPas  )
         between 1 and 35 then 0   --upper( 'Low')

  when ( RedNeur.Recencia * RedNeur.Frecuencia *  RedNeur.ImporteSoles * RedNeur.SaldoCorTotPas  ) 
         between 36 and 80 then 1  --upper ( 'Moderate' )

  when ( RedNeur.Recencia * RedNeur.Frecuencia *  RedNeur.ImporteSoles * RedNeur.SaldoCorTotPas  ) 
         between 81 and 144 then 2 --upper ( 'High Value' )

 end ) as RangoValorCorriente 

from 
Natan.Rn_Consumos2 RedNeur;


alter table Rn_Consumos add constraint Gc_Pk_Rn_Consumos primary key( ClienteId , MesId ,Familia );



select to_char( sysdate, 'DD/MM/YYYY HH:MI:SS AM' ) as FechaActual from sys.Dual;


exit;
