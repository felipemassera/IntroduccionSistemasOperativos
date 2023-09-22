#!/bin/bash

#crear un script q reciba por parametro el nombre de un usuario, verificar cada 10 seg si el usuario se conecta, en caso que lo haga mostrar un mensaje "USUARIO xxx logueado en el sistema " y salir.

if [ $# -ne 1 ]; then
	echo "Parametros equivocados" >&2
	exit 1
fi

# evaluo el caso en el que el usuario se conecte  grep -w busca estrictamente la palaba $1 si esta devuelve un string no vacio y eso no
while true; do
	#nombre=$(who -q | grep -w $1 | cut -d" " -f1 | wc -l )
	#if [ $nombre -gt 0 ]; then
	if who | grep -w -q $1; then
		echo "USUARIO $1 se conecto al sistema"
		exit
	fi
	sleep 10
	echo "espero 10"
done
