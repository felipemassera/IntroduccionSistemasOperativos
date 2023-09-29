#!/bin/bash
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
