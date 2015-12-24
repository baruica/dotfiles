curl -sS https://getcomposer.org/installer | php -- --install-dir=~/bin --filename=composer
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

composer self-update

composer diag

composer dump-autoload --optimize

composer require some/dependency:1.3.4

composer global require fabpot/php-cs-fixer
composer global require squizlabs/php_codesniffer
composer global require phpmd/phpmd

composer global update

composer global remove squizlabs/php_codesniffer

composer show -i
composer show -i <package>
# quick view of project dependencies
composer show --installed | cut -d' ' -f1 | xargs -n1 composer depends | sort

# composer ~ operator changes according to number of dots:
# ~1.3.1 will not move to 1.4
# however
# ~1.3   will
# ^1.3.1 will

# exécuter Composer avec une limite mémoire à 1 Go
php -d memory_limit=1024M composer update

# get the size of each vendor
du -h -d 2 vendor

# Only updates the lock file hash to suppress warning about the lock file being out of date
composer update --lock
