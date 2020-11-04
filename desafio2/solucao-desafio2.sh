#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo 'Atualizando o repositorio'
apt update -y

echo 'Instalando nginx'
apt install nginx -y

echo 'Criando o arquivo de configuração'
echo "server {
        listen 80;
        server_name www.desafio1.com;

        location / {
                return 200 'desafio1 - Ok!';
        }
}
server {
        listen 80;
        server_name www.desafio2.com;

        location / {
                return 200 'desafio2 - Ok!';
        }
}" > /etc/nginx/sites-available/desafio2

echo 'Adicionando link das configurações do desafio'
ln -s /etc/nginx/sites-available/desafio2 /etc/nginx/sites-enabled/

echo 'restartando o servidor após as mudanças'
systemctl restart nginx

echo 'Adicionando server_names em /etc/hosts'
echo '127.0.0.1 www.desafio1.com' >> /etc/hosts

echo '127.0.0.1 www.desafio2.com' >> /etc/hosts

echo 'Get Localhost' 
curl localhost

echo 'Get www.desafio1.com'
curl www.desafio1.com

echo 'Get www.desafio2.com'
curl www.desafio2.com