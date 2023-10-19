#!/bin/bash

if [ $# -lt 1 ]; then
	echo "parametros invalidos, necesita al menos 1"
	exit 1
fi

noExiste=0

cont=1

for elem in $@; do
	if [ -e $elem ]; then
		if [ $(($cont % 2)) -eq 1 ];then
			if [ -f $elem ];then
				echo "El parametro $elem es archivo"
			else
				echo "El parametro $elem es directorio"
		
			fi
		fi
	else
		noExiste=$(( $noExiste + 1 ))
	fi
	
	cont=$(( $cont + 1 ))
done
echo "la candidad de rutas inexistentes es: $noExiste"
