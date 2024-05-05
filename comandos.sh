#! /bin/bash
#<<COMMENT
while read line; do
    $line  1>> salida.txt
    # espera que se ejecute el comando
    if [ -n "$line" ]; then
        echo "Ejecución ok"
    fi
    wait
done < comando.txt
#COMMENT



