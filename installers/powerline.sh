#!/usr/bin/env bash

print_stderr "Running installation for powerline."

#you might need the current directory here....

apt-get -y install powerline
readonly INSTALLATION_STATUS=$?

mkdir -p /home/${SCRIPT_INVOKER_USERNAME}/.config/fontconfig/conf.d/
cd /home/${SCRIPT_INVOKER_USERNAME}/.config/fontconfig/conf.d/
wget https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf

mkdir -p /home/${SCRIPT_INVOKER_USERNAME}/.fonts/
cd /home/${SCRIPT_INVOKER_USERNAME}/.fonts/
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf

exit $INSTALLATION_STATUS