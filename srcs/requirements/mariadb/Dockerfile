FROM debian:buster

# mariadb --> For data storage, WordPress uses systems compatible with MySQL.
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt install -y mariadb-server

# mariadb installation script
COPY ./installer.sh /

# official mariaDB config
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

# expose port 3306 inside docker network
EXPOSE 3306

# run wordpress installation script
ENTRYPOINT [ "./installer.sh" ]