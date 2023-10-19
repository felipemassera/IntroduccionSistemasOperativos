#!/bin/bash

if [ $# -eq 0 ]; then
	echo ¨se espera almenos 1 parametro¨
	exit 1
fi

noExiste=0

for elem in $@; do
	if [ -f $elem ];then
		tar -cvf comprimido.tar $elem
	elif [ -d $elem ];then
		if [ -r $elem  ]
			tar -cvfz comprimido_empaquetado.tarz $elem
		elif [ -w $elem ];then
			rm -r $elem
		fi
	else
		let noExiste++
	fi
done
echo ¨cantidad de elementos inexistentes ´$noExiste´¨
