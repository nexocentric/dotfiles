#!/usr/bin/env bash

print_stderr "Running installation for checkinstall."

apt-get -y install build-essential automake autoconf libtool pkg-config libcurl4-openssl-dev intltool libxml2-dev libgtk2.0-dev libnotify-dev libglib2.0-dev libevent-dev checkinstall
checkinstall --version
readonly INSTALLATION_STATUS=$?

exit $INSTALLATION_STATUS