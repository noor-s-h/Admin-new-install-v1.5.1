FROM php:7.4-apache

RUN apt-get update && apt-get install -y php7.4-mysql

COPY . .

RUN a2enmod rewrite headers

RUN chown -R www-data:www-data /var/www

USER www-data
