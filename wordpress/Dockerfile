FROM debian:buster

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y php7.3 && \
	apt-get install -y php7.3-fpm && \
	apt-get install -y curl && \
	apt-get install -y php-mysqli && \
	apt-get update -y && \
	apt install -y mariadb-server

# create wordpress direcory -> wordpress CLI will be downloaded here
RUN mkdir wordpress

# install wordpress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar

# change executable name to wp
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./installer.sh /

# run wordpress installation script
ENTRYPOINT [ "./installer.sh" ]

# create mariadb database, user and give user privileges on database
# RUN service mysql start
# RUN service mysql restart && echo "CREATE DATABASE wp_database;CREATE USER 'alex'@'localhost' IDENTIFIED BY 'alex123';" | mysql
# RUN service mysql restart && echo "GRANT ALL ON wp_database.* TO 'alex'@'localhost';FLUSH PRIVILEGES;" | mysql

# download wp
# RUN cd wordpress && wp core download --allow-root

# RUN service mysql start
# RUN sleep 5

# create wp config file with db_name, db_user and db_password 
# RUN service mysql restart && cd wordpress && wp config create --allow-root --dbname=wp_database --dbuser=alex --dbpass=alex123

# install wp
# RUN service mysql restart && cd wordpress && wp core install --url=10.11.249.212 --title=title --admin_user=admin --admin_password=Agusc23. --admin_email=email@email.de --allow-root