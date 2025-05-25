FROM --platform=$TARGETOS/$TARGETARCH php:8.4-fpm-alpine

# PHP Extensions
ADD --chmod=0755 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN install-php-extensions \
    bcmath gd intl zip opcache pcntl posix pdo_mysql pdo_sqlite mbstring xml curl sqlite3 \
    && rm /usr/local/bin/install-php-extensions

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# NGINX and Tools
RUN apk add --no-cache nginx curl tar unzip bash

# Configurations files
COPY php.ini /usr/local/etc/php/php.ini
COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh

WORKDIR /var/www/pelican

EXPOSE 80

CMD ["/start.sh"]
