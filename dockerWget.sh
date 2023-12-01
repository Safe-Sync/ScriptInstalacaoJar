#!/bin/sh

#Instalação do Docker
sudo apt update && sudo apt upgrade -y

sudo apt install wget
sudo apt install docker.io

#Iniciar o serviço do Docker
sudo systemctl start docker
sudo systemctl enable docker
sudo docker pull mysql:5.7
#Criar e executar o container MySQL
sudo docker run -d -p 3306:3306 --name safesync -e "MYSQL_ROOT_PASSWORD=sptech" mysql:5.7

sleep 15

# Baixar o script SQL usando wget
wget -O /tmp/script.sql https://raw.githubusercontent.com/Safe-Sync/Dados/main/SafeSync.sql
# Executar o script SQL dentro do container MySQL
sudo docker exec -i safesync mysql -u root -psptech < /tmp/script.sql

#Dar permissão de execução ao arquivo java.sh
sudo chmod +x javaejar.sh

#Executar o arquivo java.sh
./javaejar.sh
