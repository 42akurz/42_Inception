FROM debian:buster


RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y nginx


RUN mkdir template
COPY my.html /template/.


# put config file in sites-enabled -> nginx reads it from there
COPY my.conf /etc/nginx/sites-enabled/.


# run nginx in foreground
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]