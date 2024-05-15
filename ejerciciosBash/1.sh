#! /bin/bash
for i in  `seq 1 8`
    do
    read -p " Introducir el número $i: " num1
    suma=$(expr $suma + $num1)
    done

echo "El resultado es: " $suma