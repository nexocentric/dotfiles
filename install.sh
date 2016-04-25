#!/usr/bin/env bash
readonly SCRIPT_DIRECTORY="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
readonly SCRIPT_NAME="$(basename "${0}")"
readonly INSTALLATION_SCRIPTS_FOLDER="installers"
readonly SCRIPT_INVOKER_USERNAME=$(who am i | awk '{print $1}' || logname)

readonly MANDATORY_PROGRAMS=("sudo" "git" "curl" "tmux" "powerline") #these can be changed to text files and read in that way
readonly PROGRAMMING_LANGUAGES=("rvm" "python3") #or maybe they could be the installation script that you're looking
readonly WEB_DEVELOPMENT_PROGRAMS=("rvm" "jekyll" "dos2unix")
readonly DATABASES=("postgres" "sqlite" "sqlite3")
readonly DEVELOPMENT_TOOLS("checkinstall" "cmake" "fakeroot")
readonly OPTIONAL_PROGRAMS=("hiawatha" "samba" "shellcheck" "lynx" "httpie")

print_stderr()
{
	local message="${1}"

	if [[ -z $message ]]; then
		message="No message specified for output."
	fi

	printf "${message}\n" >&2
}

print_log()
{
	local message="${1}"

	if [[ -z $message ]]; then
		print_stderr "An attempt to write to syslog was made, but no input was given."
		return
	fi

	logger "${message}"
}

get_user_input()
{
	local prompt_message="${1}"
	local user_response=

	if [[ -z $prompt_message ]]; then
			prompt_message="Please enter a phrase: "
	fi

	read -r -p "$prompt_message" user_response
	printf $user_response
}

get_user_input_masked()
{
	local prompt_message="${1}"
	local user_response=

	if [[ -z $prompt_message ]]; then
			prompt_message="Please enter a phrase: "
	fi

	read -s -r -p "$prompt_message" user_response
	printf $user_response
}

display_confirmation_prompt()
{
	local user_response=$(get_user_input "${1}")

	case $user_response in
		[yY][eE][sS]|[yY])
			return 0
			;;
		*)
			return 1
			;;
	esac
}

program_exists()
{
	local selected_command=$1

	hash $selected_command 2> /dev/null || { print_stderr "The ${selected_command} command does not exist."; return 1; }

	return 0
}

run_installer_script()
{
	print_stderr "Sourcing the installation script for the [${1}] program."
	local installation_script_path="${SCRIPT_DIRECTORY}/${INSTALLATION_SCRIPTS_FOLDER}/${1}.sh"

	if [[ ! -f "${installation_script_path}" ]]; then
		print_log "The installation script for[${1}] does not exist. Search directory: [${installation_script_path}]"
		print_stderr "Failed to install [${1}] because the installation script does not exist."
		return
	fi

	source $installation_script_path
}

#check to ensure script is running as root
if [[ $(id -u) != 0 ]]; then
	print_stderr "This script must be run as root."
	print_stderr "Please run the script using the following command."
	print_stderr "su -c 'bash ${SCRIPT_DIRECTORY}/${SCRIPT_NAME}'"
	exit 1
fi

export SCRIPT_DIRECTORY
export SCRIPT_NAME
export INSTALLATION_SCRIPTS_FOLDER
export SCRIPT_INVOKER_USERNAME

export -f print_stderr
export -f print_log
export -f display_confirmation_prompt
export -f get_user_input
export -f get_user_input_masked
export -f program_exists

#install mandatory commands
for program in "${MANDATORY_PROGRAMS[@]}"; do
	program_exists "${program}"
	if [[ $? -ne 0 ]]; then
		run_installer_script "${program}"
	fi
done

if [[ $(id -u) == 0 ]]; then
	print_stderr "Installation complete."
	exit 0
fi

#create aliases for everything that you wuld like to have as a script program
#all script programs should end in .sh the alias you use will remove the sh
#all script programs should run as the name and then a command followed by parameters
#use a case statement in the script to determine the function of a program to run
#if no program found return help
#you should be good to go here pretty soon
