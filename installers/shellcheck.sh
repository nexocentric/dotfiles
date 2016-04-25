#!/usr/bin/env bash

print_stderr "Running installation for shellcheck."

apt-get -y install shellcheck
readonly INSTALLATION_STATUS=$?

exit $INSTALLATION_STATUS