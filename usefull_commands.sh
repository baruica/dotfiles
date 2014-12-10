#!/usr/bin/env bash

composer dump-autoload --optimize
composer global update fabpot/php-cs-fixer
composer global update squizlabs/php_codesniffer
composer show -i
composer show -i <package>


# Turn a Unix epoch time back into a human readable date
date -d @728737200

phpunit -c build --filter InvoiceLineTest --testdox
# ETS\BillingBundle\Tests\Entity\InvoiceLine
#  [x] Add candidates

curl --ipv6 ipinfo.io
# {
#   "ip": "212.234.170.130",
#   "hostname": "No Hostname",
#   "city": null,
#   "region": null,
#   "country": "FR",
#   "loc": "48.8600,2.3500",
#   "org": "AS3215 Orange S.A."
# }

ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
curl http://icanhazip.com

# Listing globally installed NPM packages and version
npm list -g --depth=0


sudo apt-get purge openjdk*
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
