FROM debian:buster

RUN apt-get update -y 
RUN apt-get upgrade -y 
RUN apt-get install -y php7.3 
RUN apt-get install -y php7.3-fpm 
RUN apt-get install -y curl
RUN apt-get install -y php-mysqli
RUN apt install -y wget
RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
RUN apt install -y ./mysql-apt-config_0.8.22-1_all.deb
RUN apt-get update -y 
RUN apt install -y mysql-server
RUN apt-get install -y mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
# RUN wp core download
# RUN wp core install --url=10.11.249.212 --title=title --admin_user=admin --admin_password=Agusc23. --admin_email=email@email.de
