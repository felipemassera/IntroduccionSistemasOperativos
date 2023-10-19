#!/bin/bash
#realice un script que implemente las operaciones sobre arrays: 
# Inicializar un array vacio, agregar elemento, eliminar elemento, longitudd, imprimir, inicializar con valores. 

inicializar_vacio(){
	array=()
}
inicializar_con_parametros() {
	array=()
	#local cant=0
	#for elem in $@; do
	#	array[$cant]=$elem
	#	cant=$(($cant+1))
	#done
	array=($*)
}
agregar_elemento() {
	local cant=${#array[@]}
	array[$cant]=$1
}
eliminar_elemento(){
	cant=${#array[@]}
	if [ $1 -lt $cant ]; then
		unset 'array[$1]'
		echo "elemento borrado con exito"
	else
		echo "posicion invalida"
		exit 2
	fi
}
longitud(){
	echo ${#array[@]}
}
mostrar(){
	echo ${array[@]}
}	

echo -e " 1- crear array vacio \n 2-crear array con parametros(pasarlos) \n 3-agregar elemento (de a uno) \n 4- eliminar en (pos)\n 5- tamanio array \n 6-imprimir \n 7-exit"
while true; do	
	read -p "ingrese opcion: " opcion
	case $opcion in
		"1") 	inicializar_vacio ;;
		"2") 	inicializar_con_parametros feli fran coco tomy ivo joaxo;;
		"3") 	read -p "elemento a agregar: " elem 
			agregar_elemento $elem;;
		"4") 	read -p "en que pos desea eliminar: " pos
			eliminar_elemento $pos;;	
		"5")  	longitud ;;
		"6")  	mostrar ;;
		"7")  	exit ;;
		  *) 	echo "'$opcion' no es una opcion valida" ;;
	esac
done





