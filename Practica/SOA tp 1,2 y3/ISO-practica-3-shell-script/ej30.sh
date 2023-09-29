#!/bin/bash
#valido parametros
if [ $# -ne 0 ]; then
	echo "error de parametros, no se necesitan"
	exit 1
fi

destino="$HOME/bin"
origen=$PWD
echo $PWD

# si no existe el directorio, lo creo
if ! [ -d $destino ]; then
	mkdir $destino
	echo "directorio creado"
fi

cont=0
for elem in $origen/*; do
	echo "pal coco $elem"
	if [ -f $elem -a -x $elem ]; then  
	#-f:que sea archivo -a: AND -x:q sea ejecutable
		#mv $elem "$destino/$(basename $elem)"
		echo "muevo el elemento $(basename $elem)"
		let cont++
		#cont=$((cont+1))
	fi
done
echo "movi $cont elementos"
