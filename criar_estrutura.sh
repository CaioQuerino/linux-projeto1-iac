#!/bin/bash

# Definições
DIR_BASE="estrutura"
GRUPOS=("GRP_ADM" "GRP_VEN" "GRP_SEC")
USUARIOS_ADM=("carlos" "maria" "joao")
USUARIOS_VEN=("debora" "sebastiana" "roberto")
USUARIOS_SEC=("josefina" "amanda" "rogerio")

# Função para criar estrutura de diretórios
criar_estrutura() {
    echo "Criando estrutura de diretórios ..."

    mkdir -p "$DIR_BASE/publico" "$DIR_BASE/adm" "$DIR_BASE/ven" "$DIR_BASE/sec"

    # Define o dono dos diretórios como root
    chown root:root "$DIR_BASE" "$DIR_BASE/publico" "$DIR_BASE/adm" "$DIR_BASE/ven" "$DIR_BASE/sec"
}

# Função para criar grupos e usuários
criar_grupos_usuarios() {
    echo "Criando grupos ..."

    for grupo in "${GRUPOS[@]}"; do
        if ! getent group "$grupo" &>/dev/null; then
            groupadd "$grupo"
        fi
    done

    echo "Criando usuários e adicionando aos grupos ..."

    # Adiciona usuários ao GRP_ADM
    for usuario in "${USUARIOS_ADM[@]}"; do
        if ! id "$usuario" &>/dev/null; then
            useradd -m -s /bin/bash "$usuario"
        fi
        usermod -a -G GRP_ADM "$usuario"
    done

    # Adiciona usuários ao GRP_VEN
    for usuario in "${USUARIOS_VEN[@]}"; do
        if ! id "$usuario" &>/dev/null; then
            useradd -m -s /bin/bash "$usuario"
        fi
        usermod -a -G GRP_VEN "$usuario"
    done

    # Adiciona usuários ao GRP_SEC
    for usuario in "${USUARIOS_SEC[@]}"; do
        if ! id "$usuario" &>/dev/null; then
            useradd -m -s /bin/bash "$usuario"
        fi
        usermod -a -G GRP_SEC "$usuario"
    done
}

# Função para definir permissões
definir_permissoes() {
    echo "Definindo permissões ..."

    # Permissão total para todos no diretório publico
    chmod 777 "$DIR_BASE/publico"

    # Permissão total para o grupo dono e nenhuma permissão para outros
    chmod 770 "$DIR_BASE/adm"
    chmod 770 "$DIR_BASE/ven"
    chmod 770 "$DIR_BASE/sec"

    # Define o grupo dono de cada diretório
    chown root:GRP_ADM "$DIR_BASE/adm"
    chown root:GRP_VEN "$DIR_BASE/ven"
    chown root:GRP_SEC "$DIR_BASE/sec"
}

# Execução principal
criar_estrutura
criar_grupos_usuarios
definir_permissoes

echo "Provisionamento concluído!"