#! /bin/bash
read -p "¿Cuantos numeros va a sumar?: " secuencia
for i in `seq 1 $secuencia`
    do
        read -p "Introduce un número $1: " num1
        suma=$(expr $suma + $num1)
    done
echo "El resultado es: "$suma