#pido numeros
echo "ingrese un numero"
read num1 
read -p "ingrese otro numero: " num2

#realizo calculos
echo "suma2 $(expr $num1 + $num1)"
multi=$((num1 * num2))
suma=$((num1 + num2))
resta=$((num1 - num2))

# muestro resultados
echo "suma $suma"
echo "resta $resta"
echo "multi $multi"

# Calculo y muestro cual es el mas grande
echo -n " El numero mas grande es el ... " 
if [ "$num1" -gt "$num2" ] ; then
	echo "$num1"
else
	echo "$num2"
fi
