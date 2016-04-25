#!/usr/bin/env bash

print_stderr "Running installation for cmake."

apt-get -y install cmake
readonly INSTALLATION_STATUS=$?

exit $INSTALLATION_STATUS