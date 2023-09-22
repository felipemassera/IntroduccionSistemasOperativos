#!/bin/bash

# chequeo cantidad de parametros
if [ $# -ne 0 ]; then
	echo "Este programa no usa parametros"
	exit 1
fi

# instancio variables
num1=(1 80 65 35 2)
num2=(5 98 3 41 8)
tamanio=${#num1[@]}

for (( i=0 ; i<$tamanio ; i++)); do
	tot=$((${num1[$i]} + ${num2[$i]}))
	echo "la suma de los elemnetos de la posicion $i de los vectores es $tot"
done 
exit

