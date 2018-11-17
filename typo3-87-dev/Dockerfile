FROM martinhelmich/typo3:8

MAINTAINER thomas@visualworx.de

ENV TYPO3_CONTEXT Development

# Install PECL extensions
RUN pecl install xdebug-2.6.0
RUN docker-php-ext-enable xdebug
RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini

RUN echo '<Directory /var/www/html>\n
		AllowOverride All\n
		Order Allow,Deny\n
		Allow From All\n
	</Directory>' >> /etc/apache2/sites-available/000-default.conf
