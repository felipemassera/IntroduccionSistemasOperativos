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
	pila+=($1)
}
pop() {
	if [ ${#pila[@]} -gt 0 ]; then
		elemento=${pila[-1]}  	#me guardo el elemento en la variable
		unset pila[-1]  	#le quito el ultimo elemento a la pila
		echo "pop elemento=$elemento" #muestro el elemento
	else
		echo " La pila esta vacia. "
	fi
}
length(){
	echo "El tamano de la pila es: ${#pila[@]}"
}
printy(){
	echo "OBJETOS DE LA PILA"
	echo ${pila[@]}
}

while true; do 
	echo "MENU"
	select opcion in push pop length print exit; do
		case $opcion in 
			"push") 	read -p "Ingrese el elemento: " elemento
					push $elemento ;;
			"pop") 		pop;;
			"length") 	length;;
			"print") 	printy;;
			"exit") 	exit ;;
			*) 	echo "opcion no valida, vuelva a intentarlo" ;;
		esac
	done
done
