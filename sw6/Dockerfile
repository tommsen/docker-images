FROM php:7.3-apache-stretch
LABEL maintainer="thomas@visualworx.de"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        nano \
        wget \
        mysql-client \
        nodejs \
        git \
        unzip \
        ssh \
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
        pecl install xdebug-2.9.1 && \
# Configure extensions
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) mysqli soap gd zip opcache intl pdo_mysql && \
    docker-php-ext-enable xdebug && \
    echo 'always_populate_raw_post_data = -1\nmax_execution_time = 240\nmax_input_vars = 1500\nupload_max_filesize = 32M\npost_max_size = 32M\nmemory_limit=600M' > /usr/local/etc/php/conf.d/typo3.ini && \
    echo "xdebug.remote_enable=1\nxdebug.max_nesting_level=400\nerror_reporting = E_ALL\nlog_errors = On\nerror_log = /var/log/php.log" >> /usr/local/etc/php/php.ini && \
# Configure Apache as needed
    a2enmod rewrite && \
    sed -i -e 's/AllowOverride\s*None/AllowOverride All/ig' /etc/apache2/apache2.conf && \
    sed -i -e 's/DocumentRoot \/var\/www\/html/DocumentRoot \/var\/www\/html\/development\/public/ig' /etc/apache2/sites-available/000-default.conf && \
    apt-get clean && \
    apt-get -y purge \
        libxml2-dev libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        zlib1g-dev && \
    rm -rf /var/lib/apt/lists/* /usr/src/*

# Install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'c5b9b6d368201a9db6f74e2611495f369991b72d9c8cbd3ffbc63edff210eb73d46ffbfce88669ad33695ef77dc76976') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/bin && \
    php -r "unlink('composer-setup.php');" && \
    ln -s /bin/composer.phar /bin/composer



RUN cd /var/www/html && \
    chown -R www-data. .

# Configure volumes
VOLUME /var/www/html