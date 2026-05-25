#!/bin/sh

if [ ! -f /var/www/html/index.php ]; then
    echo "Descargando Adminer..."
    curl -L -o /var/www/html/index.php https://www.adminer.org/latest.php
fi

echo "Iniciando Adminer en el puerto 9000..."
exec /usr/sbin/php-fpm83 -F