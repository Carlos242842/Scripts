#!/bin/bash

ID="5129908589"
TOKEN="5907010753:AAFwp7Q62HNSLy2OGxb7sLvCB0y2zkbLOBs"
MENSAJE="Hola! La data del equip és : $(date)"
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

curl -s -X POST $URL -d chat_id=$ID -d text="$MENSAJE"