FROM debian:buster

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt install -y php-mysql && \
	apt install -y mysql-server

	# apt-get install mariadb-server -y


# ENTRYPOINT [ "mysql", "-u", "root", "-p" ]