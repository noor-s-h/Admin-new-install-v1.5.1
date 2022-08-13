FROM php:apache

docker-php-ext-install mysqli pdo pdo_mysql

COPY . .

RUN a2enmod rewrite headers

RUN chown -R www-data:www-data /var/www

USER www-data
