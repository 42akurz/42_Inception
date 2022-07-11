#!/bin/bash

service mysql start

mysql -Bse "CREATE DATABASE wp_database;CREATE USER 'alex'@'localhost' IDENTIFIED BY 'alex123';GRANT ALL ON wp_database.* TO 'alex'@'localhost';FLUSH PRIVILEGES;"

# download wp
cd wordpress

wp core download --allow-root

# create wp config file with db_name, db_user and db_password 
wp config create --allow-root --dbname=wp_database --dbuser=alex --dbpass=alex123

# install wp
wp core install --url=10.11.249.212 --title=title --admin_user=admin --admin_password=Agusc23. --admin_email=email@email.de --skip-email --allow-root

# keep container running
mkdir -p /var/run/php
php-fpm7.3 -F