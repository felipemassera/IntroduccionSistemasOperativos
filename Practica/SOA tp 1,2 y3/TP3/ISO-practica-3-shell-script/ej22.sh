#!/bin/bash
#dado un array cargado de numeros se deben multiplicar todos ellos y mostrar un resultado

if [ $# -ne 0 ]; then
	echo " Esta funcion no necesita caracteres"
	exit 1
fi

num=(10 3 5 7 9 3 5 4)
tamanio=$((${#num[@]} -1))
total=1
while [ $tamanio -ge 0 ]; do
	total=$(($total * ${num[$tamanio]}))
	tamanio=$((tamanio - 1))
done

echo "total= $total"
