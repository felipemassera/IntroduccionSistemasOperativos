#!/bin/bash
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
