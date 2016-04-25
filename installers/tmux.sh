#!/usr/bin/env bash

print_stderr "Running installation for tmux."

apt-get -y install tmux
readonly INSTALLATION_STATUS=$?

exit $INSTALLATION_STATUS