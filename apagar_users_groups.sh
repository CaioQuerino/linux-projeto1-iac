#!/bin/bash

# Definições
DIR_BASE="estrutura"
GRUPOS=("GRP_ADM" "GRP_VEN" "GRP_SEC")
USUARIOS_ADM=("carlos" "maria" "joao")
USUARIOS_VEN=("debora" "sebastiana" "roberto")
USUARIOS_SEC=("josefina" "amanda" "rogerio")

# Função para limpar ambiente anterior
limpar_ambiente() {
    echo "Limpando ambiente anterior ..."

    # Remove diretórios
    if [ -d "$DIR_BASE" ]; then
        rm -rf "$DIR_BASE"
    fi

    # Remove usuários
    for usuario in "${USUARIOS_ADM[@]}" "${USUARIOS_VEN[@]}" "${USUARIOS_SEC[@]}"; do
        if id "$usuario" &>/dev/null; then
            userdel -r "$usuario"  
        fi
    done

    # Remove grupos
    for grupo in "${GRUPOS[@]}"; do
        if getent group "$grupo" &>/dev/null; then
            groupdel "$grupo"
        fi
    done
}

limpar_ambiente