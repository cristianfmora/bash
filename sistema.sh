#! /bin/bash

# crear archvo
file=sistema.txt
touch $file

# información del PC
# información de la distribución
dist=$(cat /etc/*release | grep "VERSION=" | awk -F '=' '{print $2}' | sed 's/"//g')

infoPC=(
"IP:"$(hostname -i | awk '{print $1}') 
"MAC:"$(hostname -i | awk '{print $2}')
"host:"$(hostname)
"user:"$(echo $USER)
"up:"$(uptime | awk -F ' ' '{print $3}' | sed 's/,//')
)

# add info pc
echo -e "Información del pc\n" >> $file
echo "distribucion:$dist" >> $file

for info in ${infoPC[@]}
do
    echo $info >> $file
done

# información componentes internos

echo -e "\nComponentes internos\n" >> $file

CPU=(
"CPU:"$(lscpu | grep "Model name" | awk -F ':' '{print $2}' |  tr -d '[[:space:]]')
)

echo $CPU >> $file 

# información memoria RAM
RAM=(
"total:"$(free -h | grep Mem | awk -F ' ' '{print $2}')
"available:"$(free -h | grep Mem | awk -F ' ' '{print $7}')
)

SWAP=(
"total:"$(free -h | grep Swap | awk -F ' ' '{print $2}')
"available:"$(free -h | grep Swap | awk -F ' ' '{print $4}')
)

echo -e "\nRAM" >> $file

for ram in ${RAM[@]}
do
    echo $ram >> $file
done

echo -e "\nSwap" >> $file

for swap in ${SWAP[@]}
do
    echo $swap >> $file
done

# información de la partición dev

echo -e "\nParticiones" >> $file

disco=$(df -h | grep ^/dev | awk '{print $1}')

declare -A infoDisk
infoDisk=(['2']='Size' ['5']='Use' ['6']='Mounted')
columDisk=('2' '5' '6')

for disk in ${disco[@]}
do
    # mostrar las particiones dev
    echo -e "\n$disk" >> $file
    for column in ${columDisk[@]}
    do
        patron="\$${column}"
        echo "${infoDisk[$column]}:$(df -h | grep $disk | awk -F ' ' "{print $patron}")" >> $file
    done
done

