FROM debian:buster

RUN apt-get update -y && \
	apt-get upgrade -y && \
	# apt-get install -y php-mysqli && \
	apt install -y mariadb-server

COPY ./installer.sh /

# run wordpress installation script
ENTRYPOINT [ "./installer.sh" ]