FROM php:apache

RUN docker-php-ext-install pdo mysqli pdo_mysql

COPY . .

RUN a2enmod rewrite

RUN chown -R www-data:www-data /var/www/html

USER www-data
