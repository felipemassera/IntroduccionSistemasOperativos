#!/bin/bash
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
