#!/usr/bin/env bash

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=~/bin --filename=composer

composer self-update

composer diag

composer dump-autoload --optimize

composer global require fabpot/php-cs-fixer
composer global require squizlabs/php_codesniffer

composer global update

composer global remove squizlabs/php_codesniffer

composer show -i
composer show -i <package>
# quick view of project dependencies
composer show --installed | cut -d' ' -f1 | xargs -n1 composer depends | sort
