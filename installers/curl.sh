#!/usr/bin/env bash

print_stderr "Running installation for curl."
apt-get -y install curl
readonly INSTALLATION_STATUS=$?

exit $INSTALLATION_STATUS