FROM php:apache

RUN docker-php-ext-install pdo_mysql

COPY . .

RUN a2enmod rewrite headers

RUN chown -R www-data:www-data /var/www

USER www-data
