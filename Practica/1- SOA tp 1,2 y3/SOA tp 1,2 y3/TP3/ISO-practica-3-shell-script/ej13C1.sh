#!/bin/bash
#ejercicio que espera 1 parametro. y este es una RUTA a un Archivo o directorio
if [ $# -ne 1 ]; then
	echo "Error no hay parametros" 
	exit 1
fi
echo "El archivos se llama= '$1'"
if [ ! -e $1 ]; then
	mkdir $1
        echo "Se creo el directorio '$1'"	
elif [ -d $1 ]; then
	echo "$1 es un DIRECTORIO"
else
	echo "$1 es un ARCHIVO"
fi
