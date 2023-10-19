#!/bin/bash
# chequeo cantidad de parametros
if [ $# -ne 0 ];then
	echo "este programa no necesita parametros"
	exit 1
fi

# creo array vacio.
pila=()
#pusheo un elemento al array, el parametro ingresa como $1.
push() { 
	tamanio=${#pila[@]}
	pila[$tamanio]=$1
}
pop() {
	if [ ${#pila[@]} -gt 0 ]; then
		elemento=${pila[-1]}  		#me guardo el elemento en la variable
		unset 'pila[${#pila[@]}-1]'  	#le quito el ultimo elemento a la pila
		echo "pop elemento=  $elemento" #muestro el elemento
	else
		echo " La pila esta vacia. "
	fi
}
length(){
	echo "El tamano de la pila es: ${#pila[@]}"
}
printy(){
	echo "OBJETOS DE LA PILA"
	cant_elementos=${#pila[@]}
	echo "cantidad de elementos $cant_elementos"
	elem=$((cant_elementos-1))

	while [ $elem -ge 0 ]; do
		echo "${pila[$elem]}"
		elem=$((elem - 1))
	done
}

while true; do 
	echo "MENU PILA"
	echo "1- PUSH ( Agrega un elemento a la pila )"
	echo "2- POP ( Quita un elemento de la pila )"
	echo "3- LENGTH ( devuelve la cantidad de elementos contenidos)"
	echo "4- PRINT ( muestra los elementos de la cola )"
	echo "5- EXIT"
	read -p "Que desea hacer? " opcion

	case $opcion in 
		"1") 	read -p "Ingrese el elemento: " elemento
			push $elemento ;;
		"2") 	pop;;
		"3") 	length;;
		"4") 	printy;;
		"5") 	exit ;;
		*) 	echo "opcion no valida, vuelva a intentarlo" ;;
	esac
done
