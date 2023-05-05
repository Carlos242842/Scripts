#!/bin/bash
#ESCRIU UN SCRIPT QUE RECORRI EL FITXER numeros.txt i
#mostri QUANTES LÍNIES TÉ EL FITXER
NUMERO_LINIES=0
for linia in $(cat numeros.txt)
do
    #INCREMENTAR EL NUMEROS DE LINIES 
    NUMERO_LINIES=$((NUMERO_LINIES+1))
done
echo "numero de linies: ${NUMERO_LINIES}"