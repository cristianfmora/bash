#! /bin/bash
<<COMMENT
# Validar que existan archivos en la carpeta
if [ -z "$(ls -A .)" ]; then
    echo "No hay archivos para procesar."
    exit 1
    else
        for archivo in  $(ls $1); do
            # obtener la extensión
            extension="${archivo##*.}"
            
            echo $extension 
        done
fi
COMMENT

# Recorrer la carpeta
for archivo in  $(ls $1); do
    # obtener la extensión
    extension="${archivo##*.}"
     # crear carpeta de la extensión
    [ -d $extension ] || mkdir $1/$extension
    # mover carpetas creadas a la carpeta principal
    wait
    mv $1/$archivo $1/$extension
done
    # validar si la extensión existe
    #if [[ ! "${list[@]}" =~ "$extension" ]]; then
        # Agregar la extensión a la lista
     #   list+=("$extension")
    #fi

   

