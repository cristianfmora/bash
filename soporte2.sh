#! /bin/bash
<<COMMENT
COMMENT

salida=$(speedtest-cli --simple)
download=$(echo "$salida" | grep -oP 'Download: \K[0-9.]+')
upload=$(echo "$salida" | grep -oP 'Upload: \K[0-9.]+')
echo $download
# se obtiene solamente el entero
down="${download%.*}"
up="${upload%.*}"

# validar si la conexión a el internet es optima
if (( $down <= 20 ))
	then
	if (( $up <=20 ))
	then
		internet="Presenta fallo"
	fi
else 
	internet="ok"
fi
echo $internet

#speed=$(ethtool enp0s3 | awk '{print $1 $2}') 

#echo $speed | grep "Speed:"

