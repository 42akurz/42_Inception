FROM debian:buster

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y php7.3 \
	php7.3-fpm \
	curl \
	mariadb-server \
	php-mysqli && \
	apt-get update -y

# create wordpress direcory -> wordpress CLI will be downloaded here
RUN mkdir -p /var/www/wordpress

WORKDIR /var/www/wordpress

# install wordpress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar

# change executable name to wp
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./www.conf /etc/php/7.3/fpm/pool.d

# WORKDIR /

COPY ./installer.sh /

# run wordpress installation script
ENTRYPOINT [ "/installer.sh" ]