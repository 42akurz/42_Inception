#!/bin/bash

service mysql start

mysql -Bse "CREATE DATABASE wp_database;CREATE USER 'alex'@'localhost' IDENTIFIED BY 'alex123';GRANT ALL ON wp_database.* TO 'alex'@'localhost';FLUSH PRIVILEGES;"

service mysql stop

sleep 2

# keep container running
mysqld_safe