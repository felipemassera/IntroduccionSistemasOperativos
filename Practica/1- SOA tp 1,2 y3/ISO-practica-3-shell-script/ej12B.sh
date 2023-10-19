#! /bin/bash

if [ $# -eq 2 ] ; then
	echo "entre sin problemas"

	# muestro resultados
	echo "suma $(($1 + $2))"
	echo "resta $(($1 - $2))"
	echo "multi $(($1 * $2))"

	# Calculo y muestro cual es el mas grande
	echo -n " El numero mas grande es el ... " 
	if [ "$1" -gt "$2" ] ; then
        	echo "$1"
	else
        	echo "$2"
	fi
	exit
else
	echo "cantidad de parametros incorrectos"
	exit 1
fi
