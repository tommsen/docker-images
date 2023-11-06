FROM php:7.4-apache-buster
LABEL maintainer="thomas@visualworx.de"

# Install TYPO3
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ssl-cert \
        wget \
        telnet \
        default-mysql-client \
# Configure PHP
        libxml2-dev libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        zlib1g-dev \
        libzip-dev \
# Install required 3rd party tools
        graphicsmagick && \
# Install xdebug
        pecl install xdebug-3.0.3 && \
# Configure extensions
    docker-php-ext-configure gd --with-jpeg --with-freetype && \
    docker-php-ext-install -j$(nproc) mysqli soap gd zip opcache intl && \
    docker-php-ext-enable xdebug && \
    echo 'always_populate_raw_post_data = -1\nmemory_limit=400M\nmax_execution_time = 240\nmax_input_vars = 1500\nupload_max_filesize = 32M\npost_max_size = 32M' > /usr/local/etc/php/conf.d/typo3.ini && \
    echo "xdebug.mode=debug\nxdebug.connect_timeout_ms=200\nxdebug.max_nesting_level=1500\nxdebug.idekey=PHPSTORM" >> /usr/local/etc/php/php.ini && \
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
        zlib1g-dev \
        libzip-dev && \
    rm -rf /var/lib/apt/lists/* /usr/src/*

ENV TYPO3_CONTEXT Development

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --quiet && \
    rm composer-setup.php && \
    mv composer.phar /usr/local/bin/composer

RUN cd /var/www/html && \
#    wget --content-disposition https://get.typo3.org/10 | tar -xzf - && \
    ln -s typo3_src/index.php && \
    ln -s typo3_src/typo3 && \
#    ln -s typo3/sysext/install/Resources/Private/FolderStructureTemplateFiles/root-htaccess .htaccess && \
    mkdir typo3temp && \
    mkdir typo3conf && \
    mkdir fileadmin && \
    mkdir uploads && \
    mkdir typo3_src && \
    touch FIRST_INSTALL && \
    chown -R www-data. .

# Configure volumes
#VOLUME /var/www/html
VOLUME /var/www/html/fileadmin
VOLUME /var/www/html/typo3conf
VOLUME /var/www/html/typo3temp

