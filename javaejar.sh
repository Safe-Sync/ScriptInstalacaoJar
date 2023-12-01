#!/bin/bash

# URL do arquivo JAR no GitHub
jar_url="https://https://github.com/Safe-Sync/DataSync-3.0/tree/main/datasync/target/datasync-1.0-jar-with-dependencies.jar"

# Nome do arquivo JAR após o download
jar_nome="datasync-1.0-jar-with-dependencies.jar"

echo "Agora iremos verificar se você já possui o Java instalado, aguarde um instante..."
sleep 5

if ! command -v java &> /dev/null; then
    echo "Você ainda não possui o Java instalado."
    echo "Confirme se deseja instalar o Java (S/N)?"
    read inst
    if [[ "$inst" == "S" || "$inst" == "s" ]]; then
        echo "Ok! Você escolheu instalar o Java."
        echo "Adicionando o repositório..."
        sleep 7
        sudo add-apt-repository ppa:linuxuprising/java -y
        clear
        echo "Atualizando os pacotes... Quase acabando."
        sleep 7
        sudo apt update -y

        # Instalação do Java
        echo "Preparando para instalar a versão 17 do Java. Lembre-se de confirmar a instalação quando necessário!"
        sudo apt-get install openjdk-17-jdk -y
        clear
        echo "Java instalado com sucesso!"
        echo "Vamos atualizar os pacotes..."
        sudo apt update && sudo apt upgrade -y
    else
        echo "Você optou por não instalar o Java no momento."
    fi
else
    echo "Você já possui o Java instalado!"
fi

# Verificar se o arquivo JAR já existe
if [ ! -f "$jar_nome" ]; then
    echo "Baixando o arquivo JAR..."
    # Instale o wget se não estiver instalado
    sudo apt install wget -y
    # Baixar o arquivo JAR usando wget
    wget "$jar_url" -O "$jar_nome"

    # Verificar se o download foi bem-sucedido
    if [ $? -eq 0 ]; then
        echo "Download do arquivo JAR concluído com sucesso."
    else
        echo "Erro ao baixar o arquivo JAR."
        exit 1
    fi
else
    echo "Arquivo JAR já existe. Pulando o download."
fi

# Perguntar se deseja executar o arquivo JAR
echo "Deseja executar o arquivo JAR (S/N)?"
read exec
if [[ "$exec" == "S" || "$exec" == "s" ]]; then
    # Executar o arquivo JAR
    java -jar "$jar_nome"

    # Verificar se a execução foi bem-sucedida
    if [ $? -eq 0 ]; then
        echo "Execução do arquivo JAR bem-sucedida."
    else
        echo "Erro ao executar o arquivo JAR."
    fi
else
    echo "Você optou por não executar o arquivo JAR no momento."
fi