
Options ( Direct = true , Skip = 1 )

Load data

Infile       '/home/natan/Documentos/Prometeo/Consumos Bancarios/Fuente/Clientes.csv'
Badfile      '/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Cliente/Extraccion.bad'
DiscardFile  '/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Cliente/Extraccion.dsc'

Truncate

Into Table Natan.Gc_Clientes1
fields Terminated by "," trailing nullcols

(

Mesid,
Clienteid,
Tipodocumento,
Numerodocumento,
Segmento,
Edad,
Ingresobruto,
Fuenteingresobruto,
Situacionlaboral,
Nivelservicio,
Clasificacionriesgoibk,
Rentabilidadpromedio,
Segmentomercadoid,
Adelsuel,
Con,
Hip,
Libdis,
Tarcred,
Parquetarcred,
Segundatarcred,
Saldocorvigtarcred,
Saldocortottarcred,
Extcastarcred,
Saldocorvigextcastarcred,
Saldopromvigextcastarcred,
Veh,
Ahorcred,
Cts,
Inv,
Mil,
Plan,
Planabon,
Saldocortotplan,
Plazfij,
Tran,
Pagaut,
Asistenciaseg,
Proteccioncreditoseg,
Saludvidaseg,
Castigado,
Fallecido,
Productos,
Gestionable

)


