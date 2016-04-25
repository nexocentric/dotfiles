#!/usr/bin/env bash

print_stderr "Running installation for git."

apt-get -y install git
readonly INSTALLATION_STATUS=$?

exit $INSTALLATION_STATUS