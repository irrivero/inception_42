#!/bin/bash

sleep 10

if [ ! -f /var/www/html/wp-config.php ]; then
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar

	./wp-cli.phar core download https://wordpress.org/latest.tar.gz --allow-root --path=/var/www/html

	./wp-cli.phar config create --allow-root \
		--dbname=${MYSQL_DATABASE} \
		--dbuser=${MYSQL_USER} \
		--dbpass=${MYSQL_PASSWORD} \
		--dbhost=mariadb \
		--path=/var/www/html

	sleep 2

	./wp-cli.phar core install --allow-root \
	 --url=${DOMAIN_NAME} \
	 --title=Inception --admin_user=${ADMIN_USER} \
	 --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} \
	 --path=/var/www/html --skip-email

	 sleep 2

	./wp-cli.phar user create --allow-root \
	 --path=/var/www/html \
	 --user_pass=${WP_PASSWORD} \
	 --role=author ${WP_USER} ${WP_EMAIL}

fi 

exec "$@"