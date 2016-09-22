


class Tarjeta():
	
	"""Clase que representa las tarjetas de un cliente """
	
	def __init__( self, tipoTarjeta , numeroCuenta , numeroTarjeta , marca , tipo , parque,
				  programa , fechaAltaCuenta , fechaAltaTarjeta , lineaCredito , mesIdExpiracion, consumos ):

		self.tipoTarjeta = TipoTarjeta,
		self.numeroCuenta = NumeroCuenta,
		self.numeroTarjeta = NumeroTarjeta,
		self.marca = Marca,
		self.tipo = Tipo,
		self.parque = Parque,
		self.programa = Programa,
		self.fechaAltaCuenta = FechaAltaCuenta,
		self.fechaAltaTarjeta = FechaAltaTarjeta,
		self.lineaCredito = LineaCredito,
		self.mesIdExpiracion = MesIdExpiracion
		self.consumos = list(consumos)



class Consumo():

	"""" Clase que representa los consumos realizados por un cliente """

	def _init_( self , mesId , descripcion , canal , tipo , familia , subFamilia , producto , importeSoles ):

		self.mesId = MesId,
		self.descripcion = Descripcion,
		self.importeSoles = ImporteSoles,
		self.canal = Canal,
		self.tipo = Tipo,
		self.familia = Familia,
		self.subFamilia = SubFamilia,
		self.producto = Producto	



class Cliente():	

	"""" Clase que representa la muestra de clientes seleccionados de un banco """

	def _init_( self , nombreClienteClienteId , tipoDocumento , numeroDocumento , edad , ingresoBruto , situacionLaboral,
			    nivelServicio , rentabilidad , hip , libDis , tarCred , segundaTarCred , saldoCorVigTarCred , veh , cts , inv,
			    mil , plan , planAbon , saldoCortotPlan , pLazFij , tran , pagAut , asistenciaSeg , proteccionCreditoSeg 
			    ,saludVidaSeg , productos , Gestionable , tarjetas ):

		self.NombreCliente = NombreCliente,
		self.ClienteId = ClienteId,
		self.TipoDocumento = TipoDocumento,
		self.NumeroDocumento = NumeroDocumento,
		self.Edad = Edad,
		self.IngresoBruto = IngresoBruto,
		self.SituacionLaboral = SituacionLaboral,
		self.NivelServicio = NivelServicio,
		self.Rentabilidad = Rentabilidad,
		self.Hip = Hip,
		self.LibDis = LibDis,
		self.TarCred = TarCred,
		self.SegundaTarCred = SegundaTarCred,
		self.SaldoCorVigTarCred = SaldoCorVigTarCred,
		self.Veh = Veh,
		self.Cts = Cts,
		self.Inv = Inv,
		self.Mil = Mil,
		self.PLan = PLan,
		self.PLanAbon = PLanAbon,
		self.SaldoCortotPlan = SaldoCortotPlan,
		self.PLazFij = PLazFij,
		self.Tran = Tran,
		self.PagAut = PagAut,
		self.AsistenciaSeg = AsistenciaSeg,
		self.ProteccionCreditoSeg = ProteccionCreditoSeg,
		self.SaludVidaSeg = SaludVidaSeg,
		self.Productos = Productos,
		self.Gestionable = Gestionable
