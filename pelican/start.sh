#!/bin/sh

if [ -z "$(ls -A /var/www/pelican)" ]; then
    echo "Downloading Pelican Panel..."
    curl -L https://github.com/pelican-dev/panel/releases/latest/download/panel.tar.gz | tar -xzv -C /var/www/pelican
    cd /var/www/pelican
    COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --optimize-autoloader
fi

php-fpm -D
nginx -g "daemon off;"
