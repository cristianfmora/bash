#! /bin/bash

ruta=$(pwd)

# crear fecha actual
fecha=$(date +%Y-%m-%d)-db

# bucle para recorrer el archivo en la carpeta
for archivo in $(ls $ruta/base-datos)
do
  # crear carpeta con fecha actual
  [ -d $fecha ] || mkdir $fecha
  # sincronizar los archivos carpeta base-datos
  #rsync -r $ruta/base-datos/$archivo $ruta/$fecha/
  mv $ruta/base-datos/$archivo $ruta/$fecha
done

