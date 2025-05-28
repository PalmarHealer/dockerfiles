FROM ghcr.io/pelican-dev/panel:latest

USER root

WORKDIR /tmp

RUN curl -L -o panel.tar.gz https://github.com/PalmarHealer/pelican-extension-manager/releases/latest/download/panel.tar.gz \
    && tar -xzvf panel.tar.gz \
    && cp -r * /var/www/html/ \
    && rm -rf panel.tar.gz

USER www-data
