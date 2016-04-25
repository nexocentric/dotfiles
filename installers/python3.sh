#!/usr/bin/env bash

print_stderr "Running installation for python3."

apt-get -y install python3
readonly INSTALLATION_STATUS=$?

exit $INSTALLATION_STATUS