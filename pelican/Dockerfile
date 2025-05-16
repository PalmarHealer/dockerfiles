FROM php:8.4-fpm

RUN apt-get update && apt-get install -y \
    libjpeg62-turbo-dev \
    libcurl4-openssl-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libicu-dev \
    libxslt1-dev \
    unzip \
    git \
    zip \
    sqlite3 \
    curl \    
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
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
