#!/bin/bash



wp core download --allow-root

cp /wp-config.php /var/www/wordpress/

# create wp config file with db_name, db_user and db_password 
# wp config create	--dbhost=$DB_HOST \
# 					--dbname=$DB_NAME \
# 					--dbuser=$DB_USER \
# 					--dbpass=$DB_PASSWORD \
# 					--allow-root

# install wp
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

# to fix error: enable to create .pid file, cause /run/php directory doesn't exist
mkdir -p /var/run/php

# run php-fpm7.3 listening for CGI request and force to stay in foreground and ignore daemonize option fromm configuration file
php-fpm7.3 -F