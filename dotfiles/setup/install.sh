#!/usr/bin/env bash

write_error_message() {
        message="${1}"
        if [[ -z $message ]]; then
                message="No message specified for output."
        fi

        printf "${message}\n" >&2
}

command_exists() {
        selected_command=$1
        hash $selected_command 2> /dev/null || { write_error_message "The ${selected_command} command does not exist."; return 1; }
        return 0
}

type_exists() {
        selected_type=$1
        type $selected_command > /dev/null 2>&1 || { write_error_message "The ${selected_type} keyword/type does not exist."; return 1; }
        return 0
}

display_confirmation_prompt() {
        prompt_message="$1"
        if [[ -z $prompt_message ]]; then
                prompt_message="Is this okay?"
        fi

        read -r -p "$prompt_message" user_response
        case $user_response in
                [yY][eE][sS]|[yY])
                        return 0
                        ;;
                *)
                        return 1
                        ;;
        esac
}

install_package() {
        package_name="$1"
        if [[ -z $package_name ]]; then
                write_error_message "A package name for installation must be specified."
                return 1
        fi

        [[ $package_name =~ [A-Za-z0-9] ]]
        if [[ $? -eq 0 ]]; then
                display_confirmation_prompt "Would you like to install [${package_name}]?"
                if [[ $? -ne 0 ]]; then
                        return 1
                fi

                write_error_message "Preparing to install [$package_name]."
                echo "sudo $detected_package_manager install $package_name"
        else
                write_error_message "The package name contains invalid characters. Package name: [${package_name}]"
        fi


}

detected_package_manager="apt-get"

command_exists "git"
if [[ $? -ne 0 ]]; then
        install_package "git"
fi

echo "finished sucessfully!"
