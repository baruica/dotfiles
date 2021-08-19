#!/usr/bin/env bash

sudo apt -y purge openjdk*

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 15.0.9.hs-adpt

sdk install maven
sdk install gradle
