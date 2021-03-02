#!/bin/bash
#cd /var/www/html
#wget --no-check-certificate -O master.zip https://github.com/shopware/development/archive/master.zip | tr -d '\r'
#unzip -n master.zip | tr -d '\r'
#composer.phar --working-dir=/var/www/html/development-master install | tr -d '\r'
git clone https://github.com/shopware/development.git | tr -d '\r'
cd development | tr -d '\r'
chown -R www-data. . | tr -d '\r'
cp /var/www/html/.psh.yaml.override /var/www/html/development/ | tr -d '\r'
apache2-foreground