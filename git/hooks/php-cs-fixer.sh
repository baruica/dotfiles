#! /bin/sh
# in .git/hooks/pre-commit

PROJECTROOT=`echo $(cd ${0%/*}/../../ && pwd -P)`/

RES=`php-cs-fixer fix $PROJECTROOT --verbose --dry-run`

if [ "$RES" != "" ]; then
    echo "Committed code is not PSR-2 compliant, cancelling your commit."
    echo $RES
    echo "If you want to fix it, run:"
    echo "    php-cs-fixer fix ${PROJECTROOT} --verbose"
    exit 1
fi
