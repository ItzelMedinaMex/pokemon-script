#!/bin/bash

POKEMON="$1"
API_URL="https://pokeapi.co/api/v2/pokemon/$POKEMON"
RESPONSE=$(curl -s "$API_URL")

ID=$(echo "$RESPONSE" | jq '.id')
NAME=$(echo "$RESPONSE" | jq -r '.name')
WEIGHT=$(echo "$RESPONSE" | jq '.weight')
HEIGHT=$(echo "$RESPONSE" | jq '.height')
ORDER=$(echo "$RESPONSE" | jq '.order')

#Imprimir datos
echo "${NAME^} (no. $ID)"
echo "ID = $ID"
echo "Weight = $WEIGHT"
echo "Height = $HEIGHT"
echo "Order = $ORDER"

echo "${ID},${NAME}, ${WEIGHT}, ${HEIGHT}, ${ORDER}" >> pokemon_data.csv