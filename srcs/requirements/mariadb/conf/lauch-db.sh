#!/bin/bash

service mysql start;

sleep 1;
mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;";

mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'wordpress.srcs_inception' IDENTIFIED BY '${DB_PWD}';";

mysql -e "GRANT ALL PRIVILEGES ON *.* TO \`${DB_USER}\`@'wordpress.srcs_inception' IDENTIFIED BY '${DB_PWD}';FLUSH PRIVILEGES;";


mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY ${DB_ROOT_PWD};FLUSH PRIVILEGES;";

mysqladmin -u root -p${DB_ROOT_PWD} shutdown;

exec mysqld_safe;