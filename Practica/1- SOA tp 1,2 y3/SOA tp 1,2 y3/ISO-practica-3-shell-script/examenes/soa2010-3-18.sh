#!/bin/bash

if [ $# -ne 0 ]; then
	echo "no se esperan parametros"
	exit 1
fi

inicializar(){
	array=()
	echo "array creado"
}

agregar_elem(){
	if [ $# -ne 1 ];then
		echo "falta el parametro"
		return 2
	fi
	array+=($1)
	echo "elemento agregado"
}
eliminar_elem(){
 	if [ $# -ne 1 ];then
                echo "falta el parametro"
                return 3
	fi
	if [ $1 -lt ${#array[@]} ]; then
		unset array[$1]
		echo "elemento eliminado"
	else
		echo "posicion invalida"
		return 4
	fi		
}
longitud(){
	echo "Cantidad de elementos del array: ${#array[@]}"
}
imprimir(){
	echo "Elementos: "
	echo ${array[@]}
}
inicializarConValores(){
	if [ $# -ne 2 ];then
		echo "error de parametros"
		return 5
	fi
	array=()
	for ((i = 0 ; $i < $1 ; i++)); do
		array[i]=$2
	done
	echo "array creado con exito"
}

select opcion in inicializar agregar_elem eliminar_elem longitud imprimir inicializarConValores exit; do
	case $opcion in
			"inicializar") 	inicializar;;
			"agregar_elem") read -p "que elemento desea agregar: " elem
					agregar_elem $elem;;
			"eliminar_elem")read -p "ingrese la posicion del elemento a eliminar" pos
					eliminar_elem $pos;;
			"longitud")	longitud ;;
			"imprimir")	imprimir ;;
			"inicializarConValores") read -p "ingrese el tamanio del array" tamanio
					read -p "ingrese el elemento con el que llenara el array " elem_full
					inicializarConValores $tamanio $elem_full;;
			"exit") exit ;;
			*) echo "opcion incorrecta"
	esac
done
