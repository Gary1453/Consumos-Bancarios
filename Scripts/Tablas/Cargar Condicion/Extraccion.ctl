
Options ( Direct = true , Skip = 1 )

Load data

Infile       '/home/natan/Documentos/Prometeo/Consumos Bancarios/Fuente/Condicion.csv'
Badfile      '/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Condicion/Extraccion.bad'
DiscardFile  '/home/natan/Documentos/Prometeo/Consumos Bancarios/Scripts/Tablas/Cargar Condicion/Extraccion.dsc'

Truncate

Into Table Natan.Gc_Condicion1
fields Terminated by "," trailing nullcols

(

ClienteId,
Flg_Robinson,
Flg_No_Acepta_Uso_Datos,
Flg_No_Ofrecer

)


