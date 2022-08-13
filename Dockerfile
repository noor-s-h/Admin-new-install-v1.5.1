FROM php:apache

RUN docker-php-ext-install pdo mysqli bcmath mbstring opcache

COPY . .

RUN a2enmod rewrite

USER www-data

RUN chown -R www-data:www-data /var/www
