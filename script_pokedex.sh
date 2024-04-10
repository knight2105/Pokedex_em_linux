#!/bin/bash

# Função para adicionar um novo Pokémon à Pokédex
add_pokemon() {
    echo "Digite o nome do Pokémon:"
    read nome
    echo "Digite o tipo(s) do Pokémon (separados por vírgula):"
    read tipo
    echo "Digite o lugar onde o Pokémon pode ser encontrado:"
    read lugar

    echo "$nome:$tipo:$lugar" >> pokedex.txt
    echo "Pokémon adicionado à Pokédex!"
}

# Função para pesquisar um Pokémon na Pokédex
search_pokemon() {
    echo "Digite o nome do Pokémon que deseja pesquisar:"
    read pokemon

    encontrado=false

    while IFS=":" read -r nome tipos lugar; do
        if [ "$nome" == "$pokemon" ]; then
            encontrado=true
            echo "Nome: $nome"
            echo "Tipo(s): $tipos"
            echo "Lugar: $lugar"
        fi
    done < pokedex.txt

    if [ "$encontrado" == false ]; then
        echo "Pokémon não encontrado na Pokédex."
    fi
}

# Menu principal
while true; do
    echo "Bem-vindo à Pokédex!"
    echo "Escolha uma opção:"
    echo "1. Adicionar novo Pokémon"
    echo "2. Pesquisar Pokémon"
    echo "3. Sair"

    read opcao

    case $opcao in
        1) add_pokemon ;;
        2) search_pokemon ;;
        3) echo "Até logo!"; exit ;;
        *) echo "Opção inválida. Tente novamente." ;;
    esac
done
