FROM php:apache

RUN apt update && apt upgrade -y && apt install php-mysql

COPY . .

RUN a2enmod rewrite headers

RUN chown -R www-data:www-data /var/www

USER www-data
