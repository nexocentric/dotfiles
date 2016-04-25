#!/usr/bin/env bash

print_stderr "Running installation for powerline."

apt-get -y install powerline
readonly INSTALLATION_STATUS=$?

exit $INSTALLATION_STATUS