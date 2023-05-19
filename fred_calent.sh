#!/bin/bash

#Genera un nombre aleatori entre 1 i 10:
adivina=$(( ( RANDOM % 10 )  + 1 ))

########################################################
# Escriu el teu codi aqui
########################################################

numero() {
    if (( $1 < $adivina )); then
        echo "Fred!"
    elif (( $1 > $adivina )); then
        echo "Calent!"
    else
        echo "Eureka!"
        exit
    fi
}
for (( intento=1; intento<=3; intento++ )); do
    read -p "Introduce un número entre 1 y 10: " numero
    numero $numero
done

########################################################
# Fi del teu codi
########################################################

echo "El nombre que havies d'adivinar era: ${adivina}"