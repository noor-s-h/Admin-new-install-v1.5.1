FROM php:apache

COPY . .

RUN usermod -s /bin/bash www-data
RUN chown www-data:www-data /var/www/html
USER www-data:www-data
