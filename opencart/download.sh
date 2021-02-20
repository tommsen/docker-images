#!/bin/sh
FILE=/var/www/html/opencart-3.0.3.7.zip
if [ ! -f "$FILE" ]; then
    echo "$FILE does not exist....cloning..."
//    git clone https://github.com/opencart/opencart.git && mv opencart/upload/* /var/www/html
    wget https://github.com/opencart/opencart/releases/download/3.0.3.7/opencart-3.0.3.7.zip && unzip opencart-3.0.3.7.zip && mv upload/* .

echo "<?php\n \
// HTTP\n \
define('HTTP_SERVER', 'http://localhost/');\n \
\n \
// HTTPS\n \
define('HTTPS_SERVER', 'http://localhost/');\n \
\n \
// DIR\n \
define('DIR_APPLICATION', '/var/www/html/catalog/');\n \
define('DIR_SYSTEM', '/var/www/html/system/');\n \
define('DIR_IMAGE', '/var/www/html/image/');\n \
define('DIR_STORAGE', DIR_SYSTEM . 'storage/');\n \
define('DIR_LANGUAGE', DIR_APPLICATION . 'language/');\n \
define('DIR_TEMPLATE', DIR_APPLICATION . 'view/theme/');\n \
define('DIR_CONFIG', DIR_SYSTEM . 'config/');\n \
define('DIR_CACHE', DIR_STORAGE . 'cache/');\n \
define('DIR_DOWNLOAD', DIR_STORAGE . 'download/');\n \
define('DIR_LOGS', DIR_STORAGE . 'logs/');\n \
define('DIR_MODIFICATION', DIR_STORAGE . 'modification/');\n \
define('DIR_SESSION', DIR_STORAGE . 'session/');\n \
define('DIR_UPLOAD', DIR_STORAGE . 'upload/');\n \
\n \
// DB\n \
define('DB_DRIVER', 'mysqli');\n \
define('DB_HOSTNAME', 'database');\n \
define('DB_USERNAME', 'opencart');\n \
define('DB_PASSWORD', 'password');\n \
define('DB_DATABASE', 'opencart');\n \
define('DB_PORT', '3306');\n \
define('DB_PREFIX', 'oc_');" > config.php

echo "<?php\n \
// HTTP\n \
define('HTTP_SERVER', 'http://localhost/admin/');\n \
define('HTTP_CATALOG', 'http://localhost/');\n \
\n \
// HTTPS\n \
define('HTTPS_SERVER', 'http://localhost/admin/');\n \
define('HTTPS_CATALOG', 'http://localhost/');\n \
\n \
// DIR\n \
define('DIR_APPLICATION', '/var/www/html/admin/');\n \
define('DIR_SYSTEM', '/var/www/html/system/');\n \
define('DIR_IMAGE', '/var/www/html/image/');\n \
define('DIR_STORAGE', DIR_SYSTEM . 'storage/');\n \
define('DIR_CATALOG', '/var/www/html/catalog/');\n \
define('DIR_LANGUAGE', DIR_APPLICATION . 'language/');\n \
define('DIR_TEMPLATE', DIR_APPLICATION . 'view/template/');\n \
define('DIR_CONFIG', DIR_SYSTEM . 'config/');\n \
define('DIR_CACHE', DIR_STORAGE . 'cache/');\n \
define('DIR_DOWNLOAD', DIR_STORAGE . 'download/');\n \
define('DIR_LOGS', DIR_STORAGE . 'logs/');\n \
define('DIR_MODIFICATION', DIR_STORAGE . 'modification/');\n \
define('DIR_SESSION', DIR_STORAGE . 'session/');\n \
define('DIR_UPLOAD', DIR_STORAGE . 'upload/');\n \
\n \
// DB\n \
define('DB_DRIVER', 'mysqli');\n \
define('DB_HOSTNAME', 'database');\n \
define('DB_USERNAME', 'opencart');\n \
define('DB_PASSWORD', 'password');\n \
define('DB_DATABASE', 'opencart');\n \
define('DB_PORT', '3306');\n \
define('DB_PREFIX', 'oc_');\n \
\n \
// OpenCart API\n \
define('OPENCART_SERVER', 'https://www.opencart.com/');" > admin/config.php
chown -R www-data. /var/www
fi
apache2-foreground