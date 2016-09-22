
Options ( Direct = true , Skip = 1 )

Load data

Infile       '/home/natan/Documentos/Prometeo/Consumos Bancarios/Fuente/Consumos.txt'
Badfile      '/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Consumos/Extraccion.bad'
DiscardFile  '/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Consumos/Extraccion.dsc'

Truncate

Into Table Natan.Gc_Consumos1 
fields Terminated by "|" trailing nullcols

(

MesId,
Fecha,
TransaccionId,
ClienteId,
NombreCliente,
NumerocuentaOrigen,
NumeroTarjeta,
TipoTarjeta,
ImporteSoles,
ClienteIdAbonado,
NombreClienteAbonado,
Descripcion,
Canal,
Tipo,
NumerocuentaDestino,
NombCatCom,
Visanet,
Familia,
Subfamilia,
Local,
Institucion,
TransaccionPropia,
Producto,
Mil,
Inv,
PlazFij,
Flg_Ahorr,
Flg_Cartera,
Nfamilia

)


