FROM debian:buster

# Update
RUN apt update -y
RUN apt upgrade -y

# Install wget, php
RUN apt-get -y install wget
RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

# Install wp-cli, and place in executable path repertory
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN	chown -R root:root wp-cli.phar

# Move wp cli file in executable path
RUN mv wp-cli.phar /usr/local/bin/wp

# Dowload, decompress, and authorise wordpress files
RUN wget https://fr.wordpress.org/wordpress-6.2.3-fr_FR.tar.gz -P /var/www
RUN tar -xzf /var/www/wordpress-6.2.3-fr_FR.tar.gz -C /var/www && rm -rf /var/www/wordpress-6.2.3-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress

# Conf file
COPY conf/config-wp.sh /tmp/config-wp.sh
RUN chmod 777 /tmp/config-wp.sh
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod 777 /etc/php/7.3/fpm/pool.d/www.conf

# Créé un dossier php avec les bonnes autorisations
RUN mkdir -p /run/php/
RUN chown www-data:www-data /run/php/

ENTRYPOINT /tmp/config-wp.sh