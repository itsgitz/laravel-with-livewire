#!/usr/bin/env bash

php -v

if [ $? != 0 ]; then
    echo "PHP is not installed"
    exit 0
fi

composer --version

if [ $? != 0 ]; then
    echo "Composer is not installed"
    exit 0
fi


PROJECT_NAME="larave-livewire"

docker-compose -f \
    docker-compose.local.yaml \
    -p $PROJECT_NAME \
    up -d --force-recreate

npm install

php artisan migrate
php artisan db:seed
php artisan serve
