#!/bin/bash

# Obtenir el nom del script
script_name=$(basename "$0")

# Obtenir el PATH i el filename del script
script_path=$(dirname "$0")
script_filename=$(basename "$0")

# Obtenir el nombre de paràmetres
num_params=$#

# Comprovar si no hi ha cap paràmetre
if [ $num_params -eq 0 ]; then
  echo "El primer paràmetre és obligatori i serà el nom d'usuari (USER_NAME)."
  echo "Pot afegir paràmetres opcionals que també seran noms d'usuaris."
  exit 1
fi

# Mostrar el nom del script
echo "Nom del script: $script_name"

# Mostrar el PATH i el filename del script
echo "PATH: $script_path"
echo "Filename: $script_filename"

# Mostrar el número de paràmetres
echo "Nombre de paràmetres: $num_params"

# Guardar tots els paràmetres en una variable
params="$@"
echo "Paràmetres: $params"

# Generar una contrasenya per a cada usuari passat com a paràmetre
echo "Contrasenyes generades:"
for username in $params; do
  password=$(openssl rand -base64 12)
  echo "Usuari: $username - Contrasenya: $password"
done