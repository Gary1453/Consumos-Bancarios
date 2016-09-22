

/* Funcion  para obtener las tarjetas de un cliente*/

Select 

TipoTarjeta,
NumeroCuenta,
NumeroTarjeta,
Marca,
Tipo,
Parque,
Programa,
FechaAltaCuenta,
FechaAltaTarjeta,
LineaCredito,
MesIdExpiracion

from 
Natan.gc_tarjetas

where
clienteid = '' ;

/* Funcion  para obtener los consumos de un cliente*/

Select 

MesId,
Descripcion,
(case when Familia in ('-') then NFamilia else Familia end) as Familia,
SubFamilia,
Producto,
Canal,
sum(ImporteSoles) as ImporteSoles

from 
Natan.Gc_consumos2

where clienteid = '' and NumeroTarjeta = ''

group by 

MesId,
Descripcion,
(case when Familia in ('-') then NFamilia else Familia end),
SubFamilia,
Producto,
Canal;


/* Funcion  para obtener los todos los clientes */



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
(
		Select
		nombrecliente,
		clienteid

		from 
		gc_consumos

		group by 

		nombrecliente,
		clienteid      ) Nom on

Clien.clienteid = Nom.clienteid;











