FROM php:8.4-fpm

RUN apt-get update

RUN apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    libxslt1-dev \
    sqlite3 \
    unzip \
    zip \
    curl \
    git

RUN docker-php-ext-configure gd

RUN docker-php-ext-install -j$(nproc) \
    gd \
    mysqli \
    mbstring \
    bcmath \
    xml \
    curl \
    zip \
    intl \
    pdo_sqlite \
    xsl \
    opcache

RUN apt-get clean && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /run/php /var/www/pelican

RUN rm /etc/nginx/sites-enabled/default \
    && curl -L https://raw.githubusercontent.com/PalmarHealer/dockerfiles/main/pelican/nginx.conf -o /etc/nginx/sites-available/pelican.conf \
    && ln -s /etc/nginx/sites-available/pelican.conf /etc/nginx/sites-enabled/pelican.conf

WORKDIR /var/www/pelican

RUN curl -L https://github.com/pelican-dev/panel/releases/latest/download/panel.tar.gz | tar -xzv

RUN curl -L https://github.com/PalmarHealer/pelican-extension-manager/releases/latest/download/panel.tar.gz | sudo tar -xzv

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --optimize-autoloader

RUN php artisan p:environment:setup --no-interaction

RUN chmod -R 755 storage bootstrap/cache \
    && chown -R www-data:www-data /var/www/pelican
