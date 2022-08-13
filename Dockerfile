FROM php:apache

RUN docker-php-ext-install pdo mysqli pdo_mysql bcmath tokenizer json mbstring openssl opcache intl xml ctype fileinfo

COPY . .

RUN a2enmod rewrite headers

USER www-data
RUN chown -R www-data:www-data /var/www
