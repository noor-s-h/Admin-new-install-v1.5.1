FROM php:8.0-apache-buster
LABEL maintainer="Lelite"
WORKDIR /var/www/laravel
COPY . .
RUN curl -o  /usr/local/bin/composer https://mirrors.cloud.tencent.com/composer/composer.phar \
	&& chmod +x /usr/local/bin/composer \
	&& composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ 
RUN sed -i 's!http://deb.debian.org'!https://mirrors.cloud.tencent.com!g /etc/apt/sources.list \
	&& sed -i 's!http://security.debian.org'!https://mirrors.cloud.tencent.com!g /etc/apt/sources.list \
    && apt-get update \
	&& apt-get install -y git zip unzip libpq-dev libpng-dev libjpeg-dev \
	&& docker-php-ext-install pdo_mysql pdo_pgsql bcmath gd \
	&& apt-get -y autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENV APACHE_DOCUMENT_ROOT /var/www/laravel/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf \
    && a2enmod rewrite
EXPOSE 8000
