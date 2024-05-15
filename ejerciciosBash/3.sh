#! /bin/bash

for i in `seq 1 30`
    do
        num=$(expr $i % 3)
        if [ $num -eq 0 ]; then
            echo "$i es multiplo de 3"
        fi
    done