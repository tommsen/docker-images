FROM martinhelmich/typo3:8

MAINTAINER thomas@visualworx.de

ENV TYPO3_CONTEXT Development

# Install PECL extensions
RUN pecl install xdebug-2.6.0
RUN docker-php-ext-enable xdebug
RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini
RUN a2enmod rewrite

RUN echo '<Directory /var/www/html>' >> /etc/apache2/sites-available/000-default.conf
RUN echo '	AllowOverride All' >> /etc/apache2/sites-available/000-default.conf
RUN echo '	Order Allow,Deny' >> /etc/apache2/sites-available/000-default.conf
RUN echo '	Allow From All' >> /etc/apache2/sites-available/000-default.conf
RUN echo '</Directory>' >> /etc/apache2/sites-available/000-default.conf
