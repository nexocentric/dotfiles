#!/usr/bin/env bash

print_stderr "Running installation for sudo."
apt-get -y install sudo
readonly INSTALLATION_STATUS=$?

program_exists "sudo"
if [[ $? -eq 0 ]]; then
	print_stderr "Adding [${SCRIPT_INVOKER_USERNAME}] to the sudoer's group."
	usermod -a -G sudo "${SCRIPT_INVOKER_USERNAME}"
else
	print_stderr "Unable to add [${SCRIPT_INVOKER_USERNAME}] to the sudoer's group."
	print_log "Unable to add [${SCRIPT_INVOKER_USERNAME}] to the sudoer's group due to a possible installation failure."
fi

exit $INSTALLATION_STATUS