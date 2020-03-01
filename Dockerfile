# https://github.com/barryvdh/laravel-dompdf/issues/503#issuecomment-413104905
FROM php:7.2-apache

# Bluespice 3.1
ENV DOWNLOAD_URL=https://bluespice.com/filebase/bluespice-free-3-0/
ENV ZIP_PATH=bluespice/*

# Install installation dependencies
RUN apt-get update && \
    apt-get install unzip

# Download bluespice wiki
RUN curl -o bluespice.zip $DOWNLOAD_URL && \
    unzip bluespice.zip && \
    rm bluespice.zip && \
    mv $ZIP_PATH /var/www/html/

# Install system dependencies
RUN apt-get update && \
    apt-get install -y libpng-dev

# Install php dependencies
RUN apt-get update && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install gd

