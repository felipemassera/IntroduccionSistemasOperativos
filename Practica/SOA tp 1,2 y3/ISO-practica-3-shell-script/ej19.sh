#!/bin/bash

#escribir un menu de comandos amigable con el usuario. llamado menu, el cual al ser invocado, mostrata un menu con la seleccion para cada uno de los scripts creados en esta practica,. las instrucciones de comom proceder sdeben mostrarse junto con el menu. El menu debera iniciarse y permanecer activo hasta que se seleccione salir. (muestra un ejemplo de menu)
while true; do
	echo -e "MENU DE COMANDOS \n"
	echo -e "*** Evaluacion de expresiones *** \n\t 1- ej12A \n\t 2- ej12B \n\t 3- ej12C"
	echo -e "*** Uso de estructuras de control ***"
	echo -e "\t 4- ej13A \n\t 5- ej13B \n\t 6- ej13C (consultar)"
	echo -e "\t 7- ej14 (Renombrando Archivos)\n\t 8- ej16 (reporte cant de archivos x extension x usuario) \n\t 9- ej17 (intercambio mayuscula y min renombrando archivos)"
	echo -e "\t 10- ej18 (verificacion de usuario conectado)"
	echo -e "\t 11- EXIT"

	read -p "Que desea hacer?  " opcion
	case $opcion in 
		"1") 	./ej12A.sh;;
		"2")  	read -p "ingrese un numero " num1
			read -p "ingrese otro numero " num2
			./ej12B.sh $num1 $num2 ;;
		"3") 	read -p "ingrese un numero " num1
			read -p "operacion +-*% " signo 
                        read -p "ingrese otro numero " num2
			./ej12C.sh $num1 $signo $num2 ;;
		"4")  	./ej13A.sh;;
		"5")  	./ej13B.sh;;
		"6")  	read -p "ingrese el nombre de un archivo/directorio " nombre
			./ej13C1.sh $nombre;;
		"7")  	read -p "ingrese un DIRECTORIO " dir
                        read -p "ingrese -a despues -b antes " param
                        read -p "ingrese la cadena a insertar en el nombre " txt
			./ej14.sh $dir $param $txt;;
                "8")  	read -p "Ingrese la extension que desea buscar sin punto ej: txt sh " ext
			./ej16.sh $ext;;
		"9")  	./ej17.sh;;
		"10")  	read -p "ingrese el nombre de un usuario para verificar si esta conectdo " user
			./ej18.sh $user;;
		"11") 	echo "saliste"
			exit ;;
		*) echo "Opcion equivocada, intentelo nuevamente"
	esac
done
	

