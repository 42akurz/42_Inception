#!/bin/bash

# if database aready exists --> skip
if [ ! -d "/var/lib/mysql/wordpress" ]; then

# start database
service mysql start

# wait to make sure that db is active
sleep 3

# run mysql commands to setup datbase and database user (utilizing heredoc)
mysql -u root <<DATA
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON wordpress.* TO '$DB_USER'@'%';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$DB_PASS_ROOT');
DATA

# need to stop mysql before running the daemon
service mysql stop

# make sure mysql stopped
sleep 3

echo "database created"

else
echo "database found"

fi

# keep container running
mysqld_safe