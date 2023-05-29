#!/bin/bash

function usage(){
    echo "INSTRUCCIONES: ./create_users.sh NOMBRE_USUARIO [NOMBRE_USUARIO ... ]"
    exit 1
}

if [[ $EUID -ne 0 ]]; then
   echo "Este script debe ser ejecutado como root" 
   exit 1
fi

if [[ $# -eq 0 ]]; then
    usage
fi

for NOMBRE_USUARIO in "$@"; do
    PASSWORD=$(date +%s%N | sha256sum | head -c10)
    echo "${NOMBRE_USUARIO}:${PASSWORD}"
    
    adduser -m ${NOMBRE_USUARIO}
    
    if [[ $? -eq 0 ]]; then
        echo "Usuario ${NOMBRE_USUARIO} creado exitosamente."
    else
        echo "Error al crear el usuario ${NOMBRE_USUARIO}."
        continue
    fi
    
    echo "${NOMBRE_USUARIO}:${PASSWORD}" | chpasswd
    if [[ $? -eq 0 ]]; then
        echo "Contraseña establecida correctamente para ${NOMBRE_USUARIO}."
    else
        echo "Error al establecer la contraseña para ${NOMBRE_USUARIO}."
    fi
done

