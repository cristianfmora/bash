#! /bin/bash
<<COMMENT
# información subida - bajada 
salida=$(python3 speedtest-cli --simple)
#obtener solamente los datos
ping=$(echo "$salida" | grep -oP 'Ping: \K[0-9.]+')
download=$(echo "$salida" | grep -oP 'Download: \K[0-9.]+')
upload=$(echo "$salida" | grep -oP 'Upload: \K[0-9.]+')



# crea comentarios de varias lineas


# se obtiene solamente el entero
down="${download%.*}"
up="${upload%.*}"

# validar si la conexión a el internet es optima
if (( $down <= 20 ))
then
	if (( $up <= 20 ))
	then
		internet="malo"
	fi
else
  internet="ok"
fi

echo $internet
COMMENT

speed=$(ethtool enp0s3 | awk '{print $1 $2}') 

echo $speed | grep "Speed:"

