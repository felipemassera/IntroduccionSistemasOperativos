ISO-practica-3-shell-script/ej12B.sh                                                                0000744 0001750 0001750 00000000617 14501411733 016674  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #! /bin/bash

if [ $# -eq 2 ] ; then
	echo "entre sin problemas"

	# muestro resultados
	echo "suma $(($1 + $2))"
	echo "resta $(($1 - $2))"
	echo "multi $(($1 * $2))"

	# Calculo y muestro cual es el mas grande
	echo -n " El numero mas grande es el ... " 
	if [ "$1" -gt "$2" ] ; then
        	echo "$1"
	else
        	echo "$2"
	fi
	exit
else
	echo "cantidad de parametros incorrectos"
	exit 1
fi
                                                                                                                 ISO-practica-3-shell-script/ej12C.sh                                                                0000764 0001750 0001750 00000000542 14502047452 016700  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #! /bin/bash
#programa que recibe parametros (num1 signo num2)
if [ $# -eq 3 ]; then
	case $2 in
		"+")
			echo "Suma $(( $1 + $3 ))" ;;
		"-")
			echo "Resta $(( $1 - $3 ))" ;;
		"*")
			echo "Multiplicacion $(( $1 * $3 ))" ;;
		"%")
			echo "Mod $(($1 % $3)) " ;;
	esac
else
	echo "ERROR : cantidad de parametros. "
	echo "params:  NUM1 signo NUM2"
fi
                                                                                                                                                              ISO-practica-3-shell-script/ej13A.sh                                                                0000764 0001750 0001750 00000000115 14502050101 016654  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #! /bin/bash
for (( i=1 ; i<=100 ; i++)); do
	echo "num $i y $($i**2)) 
done
                                                                                                                                                                                                                                                                                                                                                                                                                                                   ISO-practica-3-shell-script/ej13B.sh                                                                0000764 0001750 0001750 00000000342 14501420573 016674  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #! /bin/bash

# consulta que se desea hacer

echo -e "que desea hacer?(solo numero) \n\t 1-Listar \n\t 2-DondeEstoy \n\t 3-QuienEsta"
read opcion
case $opcion in
	 "1") echo `ls` ;;
	 "2") echo $PWD;;
	 "3") echo `who`;;
esac
                                                                                                                                                                                                                                                                                              ISO-practica-3-shell-script/ej13C1.sh                                                               0000764 0001750 0001750 00000000534 14501675236 016771  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash
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
                                                                                                                                                                    ISO-practica-3-shell-script/ej14.sh                                                                 0000764 0001750 0001750 00000000751 14501651716 016604  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash
