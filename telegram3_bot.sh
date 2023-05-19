#!/bin/bash

IP=$(curl ifconfig.me)
DATA=$(date)
HOST=$(hostname)
MENSAJE="S'ha reiniciat ${HOST} a les ${DATA} ip: ${IP}"

. /home/estudiant/GIT/Scripts/telegram2_bot.sh "${MENSAJE}"