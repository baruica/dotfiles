#!/usr/bin/env bash

hash composer >/dev/null 2>&1 && composer self-update && composer global update -q
hash symfony >/dev/null 2>&1 && symfony self-update

hash gem >/dev/null 2>&1 && sudo gem update --system
hash npm >/dev/null 2>&1 && sudo npm update -g
hash update_rubygems >/dev/null 2>&1 && sudo update_rubygems
