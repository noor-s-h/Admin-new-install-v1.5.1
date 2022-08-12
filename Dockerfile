FROM php:apache

COPY . .

RUN chown -R www-data:www-data /var/www
USER www-data
