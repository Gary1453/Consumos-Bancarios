


class Tarjeta():

	"""Clase que representa las tarjetas de un cliente """

	tipoTarjeta = ''
	marca = ''
	tipo  = ''
	parque = ''
	programa = ''
	fechaAltaCuenta = ''
	fechaAltaTarjeta = ''
	lineaCredito  = 0.0
	mesIdExpiracion = ''

	
	def __init__( self, numeroCuenta , numeroTarjeta  ):

		self.numeroCuenta = numeroCuenta
		self.numeroTarjeta = numeroTarjeta


class Consumo():

	"""" Clase que representa los consumos realizados por un cliente """

	def __init__( self , mesId , descripcion , canal , tipo , familia , subFamilia , producto , importeSoles ):

		self.mesId = mesId
		self.descripcion = descripcion
		self.importeSoles = importeSoles
		self.canal = canal
		self.tipo = tipo
		self.familia = familia
		self.subFamilia = subFamilia
		self.producto = producto	



class Cliente():	

	"""" Clase que representa la muestra de clientes seleccionados de un banco """

	edad = 0
	ingresoBruto = 0.0
	situacionLaboral = ''
	nivelServicio = ''
	rentabilidad = ''
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










