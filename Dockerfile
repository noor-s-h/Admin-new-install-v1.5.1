FROM php:apache

RUN docker-php-ext-install mysqli

COPY . .

RUN a2enmod rewrite headers

RUN chown -R www-data:www-data /var/www
