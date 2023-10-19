#! /bin/bash

usuarios=($(cat /etc/passwd|cut -d: -f1))

usuarios(){
 	echo ${usuarios[@]}
}

existe(){
	if [ $# -ne 1 ];then
		echo error de parametros
		return 1
	fi

	# existe=$(echo "${usuarios[*]}" | grep -w $1 | wc -l)


	for elem in ${usuarios[@]};do
		if [ $elem == $1 ];then
			echo "existe el usuario"
			return
		fi
	done
	return 1
}
eliminar_usuario(){
	if [ $# -ne 1 ];then
                echo error de parametros
             	return 1
        fi      

	for ((i=0 ; $i< ${#usuarios[@]}; i++));do
		if [ ${usuarios[i]} == $1 ]; then
			unset usuarios[$i]
			usuarios=(${usuarios[*]})
			return
		fi
	done
	return 2
}
cantidad(){
	echo ${#usuarios[@]}
}
usuarios_con_patron(){
        if [ $# -ne 1 ];then
                echo error de parametros
                return 1
        fi      
	echo -e "Los elementos que coinciden con el patrón son:\n $(printf "%s\n" "${usuarios[@]}" | grep $1)"
}

select opt in cantidad eliminar existe con_patron usuarios fin; do
	case $opt in
		"cantidad") 	cantidad ;;
		"eliminar") 	read -p "ingrese el nombre del usuario a eliminar: " elim
				eliminar_usuario $elim;;
		"existe") 	read -p "que usuario desea chequear? " user
				existe $user;;
		"usuarios") 	usuarios ;;
		"con_patron")	read -p "ingrese el patron: " patron
				usuarios_con_patron $patron;;
			"fin")  exit ;;
			*)	echo "opcion incorrecta"
	esac
done

