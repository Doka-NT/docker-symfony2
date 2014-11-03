#!/bin/bash

if [ $DEBUG ]; then
    echo "xdebug.remote_connect_back=On" >> /etc/php5/fpm/conf.d/20-xdebug.ini
    echo "xdebug.remote_enable=On" >> /etc/php5/fpm/conf.d/20-xdebug.ini
fi

if [ -z "$1" ];
    then
    cd /var/www
    composer install
    rm -rf app/cache/*
    php app/console assets:install --symlink web/
    php app/console c:c
    php app/console c:w
    service php5-fpm start
    nginx
else
    exec "$@"
fi
