import conexion_oracle as conn
import numpy as np
import mlp
import time 


#Valores de Inicio

start = time.time()
baseInicial = conn.obtener_clientes()
inputs=[]
temp=[]

#Obtenemos nuestro arreglo inicial de valores de entrada 

for cliente in baseInicial:

	temp = [ cliente.edad , int( cliente.ingresoBruto ) , int( cliente.mil ) ]
	inputs.append( temp )


#Valores de Entrada 

inputs=np.array(inputs)
print inputs[ 0:5 , : ]  

#Cantidad de velores  de entrada 

cant = np.ndim( inputs )

#Normalizacion de la informacion 

inputs[ : , :cant ] = inputs[ : , :cant ] - inputs[ : , :cant ].mean(axis=0)
imax = np.concatenate( ( inputs.max( axis=0 ) * np.ones( ( 1 , cant + 1 ) ), inputs.min(axis=0) * np.ones((1,cant + 1 ) ) ),axis=0).max(axis=0)
inputs[:,:cant ] = inputs[:,:cant ] / imax [ : cant ]
print inputs[0:5,:]


#Definimos nuestros valores objetivos 
# Para esta simulacion seran solo 2 ( 1 o 0 )

target = np.zeros( ( np.shape ( inputs )[0] , 2 ) );
indices = np.where ( inputs[ : , cant ] == 0 ) 
target[ indices , 0 ] = 1
indices = np.where( inputs[ : , cant ] == 1)
target[ indices , 1 ] = 1

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

net = mlp.mlp(train,traint,5,outtype='softmax')
net.earlystopping(train,traint,valid,validt,0.1)
net.confmat(test,testt)

#Duracion 

duracion = round( ( time.time() - start) / 60 , 2 )
print( "Duracion : " + str(duracion) + " minutos")