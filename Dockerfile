FROM php:apache

RUN docker-php-ext-install pdo pdo-mysql

COPY . .

RUN a2enmod rewrite headers

USER www-data
RUN chown -R www-data:www-data /var/www
