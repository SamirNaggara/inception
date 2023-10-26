FROM debian:buster

# Update
RUN apt update -y
RUN apt upgrade -y

# Install MariaDb
RUN apt-get install mariadb-server -y

# Conf file
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/lauch-db.sh /etc/mysql/mariadb.conf.d/lauch-db.sh
RUN chmod 777 /etc/mysql/mariadb.conf.d/lauch-db.sh


ENTRYPOINT ["/etc/mysql/mariadb.conf.d/lauch-db.sh"]
