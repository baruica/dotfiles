# display the physical current working directory (all symlinks resolved)
pwd -P

cat /etc/os-release
# NAME="Ubuntu"
# VERSION="14.04.2 LTS, Trusty Tahr"
# ID=ubuntu
# ID_LIKE=debian
# PRETTY_NAME="Ubuntu 14.04.2 LTS"
# VERSION_ID="14.04"
# HOME_URL="http://www.ubuntu.com/"
# SUPPORT_URL="http://help.ubuntu.com/"
# BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"

lsb_release -sc
# utopic

# current kernel version
uname -r
# 3.19.0-21-generic

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

curl -x POST \
    -H "Accept: application/json" \
    -H "Authorization: Bearer at-80003004-19a8-46a2-908e-33d4057128e7" \
    -d '{"state":"running"}' \
    https://api.fakecompany.com/v1/users/007/orders?client_id=API_KEY_003

ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
curl http://icanhazip.com

# Listing globally installed NPM packages and version
npm list -g --depth=0


# list of packages installed on your system
comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u) | awk {'print  $0'}

# find dotfiles
find ~ -maxdepth 1 \( -type f -o -type l \) -name '.*'
