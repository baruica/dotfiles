#!/usr/bin/env bash

composer show -i
composer show -i <package>


# Turn a Unix epoch time back into a human readable date
date -d @728737200

phpunit -c build --filter InvoiceLineTest --testdox
# ETS\BillingBundle\Tests\Entity\InvoiceLine
#  [x] Add candidates
