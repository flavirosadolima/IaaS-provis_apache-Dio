#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
if [ $? -ne 0 ]; then
	echo "Upgrade mal sucedido. Executando dist-upgrade..." 
	sudo apt-get dist-upgrade -y
fi

if ! command -v apache2 >/dev/null 2>&1; then
	echo "Instalando apache2..."
	sudo apt-get install apache2 -y
else
	echo "Apache2 já instalado."
fi
if ! command -v unzip >/dev/null 2>&1; then
	echo "Instalando unzip..."
	sudo apt-get install unzip -y
else
	echo "Unzip já instalado."
fi
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio-main
#copiando site do /tmp para diretório padrão apache
cp -R * /var/www/html
