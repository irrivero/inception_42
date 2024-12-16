FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx

RUN mkdir -p /etc/nginx/ssl && apt install openssl -y
RUN openssl req -x509 -nodes -days 365 \
	-keyout /etc/nginx/ssl/inception.key \
	-out /etc/nginx/ssl/inception.crt \
	-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=irivero-.42.fr"

RUN rm -rf /etc/nginx/http.d/default.conf

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod -R 755 /var/www/html && chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]