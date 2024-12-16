FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt install -y wget
RUN apt install vim -y

RUN apt-get install -y php7.4 php-fpm php-mysql mariadb-client

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./tools/wordpress.sh /tmp/wordpress.sh

EXPOSE 9000
# Create the run directory required to start the PHP7.4 service
RUN mkdir -p /run/php

ENTRYPOINT ["sh", "/tmp/wordpress.sh"]

CMD ["php-fpm7.4", "-F"]