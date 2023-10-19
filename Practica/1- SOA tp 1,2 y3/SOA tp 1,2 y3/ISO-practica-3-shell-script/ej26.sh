#!/bin/bash
#crear un programa que reciba parametros(al menos 1). cada parametro es la ruta a un archivo directorio o puede no existir. 
if [ $# -eq 0 ]; then
	echo "requiere al menos un parametro"
	exit 1
fi

inexistentes=0
cant=1
#itero sobre los parametros '$@', si existe y es impar determino si es directorio o archivo, sino existe: +1 inexistentes. luego imprimo resultados
for actual in $@; do
	if [ -e $actual] && [ $(($cant % 2)) -eq 1 ]; then
		if [ -d $actual ]; then 
			echo "'$actual' es un directorio"
		else
			echo "'$actual' es un archivo"
		fi
	elif [ ! -e $actual ]; then
		inexistentes=$((inexistentes+1))
	fi
done
echo "la cantidad de inexistentes es= $inexistentes"
