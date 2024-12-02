FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt install -y wget
RUN apt install vim -y

RUN apt-get install -y php7.3 php-fpm php-mysql mariadb-client

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN wget https://wordpress.org/latest.tar.gz -P /var/www

RUN cd /var/www && tar -xzf latest.tar.gz && rm -rf latest.tar.gz

RUN chmod -R 755 /var/www/wordpress && chown -R www-data:www-data /var/www/wordpress

COPY ./tools/wordpress.sh /tmp/wordpress.sh

EXPOSE 9000
# Create the run directory required to start the PHP7.3 service
RUN mkdir -p /run/php

ENTRYPOINT ["sh", "/tmp/wordpress.sh"]

CMD ["php-fpm7.3", "-F"]