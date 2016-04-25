#!/usr/bin/env bash

print_stderr "Running installation for samba."

apt-get -y install samba
readonly INSTALLATION_STATUS=$?

smbpasswd -a ${SCRIPT_INVOKER_USERNAME}

service smbd restart

exit $INSTALLATION_STATUS