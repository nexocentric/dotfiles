#!/usr/bin/env bash

write_error_message()
{
	message="${1}"
	if [[ -z $message ]]; then
		message="No message specified for output."
	fi
	
	printf "${message}" >&2
}

command_exists()
{
	selected_command=$1
	hash $selected_command 2> /dev/null || { write_error_message "The ${selected_command} does not exist."; return 1; }
	return 0
}

type_exists()
{
	selected_type=$1
	type $selected_command > /dev/null 2>&1 || { write_error_message "The ${selected_type} does not exist."; return 1; }
	return 0
}

detected_package_manager="apt-get"

if [[ command_exists "git" -ne 0 ]]; then
	echo "sudo $detected_package_manager install git"
fi

echo "finished sucessfully!"
