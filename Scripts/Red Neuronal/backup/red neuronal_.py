import conexion_oracle as conexion
import theano
import theano.tensor as T 
from theano.ifelse import ifelse
import numpy as np


#Definimos las variables
x = T.vector('x')
w = T.vector('w')
b = T.scalar('b')

#Definimos expresion matematica

z = T.dot ( x , w ) + b

a = ifelse( T.lt( z , 0 ) , 0 , 1 )

neuron = theano.function([x,w,b],a)

clientes = conexion.obtener_clientes()

inputs = [

[ clientes[0].edad , clientes[0].productos ],
[ clientes[10].edad , clientes[10].productos ],
[ clientes[1000].edad , clientes[1000].productos ],
[ clientes[120].edad , clientes[120].productos ]

]

weights = [ 1 , 1 ]

bias = -1.5 

#Iteramos las entradas y encontramos las salidas

for i in range ( len ( inputs ) ) :

	t = inputs[i]
	out = neuron( t , weights , bias )
	print 'La salida para  x1=%d | x2=%d is %d' % (t[0],t[1],out)













