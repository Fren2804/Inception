#!/bin/sh

set -e


export WP_CLI_PHP_ARGS='-d memory_limit=512M'

echo "Esperando a MariaDB en $DB_HOST:3306..."


while ! nc -z "$DB_HOST" 3306; do
    sleep 2
done

echo "MariaDB conectada."

if [ ! -f "/var/www/html/wp-config.php" ]; then
    echo "Descargando WordPress..."
  
    php83 /usr/local/bin/wp core download --allow-root

    echo "Creando configuración..."
    wp config create \
        --dbname="$DB_NAME" \
        --dbuser="$DB_USER" \
        --dbpass="$DB_PASS" \
        --dbhost="$DB_HOST" \
        --allow-root

    echo "Instalando WordPress..."
    wp core install \
        --url="$WP_URL" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASS" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --skip-email \
        --allow-root

    echo "Creando usuario auxiliar..."
    wp user create "$AUX_USER" "$AUX_EMAIL" \
        --role=author \
        --user_pass="$AUX_PASSWORD" \
        --allow-root
else
    echo "WordPress ya está instalado."
fi

echo "Configurando Redis en wp-config.php..."
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --raw --allow-root
wp config set WP_CACHE true --raw --allow-root

if ! wp plugin is-installed redis-cache --allow-root; then
    echo "Instalando plugin Redis Object Cache..."
    wp plugin install redis-cache --activate --allow-root
fi


echo "Activando Redis..."
wp redis enable --allow-root

echo "Iniciando PHP-FPM..."
exec /usr/sbin/php-fpm83 -F