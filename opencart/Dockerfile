FROM php:7.3-apache-stretch
LABEL maintainer="thomas@visualworx.de"

# Install TYPO3
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ssl-cert \
        git \
        wget \
        unzip \
        mysql-client \
# Configure PHP
        libxml2-dev libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libzip-dev \
        zlib1g-dev \
# Install required 3rd party tools
        graphicsmagick && \
# Install xdebug
        pecl install xdebug-3.0.2 && \
# Configure extensions
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) mysqli soap gd zip opcache intl && \
    docker-php-ext-enable xdebug && \
    echo 'always_populate_raw_post_data = -1\nmax_execution_time = 240\nmax_input_vars = 1500\nupload_max_filesize = 32M\npost_max_size = 32M\nerror_reporting = 341\ndisplay_errors = 1' > /usr/local/etc/php/conf.d/typo3.ini && \
    echo "xdebug.remote_enable=1\nxdebug.max_nesting_level=1500\ncd xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/php.ini && \
# Configure Apache as needed
    a2enmod rewrite && \
    a2enmod ssl && \
    a2ensite default-ssl && \
    apt-get clean && \
    apt-get -y purge \
        libxml2-dev libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libzip-dev \
        zlib1g-dev && \
    rm -rf /var/lib/apt/lists/* /usr/src/*

RUN cd /var/www/html

# Configure volumes
VOLUME /var/www/html