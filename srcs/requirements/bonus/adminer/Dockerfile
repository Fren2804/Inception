FROM alpine:3.21

RUN apk update && apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-session \
    curl

RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' /etc/php83/php-fpm.d/www.conf

WORKDIR /var/www/html

COPY tools/adminer.sh /usr/local/bin/adminer.sh
RUN chmod +x /usr/local/bin/adminer.sh

EXPOSE 9000

ENTRYPOINT ["adminer.sh"]