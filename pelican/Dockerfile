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
RUN mkdir -p /usr/local/etc/php /etc/nginx/sites-enabled \
 && curl -fsSL -o /usr/local/etc/php/php.ini https://raw.githubusercontent.com/PalmarHealer/dockerfiles/main/pelican/php.ini \
 && curl -fsSL -o /etc/nginx/sites-enabled/pelican.conf https://raw.githubusercontent.com/PalmarHealer/dockerfiles/main/pelican/nginx.conf \
 && curl -fsSL -o /start.sh https://raw.githubusercontent.com/PalmarHealer/dockerfiles/main/pelican/start.sh \
 && chmod +x /start.sh

WORKDIR /

EXPOSE 80

CMD ["/start.sh"]
