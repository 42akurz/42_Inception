FROM debian:buster

# nginx --> The web server is piece of software that accepts user web requests and serves them the appropriate result.
# openssl --> library that contains SSL and TLS, Permits SSL-based connections to other hosts.
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y nginx \
	openssl

# create self-signed ssl certificates for TLS
# req --> the req command primarily creates and processes certificate requests
# -x509 --> this option outputs a self signed certificate instead of a certificate request
# -days n --> when the -x509 option is being used this specifies the number of days to certify the certificate for.
# -nodes --> if this option is specified then if a private key is created it will not be encrypted.
#            Theoretically you could leave out the -nodes parameter (which means "no DES encryption"), in which case "/etc/ssl/private/nginx.key" 
#            would be encrypted with a password. However, this is almost never useful for a server installation, because you would either 
#            have to store the password on the server as well, or you'd have to enter it manually on each reboot.
# -newkey arg --> this option creates a new certificate request and a new private key (arg = rsa:nbits)
#   rsa:nbits --> nbits is the number of bits, generate an RSA key nbits in size
# -keyout filename --> his gives the filename to write the newly created private key to
# -out filename --> This specifies the output filename to write to or standard output by default
# -sha256 --> SHA is an acronym for “secure hashing algorithm".
#             SHA256 is nothing but the SHA2 algorithm having a 256-bit length.
# -subj arg --> sets subject name for new request or supersedes the subject name when processing a request (CN = commonName)
RUN openssl req -newkey rsa:4096 \
			-x509 \
			-sha256 \
			-days 3650 \
			-nodes \
			-out self-signed.crt \
			-keyout self-signed.key \
			-subj "/C=DE/ST=Baden-Württemberg/L=Heilbronn/O=./OU=./CN=10.11.249.212"

# put config file in sites-enabled -> nginx reads it from there
COPY my.conf /etc/nginx/sites-enabled/.

# run nginx in foreground
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]