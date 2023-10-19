#!/bin/bash

archivos=($(ls /var/log | grep "access"))

cantidad(){
	echo ${#archivos[@]}
}
listar(){
	echo ${archivos[@]}
}
eliminar(){
	if [ $# -ne 2 ]; then
		echo "se esperan dos parametros"
		return 1
	fi

	if [ $1 -lt ${#archivos[@]} ]; then
		if [ $2 == "fisico" ];then
                	rm "/var/log/$archivos[$1]"
 		fi
		unset $archivos[$1]
		archivos=(${archivos[@]})
	fi	 
}
