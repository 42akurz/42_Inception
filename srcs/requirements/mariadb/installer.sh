#!/bin/bash

# if database aready exists --> skip
if [ ! -d "/var/lib/mysql/wordpress" ]; then

service mysql start

sleep 3

mysql -u root <<DATA
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON wordpress.* TO '$DB_USER'@'%';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_PASS_ROOT');
DATA

service mysql stop

sleep 3
echo "database created"

else
echo "database found"

fi

# keep container running
mysqld_safe