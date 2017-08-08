FROM php:7.1-apache

### install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

### add entrypoint
COPY docker/entrypoint-app.sh /usr/local/bin/

