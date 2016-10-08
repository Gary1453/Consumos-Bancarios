


class Tarjeta():

	"""Clase que representa las tarjetas de un cliente """

	tipoTarjeta = 0
	prioridad=0
	programa = 0
	cantidad=0	
	lineaCredito  = 0.0

	
	def __init__( self,  programa , cantidad , prioridad , lineaCredito ):

		self.programa=programa
		self.cantidad=cantidad
		self.prioridad = prioridad
		self.lineaCredito=lineaCredito


class Consumo():

	"""" Clase que representa los consumos realizados por un cliente """

	def __init__( self , mesId ,  familia , recencia , frecuencia , importeSoles , saldoPasivo ,  valorCorriente ):

		self.mesId = mesId
		self.importeSoles = importeSoles
		self.familia = familia
		self.recencia=recencia
		self.frecuencia=frecuencia
		self.saldoPasivo=saldoPasivo
		self.valorCorriente=valorCorriente




class Cliente():	

	"""" Clase que representa la muestra de clientes seleccionados de un banco """

	edad = 0
	ingresoBruto = 0.0
	situacionLaboral = ''
	nivelServicio = ''
	rentabilidad = 0
	hip = 0,
	libDis = 0
	tarCred = 0
	segundaTarCred = 0,
	saldoCorVigTarCred = 0.0
	veh = 0
	cts = 0
	inv = 0
	mil = 0
	plan = 0
	planAbon = 0,
	saldoCortotPlan = 0.0
	plazFij = 0
	tran = 0
	pagAut = 0
	asistenciaSeg = 0
	proteccionCreditoSeg = 0
	saludVidaSeg = 0
	productos = 0
	gestionable = 0
	consumos=[]
	tarjetas=[]


	def __init__(self,nombreCliente,clienteId,tipoDocumento,numeroDocumento):

		self.nombreCliente = nombreCliente
		self.clienteId = clienteId
		self.tipoDocumento = tipoDocumento
		self.numeroDocumento = numeroDocumento










