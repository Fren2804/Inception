FROM alpine:3.21


RUN apk update && apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-phar \
    php83-iconv \
    php83-mbstring \
    php83-tokenizer \
    php83-ctype \
    curl \
    mariadb-client \
    netcat-openbsd \
    php83-pecl-redis


RUN echo "memory_limit = 512M" > /etc/php83/conf.d/docker-php-memlimit.ini


RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp


RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/g' /etc/php83/php-fpm.d/www.conf

WORKDIR /var/www/html

COPY tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]