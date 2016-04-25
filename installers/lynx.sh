#!/usr/bin/env bash

print_stderr "Running installation for lynx."

apt-get -y install lynx
readonly INSTALLATION_STATUS=$?

exit $INSTALLATION_STATUS