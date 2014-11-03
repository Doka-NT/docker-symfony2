#!/bin/bash

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
