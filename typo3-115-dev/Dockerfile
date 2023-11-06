FROM php:8.1-apache
LABEL maintainer="thomas@visualworx.de"

# Install TYPO3
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ssl-cert \
        wget \
        telnet \
        default-mysql-client \
    #    php-xdebug \
    # Configure PHP
        libxml2-dev libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        zlib1g-dev \
        libzip-dev \
# Install required 3rd party tools
        graphicsmagick && \
# Install xdebug \
        pecl install xdebug && \
# Configure extensions
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) mysqli soap gd zip opcache intl xml && \
    docker-php-ext-enable xdebug && \
    echo 'always_populate_raw_post_data = -1\nmax_execution_time = 240\nmax_input_vars = 1500\nupload_max_filesize = 320M\npost_max_size = 320M\ncurl.cainfo=/usr/local/etc/php/cacert.pem' > /usr/local/etc/php/conf.d/typo3.ini && \
    echo "xdebug.mode=debug\nxdebug.connect_timeout_ms=400\nxdebug.max_nesting_level=1500\nxdebug.idekey=PHPSTORM" >> /usr/local/etc/php/php.ini && \
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
        zlib1g-dev && \
    rm -rf /var/lib/apt/lists/* /usr/src/*

#RUN apk add --no-cache --update \
#        php-xdebug~=8.1 \

ENV TYPO3_CONTEXT Development
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --quiet && \
    rm composer-setup.php && \
    mv composer.phar /usr/local/bin/composer

RUN cd /usr/local/etc/php && \
        wget https://curl.haxx.se/ca/cacert.pem
RUN cd /var/www/html && \
#    wget -O - https://get.typo3.org/8.7 | tar -xzf - && \
#    ln -s typo3_src-* typo3_src && \
    ln -s typo3_src/index.php && \
    ln -s typo3_src/typo3 && \
    ln -s typo3/sysext/install/Resources/Private/FolderStructureTemplateFiles/root-htaccess .htaccess && \
    mkdir typo3temp && \
    mkdir typo3conf && \
    mkdir fileadmin && \
    mkdir uploads && \
    mkdir typo3_src && \
    #touch FIRST_INSTALL && \
    chown -R www-data. .

# Configure volumes
#VOLUME /var/www/html
VOLUME /var/www/html/fileadmin
VOLUME /var/www/html/typo3conf
VOLUME /var/www/html/typo3temp
VOLUME /var/www/html/uploads
