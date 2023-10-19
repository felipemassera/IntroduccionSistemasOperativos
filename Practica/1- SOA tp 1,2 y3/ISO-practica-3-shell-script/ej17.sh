#!/bin/bash

#escribir un script q al ejecutarse imprima en pantalla los nombres de los archivos que se encuentran en el directorio actual, intercambiando minusculas x mayusculas, ademas de eliminar la letrra "A" o "a" q contengan.

for elem in $(ls $PWD); do
	nombre=$(echo $elem | tr -d 'a,A' | tr '[:lower:][:upper:]' '[:upper:][:lower:]')
	mv $PWD/$elem $PWD/$nombre
done
