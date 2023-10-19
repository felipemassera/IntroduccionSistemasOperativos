#!/bin/bash 

array=()

insert_elem(){
	if [ $# -ne 1 ];then
		echo "error en parametro"
		return 1
	fi

	array+=($1)
	echo "Agregado al array"
}
rellenar(){
 	if [ $# -ne 1 ];then
                echo "error en parametro"
                return 1
        fi
	read -p "ingrese la cadena que desea agregar" cadena
	for ((i =0 ; $i < $1 ; i++)) do
		insert_elem $cadena
	done
}
select_elem(){
	if [ $# -ne 1 ];then
                echo "error en parametro"
                exit 1
        fi
	if [ $1 == "*" ];then
		echo ${array[@]}
	else
		for ((i=0 ; $i < ${#array[@]}; i++));do
			if [ ${array[$i]} == $1 ];then
				echo "el elemento seleccionado es ${array[i]}"
				return
			fi
		done
		echo "elemento no encontrado"
	fi
}
delete_elem(){
        if [ $# -ne 1 ];then
                echo "error en parametro"
                exit 1
        fi 
        if [ $1 == "*" ];then
		array=()
		echo "elementos eliminados" 
        else            
                for ((i=0 ; $i < ${#array[@]}; i++));do
                        if [ ${array[$i]} == $1 ];then
                                unset array[i]
                                array=(${array[@]})
				echo "el elemento $1 fue eliminado"
                                return
                        fi      
                done    
                echo "elemento no encontrado"
        fi      
}   

insert_elem felipe
rellenar 5
select_elem felipe
delete_elem felipe

echo "los elementos del array son"
printf "%s\n" "${array[@]}"
