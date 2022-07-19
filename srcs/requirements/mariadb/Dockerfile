FROM debian:buster

# mariadb --> For data storage, WordPress uses systems compatible with MySQL.

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt install -y mariadb-server

COPY ./installer.sh /

# official mariaDB config
COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

# run wordpress installation script
ENTRYPOINT [ "./installer.sh" ]