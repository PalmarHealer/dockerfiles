FROM ghcr.io/pelican-dev/panel:latest
RUN mkdir -p /var/www/html/public && \
    wget -O /var/www/html/public/nauren.svg https://files.nauren.de/nauren.svg && \
    cd /var/www/html && \
    sudo curl -L https://github.com/PalmarHealer/pelican-extension-manager/releases/latest/download/panel.tar.gz | sudo tar -xzv && \    
    chown -R www-data:www-data /var/www/html/
