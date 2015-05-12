# display the physical current working directory (all symlinks resolved)
pwd -P

lsb_release -sc
# utopic

# 0 if SSD, 1 otherwise
cat /sys/block/sda/queue/rotational

# locate php.ini file
php -i | grep php.ini

# list modules
php -m

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
