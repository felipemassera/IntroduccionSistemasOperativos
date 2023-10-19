#!/bin/bash 

#relice un script que reciba por parametro el nombre de un directorio. debiendo validar que este exista , de no existir que de error 4. si existe debera contar por separado la cantidad de elementos que este contiene para los cuales el usuario que esta ejecuutando el script tenga permisos de lectura y escritura. e informar dichos valores por pantalla. en caso q en la carpeta existan subdirectorios, estos no deben ser procesados ni contabilizados. 

#valido parametros
if [ $# -ne 1 ]; then
	echo "error de parametros"
	exit 1
fi

directorio=$1

#evaluo que exista dicho elemento y sea un directorio.
if ! [ -e $directorio -a -d $directorio ]; then 
	echo "No existe un directorio con ese nombre"
	exit 4
else
# para cada archivo contenido en el directorio, verifico que sea un archivo y que tenga permisos de lectura(-r) y escritura (-w).
	cant=0
	for elem in $(ls $directorio); do
		echo "elemento: $elem"
		if [ -f $elem ] && [ -r $elem -a -w $elem ]; then
			cant=$(($cant+1))
		fi
	done
	echo "cantidad de elementos con permisos = $cant"
fi
