import cx_Oracle as oracle
import time 
import clases as clases

# Variables

#conn = oracle.connect('natan/nisekoi@127.0.0.1')

"""
Metodos de Conexion 
"""

def obtener_clientes():
	
	conn = oracle.connect('natan/nisekoi@127.0.0.1')
	clientes = []
	cur = conn.cursor()
	sql = "Select * from natan.gc_clientes"
	cur.execute(sql)
	res = cur.fetchall()

	for r in res:
		
		cliente = clases.Cliente( r[0] , r[1] , r[2] , r[3] )
		cliente.edad=r[4]
		cliente.ingresoBruto = r[5] 
		cliente.situacionLaboral = r[6]
		cliente.nivelServicio = r[7]
		cliente.rentabilidad = r[8]
		cliente.hip = r[9]
		cliente.libDis = r[10]
		cliente.tarCred = r[11]
		cliente.segundaTarCred = r[12]
		cliente.saldoCorVigTarCred = r[13]
		cliente.veh = r[14]
		cliente.cts = r[15]
		cliente.inv = r[16]
		cliente.mil = r[17]
		cliente.pLan = r[18]
		cliente.pLanAbon = r[19]
		cliente.saldoCortotPlan = r[20]
		cliente.pLazFij = r[21]
		cliente.tran = r[22]
		cliente.pagAut = r[23]
		cliente.asistenciaSeg = r[24]
		cliente.proteccionCreditoSeg = r[25]
		cliente.saludVidaSeg = r[26]
		cliente.productos =r[27] 
		cliente.gestionable =r[28] 
		cliente.consumos = obtener_consumos( conn , cliente.clienteId )
		cliente.tarjetas = obtener_tarjetas( conn , cliente.clienteId )
		clientes.append( cliente )

	cur.close()
	return clientes


def obtener_consumos( conn , clienteId ):

	consumos = []
	cur = conn.cursor()
	sql = "Select * from natan.rn_consumos where clienteId = :clienteId"
	cur.execute( sql , { 'clienteId' : clienteId} )
	res = cur.fetchall()

	for r in res:

		consumo = clases.Consumo( r[1] , r[2] , r[3] , r[4] , r[5] ,r[6] , r[7] )			
		consumos.append( consumo )		

	cur.close()
	return consumos	                        


def obtener_tarjetas( conn , clienteId ):

	tarjetas = []
	cur = conn.cursor()
	sql="Select "
	sql+= " sum(Programa) as Programa,"
	sql+= " sum(Cantidad) as Cantidad,"
	sql+= " avg(Cantidad * Prioridad) as Prioridad,"
	sql+= " sum(LineaCredito) as LineaCredito "
	sql+= " from natan.rn_tarjetas "
	sql+= " where clienteId = :clienteId"
	sql+= " group by clienteid"

	cur.execute( sql , { 'clienteId' : clienteId} )
	res = cur.fetchall()

	for r in res:

		tarjeta = clases.Tarjeta( r[0] , r[1] , r[2] , r[3]  )	
		tarjetas.append( tarjeta )		

	cur.close()
	return tarjetas	 


"""

Mostramos el tiempo de procesamiento y cerramos la conexion 

"""


"""
a=obtener_clientes()[15]
print(a.edad)
print a.numeroDocumento
print(a.clienteId)
print(a.consumos[5].importeSoles)
print(a.consumos[5].valorCorriente)
print(a.consumos[5].mesId)
print(a.tarjetas[0].lineaCredito)
print(a.tarjetas[0].prioridad)
"""


#conn.close()


