#! /bin/bash

<<COMMENT
 ${@} recibir todos los argumentos
COMMENT

# echo "Argumentos: " $1 $2 $3

# funciones
funcion(){
	echo $1
}
echo "mensaje fuera de la funcion"
# llamar a la funcion
funcion

# bucle
for USUARIO in ${@}; do
    echo funcion $USUARIO
done
