FROM debian:buster

# php --> PHP is a programming language on which WordPress code is based.
# php7.3-fpm --> This package provides the Fast Process Manager interpreter that runs as a daemon and receives Fast/CGI requests
# php-mysqli --> Connects to MySQL for database interactions.
# mariadb-client --> MariaDB client is the tool which can be used for establishing the connection and interaction with the 
#					 MariaDB server from the client-side by the user of the database.
# curl --> Performs remote request operations.
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y php7.3 \
	php7.3-fpm \
	php-mysqli \
	mariadb-client \
	curl && \
	apt-get update -y

# create wordpress direcory -> wordpress CLI will be downloaded here
RUN mkdir -p /var/www/wordpress
WORKDIR /var/www/wordpress

# install wordpress CLI
# WP-CLI is the official command line tool for interacting with and managing your WordPress sites.
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar

# change executable name to wp
RUN mv wp-cli.phar /usr/local/bin/wp

# php-fpm config
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# official wordpress config
COPY ./conf/wp-config.php /var/www/wordpress

# script that runs the wordpress CLI installation process
COPY ./installer.sh /

# expose port 9000 inside docker network
EXPOSE 9000

# run wordpress installation script
ENTRYPOINT [ "/installer.sh" ]