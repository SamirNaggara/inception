FROM debian:buster

# Update
RUN apt update -y
RUN apt upgrade -y

# Install nginx and openssl
RUN apt install nginx -y
RUN apt install openssl -y

# Help for command line
RUN apt install vim -y
RUN apt install curl -y

# Install tsl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=snaggara.42.fr/UID=snaggara"

# Config file nginx
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Auth
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html


# Lauch nginx first plan
CMD [ "nginx", "-g", "daemon off;" ]
