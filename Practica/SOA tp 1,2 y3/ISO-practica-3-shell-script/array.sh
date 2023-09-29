#agregar o modificar elemento 
array["pos"]+=" elem"

#agregar elementos
array=()
array+=("elemento")
array=(${array[@]} "elemento") 
array[${#array[@]}]="elemento"

#imprime
for elem in ${array[@]};do
	echo $elem
done

echo ${array[@]}

#cant elem
echo ${#array[@]}

#eliminar por indice
unset array["pos"]
array=(${array[@]})




