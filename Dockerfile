FROM php:apache

COPY . .

RUN usermod -u 1000 www-data
