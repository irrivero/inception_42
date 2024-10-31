FROM debian:buster

ARG MYSQL_DATABASE
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD

RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mariadb.sh /tmp/mariadb.sh

RUN service mysql start && sh /tmp/mariadb.sh

EXPOSE 3306

CMD ["mysqld"]