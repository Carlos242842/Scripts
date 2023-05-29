#!/bin/bash

function usage() {
  echo "INSTRUCCIONS: ./create_users.sh USER_NAME [USER_NAME ... ]"
  exit 1
}

# Comprobar si eres root
if [[ $EUID -ne 0 ]]; then
  echo "Este script debe ser ejecutado como root."
  exit 1
fi

# Obtener el nombre del script que se ejecuta
echo "${0}"
# Obtener el PATH y el filename del script
echo "Directorio: $(dirname "${0}") - Archivo: $(basename "${0}")"
# Obtener el número de parámetros
NUMERO_PARAMETROS=$#
echo "Número de parámetros: ${NUMERO_PARAMETROS}"
# Si el número de parámetros es igual a cero, salir (exit 1),
# indicando que el primer parámetro es obligatorio y será el nombre de usuario (USER_NAME),
# y que puede recibir parámetros opcionales que también serán nombres de usuarios.
if [[ ${NUMERO_PARAMETROS} -eq 0 ]]; then
  # Error, se necesita al menos un parámetro
  usage
fi

# VOLVER A MOSTRAR TODOS LOS PARÁMETROS
TODOS_LOS_PARAMETROS=${*}
echo "TODOS LOS PARÁMETROS: ${TODOS_LOS_PARAMETROS}"
# Generar una contraseña para cada uno de los usuarios pasados como parámetros.
# for es un bucle, que se ejecuta por cada elemento de ${@}

for USER_NAME in "${@}"; do
  # ENTRAREMOS EN ESTE BLOQUE, TANTAS VECES COMO PARÁMETROS PONGAMOS EN EL SCRIPT
  PASSWORD=$(date +%s%N | sha256sum | head -c10)
  echo "${USER_NAME}:${PASSWORD}"

  # CREAR EL USUARIO CON EL HOME
  sudo useradd -m ${USER_NAME}

  # COMPROBAR SI SE HA CREADO BIEN
  if [[ $? -eq 0 ]]; then
    echo "El usuario ${USER_NAME} ha sido creado exitosamente."
  else
    echo "Error al crear el usuario ${USER_NAME}."
    continue
  fi

  # CAMBIAR LA CONTRASEÑA
  chage -d 0 "$USER_NAME"

  # COMPROBAR SI EL CAMBIO DE CONTRASEÑA HA IDO BIEN
  if [[ $? -eq 0 ]]; then
    echo "La contraseña del usuario ${USER_NAME} ha sido cambiada exitosamente."
  else
    echo "Error al cambiar la contraseña del usuario ${USER_NAME}."
    continue
  fi

  # HACER QUE EL USUARIO TENGA QUE CAMBIAR LA CONTRASEÑA EN EL PRIMER INICIO DE SESIÓN
  chage -d 0 -M 0 "$USER_NAME"
  if [[ $? -eq 0 ]]; then
    echo "El usuario ${USER_NAME} deberá cambiar la contraseña en el primer inicio de sesión."
  else
    echo "Error al configurar el cambio de contraseña para el usuario ${USER_NAME}."
    fi
done