#! /bin/bash

if [ $# -ne 1 ];then
	echo "error de parametros. se necesita uno"
	exit 2
fi

usuario=$(cat /etc/passwd | grep -c $1)

if [ $usuario -eq 0 ];then 
	echo "no existe un usuario con ese nombre"
	exit 1
else
	while true ; do
		if [ $(who |grep $1 | wc -l) -eq 1 ]; then 
			echo "$1 conectado al sistema"
			exit
		fi
		echo "espero y vuelvo a chequear "
		sleep 30
	done
fi
