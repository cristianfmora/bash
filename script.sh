#! /bin/bash

# $(Ejecutar-comandos)
# $1: obtener el primer valor de la consola
# read line: guarda las lineas del archivo txt en la variable line
# < lista.txt // leer el archivo
# <<COMMENT COMMENT // comentarios en varias lineas

# condicional
<<COMMENT
if [ $1 == https://blog.com ]; then
    echo $1: "status -> 200 "
else
    response=$(curl --write-out "%{http_code}\n" --silent --output /dev/null "$1")
    echo $1: "status -> "$response
fi
COMMENT
# bucle
while read line; do    
    response=$(curl --write-out "%{http_code}\n" --silent --output /dev/null "$line")
    echo $line: "status -> "$response
done < lista.txt