read -p "ingrese cantidad de valores: " num
mayor=0
for i in `seq 1 $num`
    do
    read -p "introduce el número: " value
    if [ $value -gt $mayor ]; then
        mayor=$value
    fi
    done
echo $mayor