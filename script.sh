#!/bin/bash

echo "Olá! Irei te ajudar a instalar o DataSync para você!"

echo "Posso instalar o app do DataSync? (Y/n)"
read appDataSync

if [ \"$appDataSync\" == \"Y\" ]
    then
        echo "Para instalar o DataSync, você precisa ter o Java instalado." 
        echo "Irei verificar se você já tem o Java."
        java -version
        if [ $? = 0 ]
            then
                echo "Você já tem o Java instalado!"
            else
                echo "Não encontrei nenhuma versão do Java instalado."
                echo "Deseja instalar o Java? (Y/n)"
                read inst

                if [ \"$inst\" == \"Y\" ]
                    then 
                        echo "Irei instalar o Java para você."
                        sudo apt install openjdk-17-jre -y
                        sudo apt update && sudo apt upgrade -y
                    else
                        echo "Não podemos prosseguir sem o Java, desculpe!"
                        exit 0
                    fi
            fi
        git clone https://github.com/Safe-Sync/DataSync.git
        chmod 777 DataSync.jar
        echo "Obrigado por instalar o nosso app!"
        echo "Você já pode utilizar nossa aplicação!"
    else
        echo "Você optou por seguir sem a instalação do app, até a próxima!"
    fi