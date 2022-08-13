FROM komandar/nginx-php

COPY --chown=www-data:www-data . /var/www/html

RUN composer install --no-ansi --no-interaction --no-scripts --no-plugins --no-progress --prefer-dist \
    # Setup Laravel
    && chmod -R 755 storage bootstrap/cache \
    && php artisan storage:link \
    && php artisan optimize:clear
