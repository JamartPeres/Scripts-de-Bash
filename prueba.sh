#!/bin/bash

# Se verifica que se haya mandado un parámetro
if [[ -z $1 ]];
then 
	echo "Debes proporcionar el nombre de un pokémon >:("
else
	pokemon_info=$(curl -s https://pokeapi.co/api/v2/pokemon/$1)

	# Se verifica que exista el poquemón
	if [[ $pokemon_info == *"Not Found"* ]]; then
	  echo "El pokémon que escribiste no existe :("
	else
	  #Se usa jq para asignar la información solicitada a variables
	  name=$(echo $pokemon_info | jq -r '.name')
	  order=$(echo $pokemon_info | jq -r '.order')
	  id=$(echo $pokemon_info | jq -r '.id')
	  weight=$(echo $pokemon_info | jq -r '.weight')
	  height=$(echo $pokemon_info | jq -r '.height')

	  # Se imprime la información en el formato deseado
	  echo "$name (No. $order)"
	  echo "Id = $id"
	  echo "Weight = $weight"
	  echo "Height = $height"
	fi
fi



