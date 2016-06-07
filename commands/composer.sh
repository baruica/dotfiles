composer self-update

composer diag

composer dump-autoload --optimize

composer require some/dependency:1.3.4
composer require --dev phpspec/phpspec phpunit/phpunit
composer require --dev phpunit/phpunit:5.3 --ignore-platform-reqs

composer global require bartlett/php-compatinfo     # then bin/phpcompatinfo analyser:run src
composer global require hirak/prestissimo
composer global require squizlabs/php_codesniffer
composer global require sebastian/phpcpd
composer global require phpmd/phpmd
composer global require puli/cli:^1.0

composer global update

composer global remove squizlabs/php_codesniffer

# list the current versions of all installed dependencies
composer show -i
composer show -i <package>

# show a tree of all installed packages and their dependencies
composer show -t -i

composer outdated

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

# composertip change your composer.json to ^5.5 or similar unless you actually work with 7.0. If so: ^5.5 || ^7.0

# composer forwards env vars so you can use, e.g, a Git SSH wrapper : GIT_SSH=/git_wrapper php composer.phar install --dev working with composer on a really slow connexion? `export COMPOSER_PROCESS_TIMEOUT=4000` and `composer install --prefer-dist`
