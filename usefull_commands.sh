#!/usr/bin/env bash

# display the physical current working directory (all symlinks resolved)
pwd -P

lsb_release -sc
# utopic

# locate php.ini file
php -i | grep php.ini

# list modules
php -m

# exécuter Composer avec une limite mémoire à 1 Go
php -d memory_limit=1024M composer update

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

# 5 biggest files
find . -type f -exec ls -s {} \; | sort -n -r | head -5

find . -type f -print0 | xargs -0 du -h | sort -hr | head -20


# generate JSON as output
tree -J
