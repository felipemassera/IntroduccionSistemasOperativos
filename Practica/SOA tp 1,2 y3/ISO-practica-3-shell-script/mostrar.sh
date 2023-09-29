#!/bin/bash
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
