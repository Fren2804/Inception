FROM alpine:3.21


RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir -p /var/lib/mysql /run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /run/mysqld


COPY tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh


EXPOSE 3306


ENTRYPOINT ["entrypoint.sh"]