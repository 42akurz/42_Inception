FROM debian:buster

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y nginx && \
	apt-get install -y openssl

# create self-signed ssl certificates for TLS
RUN openssl req -newkey rsa:4096 \
			-x509 \
			-sha256 \
			-days 3650 \
			-nodes \
			-out self-signed.crt \
			-keyout self-signed.key \
			-subj "/C=DE/ST=Baden-Württemberg/L=Heilbronn/O=./OU=./CN=10.11.249.212"

# copy html file into container
RUN mkdir template
COPY my.html /template/.

# put config file in sites-enabled -> nginx reads it from there
COPY my.conf /etc/nginx/sites-enabled/.

# run nginx in foreground
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]