function usage(){
    echo "USAGE: you have to enter almost 2 parametres"
    echo "parametres.sh x1 x2 [x3...xn]"
    exit 1
}

NUM_PARAM=${#}
echo "Número de parametres: ${NUM_PARAM}"

    #error per el número de parametres

#FOR ESTRUCTURA DE CONTROL DE ITERAR
SUMA=0
PRODUCTE=1
for I in ${@}
do
    SUMA=$((SUMA+I))
    PRODUCTE=$((PRODUCTE*I))
done
echo "La suma val ${SUMA}"
echo "El produte val ${PRODUCTE}"