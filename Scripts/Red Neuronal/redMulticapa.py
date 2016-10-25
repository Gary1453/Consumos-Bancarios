import conexion_oracle as conn
import numpy as np
import mlp
import time 

#Algunas funciones de apoyo 

def nvl( valor1 , valor2 ):
	
	if valor1 is None :
		valor1 = valor2

	return valor1		

#Valores de Inicio

start = time.time()
numero = 0
baseInicial = conn.obtener_clientes()
inputs=[]
temp=[]

#Imprimos el log de la red neuronal

archivo = open( "redMulticapa.log" , "w" )
archivo.write( " Red Multicapa \n" )
archivo.write( " ============= \n" )
archivo.close()

#Obtenemos nuestro arreglo inicial de valores de entrada 

for cliente in baseInicial:
  
  #for consumos in cliente.consumos:

	try:
		varInp1 = int( cliente.tarjetas[0].lineaCredito )	    
		varInp2 = int( cliente.tarjetas[0].cantidad )
		varInp3 = int( cliente.tarjetas[0].programa )
		varInp4 = int( cliente.ingresoBruto ) 
		varInp5 = int( cliente.rentabilidad )
		varInp6 = int( cliente.saldoCortotPlan )
		varInp7 = int( cliente.productos )
		varTar1 = int( cliente.mil , 0 ) 

		#Generamos el log 

		archivo = open( "redMulticapa.log" , "a" )
		archivo.write( "\n")
		archivo.write( " Cliente : Cliente Numero " + str( numero) + "\n")
		archivo.write( " Linea de Credito  : " + str( nvl ( varInp1 , 0  )  ) + "\n")
		archivo.write( " Cantidad  : " + str( varInp2 ) + "\n")
		archivo.write( " Programa  : " + str( varInp3 ) + "\n")
		archivo.write( " IngresoBruto  : " + str( varInp4 ) + "\n")
		archivo.write( " Rentabilidad  : " + str( varInp5 ) + "\n")
		archivo.write( " SaldoCortotPlan  : " + str( varInp6 ) + "\n")
		archivo.write( " Productos  : " + str( varInp7 ) + "\n")
		archivo.write( " ValorObjetivo  : " + str( varTar1 ) + "\n")
		archivo.write( "\n")
		archivo.close()

	
	except IndexError:
	
		print('An error ocurred')
	
	finally:

		temp = [ 
				 nvl( varInp1 , 0 ) , nvl( varInp2 , 0 ) , nvl( varInp3 , 0 ) , varInp4 ,
				 varInp5 , varInp6 , varInp7 , varTar1  
			   ]

		inputs.append( temp )
		numero = numero + 1


#Valores de Entrada 

inputs = np.array(inputs)

#print inputs[ 0:5 , : ]  

#Cantidad de valores  de entrada 
# Se disminuye uno , debido a que se cuenta solo con un valor objetivo

cant = np.shape( inputs )[1] -1

#Normalizacion de la informacion 

inputs[ : , :cant ] = inputs[ : , :cant ] - inputs[ : , :cant ].mean(axis=0)
#print(inputs[0:5,:])
imax = np.concatenate( ( inputs.max( axis=0 ) * np.ones( ( 1 , cant + 1 ) ), inputs.min(axis=0) * np.ones((1,cant + 1 ) ) ),axis=0).max(axis=0)
#print(imax [ : cant ])
inputs[:,:cant ] = inputs[:,:cant ] / imax [ : cant ]
#print inputs[0:5,:]


#Definimos nuestros valores objetivos 
# Para esta simulacion seran 3 valores

target = np.zeros( ( np.shape ( inputs )[0] , 3 ) );
indices = np.where ( inputs[:, cant ] == 0 ) 
target[ indices , 0 ] = 1
indices = np.where ( inputs[:, cant ] == 1 )
target[ indices , 1 ] = 1
indices = np.where( inputs[ : , cant ] == 2 )
target[ indices , 2 ] = 1

# Ordenamos aleatoriamente la data 

order = range( np.shape( inputs )[0] )
np.random.shuffle( order )

inputs = inputs[ order , : ]
target = target[ order , : ]

train  = inputs[ ::2 , 0:cant ]
traint = target[ ::2 ]

valid  = inputs[ 1::4 , 0:cant ]
validt = target[ 1::4 ]

test  = inputs[ 3::4 , 0:cant ]
testt = target[ 3::4 ]


#Entrenamos la red 

net = mlp.mlp( train , traint , 5 , outtype='softmax' ) 
net.earlystopping( train , traint , valid , validt , 0.1 )
net.confmat( test , testt )

#Duracion 

duracion = round( ( time.time() - start ) / 60 , 2 )
archivo = open( "redMulticapa.log" , "a" )
archivo.write( "Duracion : " + str( duracion ) + " minutos" )
archivo.close()



