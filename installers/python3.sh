#!/usr/bin/env bash

print_stderr "In order to install programs, we must first install the sudo program."
print_stderr "This will require the root user password."
print_stderr " "

get_user_input "Please enter the password for root: "

su -c 'bash -s' <<EOF
	# list of root commands
EOF

# su
# apt-get update
# apt-get -y upgrade
# apt-get -y install sudo

# usermod -a -G sudo ddzakuma

# #running this command will allow ddzakuma to get the new group assignments
# #without logging out
# #su - $USER