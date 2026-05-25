FROM alpine:3.21

RUN apk update && apk add --no-cache vsftpd

# Copiar configuración y script
COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/www/html

# Puertos: 21 para control, 21100-21110 para datos (pasivo)
EXPOSE 21 21100-21110

ENTRYPOINT ["entrypoint.sh"]