#recibe 3 argumentos DIRECTORIO ; |-a| o |-b| ; txt a agregar
if [ $# -ne 3 ]; then
	echo "error de parametros $0"
	exit 1
fi

if [ ! -d $1 ]; then
  	echo "No existe el directorio"
  	exit 2
fi

if [ $2 = "-b" ]; then
  	for file in $(ls $1); do
                mv $1$file $1$3$file
	done 
elif [ $2 = "-a" ]; then
	for elem in $(ls $1) ; do
		mv $1$elem $1$elem$3
	done
else
  echo -e "error de parametro solo |-a| o |-b|"
  exit 3
fi
echo programa ejecutado con exito!
exit
                       ISO-practica-3-shell-script/ej16.sh                                                                 0000764 0001750 0001750 00000002024 14501671625 016602  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash
#Realizar un scipt que tome una extension ingresado por teclado, o salida de otra funcion y que 
#muestre en pantalla la informacion de la cantidad de archivos que cada usuario del sistema tiene con dicha extension
#la informacion debe guardarse en un archivo llamado "reporte.txt".
#
extension=$1;

#evaluamos que la cantidad de parametros sea =1
# exit 1 nos indica que se finalizo el programa con error
#>&2 indica que informamos el error al filedescriptor especial
if [ $# -ne 1 ]
then
	echo "cantidad de argumentos incadecuados" >&2
	exit 1
fi

# creo el archivo reporte.txt si existe lo reescribe sino lo crea vacio
echo -n > $HOME/reporte.txt 

# busco en la carpeta passwd las columnas USUARIO(1) y HOMEuser(6) para ello se separa 
for linea in $(cat /etc/passwd | cut -d: -f 1,6); do
	home=$(echo $linea | cut -d: -f2)
	user=$(echo $linea | cut -d: -f1)
	
	# no contamos usuarios que no tengan directorio personal
	if [ -d $home ]; then
		echo $user $(find $home -name "*.$extension" | wc -l) >> $HOME/reporte.txt
	fi
done
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ISO-practica-3-shell-script/ej17.sh                                                                 0000764 0001750 0001750 00000000570 14501704062 016577  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash

#escribir un script q al ejecutarse imprima en pantalla los nombres de los archivos que se encuentran en el directorio actual, intercambiando minusculas x mayusculas, ademas de eliminar la letrra "A" o "a" q contengan.

for elem in $(ls $PWD); do
	nombre=$(echo $elem | tr -d 'a,A' | tr '[:lower:][:upper:]' '[:upper:][:lower:]')
	mv $PWD/$elem $PWD/$nombre
done
                                                                                                                                        ISO-practica-3-shell-script/ej18.sh                                                                 0000764 0001750 0001750 00000001173 14502037535 016605  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash

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
                                                                                                                                                                                                                                                                                                                                                                                                     ISO-practica-3-shell-script/ej19.sh                                                                 0000764 0001750 0001750 00000003636 14502051470 016606  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash

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
	

                                                                                                  ISO-practica-3-shell-script/ej20bis.sh                                                              0000764 0001750 0001750 00000001647 14504054074 017301  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash
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
                                                                                         ISO-practica-3-shell-script/ej20.sh                                                                 0000764 0001750 0001750 00000002467 14502077223 016603  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash
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
                                                                                                                                                                                                         ISO-practica-3-shell-script/ej22.sh                                                                 0000764 0001750 0001750 00000000550 14502111407 016565  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash
#dado un array cargado de numeros se deben multiplicar todos ellos y mostrar un resultado

if [ $# -ne 0 ]; then
	echo " Esta funcion no necesita caracteres"
	exit 1
fi

num=(10 3 5 7 9 3 5 4)
tamanio=$((${#num[@]} -1))
total=1
while [ $tamanio -ge 0 ]; do
	total=$(($total * ${num[$tamanio]}))
	tamanio=$((tamanio - 1))
done

echo "total= $total"
                                                                                                                                                        ISO-practica-3-shell-script/ej23.sh                                                                 0000764 0001750 0001750 00000000455 14502114155 016575  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash
#inicializo variables
num=(10 3 5 7 9 3 5 4)
total=0

# recorro array, imprimo num par y acumulo en total la sumatoria de num impares.
for elem in ${num[@]}; do
	if [ $(($elem % 2)) -eq 0 ]; then
		echo $elem
	else
		total=$(($total + $elem))
	fi
done

#imprimo total
echo "TOTAL= $total"
                                                                                                                                                                                                                   ISO-practica-3-shell-script/ej24.sh                                                                 0000764 0001750 0001750 00000000551 14502117555 016602  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash

# chequeo cantidad de parametros
if [ $# -ne 0 ]; then
	echo "Este programa no usa parametros"
	exit 1
fi

# instancio variables
num1=(1 80 65 35 2)
num2=(5 98 3 41 8)
tamanio=${#num1[@]}

for (( i=0 ; i<$tamanio ; i++)); do
	tot=$((${num1[$i]} + ${num2[$i]}))
	echo "la suma de los elemnetos de la posicion $i de los vectores es $tot"
done 
exit

                                                                                                                                                       ISO-practica-3-shell-script/ej25.sh                                                                 0000764 0001750 0001750 00000001532 14502126564 016603  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash
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
                                                                                                                                                                      ISO-practica-3-shell-script/ej26.sh                                                                 0000764 0001750 0001750 00000001261 14502324514 016576  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash
#crear un programa que reciba parametros(al menos 1). cada parametro es la ruta a un archivo directorio o puede no existir. 
if [ $# -eq 0 ]; then
	echo "requiere al menos un parametro"
	exit 1
fi

inexistentes=0
cant=1
#itero sobre los parametros '$@', si existe y es impar determino si es directorio o archivo, sino existe: +1 inexistentes. luego imprimo resultados
for actual in $@; do
	if [ -e $actual] && [ $(($cant % 2)) -eq 1 ]; then
		if [ -d $actual ]; then 
			echo "'$actual' es un directorio"
		else
			echo "'$actual' es un archivo"
		fi
	elif [ ! -e $actual ]; then
		inexistentes=$((inexistentes+1))
	fi
done
echo "la cantidad de inexistentes es= $inexistentes"
                                                                                                                                                                                                                                                                                                                                               ISO-practica-3-shell-script/ej27.sh                                                                 0000764 0001750 0001750 00000002404 14502571605 016604  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash
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





                                                                                                                                                                                                                                                            ISO-practica-3-shell-script/ej28.sh                                                                 0000764 0001750 0001750 00000002046 14502573026 016606  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash 

#relice un script que reciba por parametro el nombre de un directorio. debiendo validar que este exista , de no existir que de error 4. si existe debera contar por separado la cantidad de elementos que este contiene para los cuales el usuario que esta ejecuutando el script tenga permisos de lectura y escritura. e informar dichos valores por pantalla. en caso q en la carpeta existan subdirectorios, estos no deben ser procesados ni contabilizados. 

#valido parametros
if [ $# -ne 1 ]; then
	echo "error de parametros"
	exit 1
fi

directorio=$1

#evaluo que exista dicho elemento y sea un directorio.
if ! [ -e $directorio -a -d $directorio ]; then 
	echo "No existe un directorio con ese nombre"
	exit 4
else
# para cada archivo contenido en el directorio, verifico que sea un archivo y que tenga permisos de lectura(-r) y escritura (-w).
	cant=0
	for elem in $(ls $directorio); do
		echo "elemento: $elem"
		if [ -f $elem ] && [ -r $elem -a -w $elem ]; then
			cant=$(($cant+1))
		fi
	done
	echo "cantidad de elementos con permisos = $cant"
fi
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          ISO-practica-3-shell-script/ej29.sh                                                                 0000764 0001750 0001750 00000003372 14502601263 016605  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash
#evaluo parametros
if [ $# -ne 0 ];then
	echo "no se necesitan parametros"
	exit 1
fi

#realizar un script que agregue a un arreglo todos los archivos de la carpeta /home cuya extension sea .doc . DEVUELVE el nombre de los arhivos terminados en '.doc'

# array2=($(find $HOME -name "*.doc"))
array=($(ls $HOME | grep ".doc$"))
echo para coco ${array[@]}

# IMPLEMENTE LAS FUNCIONES
# verArchivo muestra el contenido de un archivo, cuyo nombre fue recibido x parametro
verArchivo(){
	read -p "que archivo deseas ver? " nombre
	for elem in ${array[@]}; do 
		if [ $nombre = $elem ]; then
			cat $HOME/$elem
			return
		fi
	done
	echo "Archivo no encontrado"
	return 5
}
#cantidadARchivos : imprime la cant de archivos del /home
cantArchivos(){
	echo "Cantidad de archivos en /home: ${#array[@]}"
}

#borrarArchivo: consulta si quiere borrar un archivo logicamente, si pone que si borra el archivo del array, si pone que NO, lo borra del array y tb del filesystem. antes se debe validar que el archivo exista en el vector .

borrarArchivo(){
	read -p "ingrese el nombre del archivo que desea eliminar: " nombre
	read -p "Desea eliminarlo logicamentes? s/n: " sino
	cant_elem=${#array[@]}
	for (( i=0 ; $i < $cant_elem ; i++ )); do
		echo entro a for
		if [ $nombre = ${array[$i]} ]; then  
			echo encontre
			unset array[$i]
			if [ $sino = "n" ]; then
				echo "voy a borrar"
				rm $HOME/$elem
				#rm "$HOME/$elem"
				#echo `rm $HOME/$elem`
				echo "borre"
			fi
			return
		fi
	done
	echo "Archivo no encontrado"
	return 10
}

echo -e "${array[*]} \n \n"

while true; do
	echo "1- ver Archivo"
	echo "2- Cantidad de archivos"
	echo "3- borrarArchivo"
	read -p " opcion: " num

	case $num in
		"1") verArchivo ;;
		"2") cantArchivos ;;
		"3") borrarArchivo ;;
	esac
done
                                                                                                                                                                                                                                                                      ISO-practica-3-shell-script/ej30.sh                                                                 0000764 0001750 0001750 00000001062 14502602520 016564  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash
#valido parametros
if [ $# -ne 0 ]; then
	echo "error de parametros, no se necesitan"
	exit 1
fi

destino="$HOME/bin"
origen=$PWD
echo $PWD

# si no existe el directorio, lo creo
if ! [ -d $destino ]; then
	mkdir $destino
	echo "directorio creado"
fi

cont=0
for elem in $origen/*; do
	echo "pal coco $elem"
	if [ -f $elem -a -x $elem ]; then  
	#-f:que sea archivo -a: AND -x:q sea ejecutable
		#mv $elem "$destino/$(basename $elem)"
		echo "muevo el elemento $(basename $elem)"
		let cont++
		#cont=$((cont+1))
	fi
done
echo "movi $cont elementos"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ISO-practica-3-shell-script/mostrar.sh                                                              0000764 0001750 0001750 00000001073 14501331277 017523  0                                                                                                    ustar   ubuntu                          ubuntu                                                                                                                                                                                                                 #!/bin/bash
#comentarios acerca de lo que hace el script
#simepre comento mis scripts, ya que podes olvidarte lo que quisiste hacer.

echo "introduzca tu nombre y apellido"
read nombre apellido
echo "fecha y hora actual"
date
echo "su apellido t nombre es:"
echo "$apellido $nombre"
echo "Su usuario es : `whoami`"
echo -e "su directorio actual es :"
echo $HOME
echo -e "en este directorio estan los archivos: \n `ls`"
echo -e "el espacio en disco libre es:\n `df` "
echo "ingrese su dia mes anio de nacimiento"
read dia mes anio
echo " usted nacio el : $dia/$mes/$anio"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     