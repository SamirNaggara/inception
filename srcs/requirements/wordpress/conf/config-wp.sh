#!/bin/bash
usermod -aG www-data manager;
sleep 10;

fichier="/var/www/wordpress/wp-config.php";
cd /var/www/wordpress;
if [ ! -e "$fichier" ]; then
	wp config create --dbhost=mariadb:3306 --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PWD} --allow-root;
	wp core install --url="${WEBSITE_URL}" --title="${WEBSITE_NAME}" --admin_user=${ADMIN_NAME} --admin_password=${ADMIN_PWD} --admin_email=${ADMIN_MAIL} --allow-root;
	wp user create ${USER_NAME} ${USER_MAIL} --role=${USER_ROLE} --user_pass=${USER_PWD} --allow-root;
fi


/usr/sbin/php-fpm7.3 -F;
