#! /bin/bash

# consulta que se desea hacer

echo -e "que desea hacer?(solo numero) \n\t 1-Listar \n\t 2-DondeEstoy \n\t 3-QuienEsta"
read opcion
case $opcion in
	 "1") echo `ls` ;;
	 "2") echo $PWD;;
	 "3") echo `who`;;
esac
