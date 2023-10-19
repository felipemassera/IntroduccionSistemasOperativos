#!/bin/bash
# |-b n| indica la pos del arreglo que se quiere acceder, en caso q no exista da error
# |-l| devuelve la cant de elementos del arreglo
# |-i| imprime los elementos del vector
echo $#
echo $1
if [ $# -lt 1 ]; then
	echo "parametros erroneos : |-b n| |-l| |-i| (n=a una pos del arreglo)"
	exit 1
fi
#inicializo var
users=()
tamanio=0
# getent nos da datos del sistema en este caso del grupo users. a partir de la columna 4 devuelve los usuarios del sistema que pertenecen al grupo (puse limite 1000 usuarios)
for user in $(getent group users | cut -d: -f 3-1000 | tr ":" " "); do
	users[$tamanio]=$user
	tamanio=$(($tamanio + 1))
done

case $1 in
	"-b")	if [ $2 -lt $tamanio ]; then
			echo ${users[$2]}
		else
			echo "posicion erronea"
			exit 2
		fi ;;
	
	"-l")	echo $tamanio;;
	"-i")	for elem in ${users[@]}; do 
			echo $elem	
		done ;;
esac
