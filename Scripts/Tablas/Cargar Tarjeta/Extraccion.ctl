
Options ( Direct = true , Skip = 1 )

Load data

Infile       '/home/natan/Documentos/Prometeo/Consumos Bancarios/Fuente/Tarjeta.csv'
Badfile      '/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Tarjeta/Extraccion.bad'
DiscardFile  '/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Tarjeta/Extraccion.dsc'

Truncate

Into Table Natan.Gc_Tarjetas1 
fields Terminated by "," trailing nullcols

(

  ClienteId,
  TipoTarjeta,
  NumeroCuenta,
  NumeroTarjeta,
  Marca,
  Tipo,
  Parque,
  Programa,
  FechaAltaCuenta,
  FechaAltaTarjeta,
  FechaAcuse,
  LineaCredito,
  MesIdExpiracion

)


