#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

if [ "$(uname)" == "Darwin" ]; then
    readonly SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
else
    readonly SCRIPT_DIR=$(dirname "$(readlink -m "$0")")
fi

function main {
    if [[ -z "$1" ]] && [[ -z "$2" ]]; then
        error_exit "Argument Identifiant projet attentu : bash $0 path"
    fi

    set -o errexit
    set -o pipefail
    set -o nounset
    set -o errtrace

    local path=$1
}

function error_exit {
    echo "$1" 1>&2
    exit 1
}

main "$@"
