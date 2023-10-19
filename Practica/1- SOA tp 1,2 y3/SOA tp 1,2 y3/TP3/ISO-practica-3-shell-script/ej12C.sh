#! /bin/bash
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
