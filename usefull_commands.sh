#!/usr/bin/env bash

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

# Listing globally installed NPM packages and version
npm list -g --depth=0
