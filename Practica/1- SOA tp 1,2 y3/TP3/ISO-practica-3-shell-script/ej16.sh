#!/bin/bash
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
